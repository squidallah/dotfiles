# ~/.bash_aliases
# Seperate file for bash aliases
# Sourced by ~/.bashrc

# Update dependencies and list upgradable packages.
alias aptup="echo \"sudo apt update && apt list --upgradable\" && sudo apt update && apt list --upgradable"

# Restart plasmashell (DE), probably in a bad way.
alias plasmarestart="killall plasmashell && sleep 3 && kstart5 plasmashell"

# Tjekker DBA.dk.
#alias dba="~/Coding/bin/dba.sh bastl monotron volca"
alias dba="~/Coding/bin/dba.py bastl monotron volca"

# Remove backup files and vim undo files in current directory, but prompt user
# before each removal.
alias rmb="rm -i *~ ; rm -i .*~"

## Remove backup files, but prompt user before each removal.
#alias rmb="rm -i *~"

## If the file ./index.html does not exist, create a soft link to
## ~/Coding/default-index.html called ./index.html
## Note: file as in anything (reg file, dir, symlink, node etc.), not just a regular file.
#alias hsi="[[ ! -e ./index.html ]] && ln -s ~/Coding/default-index.html ./index.html"

# If the file ./index.html does not exist, create a copy of
# ~/Coding/default-index.html called ./index.html
# Note: file as in anything (reg file, dir, symlink, node etc.), not just a regular file.
alias hsi="[[ ! -e ./index.html ]] && cp ~/Coding/default-index.html ./index.html"

## remove EOL's from text in clipboard
#alias rmeol="vim -c 'normal \"+p:%s/\\n//g<CR>' -c 'normal gg\"+yG' -c 'q!'"