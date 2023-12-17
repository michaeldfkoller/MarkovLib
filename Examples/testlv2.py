execfile("lvmath.py")
iR = 0.03
a=lvmath()
a.SetInterestRate(iR)
b=lvmath(type="US")
b.SetInterestRate(iR)
tests = ["TE","T","F","G","A","AR","AS105","AS100","AS099","AS099.99","AL1","AL0.1","AL0.01","AL0.0001","AG10","AG0","PBW","W","WS100","WS103","WS099","WS099.98","WS102.75","WL1","WL2","WL0.00001"]
for k in range(1000):
  for i in tests:
    for j in range(20,65):
        print "%-10s: %d --> %10.6f -- %10.6f" % (i, j, a.dEE(i,1,j,65),b.dEE(i,1,j,65))

