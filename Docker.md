## 首次运行

    docker-compose build web
    docker-compose run web rake db:setup
    docker-compose up

## 启动

    docker-compose up

## 将用户设为管理员

注意修改命令中的用户 ID

    docker-compose run web rails r "AdminUser.create user_id: 1, roles: ['super_admin']"

## 执行自动化测试

    sh bin/docker_test.sh

## 进入镜像 bash

    docker-compose run web /bin/sh
