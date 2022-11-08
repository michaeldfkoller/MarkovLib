
from xlrd import open_workbook

MyTokens = dict()
MyTokens["OUTFILE"] = "statictable.c"
MyTokens["XLS"] = "tablesv2.xls"
MyTokens["TXAB"] = "Qx"
MyTokens["Comment"] = "// This file has been generated automatically with dotable.py \n // M. Koller \n"
MyTokens["StaticQx"]  = "static double pdTableNUMMER[] = {DATEN};\n"
MyTokens["StaticPPD"] = "static double * ppdTable[] = {ALLTABLES}; \n"
MyTokens["LowXX"] ="static int iLowX[] ={XLOW};\n"
MyTokens["HighX"]="static int iHighX[] ={HIGHX};\n"
MyTokens["T0"]="static int iTo[] ={DATES};\n"
MyTokens["NAMESXX"] = "static char *pcId[] ={TABLENAMES};\n"
MyTokens["SEX"] ="static int iGenderArray[] ={GENDERS};\n"
MyTokens["ZINS"] ="static double dITechArray[] ={IRATES};\n"
MyTokens["NRTAF"] ="static int iNrTables = XXTAF;\n"
MyTokens["TABLENAMES"] = ""
MyTokens["XLOW"] =""
MyTokens["HIGHX"] =""
MyTokens["DATES"] =""
MyTokens["GENDERS"] =""
MyTokens["IRATES"] =""
MyTokens["ALLTABLES"] =""

strTex = ""
MyTex = dict()
MyTex["START"] = "\\subsection{Table: %s} \n"
MyTex["STARTTABLE"] = "\\begin{tabular}{rrrrrrrrrrr} \n $x$ & $q_{x}$ & $q_{x+1}$ & $q_{x+2}$ & $q_{x+3}$ & $q_{x+4}$ & $q_{x+5}$ & $q_{x+6}$ & $q_{x+7}$ & $q_{x+8}$ & $q_{x+9}$ \\\\ \n"
MyTex["ENTRY"] = " %3d & %6.5f & %6.5f & %6.5f & %6.5f & %6.5f& %6.5f & %6.5f & %6.5f & %6.5f & %6.5f \\\\ \n"
MyTex["ENTRYEND"] = " %3d "
MyTex["ENDTABLE"] = "\\end{tabular} \n"
MyTex["ENTRYENDSEP"] = "& %6.5f "
MyTex["ENTRYENDEND"] = "\\\\ \n"


ToDos = []
ToDos.append("Comment")
ToDos.append("NRTAF")
ToDos.append("NAMESXX")
ToDos.append("LowXX")
ToDos.append("HighX")
ToDos.append("T0")
ToDos.append("SEX")
ToDos.append("ZINS")

ReplaceTokens =[]
ReplaceTokens.append("TABLENAMES")
ReplaceTokens.append("XLOW")
ReplaceTokens.append("HIGHX")
ReplaceTokens.append("DATES")
ReplaceTokens.append("GENDERS")
ReplaceTokens.append("IRATES")
ReplaceTokens.append("ALLTABLES")
ReplaceTokens.append("XXTAF")

IdStrings = dict()

StaticQx = []
wb = open_workbook(MyTokens["XLS"])
tb = wb.sheet_by_name(MyTokens["TXAB"])
bFirst = True
lCharCount = 0

