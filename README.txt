# Git & GitHub Workflow: Step-by-Step Guide

Here's a summary of the key Git and GitHub actions you learned and practiced, documented for future reference. If you keep this as a checklist or cheat sheet, you'll be able to repeat the process with confidence.

***

## 1. Initialize a New Repository
- In your project folder, start a Git repository and immediately set the main branch name:
  ```bash
  git init -b main
  ```
  *This sets up Git tracking and names your starting branch `main` (or any name you choose!).*

***

## 2. Create Project Folders and Placeholder Files
- Make your folders (like `frontend`, `backend`, etc.):
  ```bash
  mkdir frontend backend folder3 folder4
  ```
- Add a `.gitkeep` file (or similar) in empty folders so Git can track them:
  ```powershell
  New-Item frontend/.gitkeep -ItemType File
  New-Item backend/.gitkeep -ItemType File
  # Repeat for other folders
  ```

***

## 3. Stage and Commit Your Changes
- Stage all your files:
  ```bash
  git add .
  ```
- Record your changes in a commit:
  ```bash
  git commit -m "Initial commit with empty folders and .gitkeep files"
  ```

***

## 4. Connect to a Remote Repository on GitHub
- Create an empty repo on GitHub (do not add a README or .gitignore online).
- Link your local repo to the remote GitHub URL:
  ```bash
  git remote add origin https://github.com/<your-username>/<repo-name>.git
  ```

***

## 5. Push Your Local Branch to GitHub
- Push and set the upstream:
  ```bash
  git push -u origin main
  ```
- Now future pushes can be done simply with:
  ```bash
  git push
  ```

***

## 6. (Optional) Clean Up and Standardize Branches
- If there are unused or disconnected branches (like an empty `main` online):
  - Delete the redundant branch on GitHub (using the web interface or commands).
  - Rename your current branch if needed:
    ```bash
    git branch -m main
    git push -u origin main
    git push origin --delete <old-branch>
    ```

***

## 7. (Optional) Move or Organize Files and Folders
- To move tracked files/folders, use:
  ```bash
  git mv <source> <destination>
  git commit -m "Move files"
  git push
  ```
- For empty directories, move them with File Explorer if there are `.gitkeep` files inside, then stage and commit as usual.

***

## 8. Common Issues & Fixes
- **Can't push?** Make sure you added the remote with `git remote add origin ...`.
- **Push rejected (no upstream)?** Use `git push -u origin main` on your first push.
- **Can't PR between branches?** They need a shared commit/history. Simplify by working on `main` for solo/projects or always branch from up-to-date `main`.
- **Empty folders not pushed?** Add a `.gitkeep` file in each directory.
- **Don't move or edit `.git` folder!** It's Git's internal repo structure—leave it at the root of your repo.

***

## 9. Typical Solo Project Workflow

1. `git init -b main`
2. Create files/folders and placeholder files
3. `git add .`
4. `git commit -m "..."`
5. `git remote add origin ...`
6. `git push -u origin main`
7. Continue working and use `git add .`, `git commit`, and `git push` for updates

***

**Pro tip:** For collaboration or practicing PRs—even solo—create feature branches from `main`, push them, and make PRs into `main` on GitHub.

***

If you want example commit messages, a branch flow diagram, or step-by-step commands for a different scenario, just ask! Keeping this workflow documented will save you time and avoid confusion in future projects.