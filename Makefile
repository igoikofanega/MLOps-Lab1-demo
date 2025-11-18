.PHONY: install lint format test refactor all clean

install:
    pip install uv &&\
	uv sync

lint:
	uv run pylint mylib cli api tests --disable=R,C

format:
	uv run black mylib cli api tests

test:
	uv run python -m pytest tests/ -v --cov=mylib --cov=cli --cov=api --cov-report=term-missing

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

