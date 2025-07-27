# Howto
## General info 
These are my personal dotfiles, used with Void Linux within Xfce on my Asus TUF notebook. 
## Restore dotfiles
1) alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
2) echo ".dots" >> .gitignore
3) git clone https://github.com/glubbfreund/dots-linux --bare <git-repo-url> $HOME/.dots
4) dots checkout
5) dots config --local status.showUntrackedFiles no
## Git config
1) generate key with ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
2) get pub key with cat /home/user/.ssh/github.pub
3) go to github, create new key and paste the pub key there
4) eval "$(ssh-agent -s)"
5) ssh-add -K /home/user/.ssh/github
6) check connection with ssh -T git@github.com
7) go to the specific repo and make git remote remove origin
8) then git remote add github git@github.com:user/repository.git
9) dots config --global user.name "Your Name" && dots config --global user.email "you@example.com"
