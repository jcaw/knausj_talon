os: mac
app: iTerm2
-
tag(): terminal
tag(): user.splits

# Pane creation and navigation
action(user.split_window_horizontally): key("cmd-shift-d")
action(user.split_window_vertically): key("cmd-d")
action(user.split_window_right): key("cmd-d")
action(user.split_next): key("cmd-]")
action(user.split_last): key("cmd-[")

# these don't really go here

# {"tags": ["old talon"], "input": '', "output": ''},
shell home: "~/"
lefty: key("ctrl-a")
ricky: key("ctrl-e")
clear back: key("ctrl-u")
clear line:
    key("ctrl-e")
    key("ctrl-u")
(pain new | split vertical): key("cmd-d")
# "new [S S H] [tab] {global_terminal.servers}": new_server,
# talon
tail talon [log]: "tail -f ~/.talon/talon.log"
talon reple: "~/.talon/bin/repl"
reverse: key("ctrl-r")
rerun:
    key("up")
    key("enter")
cd:
    insert("cd ; ls")
    key("left")
    key("left")
    key("left")
    key("left")
cd wild:
    insert("cd **; ls")
    key("left")
    key("left")
    key("left")
    key("left")
    key("left")
cd wild <user.optional_text>:
    insert("cd {optional_text}**; ls")
    Key("left")
    Key("left")
    Key("left")
    Key("left")
    Key("left")
cd {user.directories}: "cd {directories}"
directory {user.directories}: "{directories}"
(ls | run ellis | run alice): "ls\n"
(la | run la): "ls -la\n"
durrup: "cd ..; ls\n"
go back: "cd -\n"
pseudo: "sudo "
pseudo [make me a] sandwich:
    key("up")
    key("ctrl-a")
    insert("sudo ")
    key("enter")
pseudo shut down now: "sudo shutdown now"

shell C H mod: "chmod "
shell curl: "curl "
shell (make executable | add executable permissions): "chmod a+x "
shell clear:
    key("ctrl-c")
    insert("clear\n")
shell copy <user.optional_text>: "cp {optional_text}"
shell copy (recursive | curse) [<user.optional_text>]: "cp -r {optional_text}"
shell kill: key("ctrl-c")
shell list <user.optional_text>: "ls {optional_text}"
shell list all <user.optional_text>: "ls -la {optional_text}"
shell make <user.optional_text>: "mkdir {optional_text}"
shell mipple <user.optional_text>: "mkdir -p {optional_text}"
shell move <user.optional_text>: "mv {optional_text}"
shell remove <user.optional_text>: "rm {optional_text}"
shell remove (recursive | curse) <user.optional_text>: "rm -rf {optional_text}"
shell enter: "ag -l | entr "
shell enter 1: "ag -l . .. | entr "
shell enter 2: "ag -l . ../.. | entr "
shell enter 3: "ag -l . ../../.. | entr "
shell enter 4: "ag -l . ../../../.. | entr "
shell less <user.optional_text>: "less {optional_text}"
shell cat <user.optional_text>: "cat {optional_text}"
shell X args <user.optional_text>: "xargs {optional_text}"
shall W get: "wget "
# shell mosh: "mosh "
shell M player: "mplayer "
shell nvidia S M I: "nvidia-smi "
shell R sync: "./src/dotfiles/sync_rsync "
shell tail: "tail "
shell tail follow: "tail -f "
shall count lines: "wc -l "
shell L S U S B: "lsusb"
shell net stat: "netstat -l "

shell mosh {user.servers}: "mosh {servers}"
shell (S S H | SSH) {user.servers}: "ssh {servers}"
shell server {user.servers}: "{servers}"
shell S S H copy I D {user.servers}: "ssh-copy-id {servers}"
shell copy key {user.servers}: "ssh-copy-id {servers}"

# python
create virtual environment:
    insert("virtualenv -p python3 venv")
    key("enter")
activate virtual environment:
    insert("source `find . | grep bin/activate$`")
    key("enter")

