#!/data/data/com.termux/files/usr/bin/bash

# T3rmuxZetup v0.2
# Termux Setup For Termux
# Setup with one command

#termux setup storage
termux-setup-storage

#pkg update and upgrade
pkg update
pkg upgrade -y

#install programs
pkg install mpv
pkg install nano
for each_pac in "wget" "net-tools" "mlocate" "python3" "clang" "zip" "unzip" "tree" "git" "cmatrix" "htop" "ruby" "vim" "neofetch" "curl"; do
    pkg install $each_pac -y

#if rooted install tsu and root repos
if [ $(id -u) -eq 0 ]; then

    echo "You are currently root, installling tsu and some root repos"
pkg install tsu
pkg install root-repo

else

    echo "You are not root, will not install tsu and root repos"
fi

#configure vim
git clone https://github.com/sickill/vim-monokai
mkdir -p ~/.vim/colors
mv vim-monokai/colors/monokai.vim ~/.vim/colors && rm -rf vim-monokai/

#vim config file
cat > ~/.vimrc << EOF
syntax enable
colorscheme monokai
" enable mouse support
set mouse=a
" set black background
hi Normal ctermbg=16 guibg=#000000
hi LineNr ctermbg=16 guibg=#000000
set cursorline
hi cursorline gui=underline cterm=underline ctermbg=NONE
set smartindent
set nowrap
set number
set tabstop=4
set expandtab
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
EOF

# install zsh
pkg install -y zsh
        touch ~/.zshrc
        {
                echo "bindkey -v"
                echo "alias la='ls -a'"
                echo "alias ll='ls -l'"
                echo "alias lal='ls -al'"
                echo "alias src='source ~/.zshrc'"

                echo "alias pi='pkg install'"
                echo "alias pla='pkg list-all'"
                echo "alias pii='pkg list-installed'"
                echo "alias pu='pkg uninstall'"
                echo "alias psh='pkg show'"
                echo "alias pse='pkg search'"
        } >> ~/.zshrc
fi

#install fzf
pkg install -y fzf
        touch ~/.bashrc
        touch ~/.zshrc

        [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
        [ -f ~/.fzf.bash ] && source ~/.fzf.bash

        {
                echo "export FZF_DEFAULT_COMMAND='find'"
                echo "export FZF_DEFAULT_OPTS='--height 50% --reverse --margin 0,0,0,2 --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33 --color info:136,prompt:136,pointer:230,>
                echo $'alias fcd=\'cd "$(find -L -type d | fzf)"\''
                echo $'alias fv=\'vim "$(find -L -type f | fzf)"\''
        } >> ~/.zshrc
        {
                echo "export FZF_DEFAULT_COMMAND='find'"
                echo "export FZF_DEFAULT_OPTS='--height 50% --reverse --margin 0,0,0,2 --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33 --color info:136,prompt:136,pointer:230,>
                echo $'alias fcd=\'cd "$(find -L -type d | fzf)"\''
                echo $'alias fv=\'vim "$(find -L -type f | fzf)"\''
        } >> ~/.bashrc
fi

#install oh-my-zsh
pkg install -y curl
    pkg install -y git
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#install python things
for each in "setuptools" "requests" "ipython" "cryptography" "faker"; do
    pip3 install $each
done

# Install sms b0mb3r (https://github.com/Denishnc/b0mb3r)
cd ~
git clone https://github.com/Denishnc/b0mb3r

# Install ip tracer (https://github.com/rajkumardusad/IP-Tracer.git)
cd ~
git clone https://github.com/rajkumardusad/IP-Tracer.git
cd IP-Tracer
chmod +x install
./install

echo  Would you like to install the follow
wing packages? y/n
echo Zphisher, Termux-os, binutils

#wait for data
$read YN

#after
if [ YN = y ]; then
git clone https://github.com/htr-tech/zphisher
fi

#remove welcome text
rm /data/data/com.termux/files/usr/etc/motd

#FINISH
clear                                                           echo "Termux setup complete!"                                   echo "Thank you for using T3rmuxZetup!"
echo "Please do not run it again!"
exit 0                                                          


