
from xlrd import open_workbook

MyTokens = dict()
MyTokens["OUTFILE"] = "statictable.c"
MyTokens["OUTFILEA"] = "statictable.c"
MyTokens["XLS"] = "tablesv2a.xls"
MyTokens["TXAB"] = "Qx"
MyTokens["Comment"] = "// This file has been generated automatically with dotableA.py \n // M. Koller \n"
MyTokens["StaticQx"]  = "static double pdTableNUMMER[] = {DATEN};\n"
MyTokens["StaticPPD"] = "static double * ppdTable[] = {ALLTABLES}; \n"
MyTokens["LowXX"] ="static int iLowX[] ={XLOW};\n"
MyTokens["HighX"]="static int iHighX[] ={HIGHX};\n"
MyTokens["T0"]="static int iTo[] ={DATES};\n"
MyTokens["NAMESXX"] = "static char *pcId[] ={TABLENAMES};\n"
MyTokens["XAMESXX"] = "/*static char *pcId[] ={XABLENAMES};*/\n"
MyTokens["SEX"] ="static int iGenderArray[] ={GENDERS};\n"
MyTokens["ZINS"] ="static double dITechArray[] ={IRATES};\n"
MyTokens["NRTAF"] ="static int iNrTables = XXTAF;\n"
MyTokens["YRTAF"] ="/*static int iNrTables = YXTAF;*/\n"
MyTokens["TABLENAMES"] = ""
MyTokens["XABLENAMES"] = ""
MyTokens["XLOW"] =""
MyTokens["HIGHX"] =""
MyTokens["DATES"] =""
MyTokens["GENDERS"] =""
MyTokens["IRATES"] =""
MyTokens["ALLTABLES"] =""

ToDos = []
ToDos.append("Comment")
ToDos.append("NRTAF")
ToDos.append("NAMESXX")
ToDos.append("YRTAF")
ToDos.append("XAMESXX")
ToDos.append("LowXX")
ToDos.append("HighX")
ToDos.append("T0")
ToDos.append("SEX")
ToDos.append("ZINS")

ReplaceTokens =[]
ReplaceTokens.append("TABLENAMES")
ReplaceTokens.append("XABLENAMES")
ReplaceTokens.append("XLOW")
ReplaceTokens.append("HIGHX")
ReplaceTokens.append("DATES")
ReplaceTokens.append("GENDERS")
ReplaceTokens.append("IRATES")
ReplaceTokens.append("ALLTABLES")
ReplaceTokens.append("XXTAF")
ReplaceTokens.append("YXTAF")

IdStrings = dict()
AllowPool = []

StaticQx = []
wb = open_workbook(MyTokens["XLS"])
tb = wb.sheet_by_name(MyTokens["TXAB"])
bFirst = True
lCharCount = 0

NrPoolId=0

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
    strTable = strTable.replace("  "," ")    
    strTable = strTable.replace(" ","-")
    iUse = tb.cell(14,i).value
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
    for j in range(18, int(0.001+19+highx)):
        locqx = tb.cell(j,i).value
        if bbFirst:
            try:
                daten += " %8.6f" % (locqx)
            except:
                print "?? %s" % (locqx)
                daten += " %8.6f" % (float(locqx.replace("'","")))
                
            bbFirst = False
        else:
            if k%10 == 0:
                try:
                    daten += ",\n   /*%03d*/   %8.6f" % (k,locqx)
                except:
                    print "?? %s" % (locqx)
                    daten += ",\n   /*%03d*/   %8.6f" % (k,float(locqx.replace("'","")))                    
            else:
                try:
                    daten += ", %8.6f" % (locqx)
                except:
                    print "?? %s" % (locqx)
                    daten += ", %8.6f" % (float(locqx.replace("'","")))                    
                    
                    
        k = k + 1
    stqx = MyTokens["StaticQx"]
    stqx = stqx.replace("NUMMER",nummer)
    stqx = stqx.replace("DATEN",daten)
    StaticQx.append(stqx)
    print strTable
    if bFirst:
        x = MyTokens["TABLENAMES"] + '"'+strTable+'" '
        if iUse>0:
            AllowPool.append(strTable)
        y = MyTokens["XLOW"] + " %3d "%(lowx)
        z = MyTokens["HIGHX"] + " %3d "%(highx)
        g = MyTokens["GENDERS"] + " %4s "%(sex)
        d = MyTokens["DATES"] + " %4d "%(dat)
        ir= MyTokens["IRATES"] + " %6.4f "%(techi)
        pn = MyTokens["ALLTABLES"] + " %s " % (pointerName)
        bFirst = False
    else:
        x = MyTokens["TABLENAMES"] + ', "'+strTable+'" '
        if iUse>0:
            AllowPool.append(strTable)
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

AllowPool.sort()

strOut = ""
bFirst = True
for i in AllowPool:
    NrPoolId +=1
    if bFirst:
        bFirst = False
        strOut += '"'+i+'" '
    else:
        strOut += ',"'+i+'" '

MyTokens["XABLENAMES"] = strOut

MyTokens["XXTAF"] =MaxId
MyTokens["YXTAF"] =NrPoolId

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
