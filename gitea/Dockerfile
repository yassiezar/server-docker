FROM golang:alpine

RUN apk add --no-cache git make 

RUN go get -d -u code.gitea.io/gitea
WORKDIR $GOPATH/src/code.gitea.io/gitea

RUN git checkout release/v1.0

RUN TAGS="bindata" make generate build
