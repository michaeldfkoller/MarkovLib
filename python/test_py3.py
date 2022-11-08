import markovlv
print("ALTERSRENTE")
a = markovlv.ANNUITYLV()
a.vSetStopTime(20)
a.vSetStartTime(120)
a.vSetSAge(65)
a.dSetPre(0.625)
temp = a.dSetBaseYear(2010)
temp = a.dSetActualYear(2010)
t0 = 1964
t1 = 2010
for i in range(120):
    a.dSetDisc(t0+i, 0.97)
    a.dSetQx(i,0.0075)
print ("%s -- %-10s  %-10s" % ("age","DK","CF"))
for i in range(50):
    print ("%d -- %10.2f  %10.4f" % (i+t1-t0, a.dGetDK(i+t1-t0), a.dGetCF(i+t1-t0)))

