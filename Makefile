init:
	@-mkdir .venv
	pipenv install --dev --skip-lock

lab:
	pipenv run jupyter lab
