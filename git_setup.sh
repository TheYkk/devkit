#!/bin/bash
set -euo pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
set -x

# author
git config --global user.name "Kaan Karakaya"
git config --global user.signingkey "E6F0EE2E61D33FDD"
git config --global user.email "yusufkaan142@gmail.com"

# use https remotes and osxkeychain for creds
git config --global url.git\@github\.com\:.pushInsteadOf https://github.com/
git config --global gpg.program "gpg"

# use ssh in hub (commented out since pushInsteadOf)
# git config --global hub.protocol ssh # https://github.com/github/hub/issues/1614

# diff-so-fancy and its color scheme
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta "227"
git config --global color.diff.frag "magenta bold"
git config --global color.diff.commit "227 bold"
git config --global color.diff.old "red bold"
git config --global color.diff.new "green bold"
git config --global color.diff.whitespace "red reverse"

# rebase helper
git config --global sequence.editor interactive-rebase-tool

# install symlink for ssh config
SSH_CONFIG="$HOME/.ssh/config"
if [[ -f "$SSH_CONFIG" ]]; then
	rm "$SSH_CONFIG"
fi
ln -s "$SCRIPT_DIR/ssh_config" "$SSH_CONFIG"
ln -s "$SCRIPT_DIR/.gitmessage" "$HOME/.gitmessage"
ln -s "$SCRIPT_DIR/.gitignore_global" "$HOME/.gitignore_global"

git config --global core.editor "code --wait"
git config --global commit.template ~/.gitmessage
git config --global commit.gpgsign true
git config --global core.excludesfile ~/.gitignore_global

# use vscode as the editor
# git config --global core.editor "code --wait"