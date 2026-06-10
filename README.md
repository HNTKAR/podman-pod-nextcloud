# podman-container-nextcloud

事前に[HNTKAR/podman-util](https://github.com/HNTKAR/podman-util)の内容を適用済みにすること

```bash
cd /PATH/TO/podman-container-nextcloud
rm -r $HOME/.config/containers/systemd/p-nextcloud*
./replace.sh
mkdir -p ~/.config/containers/systemd
cp tmp/p-* ~/.config/containers/systemd/
systemctl --user daemon-reload
systemctl --user restart pp-nextcloud
```
