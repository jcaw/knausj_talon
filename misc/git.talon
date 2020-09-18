tag: terminal
and tag: user.git
-
# design decisions:
# - should any commands like "git pull" have a new-line at the end
# - if so, which ones?

# Standard commands
git add: "git add "
git add patch: "git add . -p"
git add partial: "git add -p"
git add everything: "git add -u"
git bisect: "git bisect "
git blame: "git blame "
git branch <user.optional_text>: "git branch {optional_text}"
git branch remote: "git branch --remote"
git branch set up stream to <user.optional_text>: "git branch --set-upstream-to={optional_text}"
git branch delete <user.optional_text>: "git branch -D {optional_text}"
git branch all <user.optional_text>: "git branch -a {optional_text}"
git remote branches: "git branch --remote"
git checkout <user.optional_text>: "git checkout {optional_text}"
git checkout branch <user.optional_text>: "git checkout -B {optional_text}"
git checkout master: "git checkout master"
git cherry pick: "git cherry-pick "
git clone <user.optional_text>: "git clone {optional_text}"
git commit message <user.optional_text>: "git commit -m '{optional_text}'"
git commit amend <user.optional_text>: "git commit --amend -m '{optional_text}'"
git commit all <user.optional_text>: "git commit -a -m '{optional_text}'"
git commit: "git commit"
git config <user.optional_text>: "git config {optional_text}"
git config list <user.optional_text>: "git config --list {optional_text}"
git diff <user.optional_text>: "git diff {optional_text}"
git diff (colour|color) words <user.optional_text>: "git diff --color-words {optional_text}"
git diff staged <user.optional_text>: "git diff --staged {optional_text}"
git diff cached: "git diff --cached"
git fetch: "git fetch"
git fetch <user.optional_text>: "git fetch {optional_text}"
git fetch prune: "git fetch --prune"
git history: "git hist "
git in it: "git init"
git log all: "git log"
git log all changes: "git log -c"
git log: "git log "
git log changes: "git log -c "
git merge <user.optional_text>: "git merge {optional_text}"
git move: "git mv "
git new branch: "git checkout -b "
git pull <user.optional_text>: "git pull {optional_text} "
git pull origin <user.optional_text>: "git pull origin {optional_text} "
git pull rebase <user.optional_text>: "git pull --rebase {optional_text}"
git pull fast forward <user.optional_text>: "git pull --ff-only {optional_text}"
git push: "git push"
git push <user.text>: "git push {text} "
git push force: "git push --force "
git push force [with] lease: "git push --force-with-lease "
git push set up stream: "git push --set-up-stream "
git push origin: "git push origin "
git push up stream origin: "git push -u origin"
git push tags: "git push --tags"
git rebase: "git rebase"
git rebase continue: "git rebase --continue"
git rebase skip: "git rebase --skip"
git rebase abort: "git rebase --abort"
git remove: "git rm "
git (remove|delete) branch: "git branch -d "
git (remove|delete) remote branch: "git push --delete origin "
git reset: "git reset "
git reset soft: "git reset --soft "
git reset hard: "git reset --hard "
git restore: "git restore "
git restore staged: "git restore --staged "
git remote add <user.optional_text>: "git remote add {optional_text}"
git remote add upstream: "git remote add upstream "
git remote show origin: "git remote show origin"
git show: "git show "
git stash: "git stash"
git stash apply: "git stash apply"
git stash pop: "git stash pop"
git stash list: "git stash list"
git stash show: "git stash show"
git status: "git status"
git submodule:  "git submodule "
git submodule add:  "git submodule add "
git submodule in it:  "git submodule init "
git submodule update:  "git submodule update "
git tag: "git tag "

# Convenience
git edit config: "git config --local -e"

git clone clipboard:
  insert("git clone ")
  edit.paste()
  key(enter)
git diff highlighted:
    edit.copy()
    insert("git diff ")
    edit.paste()
    key(enter)
git diff clipboard:
    insert("git diff ")
    edit.paste()
    key(enter)
git add highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    key(enter)
git add clipboard:
    insert("git add ")
    edit.paste()
    key(enter)
git commit highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    insert("git commit")
