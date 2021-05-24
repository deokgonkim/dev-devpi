# sample

## (prerequists)

This project will use 'twine' to upload package to devpi server

```bash
pip install twine
# we need wheel to build bdist_wheel
pip install wheel
```

- prepare ~/.pypirc (.pypirc file is used when publishing package **this file will not be used when installing package using pip**)

```bash
# change username and URL for devpi
cp .pypirc ~/
```

## build package

```bash
python setup.py sdist bdist_wheel
```

will create distribution files in dist/ directory

## upload using twine

```bash
twine upload -r devpi-staging dist/*
```

## usage

- install package
    - specify index URL using *-i* argument

    ```bash
    pip install -i https://pip.deokgon.kim/dgkim/stable sample
    ```

    - or specify index URL in pip.conf (**will not reference ~/.pypirc**)

    ```
    # venv/pip.conf or ~/.config/pip/pip.conf
    [global]
    index-url = https://pip.deokgon.kim/dgkim/stable
    ;index-url = https://pip.deokgon.kim/dgkim/staging
    ```

    ```bash
    pip install sample
    ```

- using package

```python
import sample
name = sample.get_name()
print(name)

f = sample.get_function()
f()
```