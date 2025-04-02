install:
	# install commands - first activate with `poetry shell`
	poetry lock &&\
	poetry install --no-root
format:
	# format code
	black *.py mylib/*.py
	
lint:
	# flake8

test:
	# test

deploy:
	# deploy

mytest:
	echo "TEST"

all: install lint test deploy