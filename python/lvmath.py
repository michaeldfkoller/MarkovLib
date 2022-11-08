import markovlv
class lvmath():
    def __init__(self,type=None,iRate=None,dPre=0.625):
        self.MANN = 1
        self.FRAU = 2
        self.KAP = 1
        self.RENTE = 2
        self.ZWEI = 3        
        self.FuPtr = dict()
        if type == None:
            type = "CHEV90"
        TableDict = dict()
        TableDict["CHEV90"] = ("CH-QX-EKM-1995","CH-QX-EKF-1995","CH-QX-ERM-1990","CH-QX-ERF-1990")
        TableDict["CHKV90"] = ("CH-QX-GKM-1995","CH-QX-GKF-1995","CH-QX-GRM-1995","CH-QX-GRF-1995")
        TableDict["US"]     = ("US-QX-USRM-2000","US-QX-USRF-2000","US-QX-USRM-2000","US-QX-USRF-2000")
        a = markovlv.ANNUITYLV()
        self.FuPtr[(self.MANN,self.RENTE)] = a
        a = markovlv.ANNUITYLV()
        self.FuPtr[(self.FRAU,self.RENTE)] = a
        a = markovlv.CAPITALLV()
        self.FuPtr[(self.MANN,self.KAP)] = a        
        a = markovlv.CAPITALLV()
        self.FuPtr[(self.FRAU,self.KAP)] = a
        a = markovlv.ANNUITYLV2()
        self.FuPtr[(self.MANN,self.ZWEI)] = a        
        a = markovlv.ANNUITYLV2()
        self.FuPtr[(self.FRAU,self.ZWEI)] = a        
        i= self.FuPtr[(self.MANN,self.RENTE)].iSetTable(TableDict[type][2])
        i= self.FuPtr[(self.FRAU,self.RENTE)].iSetTable(TableDict[type][3])
        i= self.FuPtr[(self.MANN,self.KAP)].iSetTable(TableDict[type][0])
        i= self.FuPtr[(self.FRAU,self.KAP)].iSetTable(TableDict[type][1])
        i= self.FuPtr[(self.MANN,self.ZWEI)].iSetTable1(TableDict[type][2])
        i= self.FuPtr[(self.MANN,self.ZWEI)].iSetTable2(TableDict[type][3])
        i= self.FuPtr[(self.FRAU,self.ZWEI)].iSetTable1(TableDict[type][3])                
        i= self.FuPtr[(self.FRAU,self.ZWEI)].iSetTable2(TableDict[type][2])
        #print self.FuPtr
        self.FuPtr[(self.MANN,self.RENTE)].dSetPre(dPre)
        self.FuPtr[(self.FRAU,self.RENTE)].dSetPre(dPre)
        self.FuPtr[(self.MANN,self.ZWEI)].dSetPre(dPre)
        self.FuPtr[(self.FRAU,self.ZWEI)].dSetPre(dPre)
        self.omega = 120
        if iRate != None:
            self.SetInterestRate(iRate)
        self.PreProc=[]
        self.PreProc.append("AG")
        self.PreProc.append("AS")
        self.PreProc.append("AL")
        self.PreProc.append("WS")
        self.PreProc.append("WL")                
        self.Tarif = dict()
        self.Tarif["TE"]     = (self.KAP, ".vSetStopTime(x);.vSetStartTime(x+1);.vSetDeath(1.);.vSetSurvival(s,0.)")
        self.Tarif["T"]      = (self.KAP, ".vSetStopTime(x);.vSetStartTime(s);.vSetDeath(1.);.vSetSurvival(s,0.)")
        self.Tarif["F"]      = (self.KAP, ".vSetStopTime(x);.vSetStartTime(s);.vSetDeath(0.);.vSetSurvival(s,1.)")
        self.Tarif["G"]      = (self.KAP, ".vSetStopTime(x);.vSetStartTime(s);.vSetDeath(1.);.vSetSurvival(s,1.)")        
        self.Tarif["A"]      = (self.RENTE, ".vSetStopTime(x);.vSetSAge(s);.vLeistReset();.vSetStartTime(self.omega);.vSetG(0)")
        self.Tarif["AG"]     = (self.RENTE, ".vSetStopTime(x);.vSetSAge(s);.vLeistReset();.vSetStartTime(self.omega);.vSetG(self.g)")        
        self.Tarif["AS"]     = (self.RENTE, ".vSetStopTime(x);.vSetSAge(s);.vLeistReset();.vSetLeistExp(x,self.omega,1.,self.fact);.vSetStartTime(self.omega);.vSetG(0)")
        self.Tarif["AL"]     = (self.RENTE, ".vSetStopTime(x);.vSetSAge(s);.vLeistReset();.vSetLeistLinear(x,self.omega,1.,self.fact);.vSetStartTime(self.omega);.vSetG(0)")        
        self.Tarif["AR"]     = (self.RENTE, ".vSetStopTime(x);.vSetSAge(x);.vLeistReset();.vSetStartTime(self.omega);.vSetG(0)")
        self.Tarif["ARS293"] = (self.RENTE, ".vSetStopTime(x);.vSetSAge(x);.vLeistReset();.vSetLeistExp(x,self.omega,1.,1.03);.vSetStartTime(self.omega);.vSetG(0)")
        self.Tarif["PBW"]    = (self.RENTE, ".vSetStopTime(x);.vSetStartTime(s);.vSetSAge(x);.vLeistReset();.vSetG(0)")
        self.Tarif["W"]      = (self.ZWEI, ".vSetStopTime(x);.vSetStartTime(self.omega);.vSetSAge1(x);.vSetSAge2(x);.vLeistReset();.dSetY_Minus_X(delta,0);.dSetBenefit(0,0);.dSetBenefit(1,0);.dSetBenefit(2,1)")
        self.Tarif["WS"]      = (self.ZWEI, ".vSetStopTime(x);.vSetStartTime(self.omega);.vSetSAge1(x);.vSetSAge2(x);.vLeistReset();.vSetLeistExp(x,self.omega,1.,self.fact);.dSetY_Minus_X(delta,0);.dSetBenefit(0,0);.dSetBenefit(1,0);.dSetBenefit(2,1)")
        self.Tarif["WL"]      = (self.ZWEI, ".vSetStopTime(x);.vSetStartTime(self.omega);.vSetSAge1(x);.vSetSAge2(x);.vLeistReset();.vSetLeistLinear(x,self.omega,1.,self.fact);.dSetY_Minus_X(delta,0);.dSetBenefit(0,0);.dSetBenefit(1,0);.dSetBenefit(2,1)")                        

        
    def dEE(self,strTarif, g, x, s, delta=0):
        if strTarif not in self.Tarif.keys():
            strTarif = self.PreProcess(strTarif, g, x, s)
        if strTarif not in self.Tarif.keys():
            return "ERROR"
        ptr =self.FuPtr[(g,self.Tarif[strTarif][0])]
        task = self.Tarif[strTarif][1]
        tasks =task.split(";")
        for i in tasks:
            task="ptr"+i
            #print task
            exec(task)
        if self.Tarif[strTarif][0] == self.ZWEI:
                    return(ptr.dGetDK(x,0))
        return(ptr.dGetDK(x))

    def dPP(self,strTarif, g, x, s):
        ee = self.dEE(strTarif, g, x, s)
        pbw =  self.dEE("PBW", g, x, s)
        print(ee, pbw)
        try:
            return(ee/pbw)
        except:
            return "ERROR"            

    def PreProcess(self,strTarif, g, x, s):
        bFound = False
        for i in self.PreProc:
            if strTarif.startswith(i):
                bFound = True
                break
        strReminder = strTarif.replace(i,"")
        try:
            if i == "AG":
                self.g = int(strReminder)
            if i == "AS" or i == "WS" or i == "AL" or i == "WL" :
                self.fact = 0.01 * float(strReminder)
        except:
            return "ERROR PREPROCESSOR"
        return i

    def SetInterestRate(self,iRate):
        v= 1./(1.+iRate)
        for i in range(2500):
            for g in range(1,3):
                for t in range(1,4):
                    self.FuPtr[(g,t)].dSetDisc(i, v)
                    
