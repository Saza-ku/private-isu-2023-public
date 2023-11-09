## ISUCON X

### /etc/hosts
```
153.125.129.158 isucon1
153.125.146.245 bench
```

### SSH forwarding for netdata

```sh
ssh -fNT -L 19991:127.0.0.1:19999 isucon@isucon1
ssh -fNT -L 19992:127.0.0.1:19999 isucon@isucon2
ssh -fNT -L 19993:127.0.0.1:19999 isucon@isucon3
```

### Notes
