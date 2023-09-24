# Pipe my public key to my clipboard.
alias pubkey="xclip -selection clipboard ~/.ssh/id_rsa.pub && echo '=> Public key copied by xclip.'"

alias journalfollow="journalctl -b -f | ccze -A -o nolookups"

alias feh="feh -ZxF"

alias cat="bat --color=always --number"
