install:
	# install commands - first activate with `poetry shell`
	poetry lock &&\
	poetry install --no-root

format:
	# format code
	poetry run black *.py mylib/*.py
	
lint:
	# flake8 or pylint
	poetry run pylint --disable=R,C *.py mylib/*.py

test:
	# test
	poetry run pytest -vv --cov=mylib --cov=main test_*.py

deploy:
	# deploy

mytest:
	echo "TEST"

build:
	# build docker image
	docker build -t wiki-app-image .

run: build
	# run a docker container from the wiki-app image
	docker run --name wiki-app-container --rm -p 8080:8080 -d wiki-app-image

stop: 
	# stop the container from running
	docker stop wiki-app-container 

all: install lint test deploy