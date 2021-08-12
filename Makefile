default: build

build: fmtcheck
	go vet ./...
	go build ./...

fmtcheck:
	@sh -c "'$(CURDIR)/scripts/gofmtcheck.sh'"

fmt:
	@echo "==> Fixing source code with gofmt..."
	gofmt -s -w ./client 

test: fmtcheck
	go test ./client -timeout=5m -parallel=4