MaxId = -1
for i in range(1, 501):
    NrId = tb.cell(0, i).value
    if NrId<0:
        print "ending with index %d" % (NrId)
        break
    MaxId = max(MaxId,NrId+1)
    print NrId
    nummer ="%04d" % (NrId)
    pointerName = "pdTable%04d" % (NrId)     
    strTable = tb.cell(1,i).value+"-"+tb.cell(5,i).value+"-"+tb.cell(17,i).value
    strTable = strTable.replace("  "," ")
    strTable = strTable.replace(" ","-")
    strTex += MyTex["START"] %(strTable)
    strTex += MyTex["STARTTABLE"]
    lCharCount += len(strTable)
    IdStrings[NrId] = strTable
    lowx = tb.cell(2,i).value
    highx = tb.cell(3,i).value
    dat = tb.cell(6,i).value
    sex = tb.cell(15,i).value
    if sex =="m":
        sex = "MANN"
    else:
        sex = "FRAU"
    techi = tb.cell(13,i).value
    daten = ""
    k = 0
    bbFirst = True
    count = 0
    iXTex =0 
    stack = []
    for j in range(18, int(0.001+19+highx)):
        if count == 10:
            count =0
            try:
                strTex += MyTex["ENTRY"] % (iXTex,stack[0],stack[1],stack[2],stack[3],stack[4],stack[5],stack[6],stack[7],stack[8],stack[9])
            except:
                print "LATEX ERROR"
            stack = []
            iXTex +=10
            
        locqx = tb.cell(j,i).value
            
        if bbFirst:
            try:
                daten += " %8.6f" % (locqx)
                stack.append(locqx)
            except:
                print "?? %s" % (locqx)
                daten += " %8.6f" % (float(locqx.replace("'","")))
                stack.append(float(locqx.replace("'","")))
                
            bbFirst = False
        else:
            if k%10 == 0:
                try:
                    daten += ",\n   /*%03d*/   %8.6f" % (k,locqx)
                    stack.append(locqx)
                except:
                    print "?? %s" % (locqx)
                    daten += ",\n   /*%03d*/   %8.6f" % (k,float(locqx.replace("'","")))
                    stack.append(float(locqx.replace("'","")))
            else:
                try:
                    daten += ", %8.6f" % (locqx)
                    stack.append(locqx)
                except:
                    print "?? %s" % (locqx)
                    daten += ", %8.6f" % (float(locqx.replace("'","")))
                    stack.append(float(locqx.replace("'","")))
                    
        count +=1            
        k = k + 1
    kk= len(stack)
    if kk > 0:
        strTemp = MyTex["ENTRYEND"] % (iXTex)
        for l in range(kk):
            strTemp += MyTex["ENTRYENDSEP"] % (stack[l])
        strTemp += MyTex["ENTRYENDEND"]    
        strTex += strTemp
        
    strTex += MyTex["ENDTABLE"]
    stqx = MyTokens["StaticQx"]
    stqx = stqx.replace("NUMMER",nummer)
    stqx = stqx.replace("DATEN",daten)
    StaticQx.append(stqx)
    print strTable
    if bFirst:
        x = MyTokens["TABLENAMES"] + '"'+strTable+'" '
        y = MyTokens["XLOW"] + " %3d "%(lowx)
        z = MyTokens["HIGHX"] + " %3d "%(highx)
        g = MyTokens["GENDERS"] + " %4s "%(sex)
        d = MyTokens["DATES"] + " %4d "%(dat)
        ir= MyTokens["IRATES"] + " %6.4f "%(techi)
        pn = MyTokens["ALLTABLES"] + " %s " % (pointerName)
        bFirst = False
    else:
        x = MyTokens["TABLENAMES"] + ', "'+strTable+'" '
        y = MyTokens["XLOW"] + ", %3d "%(lowx)
        z = MyTokens["HIGHX"] + ", %3d "%(highx)
        g = MyTokens["GENDERS"] + ", %4s "%(sex)
        d = MyTokens["DATES"] + ", %4d "%(dat)
        ir= MyTokens["IRATES"] + ", %6.4f "%(techi)
        pn = MyTokens["ALLTABLES"] + ", %s " % (pointerName)        
    MyTokens["TABLENAMES"] = x
    MyTokens["XLOW"] = y
    MyTokens["HIGHX"] = z    
    MyTokens["GENDERS"] = g
    MyTokens["DATES"] = d
    MyTokens["IRATES"] =ir
    MyTokens["ALLTABLES"] = pn

MyTokens["XXTAF"] =MaxId

print MyTokens["TABLENAMES"]
print "---"
print MyTokens["XLOW"] 
print "---"
print MyTokens["HIGHX"]
print "---"
print MyTokens["GENDERS"]
print "---"
print MyTokens["DATES"]
print "---"
print MyTokens["IRATES"]
print "---"
print MyTokens["XXTAF"]
print "---"
print MyTokens["ALLTABLES"]
print "****"
    
fid = open(MyTokens["OUTFILE"],"w")

for i in ToDos:
    mytask = MyTokens[i]
    for j in ReplaceTokens:
        print j, MyTokens[j]
        try:
            mytask = mytask.replace(j,str(MyTokens[j]))
        except:
            print "Problem with token %s" % str(j)
    fid.write(mytask +"\n // --------------------------- \n")

k= 0
for i in StaticQx:
    fid.write("// Table %s \n\n" %(IdStrings[k]))
    k +=1
    fid.write(i+"\n // ++++++++++++++++++++++++++++++ \n")

ToDos = []
ToDos.append("StaticPPD")

for i in ToDos:
    mytask = MyTokens[i]
    for j in ReplaceTokens:
        print j, MyTokens[j]
        try:
            mytask = mytask.replace(j,str(MyTokens[j]))
        except:
            print "Problem with token %s" % str(j)
    fid.write(mytask +"\n // --------------------------- \n")
 
fid.close()

print lCharCount
if (lCharCount > 40000):
    print "!!!!!!!!! NEED INCREASE  >MAXCHARS< "

print strTex
