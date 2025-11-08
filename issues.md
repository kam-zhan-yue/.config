# Common Issues

These are issues I ran into when running a fresh install.

#### nvim permission errors
Running `sudo ./dev-setup.sh` will cause some files to be created by the root, instead of th e user. This is compounded if you run `sudo nvim`. Obviously I was an idiot to do so, resulting in a local cache written by the root and inaccessible by user operations. I fixed this by nuking the files.

```shell
sudo rm -rf ~/.local/share/nvim
sudo rm -rf ~/.local/state/nvim
sudo rm -rf ~/.cache/nvim
```
