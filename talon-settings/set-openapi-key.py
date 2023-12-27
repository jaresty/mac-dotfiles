#!/usr/bin/env python3

import os
with open(os.path.expanduser('~/.openapi-key'), 'r') as file:
    os.environ['OPENAI_API_KEY'] = file.read().strip()
