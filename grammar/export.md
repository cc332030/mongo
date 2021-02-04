
# 导出

```shell script
NAME=mongo
CONFIG_HOME=/etc/$NAME
```

导出
```shell script
mongoexport -d DATABASE -c test -o $CONFIG_HOME/test.json
```

导出指定 IP
```shell script
mongoexport -p=127.0.0.1 --port=27017 -d=DATABASE -c=test -o=$CONFIG_HOME/test.json
```

导出 登录
```shell script
mongoexport -u root -p 123456 -d=DATABASE -c=test -o=$CONFIG_HOME/test.json
```