# apt-get
apt get: "apt-get "
apt get install: "apt-get install "
apt get update: "apt-get update "
apt get upgrade: "apt-get upgrade "
apt get auto remove: "apt-get autoremove "
apt get auto clean: "apt-get autoclean "
apt get remove: "apt-get remove "
apt get purge: "apt-get purge "
apt get clean: "apt-get clean "
apt get check: "apt-get check "
apt get source: "apt-get source "
apt get download: "apt-get download "

# docker
docker P S: "docker ps "
docker (remove | R M): "docker rm "
docker stop: "docker stop "
docker run: "docker run "
docker exec: "docker exec "
docker logs: "docker logs "
docker shell:
    insert("docker exec -it  bash")
    key("left")
    key("left")
    key("left")
    key("left")
    key("left")
docker compose up: "docker-compose up "
docker compose down: "docker-compose down "
docker detach:
    key("ctrl-p")
    key("ctrl-q")

# conda
conda install: "conda install "
conda list: "conda list "

# tmux
(T mux | teemucks) list: "tmux ls"
(T mux | teemucks) new session <user.optional_text>: "tmux new-session -t {optional_text}"
(T mux | teemucks) attach <user.optional_text>: "tmux a -t {optional_text}"
(T mux | teemucks) scroll:
    key("ctrl-b")
    key("[")

# gsutil
G S you till acl: "gsutil acl "
G S you till bucketpolicyonly: "gsutil bucketpolicyonly "
G S you till cat: "gsutil cat "
G S you till compose: "gsutil compose "
G S you till config: "gsutil config "
G S you till cors: "gsutil cors "
G S you till cp: "gsutil cp "
G S you till defacl: "gsutil defacl "
G S you till defstorageclass: "gsutil defstorageclass "
G S you till D U: "gsutil du "
G S you till hash: "gsutil hash "
G S you till help: "gsutil help "
G S you till I am: "gsutil iam "
G S you till K M S: "gsutil kms "
G S you till label: "gsutil label "
G S you till lifecycle: "gsutil lifecycle "
G S you till logging: "gsutil logging "
G S you till L S: "gsutil ls "
G S you till M B: "gsutil mb "
G S you till move: "gsutil mv "
G S you till notification: "gsutil notification "
G S you till perfdiag: "gsutil perfdiag "
G S you till rb: "gsutil rb "
G S you till requesterpays: "gsutil requesterpays "
G S you till retention: "gsutil retention "
G S you till rewrite: "gsutil rewrite "
G S you till rm: "gsutil rm "
G S you till rsync: "gsutil rsync "
G S you till setmeta: "gsutil setmeta "
G S you till signurl: "gsutil signurl "
G S you till stat: "gsutil stat "
G S you till test: "gsutil test "
G S you till update: "gsutil update "
G S you till version: "gsutil version "
G S you till versioning: "gsutil versioning "
G S you till web: "gsutil web "

# rostopic
ross topic bandwidth: "rostopic bw "
ross topic delay: "rostopic delay "
ross topic echo: "rostopic echo "
ross topic find: "rostopic find "
ross topic hertz: "rostopic hz "
ross topic info: "rostopic info "
ross topic list: "rostopic list "
ross topic pub: "rostopic pub "
ross topic type: "rostopic type "

# supervisorctl
supervisor control: "supervisorctl"
supervisor control status: "supervisorctl status"

# dat
dat: "dat "
dat share: "dat share "
dat create: "dat create "
dat sync: "dat sync "
dat clone: "dat clone "
dat pull: "dat pull "
dat log: "dat log "
dat status: "dat status "
dat register: "dat register "
dat login: "dat login "
dat publish: "dat publish "
dat whoami: "dat whoami "
dat logout: "dat logout "
dat doctor: "dat doctor "
dat help: "dat help "
dat version: "dat version "

# pip
{user.pip}: "{pip}"
{user.pip} install: "{pip} install "
{user.pip} install requirements: "{pip} install -r "
{user.pip} install editable: "{pip} install -e "
{user.pip} install this: "{pip} install -e ."
{user.pip} install local: "{pip} install -e ."
{user.pip} install --upgrade: "{pip} install --upgrade "
{user.pip} uninstall: "{pip} uninstall "
{user.pip} list: "{pip} list"
