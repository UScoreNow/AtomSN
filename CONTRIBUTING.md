# Contributing to AtomSN

This is the repo's working standard. Every change lands via Pull Request with
CI green; no direct pushes to `main` or `dev`.

## Branch model

| Branch      | Role                               | Protected | CI/CD                         |
|-------------|------------------------------------|-----------|-------------------------------|
| `main`      | Stable / production                | Yes       | Source of Releases            |
| `dev`       | Integration                        | Yes       | Deploys to GitHub Pages       |
| `feature/*` | New feature                        | No        | PR to `dev`                   |
| `fix/*`     | Bug fix                            | No        | PR to `dev`                   |
| `refactor/*`| Refactor with no behavior change   | No        | PR to `dev`                   |
| `update/*`  | Dependencies, configuration, chores | No       | PR to `dev`                   |

Working branches are named `type/descriptive-name`, for example
`feature/date-picker` or `fix/newsprint-contrast`.

## Lifecycle of a change

1. Create your branch from `dev`:
   ```bash
   git checkout dev && git pull
   git checkout -b feature/my-change
   ```
2. Open a **PR against `dev`**. In the GitHub UI, select `dev` as the base
   (the repo keeps `main` as the default branch, so the proposed default base
   is `main`: change it to `dev`).
3. CI (`flutter analyze` on `packages/atomsn` and `apps/demo`) must pass to
   merge. Merging to `dev` deploys the demo to GitHub Pages.

## Publishing a Release (promotion `dev -> main`)

1. **Bump the version** in `packages/atomsn/pubspec.yaml` (semver). This is the
   key step: the Release tag comes from there.
2. Open a `dev -> main` PR and merge it with CI green.
3. `release.yml` creates the `v<version>` Release with notes auto-generated from
   the included PRs. If the tag already exists (you forgot to bump), the Release is
   skipped without failing: bump on the next promotion.

## Protection rules (`main` and `dev`)

- A PR is required before merging (no required approvals: you can
  auto-merge).
- CI must be green and the branch up to date with its base.
- No direct push, no force-push, no branch deletion.
