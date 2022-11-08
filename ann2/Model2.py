#############################################################################################################
#
#  simulation of annuity risk capital with lognormal sample paths
#
#  reads qx,fx and annuity portfolio
#  writes an output file with the cash flow simulation for each trajectory
#
#  Michael Koller 31.7.2006
#
#  uses koma.annuity form koma.dll
#
#############################################################################################################


import os
import sys
import math
import string
import math
import time
import scipy
import numpy

class Model2:

    def __init__(self):
        self.Now = time.clock()
        print 'Calculation of an annuity portfolio: Every Year differently'
# =================================================
        self.v = 1 / 1.035   # corresponding to 10 yr euro bond rate
        self.t = 2006
        self.sigma = 0.07 
        print 'Sigma:' , self.sigma
        self.sigma = input(' New Sigma ? ')
        self.mu = -self.sigma*self.sigma/2
        self.NrSim = 15
        self.NrSim = input(' Nr of Simulations ? ')
        self.MaxT  = 50
        print 'Mu =',self.mu,' Sigma =', self.sigma, 'Nr Sim:', self.NrSim
        self.AnnuityName='annuity.dat'
        self.OutFile = 'out1.txt'
        self.HowMany = 10
        self.ZCB = scipy.array([0.891975149642233 ,0.857779447242907 ,0.825175074968949 ,0.793511422343849 ,0.762885906637847 ,0.733523577216652 ,0.705921301096665 ,0.678226710464316 ,0.651263846305459 ,0.625175331903594 ,0.599942339996968 ,0.575546000474105 ,0.551967425828365 ,0.529710394276616 ,0.508253012842745 ,0.487570993885866 ,0.467640595683878 ,0.448438618240774 ,0.43041622175915 ,0.413081955607441 ,0.39641108351135 ,0.380379695411794 ,0.364964682347932 ,0.351231418900127 ,0.33806601872612 ,0.325443296323434 ,0.313339249274827 ,0.301730999882374 ,0.289917165313034 ,0.278565884101771 ,0.267659045650556 ,0.257179248455253 ,0.247109772342085 ,0.237434551791148 ,0.228138150304394 ,0.219205735777209 ,0.210623056834269 ,0.202376420091943 ,0.19445266831094 ,0.186839159404371 ,0.179523746267709 ,0.172494757398478 ,0.16574097827476 ,0.159251633462785 ,0.153016369425082 ,0.147025238001749 ,0.141268680538486 ,0.135737512636079 ,0.130422909496986 ,0.125316391845667 ,0.120409812400172 ,0.115695342873423 ,0.111165461483435 ,0.106812940952559 ,0.102630836976599 ,0.0986124771454015 ,0.0947514502972393 ,0.0910415962900174 ,0.0874769961729653 ,0.0840519627431449 ,0.0807610314717044 ,0.0775989517854011 ,0.0745606786894834 ,0.0716413647185665 ,0.0688363522026603 ,0.0661411658360088 ,0.0635515055368862 ,0.0610632395869573 ,0.0586723980392557 ,0.0563751663842633 ,0.0541678794639854 ,0.0520470156243104 ,0.0500091910963262 ,0.0480511545976275 ,0.0461697821450008 ,0.0443620720702118 ,0.0426251402309412 ,0.0409562154092304 ,0.039352634890094 ,0.0378118402132445 ,0.0363313730911531 ,0.0349088714869321 ,0.0335420658457823 ,0.0322287754739926 ,0.0309669050597143 ,0.0297544413299598 ,0.0285894498384911 ,0.0274700718794744 ,0.0263945215219754 ,0.0253610827605652 ,0.0243681067774893 ,0.0234140093120332 ,0.0224972681328863 ,0.0216164206094709 ,0.020770061378364 ,0.0199568401010849 ,0.0191754593096749 ,0.0184246723366296 ,])

        print 'Useing Euro ZCB'
        self.Portfolio = scipy.io.read_array(self.AnnuityName)
        qx = scipy.io.read_array('qx_ER2000_2O.dat')
        qy = scipy.io.read_array('qy_ER2000_2O.dat')
        fx = scipy.io.read_array('fx_ER2000_2O.dat')
        fy = scipy.io.read_array('fy_ER2000_2O.dat')
