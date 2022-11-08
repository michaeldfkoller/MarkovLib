import markovlv
a=markovlv.TABLESERVER()
b= markovlv.ANNUITYLV()
b2= markovlv.ANNUITYLV()
u = a.pcAllTarifs()
uu = u.split("\n")
print(len(uu))
print("ALTERSRENTE")
for i in range(len(uu)):
    j = uu[i].replace("\n","")
    ret= b.iSetTable(j)
    ret= b2.iSetTable(j)    
    if ret<0:
        break
    b.vSetStopTime(65)
    b.vSetSAge(65)
    b.dSetPre(0.625)
    for k in range(2500):
        b.dSetDisc(k, 0.97)
    b2.vSetStopTime(0)
    b2.vSetSAge(0)
    b2.dSetPre(0.5)
    for k in range(2500):
        b2.dSetDisc(k, 1.)        
    print("%-35s  (ex(0) %7.1f) -> aex(65) %7.2f"% (j, b2.dGetDK(1)+1, b.dGetDK(65)))



