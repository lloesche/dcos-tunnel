all: env test packages

clean:
	bin/clean.sh

env:
	bin/env.sh

test:
	bin/test.sh

test-binary: test
	${SHELL} -c ". env/bin/activate; \
		pip install pytest; \
		bin/test-binary.sh"

packages:
	bin/packages.sh

binary: clean env packages
	${SHELL} -c ". env/bin/activate; \
		pip install pyinstaller==3.1.1; \
		pyinstaller binary/binary.spec"