# =================================================
        import win32com.client
        self.hm = win32com.client.Dispatch("koma.annuity")
        self.hf = win32com.client.Dispatch("koma.annuity")
        for j in range(qx.shape[0]):
            dTemp = self.hm.dSetQx(qx[j,0], qx[j,1])
        for j in range(fx.shape[0]):
            dTemp = self.hm.dSetFx(fx[j,0], fx[j,1])
        for j in range(2500):
            dTemp = self.hm.dSetDisc(j, self.v)

        self.hm.vSetStartTime(140)
        self.hm.dSetBaseYear(1993)
        self.hm.dSetActualYear(self.t)
        self.hm.dSetPre(0.625)
        self.hm.vSetG(0)

        for j in range(qy.shape[0]):
            dTemp = self.hf.dSetQx(qy[j,0], qy[j,1])
        for j in range(fy.shape[0]):
            dTemp = self.hf.dSetFx(fy[j,0], fy[j,1])
        for j in range(2500):
            dTemp = self.hf.dSetDisc(j, self.v)

        self.hf.vSetStartTime(140)
        self.hf.dSetBaseYear(1993)
        self.hf.dSetActualYear(self.t)
        self.hf.dSetPre(0.625)
        self.hf.vSetG(0)

        self.DK_stat = zeros((self.MaxT,1), dtype='f');
        self.CF_stat = zeros((self.MaxT,1), dtype='f');
        self.CF_Sim = zeros((self.MaxT,self.NrSim), dtype='f');
        self.MV_DK = zeros((1, self.NrSim), dtype='f');

    def CalcExp(self):
        print 'Task 1 calculate statutory CF and DK'
        u = 0
        for i in range(self.Portfolio.shape[0]):
# Init Person i
           sex = self.Portfolio[i,2]
           if sex == 1: 
               h = self.hm
           else:
               h = self.hf
           age = self.Portfolio[i,0]
           r   = self.Portfolio[i,1]
#           print sex, age, r, self.Portfolio[i,3]
           h.vSetStopTime(age)
           h.vSetSAge(self.Portfolio[i,3])  
           u = u + r * h.dGetDK(age)
           
# Get DK and CF Person i
           for j in range(self.MaxT):
               self.CF_stat[j, 0] = self.CF_stat[j, 0] + r * h.dGetCF(age + j);
        print u
        print 'time:', time.clock()-self.Now

    def CalcSim(self):
        print 'Task 2 Simulation of CF and DK'
        jetzt = time.clock()
        for k in range(self.NrSim):
            XOmega = exp(self.mu * ones((100,1), dtype='f') + self.sigma * randn(100,1))

            kktemp = double(1.0)
            
            for j in range (100):
                kktemp *= XOmega[j]
	        dTemp = self.hm.dSetRelativeQx(long(j), double(kktemp))
	        dTemp = self.hf.dSetRelativeQx(long(j), double(kktemp))

            for i in range(self.Portfolio.shape[0]):
                    sex = self.Portfolio[i,2]
                    if sex == 1: 
                        h = self.hm
                    else:
                        h = self.hf
                    age = self.Portfolio[i,0]
                    r   = self.Portfolio[i,1]
#           print sex, age, r, self.Portfolio[i,3]
                    h.vSetStopTime(age)
                    h.vSetSAge(self.Portfolio[i,3])
#                    print i
                    for j in range(self.MaxT):
                        self.CF_Sim[j,k] = self.CF_Sim[j,k] + r * h.dGetCF(age + j);
            if (mod(k,10) == 1) :
                abgelaufeneZeit = time.clock() - jetzt
                verbleibendeZeit = abgelaufeneZeit * (self.NrSim - k) / k
                print 'Simulation', k, 'out of ', self.NrSim,' Time elapsed ', time.clock()-self.Now, 'Remaining Time:', verbleibendeZeit/60,' Min.'
            if (mod(k,self.HowMany) == 1):
                plot(range(self.MaxT),self.CF_Sim[range(self.MaxT),k])
                show()

#############################################################################################################
def main():
#############################################################################################################    
        s = Model2()
        s.CalcExp()
        s.CalcSim()
        outFile = file(s.OutFile, 'w')
        scipy.io.write_array(outFile,  s.CF_Sim.transpose())
        outFile.close()
        print 'Done, time:', time.clock()-s.Now,'Sec.'  

#    print 'Total lines read: ', self.totallines

if __name__ == "__main__":
    main()
