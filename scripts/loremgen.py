#!/usr/bin/env python3

import sys
from lorem.text import TextLorem

lorem = TextLorem(srange=(5, 20), prange=(5, 10))

def print_usage():
    print("USAGE: {} <paragraph_count>".format(sys.argv[0]), file=sys.stderr)
    print("\tparagraph_count - Number of paragraphs to generate", file=sys.stderr)
    sys.exit(1)

if len(sys.argv) != 2:
    print_usage()

try:
    para_count = int(sys.argv[1])
except ValueError:
    print_usage()
finally:
    for i in range(para_count):
        print(lorem.paragraph())
        
        if i != para_count-1:
            print()

