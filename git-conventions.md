# Contributing & Git Conventions

## 🚫 Main Rule
- **Do NOT commit directly to `main`**
- All work happens on feature branches + Pull Requests (PRs)

## 🧭 Workflow

1. **Update local `main`**
   ```bash
   git checkout main
   git pull
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/<short-description>
   ```

3. **Make changes, commit, and push**
   ```bash
   git add .
   git commit -m "<type>(scope): short summary"
   git push
   ```

4. **Open a PR**
   - Only after **all CI checks pass**
   - Follow the PR template

5. **Review & Merge**
   - At least **1 teammate review** required
   - Address feedback
   - Merge to `main` via the PR

## 🌿 Branch Naming

- **Features**: `feature/<short-description>`
  *New functionality*
- **Bug fixes**: `fix/<name>/<short-description>`
  *Patching issues/defects*
- **Chores**: `chore/<name>/<short-description>`
  *Tooling, configs, CI, dependencies, docs, etc.*
- **Refactors**: `refactor/<name>/<short-description>`
  *Organizing code, improving readability, reducing complexity*

*Examples:*
- `feature/signup-flow`
- `fix/chat-timeout`
- `chore/add-swiftlint`
- `refactor/session-manager-di`

## ✍️ Commit Messages (Conventional)

**Format**
```
<type>(scope): short summary
```

**Types**
- `feat`: new feature
- `fix`: bug fix
- `docs`: documentation only changes
- `style`: formatting, no code change
- `refactor`: code change that isn't a bug fix or feature
- `test`: adding/fixing tests
- `chore`: tooling/config changes

**Examples**
```
feat(followup): add follow-up flag to topic model
fix(ui): correct badge color for follow-up status
refactor(tags): extract tagging utils into separate module
```

## 🔁 Pull Requests

**Branch → PR:** each branch maps to **one** PR.

**PR Titles**
- Same format as commits: `<type>(scope): short summary`

**PR Description should include**
- **Summary**: what & why
- **Issue link**: reference related issue(s), if any
- **Testing**: how you verified the change
- **Evidence (optional)**: screenshots, logs, recordings
                                    
**CI**
- PRs must pass all CI checks (lint/tests) before merge.

**Review**
- Assign at least **1 Reviewer**
- Reviewer must approve (or comment "LGTM") before merge
