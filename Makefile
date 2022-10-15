.PHONY:
test:
	echo "1111"

.PHONY:
ohmyzshInstall:
	echo "ohmyzsh"
	ln -s ~/dotfiles/oh-my-zsh/zshrc ~/.zshrc
	source ~/.zshrc
	proxy
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

.PHONY:
tmuxInstall:
	echo "tmux"
	ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
	tmux source-file ~/.tmux.conf

.PHONY:
neovimInstall:
	echo "neovim"

.PHONY:
dotfiles: ohmyzshInstall tmuxInstall neovimInstall

