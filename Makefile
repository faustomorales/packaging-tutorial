DOCUMENTATION_PORT ?= 5001

init:
	@-mkdir .venv
	pipenv install --dev --skip-lock
	pipenv run pip install -r docs/requirements.txt

lab:
	pipenv run jupyter lab

lint:
	pipenv run pylint -j 0 flattener --rcfile=setup.cfg

type:
	pipenv run mypy flattener

format:
	pipenv run yapf --recursive --in-place --exclude=flattener/_version.py flattener tests

format_check:
	pipenv run yapf --recursive --diff --exclude=flattener/_version.py tests flattener\
	|| (echo '\nUnexpected format.' && exit 1)

test:
	pipenv run pytest $(TEST_SCOPE)

.PHONY: docs
docs:
	pipenv run sphinx-autobuild -b html "docs" "docs/_build/html" --host 0.0.0.0 --port $(DOCUMENTATION_PORT) $(O)

dist:
	rm -rf dist
	pipenv run python setup.py sdist
	pipenv run twine upload --repository-url https://test.pypi.org/legacy/ dist/*