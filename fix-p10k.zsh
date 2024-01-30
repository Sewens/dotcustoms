# From https://github.com/romkatv/powerlevel10k/issues/936#issuecomment-670839712
() {
  emulate -L zsh -o xtrace -o err_return
  ZDOTDIR=/no/such/dir command zsh -ic '[[ $ZDOTDIR == /no/such/dir ]]'
  command mkdir -p -- ~/zsh-backup
  local rc
  for rc in ~/.zshenv ~/.zprofile ~/.zshrc ~/.zlogin ~/.zlogout ~/.oh-my-zsh; do
    [[ -e $rc ]] || continue
    [[ ! -e ~/zsh-backup/${rc:t} ]] || {
      command rm -rf -- $rc
      continue
    }
    command rm -rf -- ~/zsh-backup/${rc:t}.tmp.$$
    command cp -r -- $rc ~/zsh-backup/${rc:t}.tmp.$$
    command mv -- ~/zsh-backup/${rc:t}.tmp.$$ ~/zsh-backup/${rc:t}
    command rm -rf -- $rc
  done
  command git clone -- https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
  command git clone --depth=1 -- https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
  command sed -- 's|robbyrussell|powerlevel10k/powerlevel10k|' ~/.oh-my-zsh/templates/zshrc.zsh-template >~/.zshrc
  ZDOTDIR=~ exec zsh -i
}