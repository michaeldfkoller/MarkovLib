import markovlv
print "ALTERSRENTE"
b = markovlv.ANNUITYLV()
b.vSetStopTime(20)
b.vSetStartTime(120)
b.vSetSAge(65)
b.dSetPre(0.625)
b2 = markovlv.ANNUITYLV()
b2.vSetStopTime(20)
b2.vSetStartTime(120)
b2.vSetSAge(65)
b2.dSetPre(0.625)
a=markovlv.TABLESERVER()
a2=markovlv.TABLESERVER()
j = "CH-QX-ERF-1995"
j2= "CH-QX-ERF-1995"+";1.1"

print j
print j2
print "Table %s -- %s " % (j, j2)
print a.dITech()
print a2.dITech()
b.iSetTable(j)
b2.iSetTable(j2)
a.vSetTable(j)
a2.vSetTable(j2)

for k in range(2500):
    b.dSetDisc(k, 1./(1.035))
    b2.dSetDisc(k, 1./(1.035))    

v0 = 0
v1 = 0
dPre = 0.625
dPost = 1. - dPre
v = 1./1.035
for k in range(120, 47, -1):
    qx = a.dGetValue(k)
    qx2 = 1.1 * qx
    if k<65:
        dPre = 0
        dPost = 0
    v0 = dPre + v * (1-qx) * ( dPost + v0)
    v1 = dPre + v * (1-qx2) * ( dPost + v1)    
    print "%d  %6.4f %6.4f  %6.4f %6.4f" % (k,v0, b.dGetDK(k), v1, b2.dGetDK(k))

b = markovlv.ANNUITYLV2()
b.vSetStopTime(20)
b.vSetStartTime(120)
b.vSetSAge1(65)
b.vSetSAge2(65)
b.dSetPre(0.625)
b2 = markovlv.ANNUITYLV2()
b2.vSetStopTime(20)
b2.vSetStartTime(120)
b2.vSetSAge1(65)
b2.vSetSAge2(65)
b2.dSetPre(0.625)
a=markovlv.TABLESERVER()

j = "CH-QX-ERF-1995"
j2= "CH-QX-ERF-1995;1.1"
print j
print j2
print "Table %s -- %s " % (j, j2)
print a.dITech()
print a2.dITech()
print b.iSetTable1(j)
print b2.iSetTable1(j2)
print b.iSetTable2(j)
print b2.iSetTable2(j2)


pointers = [b, b2]
for i in pointers:
        i.dSetBenefit(0, 1.)
        i.dSetBenefit(1, 1.)
        i.dSetBenefit(2, 1.)
        i.dSetY_Minus_X(65, 65)
        i.vSetStartTime(130)

for k in range(120, 47, -1):
        print "%d  %6.4f %6.4f  %6.4f %6.4f" % (k,0, b.dGetDK(k,0), 0, b2.dGetDK(k,0))
    
