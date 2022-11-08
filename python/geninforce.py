
AllPolicies = []
AllTasks = []

DistDK = 100 * [0]
DistDK[62] = 4.495
DistDK[63] = 4.67
DistDK[64] = 12.6
DistDK[65] = 12
DistDK[66] = 11.4
DistDK[67] = 9.7
DistDK[68] = 9
DistDK[69] = 8.3
DistDK[70] = 7.3
DistDK[71] = 6.9
DistDK[72] = 6.4
DistDK[73] = 5.6
DistDK[74] = 5.3
DistDK[75] = 4.7
DistDK[76] = 4.2
DistDK[77] = 3.6
DistDK[78] = 3.2
DistDK[79] = 2.3
DistDK[80] = 1.9
DistDK[81] = 1.6
DistDK[82] = 1.0
DistDK[83] = 0.7
DistDK[84] = 0.8

Mult = 50000. / sum(DistDK)

def PrintPol(str):
    print str

for i in range(len(DistDK)):
    if DistDK[i] == 0:
        continue
    DKCurrent = DistDK[i] * Mult
    iX = i
    iSW = max(i, 65)
    iS = max(i, 85)
    fLevel = max(1., 1.10 - 3.*(iX -60.)/100.)
    fGWB = DKCurrent / fLevel
    strInp = "iX  %d" % (iX)
    PrintPol(strInp)
    strInp = "iSW  %d" % (iSW)
    PrintPol(strInp)
    strInp = "iS  %d" % (iS)
    PrintPol(strInp)    
    PrintPol("iT0 5")
    PrintPol("iSex 0")
    strInp = "fFV  %10.2f" % (DKCurrent)
    PrintPol(strInp)
    strInp = "fGWB  %10.2f" % (fGWB)
    PrintPol(strInp)
    PrintPol("fGWBPct 0.05")
    PrintPol("fPart[0] 0.75")
    PrintPol("fPart[1] 0.125")
    PrintPol("fPart[2] 0.125")
    if i < 70:
        strInp = "fGuGWB  %10.2f" % (fGWB)
        PrintPol(strInp)
        strInp = "fDeltaGuGWB  %10.2f" % (0.045*fGWB)
        PrintPol(strInp)
        strInp = "iGuGWBRemainT  %d" % (70-i)
        PrintPol(strInp)
    else:
        strInp = "fGuGWB  %10.2f" % (0.)
        PrintPol(strInp)
        strInp = "fDeltaGuGWB  %10.2f" % (0.)
        PrintPol(strInp)
        PrintPol("iGuGWBRemainT 0")
    PrintPol("iRatchet 3")
    PrintPol("iForLife 1")
    PrintPol("fPremPct 0.0117")
    PrintPol("iGMDB 1")
    PrintPol("iGMDBiS 85")    


print "Done"
