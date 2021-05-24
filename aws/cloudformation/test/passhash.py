#!/usr/bin/env python2

import random

hash = random.getrandbits(128)

print("%032x" % hash)
