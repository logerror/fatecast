PY=python
PIP=pip

.PHONY: install dev run serve web test lint format precommit-install

install:
	$(PIP) install -e .

dev:
	$(PIP) install -e . -r requirements-dev.txt

run:
	$(PY) -m fatecast

serve:
	textual run fatecast.ui:CupThrowApp

web:
	textual serve "python -m fatecast"

test:
	pytest -q

lint:
	ruff check . && mypy fatecast

format:
	black .

precommit-install:
	pre-commit install


