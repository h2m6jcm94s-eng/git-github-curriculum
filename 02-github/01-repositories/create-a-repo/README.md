# Creating a Repository ⭐

Every project on GitHub starts with a repository. In this lesson you'll see how to create one, set its visibility, and understand the difference between cloning and downloading a ZIP. You'll also learn what happens when an existing local project meets a remote repo that already has a README.

## Setup

This lesson is hands-on. Run the sandbox builder before you begin:

```bash
bash setup.sh
```

## Step-by-step task

1. `cd` into `sandbox/local-project`.
2. Run `git log --oneline` to see your local commit.
3. Add the simulated remote as `origin`:
   ```bash
   git remote add origin ../upstream.git
   ```
4. Try to push:
   ```bash
   git push -u origin main
   ```
   Notice the rejection because the remote already contains a README commit.
5. Fetch the remote history and merge it:
   ```bash
   git fetch origin
   git merge origin/main --allow-unrelated-histories
   ```
   (Alternatively, you could rebase.)
6. Push again:
   ```bash
   git push -u origin main
   ```
7. Run `git log --oneline --graph --all` and confirm both your local commit and the README commit are present.

## ❓ Normal question

What's the difference between public and private?

## 🔥 Tricky question

You created a repo with a README, then pushed an existing local repo. What conflict occurs and how do you resolve it?

## ✅ How to check yourself

- `git remote -v` shows `origin` pointing to `../upstream.git`.
- `git log` shows both your local work and the README commit.
- `git push` succeeds without errors.
