# --- Variables ---
# The name of your application's binary
BINARY_NAME=myapp

# The path to your main.go file
CMD_PATH=./cmd/myapp

# The output directory for the binary
BIN_DIR=./bin

# --- Targets ---

.PHONY: all build run clean test tidy help

# Default target, runs when you just type 'make'
all: build

## build: Compiles the application and places the binary in the /bin directory.
build:
	@echo "Building application..."
	@go build -o $(BIN_DIR)/$(BINARY_NAME) $(CMD_PATH)

## run: Runs the application directly from the source code.
run:
	@echo "Running application..."
	@go run $(CMD_PATH)

## clean: Removes the compiled binary from the /bin directory.
clean:
	@echo "Cleaning up..."
	@if [ -f $(BIN_DIR)/$(BINARY_NAME) ]; then rm $(BIN_DIR)/$(BINARY_NAME); fi

## tidy: Tidies and formats go.mod and go.sum files.
tidy:
	@echo "Tidying modules..."
	@go mod tidy

## help: Shows this help message.
help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-10s %s\n", $$1, $$2}'