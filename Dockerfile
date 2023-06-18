FROM golang:latest

RUN mkdir /app
WORKDIR /app
# go mod init の値は"github.com/ユーザ名/アプリケーション名"が慣例らしい
RUN go mod init db_connect
RUN go get -u golang.org/x/sys
RUN go get github.com/gin-gonic/gin
RUN go get github.com/go-sql-driver/mysql
RUN go get github.com/jinzhu/gorm

# これだけだとno required module provides package github.com/gin-gonic/gin;となり、うまくいかなくて、
# 上記とは別で、ローカルにてgo mod tidyをしたら成功した（モジュールの過不足をよしなにしてくれるらしい）