up:
	docker compose up -d

down:
	docker compose down

fmt:
	gofmt -w .

test:
	go test ./...

lint:
	golangci-lint run
	