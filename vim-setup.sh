#!/usr/bin/env bash

function print_header() {
    # makes it easier to find steps in this script
    printf "\n###############\n";
}

# if [[ ! -f ~/.vimrc ]]; then
#     print_header;
#     printf "copying vimrc\n";
#     cp /shared/vimrc /home/ubuntu/.vimrc;
# fi

if [[ ! -f ~/.tmux.conf ]]; then
    print_header;
    printf "copying tmux config\n";
    
    # makes it so that all colors are available in vim
    echo -e "set -ga terminal-overrides \",*256col*:Tc\"" > ~/.tmux.conf
    echo -e "set -g default-terminal \"screen-256color\"" >> ~/.tmux.conf
    tmux source ~/.tmux.conf
fi

if [[ ! -d ~/.vim/pack/plugins/start ]]; then
    print_header;
    printf "installing vim plugins\n";
    mkdir -p ~/.vim/pack/plugins/start;
    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go;
    vim -c "GoInstallBinaries";

    mkdir -p ~/.vim/pack/coc/start;
    git clone --branch release https://github.com/neoclide/coc.nvim.git ~/.vim/pack/coc/start/coc.nvim --depth=1;
    vim -c "helptags ~/.vim/pack/coc/start/coc.nvim/doc/";
    # Equivalent of running :CocInstall coc-go
    vim -c "CocInstall coc-go";
    vim -c "CocInstall coc-pyright";
    vim -c "CocInstall coc-tsserver";
    vim -c "CocInstall coc-json";
    vim -c "CocInstall coc-sh";

    vim -c "helptags ALL"

    # some tricks to have coc-pyright play nice with conda
    python_shim=/usr/local/bin/python-for-coc-pyright;
    sudo touch $python_shim;
    sudo chown $USER:$USER $python_shim;
    echo -e "#"'!'"/usr/bin/env bash\npython \"\$@\"" > $python_shim;
    sudo chmod u+x $python_shim;

    # create coc-settings
    echo "{ \"python.pythonPath\":\"/usr/local/bin/python-for-coc-pyright\" }" > ~/.vim/coc-settings.json
fi

