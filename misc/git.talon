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
git branch [<user.text>]: "git branch {text or ''}"
git branch remote: "git branch --remote"
git branch set up stream to [<user.text>]: "git branch --set-upstream-to={text or ''}"
git branch delete [<user.text>]: "git branch -D {text or ''}"
git branch all [<user.text>]: "git branch -a {text or ''}"
git remote branches: "git branch --remote"
git checkout [<user.text>]: "git checkout {text or ''}"
git checkout branch [<user.text>]: "git checkout -B {text or ''}"
git checkout master: "git checkout master"
git cherry pick: "git cherry-pick "
git clone [<user.text>]: "git clone {text or ''}"
git commit message [<user.text>]: "git commit -m '{text or ''}'"
git commit amend [<user.text>]: "git commit --amend -m '{text or ''}'"
git commit all [<user.text>]: "git commit -a -m '{text or ''}'"
git commit: "git commit"
git config [<user.text>]: "git config {text or ''}"
git config list [<user.text>]: "git config --list {text or ''}"
git diff [<user.text>]: "git diff {text or ''}"
git diff (colour|color) words [<user.text>]: "git diff --color-words {text or ''}"
git diff staged [<user.text>]: "git diff --staged {text or ''}"
git diff cached: "git diff --cached"
git fetch: "git fetch"
git fetch [<user.text>]: "git fetch {text or ''}"
git fetch prune: "git fetch --prune"
git history: "git hist "
git in it: "git init"
git log all: "git log"
git log all changes: "git log -c"
git log: "git log "
git log changes: "git log -c "
git merge [<user.text>]: "git merge {text or ''}"
git move: "git mv "
git new branch: "git checkout -b "
git pull [<user.text>]: "git pull {text or ''} "
git pull origin [<user.text>]: "git pull origin {text or ''} "
git pull rebase [<user.text>]: "git pull --rebase {text or ''}"
git pull fast forward [<user.text>]: "git pull --ff-only {text or ''}"
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
git remote add [<user.text>]: "git remote add {text or ''}"
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
