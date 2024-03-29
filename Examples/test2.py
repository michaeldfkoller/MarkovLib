import markovlv
print("ALTERSRENTE")
b = markovlv.ANNUITYLV()
b.vSetStopTime(20)
b.vSetStartTime(120)
b.vSetSAge(65)
b.dSetPre(0.625)
temp = b.dSetBaseYear(2010)
temp = b.dSetActualYear(2010)
t0 = 1964
t1 = 2010

a=markovlv.TABLESERVER()
u = a.pcAllTarifs()
uu = u.split("\n")
print(len(uu))
level = 0.17
for i in range(len(uu)):
    print(">%s<" % (uu[i]))
    level += 0.345
    if level > 2:
        level -= 1.998
    j = uu[i].replace("\n","")
    a.vSetTable(j)
    for k in range(120):
        b.dSetDisc(t0+k, 1./(1.00000001+a.dITech()))
        b.dSetQx(k,a.dGetValue(k))
    dTemp = b.dGetDK(48)
    a.vSetTable(j+";%6.2f"%level)
    for k in range(120):
        b.dSetDisc(t0+k, 1./(1.00000001+a.dITech()))
        b.dSetQx(k,a.dGetValue(k))    
    dTemp2 = b.dGetDK(48)    
    print("Table %d: %-25s %6.4f --> aex(48) %7.2f [%7.2f]"% (i, j, a.dITech(), dTemp, dTemp2 ))


a2 = a=markovlv.TABLESERVER()
j = "CH-QX-ERF-1995"
j2= "CH-QX-ERF-1995;1.67"
print("Table %s -- %s " % (j, j2))
a.vSetTable(j)
a2.vSetTable(j2)
for k in range(120):
    print("%d  %6.4f   %6.4f" % (k, a.dGetValue(k), a2.dGetValue(k)))

