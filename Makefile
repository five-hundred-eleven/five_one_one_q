all:
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist/ build/ *.egg-info .fuse_hidden*

install:
	python setup.py install

uninstall:
	pip uninstall -y five-one-one-q

reinstall:
	$(MAKE) clean
	$(MAKE) uninstall
	$(MAKE) install

format:
	isort python/*.py tests/*.py
	black python/*.py tests/*.py

test:
	python -m pytest --durations=50 tests/test_basics.py tests/test_order.py

# WARNING the following tests can take a very long time to run!
test-async:
	python -m pytest --durations=50 tests/test_async.py

test-memory:
	python -m pytest --durations=50 tests/test_memory.py

test-performance:
	python -m pytest --durations=50 tests/test_performance.py

test-all:
	python -m pytest --durations=50
