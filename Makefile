install:
	pip install uv &&\
	uv sync

lint:
	uv run python -m pytest tests/ -vv --cov=mylib --cov=api --cov=cli

format:
	uv run black mylib cli api tests

test:
	uv run pylint --disable=R,C --ignore-patterns=test_.*\.py mylib/*.py cli/*.py api/*.py

refactor: format lint

all: install format lint test

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".coverage" -exec rm -rf {} +
	find . -type d -name "htmlcov" -exec rm -rf {} +
	find . -type f -name "*_resized_*" -delete
	find . -type f -name "*_grayscale*" -delete

