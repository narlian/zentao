# @Author: narlian
# @Date:   2018-08-20 19:46:41
# @Last Modified by:   narlian
# @Last Modified time: 2018-08-20 19:49:59
#!/bin/sh
#如果 frontend_zentao 不存在, 则创建
if [ ! -n "$(docker network ls |grep frontend_zentao)" ]; then
  docker network create frontend_zentao
fi
#如果 backend_zentao 不存在, 则创建
if [ ! -n "$(docker network ls |grep backend_zentao)" ]; then
  docker network create backend_zentao
fi
#如果 volume_zentao_data 不存在, 则创建
if [ ! -n "$(docker volume ls |grep volume_zentao_data)" ]; then
  docker volume create volume_zentao_data
fi
# 先构建
docker-compose build
# 再创建
docker-compose up -d --force-recreate