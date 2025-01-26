PROJECT_NAME := personal-finance-tracker
PYTHON_VERSION := 3.12.2
VENV_NAME := $(PROJECT_NAME)-$(PYTHON_VERSION)


.install-python:
	pyenv install -s $(PYTHON_VERSION)

.create-venv:
	pyenv uninstall -f $(VENV_NAME)
	pyenv virtualenv $(PYTHON_VERSION) $(VENV_NAME)
	pyenv local $(VENV_NAME)

.pip:
	pip install --upgrade pip

.setup:
	pip install -r requirements.txt

create-venv: .install-python .create-venv .pip .setup

test:
	py.test -v --cov-report=term-missing --cov-report=html --cov

code-convention:
	flake8
	pycodestyle

