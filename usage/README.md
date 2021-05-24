# usage

## Prepare virtualenv

```bash
python3 -m venv venv
source venv/bin/activate
```

## install

- specify index URL using *-i* argument

    ```bash
    pip install -i https://pip.deokgon.kim/dgkim/stable sample
    ```

- or specify index URL in pip.conf (**will not reference ~/.pypirc**)

    copy pip.conf into venv/pip.conf or ~/.config/pip/pip.conf

    ```
    # venv/pip.conf or ~/.config/pip/pip.conf
    [global]
    index-url = https://pip.deokgon.kim/dgkim/stable
    ;index-url = https://pip.deokgon.kim/dgkim/staging
    ```

    ```bash
    pip install sample
    ```

## usage

```python
import sample
name = sample.get_name()

f = sample.get_function()
f()
```
