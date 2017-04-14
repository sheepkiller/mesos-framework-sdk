.PHONY: test test-race bench protos

PROTO_PATH := ${GOPATH}/src

test:
	@go test -cover ./...

test-race:
	@go test -race ./...

bench:
	@go test -bench . ./...

protos:
	@protoc --go_out=. --proto_path=.:${PROTO_PATH} ./include/scheduler/scheduler.proto
	@protoc --go_out=. --proto_path=.:${PROTO_PATH} ./include/executor/executor.proto
	@protoc --go_out=. --proto_path=.:${PROTO_PATH} ./include/mesos/mesos.proto
