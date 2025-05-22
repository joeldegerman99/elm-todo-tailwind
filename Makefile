# Project Makefile

# Default target
.PHONY: all
all: help

# Generate Tailwind CSS modules for Elm
.PHONY: generate-tailwind
generate-tailwind:
	npx elm-tailwind-modules --dir ./gen --tailwind-config tailwind.config.js

# Clean generated files
.PHONY: clean
clean:
	rm -rf ./gen

# Run the development server
.PHONY: dev
dev:
	docker-compose up --build
