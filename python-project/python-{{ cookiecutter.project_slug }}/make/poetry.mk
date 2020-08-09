dist/{{ cookiecutter.project_slug }}-$(VERSION).tar.gz:
	poetry \
		build \
			--format="sdist" \
			--no-interaction

.PHONY: poetry-package
poetry-package: dist/{{ cookiecutter.project_slug }}-$(VERSION).tar.gz

.PHONY: poetry-clean
poetry-clean:
	rm -Rf "dist"

.PHONY: poetry-test
poetry-test:
	poetry run pytest -s

.PHONY: poetry-install
poetry-install:
	poetry install