setup:
	python3 -m venv ~/.udacity-devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

github:
	echo "Running Github acitons..."


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	python -m pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
