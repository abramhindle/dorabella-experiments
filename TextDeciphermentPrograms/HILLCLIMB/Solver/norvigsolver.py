import fileinput
from ngrams import *
import re

for line in fileinput.input():
  line = re.sub(r'[^a-z]', '', line.lower())
  #print "CIPHER: ", line
  result = decode_subst(line)
  #print "SOLUTION: ", result
  print result
