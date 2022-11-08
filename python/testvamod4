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

    print a.iAnalyseToken("x 64")
    print a.iAnalyseToken("g 0")
    print a.iAnalyseToken("dEE 20000")
    print a.iAnalyseToken("dSAA1 0.75")
    print a.iAnalyseToken("dSAA2 0.125")
    print a.iAnalyseToken("dSAA3 0.125")
    print a.iAnalyseToken("dPctTerm 1.1")
    print a.iAnalyseToken("dPctAnnuity 0.05")
    print a.iAnalyseToken("lSAnnuity 64")
    print a.iAnalyseToken("lSLastAnnuity 120")
    print a.iAnalyseToken("lSTerm 85")
    print a.iAnalyseToken("dPctPremium 0.0117")
    print a.iAnalyseToken("NewPerson")
    print a.iAnalyseToken("x 65")
    print a.iAnalyseToken("g 1")
    print a.iAnalyseToken("dEE 5000")
    print a.iAnalyseToken("dSAA1 0.75")
    print a.iAnalyseToken("dSAA2 0.125")
    print a.iAnalyseToken("dSAA3 0.125")
    print a.iAnalyseToken("dPctTerm 1.1")
    print a.iAnalyseToken("dPctAnnuity 0.05")
    print a.iAnalyseToken("lSAnnuity 65")
    print a.iAnalyseToken("lSLastAnnuity 120")
    print a.iAnalyseToken("lSTerm 85")
    print a.iAnalyseToken("dPctPremium 0.0117")
    print a.iAnalyseToken("NewPerson")
    print a.iAnalyseToken("x 66")
    print a.iAnalyseToken("g 0")
    print a.iAnalyseToken("dEE 20000")
    print a.iAnalyseToken("dSAA1 0.75")
    print a.iAnalyseToken("dSAA2 0.125")
    print a.iAnalyseToken("dSAA3 0.125")
    print a.iAnalyseToken("dPctTerm 1.1")
    print a.iAnalyseToken("dPctAnnuity 0.05")
    print a.iAnalyseToken("lSAnnuity 66")
    print a.iAnalyseToken("lSLastAnnuity 120")
    print a.iAnalyseToken("lSTerm 85")
    print a.iAnalyseToken("dPctPremium 0.0117")
    print a.iAnalyseToken("NewPerson")
    print a.iAnalyseToken("x 67")
    print a.iAnalyseToken("g 1")
    print a.iAnalyseToken("dEE 5000")
    print a.iAnalyseToken("dSAA1 0.75")
    print a.iAnalyseToken("dSAA2 0.125")
    print a.iAnalyseToken("dSAA3 0.125")
    print a.iAnalyseToken("dPctTerm 1.1")
    print a.iAnalyseToken("dPctAnnuity 0.05")
    print a.iAnalyseToken("lSAnnuity 67")
    print a.iAnalyseToken("lSLastAnnuity 120")
    print a.iAnalyseToken("lSTerm 85")
    print a.iAnalyseToken("dPctPremium 0.0117")
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
    
    

