### 汎用的に使える高速化テクニック

#### webapp
- [ ] [goccy/go-json](https://github.com/goccy/go-json) を使う
- [ ] キャッシュする (**ベンチ回したときに前のキャッシュが残っていないように気をつける！**)
  - [ ] プロセス内オンメモリキャッシュ
  - [ ] [go-cache](https://github.com/patrickmn/go-cache)
  - [ ] memcached
  - [ ] プロキシキャッシュ ([参考1](https://4mo.co/nginx-proxy-cache/), [参考2](https://qiita.com/aosho235/items/bb1276a8c43e41edfc6f))
- [ ] systemd の LimitNOFILE をいい感じにする (too many open files が出てるかみる)
- [ ] db の接続設定 ([参考](https://tutuz-tech.hatenablog.com/entry/2020/03/24/170159))
- [ ] interpolateParams=true で db に接続する ([参考](http://dsas.blog.klab.org/archives/52191467.html))

#### nginx
- [ ] 静的ファイル等は nginx から配信する
  - [ ] expires を設定してキャッシュさせる
  - [ ] gzip 圧縮をする (トレードオフ)
- [ ] 同一ホストへの upstream は UNIX domain socket で通信する ([参考1](https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a#file-04_nginx-md), [参考2](https://kaneshin.hateblo.jp/entry/2016/05/29/020302)) (Go だとちょっと大変そう)


#### mysql
- [ ] innodb_flush_log_at_trx_commit = 2 にする (または 0)
- [ ] disable-log-in = 1, disable-log-bin を設定する
  - mysql8 では bin log がデフォルトで出るようになってるので注意
- [ ] innodb_buffer_pool_size をいい感じにする (総メモリの 80% ぐらい)
- [ ] innodb_flush_method をいい感じにする (O_DIRECT?)
- [ ] max_connections をいい感じにする (Too many connections error が出てるかみる) (systemd で LimitNOFILE もいじる)

#### OS (だいたい[ここ](https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a#頻出カーネルパラメータ設定)に載ってる)
- [ ] net.core.somaxconn をでかくする
- [ ] net.ipv4.ip_local_port_range でポートを広げる
- [ ] net.ipv4.tcp_tw_reuse=1 にする
- [ ] LimitNOFILE を大きくする（[参考](https://github.com/Saza-ku/ISUCON-template/wiki/LimitNOFILE-%E3%82%92%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B)）
  - `cat /proc/プロセスID/limits` で確認できる
  - `/etc/systemd/system/ユニット名.service.d/override.conf` に設定を上書きできる
    - `systemctl edit` でファイルパスを確認できる
    - nginx は[これ](https://github.com/Saza-ku/isucon11q/commit/db76093c2eca22a030c6616f3c69d22b8038cad3)
    - MySQL は[これ](https://github.com/Saza-ku/isucon11q/commit/e61a4844b6e1ec9c7fc9d68a120d564cd5554783)
      - MySQL 側で `open_files_limit` をいじる必要があるかも（[これ](https://github.com/Saza-ku/isucon11q/commit/5543eaefd533e598e9b6748c63354f09b7458623)）

#### 全般
- [ ] ログを止める (`var/lib` とかを見る)
