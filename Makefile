.PHONY: bump-major bump-minor bump-patch

bump-major:
	bumpversion major src/aphelper/VERSION

bump-minor:
	bumpversion minor src/aphelper/VERSION

bump-patch:
	bumpversion patch src/aphelper/VERSION

pypi:
	python setup.py sdist bdist_wheel
	twine check dist/*
	twine upload --repository-url https://test.pypi.org/legacy/ dist/*
	twine upload dist/*