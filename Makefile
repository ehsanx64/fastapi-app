.PHONY: setup install dev # prod test coverage clean docker-build docker-run docker-rebuild mysql-setup

VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip
PYTHONPATH = $(shell pwd)
DOCKER_IMAGE = api
DOCKER_TAG = latest

setup:
	python -m venv $(VENV)
	$(PIP) install --upgrade pip

install:
	$(PIP) install -r requirements.txt
	# $(PIP) install -e .

dev: install
	PYTHONPATH=$(PYTHONPATH) $(VENV)/bin/uvicorn src.main:app --reload --host 0.0.0.0 --port 8000

