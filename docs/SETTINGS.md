# 計測自動化の準備

## 事前
- [ ] GitHub のトークンを発行しセット
- [ ] あらかじめ ssh-keygen -R isucon1 isucon2 isucon3 を叩いておく

## 開始後
- [ ] ローカルの /etc/hosts を書き換える
- [ ] ssh できることを確認して Ansible の init.yml を流す
- [ ] netdata が見れるように SSH Forwarding を設定する
- [ ] init したやつの書き換え
  - [ ] nginx.conf を編集し、ltsv で解析できるようにする（[このようにする](https://github.com/Nagarei/isucon11-qualify-test/commit/b7e8f2667677831490d8e5966251633c14944015)）
  - [ ] MySQL のスローログの設定（[このようにする](https://github.com/Saza-ku/isucon11q/commit/4b51aa65ccc2fe2e7055ef15d4c058b01e7c15f3#diff-28ca88da6aa2437d8b374172e457b049f0af076e11da2f0f7e8400875b0c0f6eR64-R66)）
  - [ ] /etc/hosts に isucon1, isucon2, isucon3 を追加（[このようにする](https://github.com/Saza-ku/isucon11q/commit/0c73a803f287dc5124e35e7f65343950466e761d#diff-9d52768bf1e23378f9d2027518552a6e0cb75b167b8e0b552835efd807be392aR7-R9)）
  - [ ] /setup を実装し、/initialize で /setup を呼ぶ（[このようにする](https://github.com/Saza-ku/isucon11q/pull/74/commits/bdcabf4dda28881570a3d17d3df1d075fa45417a)）
      - 複数台構成を見越してリバプロではなく app サーバーに直接飛ばす
- [ ] `TODO: settings` となっているところを全て埋める
- [ ] `make fulldeploy` でデプロイする
