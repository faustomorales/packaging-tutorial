init:
	@-mkdir .venv
	pipenv install --dev --skip-lock

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
