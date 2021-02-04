
program_home=/home/program

NAME=mongo

TAG=4

PORT=27017

docker pull $NAME:$TAG

CONFIG_HOME=/etc/$NAME

docker stop $NAME
docker rm $NAME

rm -f $program_home/$NAME/data/mongod.lock

docker run -d --restart unless-stopped \
  --privileged=true \
  --log-opt max-size=10m \
  --log-opt max-file=3 \
  \
  -v /etc/localtime:/etc/localtime:ro \
  -v $program_home/$NAME:$CONFIG_HOME \
  -v $program_home/$NAME/data:/data/db \
  \
  -e java.net.preferipv4stack=true \
  -e user.timezone=gmt+08 \
  \
  -p $PORT:27017 \
  \
  --name $NAME \
  \
  $NAME:$TAG \
  \
  --config $CONFIG_HOME/mongo.yml

docker logs $NAME

docker exec -it $NAME mongo

rm -rf $program_home/$NAME/data

rm -rf $program_home/$NAME/logs

# mkdir $program_home/$NAME/logs
# chmod 777 $program_home/$NAME/logs

# -e MONGO_INITDB_ROOT_USERNAME=root \
# -e MONGO_INITDB_ROOT_PASSWORD=123456 \

# --logpath $CONFIG_HOME/logs/mongo.log
# --logappend
