default: build

build: fmtcheck build-ci

fmtcheck:
	@sh -c "'$(CURDIR)/scripts/gofmtcheck.sh'"

build-ci:
	go vet ./...
	go build -v ./...

fmt:
	@echo "==> Fixing source code with gofmt..."
	gofmt -s -w ./client

test: fmtcheck
	go test ./client -timeout=5m -parallel=4
