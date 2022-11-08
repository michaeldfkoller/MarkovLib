Item = []

StartStrH = """

#ifndef __VASTRUCT
#define __VASTRUCT

#define NRFUNDS 5
"""

EndStrH = """
#endif
"""

STRVABENEFITS = """
typedef struct VABENEFITS
{
REPLACE
} VABENEFITS;
"""

STRVAINVESTMENT = """
typedef struct VAINVESTMENT
{
REPLACE
} VAINVESTMENT;
"""

STRVAPERSON = """
typedef struct VAPERSON
{
REPLACE
} VAPERSON;
"""

STRVAPAR = """
typedef struct VAPAR
{
REPLACE
} VAPAR;
"""


strInterpreter ="""
void vTokenInterpreter(VAMOD * pVAM, VAINFORCE * pInf, VAPERSON * p, char * pcToken)
{
  printf("   --> Token Interpreter: >%s< \\n", pcToken);
TODO
};
"""

StrTypes = [("VABENEFITS",STRVABENEFITS),("VAINVESTMENT",STRVAINVESTMENT),("VAPERSON",STRVAPERSON),("VAPAR",STRVAPAR)]

strHFile = "vastruct_gen.h"
strCFile = "interpreter_gen.c"

# Item[i] = "ExtName"/None , "Structure", "Type", "InternalName", "Description"


Item.append(("lId", "VAPERSON", "long", "lId","Id of Person"))
Item.append(("x", "VAPERSON", "long", "lAge","Actual Age of Person"))
Item.append(("g", "VAPERSON", "long", "lGender","Gender of person 0 = Male, 1 = female"))
Item.append(("BirthYear", "VAPERSON", "long", "lBirthYear","Year wehn person was born eg 1950"))
Item.append((None, "VAPERSON", "VABENEFITS", "symB","Structure to benefits"))
Item.append((None, "VAPERSON", "VAINVESTMENT", "symI","Structure to investments"))
Item.append((None, "VAPERSON", "VAPERSON *", "psymNext","Next Person"))

Item.append(("dStartValueGuarantee", "VABENEFITS","double","symB.dStartValueGuarantee","Start VAlue of Guarantee"))
Item.append(("dIncreasePA", "VABENEFITS","double","symB.dIncreasePA","This is the parameter for the annual increase in the form += alpha or *= 1+alpha"))
Item.append(("lStartGuaranteeAge", "VABENEFITS","long","symB.lStartGuaranteeAge","Age at which guarantee startes to increase"))
Item.append(("lEndGuaranteeAge", "VABENEFITS","long","symB.lEndGuaranteeAge","Age at which guarantee stops to increase"))
Item.append(("bLinear", "VABENEFITS","bool","symB.bLinear","When true (1) there is a linear increase"))
Item.append(("bExponential", "VABENEFITS","bool","symB.bExponential","When true (1) there is a exponential increase"))
Item.append(("bMaxWithFunds", "VABENEFITS","bool","symB.bMaxWithFunds","Otherwise only guarantee"))
Item.append(("lRatchet", "VABENEFITS", "long","symB.lRatchet","0 - no otherwise every lRatchet Periods"))
Item.append(("lEndowmentAge", "VABENEFITS","long","symB.lEndowmentAge","Endowment Age: 0 - no endowment - otherwise maturity age"))
Item.append(("lSTerm", "VABENEFITS","long","symB.lSTerm","Term insurance: 0 - no term benefit otherwise s-age"))
Item.append(("lSAnnuity", "VABENEFITS","long","symB.lSAnnuity","Start Age annuity in payment"))
Item.append(("lSLastAnnuity", "VABENEFITS","long","symB.lSLastAnnuity","Age at which annuity stops (infty forever)"))
Item.append(("dPctEndowment", "VABENEFITS","double","symB.dPctEndowment","Amount Endowment benefit in pct benefit"))
Item.append(("dPctTerm", "VABENEFITS","double","symB.dPctTerm","Amount Term benefit in pct benefit"))
Item.append(("dPctAnnuity", "VABENEFITS","double","symB.dPctAnnuity","Amount Annuity benefit in pct benefit"))
Item.append(("dPctPremium", "VABENEFITS","double","symB.dPctPremium","Amount Premium in pct benefit")) 


Item.append(("dEE", "VAINVESTMENT","double","symI.dEE","Single Premium"))
Item.append(("DECLVECT", "VAINVESTMENT","double","dSAA[NRFUNDS]","Pct Investment in Funds 1"))
Item.append(("dSAA1", "VAINVESTMENT","double","symI.dSAA[0]","Pct Investment in Funds 1"))
Item.append(("dSAA2", "VAINVESTMENT","double","symI.dSAA[1]","Pct Investment in Funds 2"))
Item.append(("dSAA3", "VAINVESTMENT","double","symI.dSAA[2]","Pct Investment in Funds 3"))
Item.append(("dSAA4", "VAINVESTMENT","double","symI.dSAA[3]","Pct Investment in Funds 4"))
Item.append(("dSAA5", "VAINVESTMENT","double","symI.dSAA[4]","Pct Investment in Funds 5"))
Item.append(("lAgeRiskFree", "VAINVESTMENT","long","symI.lAgeRiskFree","Age at which the funds are invested risk free"))

