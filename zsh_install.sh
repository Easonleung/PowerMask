# ==== INSTALL ZSH ======================== #
echo ""
echo "===> Install zsh ..."
echo ""

sudo apt-get install zsh
sudo sh on-my-zsh-install.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo ""
echo "===> Set .zshrc ..."
echo "Set ZSH_THEME=\"powerlevel10k/powerlevel10k\" in ~\/.zshrc.\""
