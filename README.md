# dotfiles

1. dotfile仓库存放位置：`~/.local/config`
2. 用户 `$HOME` 下使用 `source ~/.local/config/xxx` 应用配置
3. 增加的可用新配置，手动更新到 config 下配置文件中，再同步

4. 应用生效方法
   * vim: `source ~/.local/config/.vimrc`
   * zsh: `source ~/.local/config/.zshrc`
   * tmux: `source-file ~/.local/config/.tmux.conf`
   * gitconfig: `[include]\n path = ~/.local/config/.gitconfig`