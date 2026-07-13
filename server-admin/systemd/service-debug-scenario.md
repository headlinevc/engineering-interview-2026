You edit `myapp.service` to add an environment variable:

```diff
 [Service]
 Type=simple
 User=myapp
+Environment=LOG_LEVEL=debug
 ExecStart=/opt/myapp/bin/myapp --config /etc/myapp/config.yml
 Restart=always
```

You then run `systemctl restart myapp`, but the new log level never shows
up in `journalctl -u myapp`.
