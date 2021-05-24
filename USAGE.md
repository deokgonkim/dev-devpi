# USAGE

## virtualenv and install devpi client

```bash
python3 -m venv venv
source venv/bin/activate
pip install devpi-client
```

## login as user1

```bash
devpi use http://localhost:3141
devpi login user1
```

## create user1 and index

```bash
# will create user (this user should authenticate by ldap authentication)
devpi user -c user1 email=user1@myrocompany.com
# to see user list
devpi user -l
# to create index (index is child of user, so we created user first)
devpi index -c user1/dev bases=root/pypi volatile=False
```

## use devpi repository

```bash
devpi use http://localhost:3141/dgkim/dev
# to see index
devpi use -l
```

