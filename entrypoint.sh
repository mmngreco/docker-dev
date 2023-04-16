#!/usr/bin/env sh
case "$1" in
    "zsh")
        /usr/bin/zsh -i
        ;;
    "bash")
        /usr/bin/bsah -i
        ;;
    "vim")
        nvim
        ;;
    "python")
        python
        ;;
    *)
        echo "Usage: $0 {zsh|bash|vim|python}"
        exit 1
esac
