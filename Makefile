.PHONY: up down build test fmt

up:
	docker-compose up --build

down:
	docker-compose down -v

build:
	docker-compose build

test:
	cd backend/backend && dotnet test

fmt:
	cd backend/backend && dotnet format
