.PHONY: bump-major bump-minor bump-patch

bump-major:
	bumpversion major aphelper/VERSION

bump-minor:
	bumpversion minor aphelper/VERSION

bump-patch:
	bumpversion patch aphelper/VERSION

pypi-build:
	rm -rf dist/*
	python setup.py sdist bdist_wheel
	twine check dist/*

pypi-test:
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*

pypi-upload:
	twine upload dist/*