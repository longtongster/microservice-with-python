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

all: install lint test deploy