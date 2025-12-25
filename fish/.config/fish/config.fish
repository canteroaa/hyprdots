set -g fish_greeting

source ~/.config/fish/hyde_config.fish

if type -q starship
    starship init fish | source
    set -gx STARSHIP_CACHE $XDG_CACHE_HOME/starship
    set -gx STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
end

# fzf 
if type -q fzf
    fzf --fish | source
end

#NOTE: MY CONFIG

#ALIAS
alias up="docker compose up"
alias down="docker compose down"
alias build="docker compose build --no-cache"
alias appsh="docker compose exec app sh"
# alias vpn="sudo openfortivpn"
# alias personal="psql -U momo -h 192.168.2.220 -p 5432 -d momo_personal"
# alias personal_auth="psql -U momo -h 192.168.2.220 -p 5432 -d momo_auth"
# alias dev_telecom="psql -U admin -h 192.168.2.247 -p 5432 -d telecom"
# alias dev_telecom_auth="psql -U admin -h 192.168.2.247 -p 5432 -d telecom_auth"
# alias antellserver="ssh -oHostKeyAlgorithms=+ssh-dss root@192.168.2.65"
# alias tigo_auth="psql -U aaron -h 127.0.0.1 -p 5432 -d momo_auth"
# alias new_tigo="psql -U aaron -h 127.0.0.1 -p 5432 -d new_tigo"
# alias bd_bolivia="psql -U aaron -h 127.0.0.1 -p 5432 -d bolivia"
# alias bd_bolivia_auth="psql -U aaron -h 127.0.0.1 -p 5432 -d bolivia_auth"
# alias telecom="ssh root@104.131.78.107"
alias sail="./vendor/bin/sail"
alias vim=nvim
# alias momotigo='cd /home/aaron/Documentos/Unnaki/Proyectos/TIGOmomopy/web-tigo && nvim'
# alias momopersonal='cd /home/aaron/Documentos/Unnaki/Proyectos/momopersonalpy/momo2-personal && nvim'
alias dsac='docker stop $(docker ps -q)'
# alias farmacia="cd /home/aaron/Documentos/tesis/Farmacia && nvim"
# alias wifi="gnome-control-center network"
# alias bd_mcdonalds_auth="psql -U aaron -h 127.0.0.1 -p 5432 -d mcdonalds_auth"
# alias bd_mcdonalds="psql -U aaron -h 127.0.0.1 -p 5432 -d mcdonalds"
# alias mcdonalds='cd /home/aaron/Documentos/Unnaki/Proyectos/mcdonals/mc-admin && nvim'
# alias devmc="ssh aaron@138.197.79.215"
# alias wallix="ssh -p 2222 porcuz@wallix.telecel.net.py"
# alias mirrorscreen="scrcpy -m 1024"
alias ku="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
# alias cwallix="ssh-keygen -f '/home/aaron/.ssh/known_hosts' -R '[wallix.telecel.net.py]:2222'"
# alias aider="aider --no-auto-commits --api-key GEMINI=AIzaSyBazyTM69o1dUdqREUwDCIMiZrqnbXgytY --model gemini/gemini-2.0-flash --chat-history-file /home/aaron/Documentos/aider_history/history.md --input-history-file /home/aaron/Documentos/aider_history/input.history --restore-chat-history --dark-mode"

source ~/.config/fish/theme_fzf.fish
source ~/.config/fish/sesh.fish

zoxide init fish | source

# GEMINI
# set -x GEMINI_API_KEY AIzaSyBazyTM69o1dUdqREUwDCIMiZrqnbXgytY

#NOTE: MY CONFIG END

# example integration with bat : <cltr+f>
# bind -M insert \ce '$EDITOR $(fzf --preview="bat --color=always --plain {}")' 

set fish_pager_color_prefix cyan
set fish_color_autosuggestion brblack

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias vc='code'

# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

fish_default_key_bindings
set -gx PATH $PATH /home/aoc/.config/composer/vendor/bin

# opencode
fish_add_path /home/aoc/.opencode/bin
