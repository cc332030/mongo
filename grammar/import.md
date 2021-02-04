
# 导入

```shell script
NAME=mongo
CONFIG_HOME=/etc/$NAME
```

导入
```shell script
mongoimport -d=DATABASE -c=test --file=$CONFIG_HOME/test.json
```

导入指定 IP
```shell script
mongoimport -p=127.0.0.1 --port=27017 -d=DATABASE -c=test --file=$CONFIG_HOME/test.json
```
