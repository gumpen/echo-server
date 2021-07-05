GOCMD=go
GOBUILD=$(GOCMD) build
BINARY_NAME=server_bin

run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./...
	./$(BINARY_NAME)

migrateup:
	migrate -source file://db/migrations -database 'mysql://root@tcp(127.0.0.1:3306)/server_dev' up

migratedown:
	migrate -source file://db/migrations -database 'mysql://root@tcp(127.0.0.1:3306)/server_dev' down

resetdb: migratedown migrateup
