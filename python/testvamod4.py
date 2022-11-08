import markovlv as lv
import time

def doVAObj(iTech=0.025):
    sx = 0.03
    iT = iTech
    a = lv.VAMOD()
    print a.iSetTable(0, "US-QX-USRM-2000" , iT)
    print a.iSetTable(1, "US-QX-USRF-2000" , iT)

    for i in range(100):
       a.dSetSx(0,0,0,i,sx)

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

    for i in range(len(DistDK)):
      print a.iAnalyseToken("NewPerson")
      if DistDK[i] == 0:
          continue
      DKCurrent = DistDK[i] * Mult
      iX = i
      iSW = max(i, 65)
      iS = max(i, 85)
      fLevel = max(1., 1.10 - 3.*(iX -60.)/100.)
      fGWB = DKCurrent / fLevel
      print "x %d %d %d -- %10.2f %10.2f" % (iX, iSW, iS, DKCurrent, fGWB)
      strInp = "iX  %d" % (iX)
      a.iAnalyseToken(strInp)
      strInp = "iSW  %d" % (iSW)
      a.iAnalyseToken(strInp)
      strInp = "iS  %d" % (iS)
      a.iAnalyseToken(strInp)    
      a.iAnalyseToken("iT0 5")
      a.iAnalyseToken("iSex 0")
      strInp = "fFV  %10.2f" % (DKCurrent)
      a.iAnalyseToken(strInp)
      strInp = "fGWB  %10.2f" % (fGWB)
      a.iAnalyseToken(strInp)
      a.iAnalyseToken("fGWBPct 0.05")
      a.iAnalyseToken("fPart[0] 0.75")
      a.iAnalyseToken("fPart[1] 0.125")
      a.iAnalyseToken("fPart[2] 0.125")
      if i < 70:
        strInp = "fGuGWB  %10.2f" % (fGWB)
        a.iAnalyseToken(strInp)
        strInp = "fDeltaGuGWB  %10.2f" % (0.045*fGWB)
        a.iAnalyseToken(strInp)
        strInp = "iGuGWBRemainT  %d" % (70-i)
        a.iAnalyseToken(strInp)
      else:
        strInp = "fGuGWB  %10.2f" % (0.)
        a.iAnalyseToken(strInp)
        strInp = "fDeltaGuGWB  %10.2f" % (0.)
        a.iAnalyseToken(strInp)
        a.iAnalyseToken("iGuGWBRemainT 0")
      a.iAnalyseToken("iRatchet 3")
      a.iAnalyseToken("iForLife 1")
      a.iAnalyseToken("fPremPct 0.0117")
      a.iAnalyseToken("iGMDB 1")
      a.iAnalyseToken("iGMDBiS 85")    
    return(a)

# a= doVAObj()
# print a.iAnalyseToken("dRiskFree 0.025")
# print " 1000 Result %f" % (a.dGetMeanDK(0,1000))
# a= doVAObj()
# print a.iAnalyseToken("dRiskFree 0.03")
# print " 1000 Result %f" % (a.dGetMeanDK(0,2000))

Drift = [0.025, 0.030, 0.035, 0.040,0.05,0.06,0.07,0.08]
DeltaR = 0.0001
Val = []
PV01 = []
n = 100
print"\n\n Results \n"
for i in Drift:
    a= doVAObj(iTech = 0.025)
    print a.iAnalyseToken("dRiskFree %10.7f" % (i))
    Val.append(a.dGetMeanDK(0,n))
    a= doVAObj(iTech= 0.025+DeltaR)
    print a.iAnalyseToken("dRiskFree %10.7f" % (i + DeltaR))
    PV01.append(Val[-1]-a.dGetMeanDK(0,n))

for i in range(len(Drift)):
    print "%10.4f    V: %10.1f  PVO1 %10.4f Rel %10.6f" % (Drift[i],Val[i],PV01[i],PV01[i]/Val[i])
    
    

