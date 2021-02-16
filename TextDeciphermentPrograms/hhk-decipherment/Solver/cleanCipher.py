import sys 
import re

cipher = open(sys.argv[1]).read()
print(re.sub(r'[^a-z]', '', cipher.lower()))