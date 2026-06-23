#!/usr/bin/env bash
# Redespliegue del build web a GitHub Pages (repo publico aparte).
#
# Compila la demo y publica build/web en UScoreNow/atomic_ui_demo_web (rama main,
# servida por Pages). Requiere acceso git al repo privado atomic_ui (gh auth
# setup-git) y a la org UScoreNow.
set -euo pipefail

HOST_REPO="https://github.com/UScoreNow/atomic_ui_demo_web.git"
BASE_HREF="/atomic_ui_demo_web/"

flutter pub get
# Sin service worker: GitHub Pages + PWA cachea de forma agresiva y, tras un
# redeploy, deja la pantalla en blanco al servir un index/main desfasados.
flutter build web --release --base-href "$BASE_HREF" --pwa-strategy=none

cd build/web
touch .nojekyll

# Sirve un service worker autodestructivo en la URL donde se registraron los SW
# de despliegues anteriores, para que se desregistren y dejen de cachear.
cat > flutter_service_worker.js <<'SW'
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    await self.registration.unregister();
    const clients = await self.clients.matchAll({ type: 'window' });
    for (const client of clients) {
      client.navigate(client.url);
    }
  })());
});
SW
rm -rf .git
git init -q
git checkout -q -b main
git config user.name "${GIT_AUTHOR_NAME:-atomic_ui deploy}"
git config user.email "${GIT_AUTHOR_EMAIL:-deploy@uscorenow.local}"
git add -A
git commit -q -m "deploy: atomic_ui demo web ($(git rev-parse --short HEAD 2>/dev/null || date +%F))"
git push -f "$HOST_REPO" main

echo "Publicado en https://uscorenow.github.io/atomic_ui_demo_web/"
