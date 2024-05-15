#!/usr/bin/python

# Usage: yaml2json.py <file>

import sys
import yaml
import json


assert len(sys.argv) == 2, "Expected a file as argument"


with open(sys.argv[1], "r") as f:
    y = yaml.safe_load(f)

j = json.dumps(y)

print(j)