Item.append(("DECLVECT", "VAINVESTMENT", "double", "dPerformance[NRFUNDS]","Performance of Funds"))
Item.append((None, "VAINVESTMENT", "double", "dCurrentVA","F(t)"))
Item.append((None, "VAINVESTMENT",  "double", "dCurrentRatchet", "R(t)"))
Item.append((None, "VAINVESTMENT",  "double", "dCurrentCashFlow", "CF(t)"))
Item.append((None, "VAINVESTMENT",  "double", "dCurrentLoss", "X(t)"))
Item.append((None, "VAINVESTMENT",  "double", "dCurrentRatchetAnnuity", "X(t)"))

Item.append(("NewPerson", None ,"call","pInf->vNewPerson();","Next Person: generate structure plus pointer")) 

Item.append(("dSigBond","VAPAR","double","symPara.dSigBond","Vola of Bonds"))
Item.append(("dSigEquity","VAPAR","double","symPara.dSigEquityShort","Vola of Equities Short"))
Item.append(("dSigLong","VAPAR","double","symPara.dSigEquityLong","Vola of Equities Long"))
Item.append(("dFundStartLevel","VAPAR","double","symPara.dFundStartLevel","Vola of Equities Short"))
Item.append(("dRiskFree","VAPAR","double","symPara.dRiskFree","Risk Free Interest Rate"))
Item.append(("lSeed","VAPAR","double","symPara.lSeed","Seed for RSG"))


def CreateScannerFunction(strInput, strType, strToken, strPointerName, strVarName):
#                         Name of Token, Which Type (long), Current Token, Pointer ->strVarName (eg %s+"->"+%s)
#                         C Var Name
    Start="""
    if (!strncmp(%s,%s,%d))
       {
    """ % (strInput, strToken, len(strToken)-2)
    End = """
       }
    """
    
    strPrint1 = '"   --> Token >%s<, Value %ld\\n"'
    strPrint2 = '"   --> Token >%s<, Value %f \\n"'

    if strType == "long":
        Middle = "      " +strPointerName+"->"+strVarName+"="
        Middle += 'atol(%s+%d);' %(strInput,len(strToken)-2)
        Middle += '\n          printf('
        Middle += strPrint1
        Middle += ', %s, %s->%s );' %(strToken,strPointerName,strVarName) 

    if strType == "double":
        Middle = "      " +strPointerName+"->"+strVarName+"="
        Middle += 'atof(%s+%d);' %(strInput,len(strToken)-2)
        Middle += '\n          printf('
        Middle += strPrint2
        Middle += ', %s, %s->%s );' %(strToken,strPointerName,strVarName)         

    if strType == "call":
        Middle = "      "
        Middle += strVarName
        Middle += '\n          printf("Call New Person");'

    if strType == "bool":
        M2 = strPointerName+"->"+strVarName+"="
        Middle = """
              long lTemp;
              lTemp = atol(%s+%d);
              if(lTemp == 1)
                  {
                     %s true;
                  }
               else
                  {
                     %s false;
                  }
         """ %(strInput,len(strToken)-2,M2,M2) 

    return(Start+Middle+End)

psymH = open(strHFile,"w")
psymC = open(strCFile,"w")

psymH.write(StartStrH)

strTodo = ""

for i in Item:
    if i[0] != None and i[0] != "DECLVECT":
        # Item[i] = "ExtName"/None , "Structure", "Type", "InternalName", "Description"
        if i[1] != "VAPAR":
            strTodo += CreateScannerFunction("pcToken", i[2], '"'+i[0]+'"', "p", i[3]) +"\n"
        if i[1] == "VAPAR":
            print "VAPAR"
            strTodo += CreateScannerFunction("pcToken", i[2], '"'+i[0]+'"', "pVAM", i[3]) +"\n"

strI2 = strInterpreter.replace("TODO",strTodo)
psymC.write(strI2)

# Item[i] = "ExtName"/None , "Structure", "Type", "InternalName", "Description"

for (i,j) in StrTypes:
    strReplace = ""
    for k in Item:
        if k[1] == i:
            name = k[3]
            name =name.replace("symI.","")
            name =name.replace("symB.","")
            name =name.replace("symPara.","")            
            if k[0] =="DECLVECT":
                strReplace += "%s %s; // %s \n" % (k[2], name, k[4])
            elif name.find("[") < 0:
                strReplace += "%s %s; // %s \n" % (k[2], name, k[4])

    tempStr = j
    tempStr = tempStr.replace("REPLACE" ,strReplace)

    psymH.write(tempStr)

psymH.write(EndStrH)
psymH.close()
psymC.close()
