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
flutter build web --release --base-href "$BASE_HREF" --no-tree-shake-icons

cd build/web
touch .nojekyll
rm -rf .git
git init -q
git checkout -q -b main
git add -A
git commit -q -m "deploy: atomic_ui demo web ($(git rev-parse --short HEAD 2>/dev/null || date +%F))"
git push -f "$HOST_REPO" main

echo "Publicado en https://uscorenow.github.io/atomic_ui_demo_web/"
