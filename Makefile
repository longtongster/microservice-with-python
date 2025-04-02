install:
	# install commands - first activate with `poetry shell`
	poetry lock &&\
	poetry install --no-root
format:
	# format code
	poetry run black *.py mylib/*.py
	
lint:
	# flake8 or pylint
	pylint --disable=R,C *.py mylib/*.py

test:
	# test

deploy:
	# deploy

mytest:
	echo "TEST"

all: install lint test deploy