#FZF
function sesh-sessions
    set -l session (sesh list -i | fzf --height 50% --no-sort --ansi --reverse --border-label ' pick session ' --border --prompt '⚡  ')
    if test -n "$session"
        sesh connect $session
    end
    clear
    fish_prompt
end

#GUM
# function sesh-sessions
#     set -l session (sesh list -i | gum filter --limit 1 --placeholder 'Pick session' --height 50 --prompt='⚡')
#     if test -n "$session"
#         sesh connect $session
#     end
#     fish_prompt
# end

bind \co sesh-sessions
