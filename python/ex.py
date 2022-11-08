import markovlv


ns=markovlv.TABLESERVER()
j ="DE-QX--DAV2008T-Male-NonSmoker-"
ns.vSetTable(j)
s=markovlv.TABLESERVER()
j="DE-QX--DAV2008T-Male-Smoker--"
s.vSetTable(j)

def qx(age, sm, glasses, bmi, sfact=1.):
    if sm ==1:
        table = s
        fact = 0.9 + 0.0027 * (bmi-26.5)**2
        qx0 = sfact * table.dGetValue(age) * fact
    else:
        table = ns
        fact = 1.+ 0.0053*(bmi-25.)**2
        qx0 = sfact * table.dGetValue(age) * fact
    a='print "qx0 %d : %f (%f * %f)" % (age, qx0,table.dGetValue(age) ,fact)'
    return min(1.,qx0 + glasses/6.*0.0011)

def ex(age, sm, glasses, bmi, sfact =1.):
    temp = 0
    for i in range(119, age-1,-1):
        temp = 1 + temp * (1- qx(i, sm, glasses, bmi, sfact))
    return temp - 0.5

bmi=25
x=48
ref = ex(x, 0, 2, 27)
best = ex(x, 0, 0, 25, 0.93)
worst = ex(x, 1, 6, 40, 1.07)
print "\n \nAge %d, ref %.2f best %.2f worst %.2f" % (x, ref, best, worst)
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
bmi=35
x=48
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
bmi=15
x=48
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
bmi=25
x=65
ref = ex(x, 0, 2, 27)
best = ex(x, 0, 0, 25, 0.93)
worst = ex(x, 1, 6, 40, 1.07)
print "\n\nAge %d, ref %.2f best %.2f worst %.2f" % (x, ref, best, worst)
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
bmi=35
x=65
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
bmi=15
x=65
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))

bmi=25
x=75
ref = ex(x, 0, 2, 27)
best = ex(x, 0, 0, 25, 0.93)
worst = ex(x, 1, 6, 40, 1.07)
print "\n\nAge %d, ref %.2f best %.2f worst %.2f" % (x, ref, best, worst)
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
bmi=35
x=75
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
bmi=15
x=75
print "Age %d, bmi %f:" % (x, bmi)
print ex(x, 0, 0, bmi), ex(x, 1, 0, bmi), ex(x, 1, 6, bmi)  
print "Lost yrs %.1f (%4.1f %%), yrs %.1f (%4.1f %%) , yrs %.1f (%4.1f %%)" % (ref-ex(x, 0, 0, bmi), 100./ref*(ref-ex(x, 0, 0, bmi)), ref-ex(x, 1, 0, bmi), 100./ref*(ref-ex(x, 1, 0, bmi)), ref-ex(x, 1, 6, bmi), 100./ref*(ref-ex(x, 1, 6, bmi)))
