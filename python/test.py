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

print("%s -- %-10s  %-10s" % ("age","DK","CF"))
for i in range(50):
    print("%d -- %10.2f  %10.4f" % (i+t1-t0, a.dGetDK(i+t1-t0), a.dGetCF(i+t1-t0)))

import markovlv
print("ALTERSRENTE2")
a = markovlv.ANNUITYLV2()
a.vSetStopTime(20)
a.vSetStartTime(120)
a.vSetSAge1(65)
a.vSetSAge2(65)
a.dSetPre(0.625)
temp = a.dSetBaseYear(2010)
temp = a.dSetActualYear(2010)
t0 = 1964
t1 = 2010
for i in range(120):
    a.dSetDisc(t0+i, 0.97)
    a.dSetQx1(i,0.0075)
    a.dSetQx2(i,0.0075)
a.dSetBenefit(0, 1)
a.dSetBenefit(1, 1)
a.dSetBenefit(2, 1)

print("%s -- %-30s  %-10s" % ("age","DK1--2","CF"))
for i in range(50):
    print("%d -- %10.2f - %10.2f - %10.2f  %10.4f" % (i+t1-t0, a.dGetDK(i+t1-t0,0), a.dGetDK(i+t1-t0,1), a.dGetDK(i+t1-t0,2), a.dGetCF(i+t1-t0)))

print("CAPITAL")
a = markovlv.CAPITALLV()
a.vSetStopTime(20)
a.vSetStartTime(70)
a.vSetSurvival(65,100000.)
a.vSetDeath(200000.)
a.vSetPremium(2000.)
temp = a.dSetBaseYear(2010)
temp = a.dSetActualYear(2010)
t0 = 1964
t1 = 2010
for i in range(120):
    a.dSetDisc(t0+i, 0.97)
    a.dSetQx(i,0.0075)

print("%s -- %-10s  %-10s" % ("age","DK","CF"))
for i in range(50):
    print("%d -- %10.2f  %10.4f" % (i+t1-t0, a.dGetDK(i+t1-t0), a.dGetCF(i+t1-t0)))

print("WIDDOW")
a = markovlv.WIDDOWLV()
a.vSetStopTime(20)
a.vSetStartTime(110)
a.dSetPre(0.625)
temp = a.dSetBaseYear(2010)
temp = a.dSetActualYear(2010)
t0 = 1964
t1 = 2010
for i in range(120):
    a.dSetDisc(t0+i, 0.97)
    a.dSetQx(i,0.0075)
    a.dSetQy(i,0.0050)
    a.dSetHx(i,0.75)
    a.dSetYx(i,i-3.)

print("%s -- %-10s  %-10s" % ("age","DK","CF"))
for i in range(50):
    print("%d -- %10.2f  %10.4f" % (i+t1-t0, a.dGetDK(i+t1-t0), a.dGetCF(i+t1-t0)))

a=markovlv.TABLESERVER()
a.vSetTable("CH-QX-EKM-1995")
print("Table Nr %d" % (a.iTableNumber()))
print("x0 %d  xOmega %d  gender %d" % (a.iX0(),a.iXOmega(),a.iGender()))
print(" Tech I %10.6f" %(a.dITech()))
for i in range(100):
   print("%d -- %10.4f" % (i, a.dGetValue(i)))
a.vSetTable("RA-QX-RA-1857")
print("Table Nr %d" % (a.iTableNumber()))
print("x0 %d  xOmega %d  gender %d" % (a.iX0(),a.iXOmega(),a.iGender()))
print(" Tech I %10.6f" %(a.dITech()))
for i in range(110):
   print("%d -- %10.4f" % (i, a.dGetValue(i)))
a.vSetTable("GB-QX-MEDIEVAL")
print("Table Nr %d" % (a.iTableNumber()))
print("x0 %d  xOmega %d  gender %d" % (a.iX0(),a.iXOmega(),a.iGender()))
print(" Tech I %10.6f" %(a.dITech()))
for i in range(100):
   print("%d -- %10.4f" % (i, a.dGetValue(i)))

print(a.pcAllTarifs())
