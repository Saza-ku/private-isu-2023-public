# 使い方

/etc/hosts に isucon1, isucon2, isucon3 の IP を設定し、`TODO: settings` とあるところを入力すれば基本的に使える。  
詳しくは [SETTINGS.md](SETTINGS.md) を参照。

## Ansible

- init.yml
  - 基本的には試合開始時に一回叩く
  - 各サーバーで必要なパッケージをインストールする
  - サーバーから webapp や etc などのファイルを rsync でローカルに落としてくる
- deploy.yml
  - webapp, etc, scripts などを rsync でデプロイ

## Makefile
- make deploy
  - webapp のビルド
  - webapp を rsync でデプロイ
  - アプリケーションの変更だけをデプロイしたいときに使う
- make fulldeploy
  - webapp のビルド
  - Ansible の deploy.yml を叩く
  - ミドルウェアの設定なども含めて全てデプロイしたいときに使う

## execall.sh

isucon1, isucon2, isucon3 の全てのサーバーに対し同じコマンドを実行する。

```bash
./execall.sh sudo ls -la /var/log/mysql
```

## sqlall.sh

isucon1, isucon2, isucon3 の全てのサーバーの MySQL に対し [scripts/exec.sql](../scripts/exec.sql) を実行する。  
インデックスを貼ったり初期データをいじったりといった手動オペレーション時に使う。
