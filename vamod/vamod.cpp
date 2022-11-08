
//////////////////////////////////////////////////////////////////
//                                                               //
// VAMod LV Zahlungsstroeme                                      //
//                                                               //
// Autor Michael Koller                                          //
//                                                               //
// Datum 7.2012: erstellt                                        //
//                                                               //
///////////////////////////////////////////////////////////////////

#define PRO_MARKOV_STANDALONE
#define SIMLIB_FOR_VAMOD
#define AUTOTIMEREP  60.

#ifdef AUTOTIMEREP
#include <time.h>
#endif
//#define TRACE_VAMOD

#ifdef PRO_MARKOV_STANDALONE
#include "vastruct_gen.h"
#ifdef FOR_OLE
#pragma message ("In order to avoid double references to omarkov.cpp we include only header")
#include "omarkov.h"
#include "simlib.h"
#else
#include "omarkov.cpp"
#include "simlib.cpp"
#endif
#include "vamod.h"
#endif


//#define TRACE_VAMOD
//#define TRACE_PLUS
#define MAN               0l
#define WOMAN           100l
#define PREMIUM           0l
#define ANNUITY         200l
#define MAXAGE           99l
#define SURRENDER       400l
#define GLMDEATH        401l
#define FIRSTORDER        0l
#define SECONDORDER       1l
#define KTAF              0l
#define RTAF              1l
#define STARTTIME       120l
#define STOPTIME          0l
#define GLMNRSTATES     402l

#define RESETSTRESS       0l
#define QXSTRESS          1l
#define FXSTRESS          2l
#define SXSTRESS          3l
#define YIELDSTRESS       4l

#define RKWNULL           0l  //Keine Rückkäufe eg sx=0  
#define RKWDK             1l  //Rückkäufe alpha x DK

#define SIMDELTATA        (1./12.)
#define SIMTIMEFACT       (1.)
#define SIMTIMESTEPS      (12*50)

VAINFORCE::VAINFORCE()
{
  psymAllPers = NULL;
  psymCurrentPers = NULL;
#ifdef TRACE_VAMOD
  printf("\n Generating VAINFORCE \n");
#endif
}

VAINFORCE::~VAINFORCE()
{
  vClearPersons();
}

void VAINFORCE::vClearPersons()
{
  VAPERSON * psymP;
  if (psymAllPers != NULL)
    {
      for(psymCurrentPers = psymAllPers, psymP = psymAllPers; psymCurrentPers != NULL;psymP = psymCurrentPers)
        {
          psymCurrentPers = psymP ->psymNext;
          printf("Freeing adress %p (next %p) \n", psymP, psymCurrentPers);
          free(psymP);
        }
    }
  psymAllPers = NULL;
  psymCurrentPers = NULL;
}


void VAINFORCE::vNewPerson()
{
  VAPERSON * psymP = psymAllPers;
  if(psymAllPers == NULL)
    {
      psymAllPers = (VAPERSON*) malloc(sizeof(VAPERSON));
      psymCurrentPers = psymAllPers;
      memset(psymAllPers,0,sizeof(VAPERSON));
#ifdef TRACE_VAMOD
      printf("New Memo First. AllPers %p Current %p \n", psymAllPers, psymCurrentPers); 
#endif
   }
  else
    {
      while (psymP->psymNext != NULL)
        {
          printf("Cylcle from %p to %p \n", psymP, psymP->psymNext);
          psymP=psymP->psymNext;
        }
      psymP->psymNext = (VAPERSON *) malloc(sizeof(VAPERSON));
      memset(psymP->psymNext,0,sizeof(VAPERSON));
      psymCurrentPers = psymP->psymNext;
      printf("New Memo Last. AllPers %p Current %p \n", psymAllPers, psymCurrentPers); 
    }
}

void VAINFORCE::vGotoStart()
{
  psymCurrentPers = psymAllPers;
}

void VAINFORCE::nNext()
{
  psymCurrentPers = psymCurrentPers->psymNext;
}

#include "interpreter_gen.c"

VAPERSON * VAINFORCE::pGetPerson(long lId)
{
  VAPERSON * psymP;
  for(psymP = psymAllPers; psymP != NULL;  psymP = psymP->psymNext)
    if(psymP->lId == lId)
      break;
  psymCurrentPers = psymP;
  return(psymP);
}

VAPERSON * VAINFORCE::pNewPerson()
{
  vNewPerson();
  return(psymCurrentPers);
}

VAINFORCE * VAINFORCE::MyThis()
{
  return(this);
}


VAMOD::VAMOD():MARKOVLV(250l, GLMNRSTATES ,1l),SIMLIB(2, SIMDELTATA, SIMTIMESTEPS, 1),VAINFORCE()
{
  int iC1, iC2, iC3;
  long lNTimes = 4;
  double dTemp;
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  double dPost= (lNTimes - 1) /( 2. * lNTimes);

  //  MARKOVLV::MARKOVLV(250l, GLMNRSTATES ,1l);
  vSetNrStates(GLMNRSTATES);
  for(iC1= 0; iC1 < 2; ++iC1)
    {
      psymQx[iC1]    = new LV_VECTOR(250, 0, 0);
      psymFx[iC1]    = new LV_VECTOR(250, 0, 0);
      lBaseYear[iC1] = 2000l;
    }

  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymSx   = new LV_VECTOR(250, 0, 0);
  psymRelQxTime = new LV_VECTOR(250, 0, 0);
  psymTilde = new LV_VECTOR(250, 0, 0);
  lActualYear = 2000;
  lNrActSim = 0;

  bTildeCalc = false;
  lValid = false;
  dAddBenefits = true;

#ifdef TRACE_VAMOD
  psymTrace = fopen("trace_VAMOD.dat","w"); 
#else
  psymTrace = NULL;
#endif

  for (iC1 = 0; iC1 < 250; ++iC1) dTemp = psymRelQxTime->dSetValue(iC1, 1.);

  // Init SIMLIB (MANUALLY)

  SIMLIB::vSetSeed(12343534l);
  SIMLIB::vSetdWidWj(0,0,1.);
  SIMLIB::vSetdWidWj(1,1,1.);
  SIMLIB::vSetdWidWj(2,2,1.);
  SIMLIB::vSetdWidWj(0,1,-0.25);   // was -25%
  SIMLIB::vSetdWidWj(0,2,-0.25);   // was -25%
  SIMLIB::vSetdWidWj(1,2,0.25);    // was -25%
  SIMLIB::dBoundary(0,0.205*0.205);
  SIMLIB::dBoundary(1,1000.);
  SIMLIB::dBoundary(2,1000.);
  SIMLIB::vSetdMui(1, 0);
  SIMLIB::dSetParameter(0, 0.33);//  was 2.
  SIMLIB::dSetParameter(1, 0.205*0.205);
  SIMLIB::dSetParameter(2, 0.);// # was 0.24
  SIMLIB::dSetParameter(3, 0.025);//  # equities
  SIMLIB::dSetParameter(4, 0.025);// # bonds
  SIMLIB::dSetParameter(5, 0.05*0.05/(0.205*0.205)); //bonds
}

VAMOD::~VAMOD()
{
  int iC1, iC2, iC3;
  for(iC1= 0; iC1 < 2; ++iC1)
    {
      delete(psymQx[iC1]);
      delete(psymFx[iC1]);

    }   
  delete(psymDisc);
  delete(psymSx);
  delete(psymRelQxTime);
  delete(psymTilde);
#ifdef TRACE_VAMOD
  fclose(psymTrace);
#endif
}

int VAMOD::iAnalyseToken(char * pcString)
{
  if (psymCurrentPers == NULL)
    {
      vNewPerson();
    }
  printf(" cTokenInterpreter: pointers this %p inforce %p current pers %p \n" ,this, VAINFORCE::MyThis(), psymCurrentPers);
  vTokenInterpreter(this, VAINFORCE::MyThis(), psymCurrentPers, pcString);
  return(0);
}


double         VAMOD::dSetQx(long lTable, long lType, long lSex, long lTime, double dValue)  // Table 0=K, 1= R Type 0 = 2 Ordn 1= erster Ordn  
{
  if (lSex   != 0 && lSex != 1) return(-1);
  lValid = false;
#ifdef TRACE_VAMOD
  if(psymTrace) fprintf(psymTrace,"\nQX>> Qx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif
  return(psymQx[lSex]->dSetValue(lTime, dValue));
}

double         VAMOD::dSetFx(long lTable, long lType, long lSex, long lTime, double dValue)
{
  if (lSex   != 0 && lSex   != 1) return(-1);
  lValid = false;
#ifdef TRACE_VAMOD
  if(psymTrace) fprintf(psymTrace,"\nFX>> Fx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif
  return(psymFx[lSex]->dSetValue(lTime, dValue));
}

double         VAMOD::dSetSx(long lTable, long lType, long lSex, long lTime, double dValue)
{
  // remark only one sx
  lValid = false;
#ifdef TRACE_VAMOD
  if(psymTrace) fprintf(psymTrace,"\nSX>> Sx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif          
  return(psymSx->dSetValue(lTime, dValue));

}

double         VAMOD::dSetBaseYear(long lTable, long lType, long lSex, long lTime)
{
  if (lSex   != 0 && lSex   != 1) return(-1);
  lValid = false;
#ifdef TRACE_VAMOD
  if(psymTrace) fprintf(psymTrace,"\nBY>> BaseYear[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10ld", lTable, lType, lSex, lTime);
#endif      
  lBaseYear[lSex]=lTime;
  return(lBaseYear[lSex]);
}

double         VAMOD::dSetActualYear(long lTime)
{
  lValid = false;
#ifdef TRACE_VAMOD
  if(psymTrace) fprintf(psymTrace,"\nAY>> ActuarYear = %10ld", lTime);
#endif      
  lActualYear = lTime;
  return(lActualYear);
}

double         VAMOD::dSetDisc(long lTime, double dValue)
{
  lValid = false;
#ifdef TRACE_VAMOD
  if(psymTrace) fprintf(psymTrace,"\nDI>> Disc[t=%4d] = %10.8lf",lTime, dValue);
#endif  
  return(psymDisc->dSetValue(lTime, dValue));
}

void           VAMOD::vAddDeath(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn)
{
  double dTemp;
  lValid = false;
  int iStateStar= WOMAN * lSex + ANNUITY +lX;
#ifdef TRACE_VAMOD
  printf("Add %10s State %d  Value %lf \n", "Death",iStateStar,dLeist);
#endif
  //dTemp = MARKOVLV::dSetPre(lS-lX, iStateStar, GLMDEATH, dLeist);
  dTemp = MARKOVLV::dSetPost(lS-lX, iStateStar, GLMDEATH,dLeist);  
}

void           VAMOD::vAddEndowment(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn)
{
  double dTemp;
  lValid = false;
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  double dPost= (lNTimes - 1) /( 2. * lNTimes);
  int iStateStar= WOMAN * lSex + ANNUITY +lX;
#ifdef TRACE_VAMOD
  printf("Add %10s State %d  Value %lf \n", "Endow",iStateStar,dLeist);
#endif
  dTemp = MARKOVLV::dSetPre(lS-lX, iStateStar, iStateStar, dPre*dLeist);
  dTemp = MARKOVLV::dSetPost(lS-lX, iStateStar, iStateStar, dPost*dLeist);
  //dTemp = MARKOVLV::dSetPost(iC2, iStateStar, SURRENDER, (psymAex->dGetDK(iC1) * dLeist + psymPraem->dGetDK(iC1)) * dAexRKW);  
}

void           VAMOD::vAddPremium(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn)
{
  double dTemp;
  lValid = false;
  int iStateStar= WOMAN * lSex + PREMIUM +lX;
#ifdef TRACE_VAMOD
  printf("Add %10s State %d  Value %lf \n", "Prem",iStateStar,dPraem);
#endif
  dTemp = MARKOVLV::dSetPre(lS-lX, iStateStar, iStateStar, -dPraem);
}

void           VAMOD::vUpdateOperator()
{
  double dQxLoc=1., dSxLoc=1.;
  int iStartalter, iVersicherungstyp, iC1, iC2;
  double dSxKorr = 1;
  double dTemp;
  // 1. Belegen der Wahrscheinlichkeiten
  // --------------------------------------
  // Kapital Mann
  printf("\n Update Op");
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, KTAF, MAN, iStartalter + iC1 , iC1 + lActualYear) * psymRelQxTime->dGetValue(iC1);
	  //printf("\n iC= %d x=%3d y=%4d qx = %10.8f Delta = %10.8f", iC1, iStartalter +iC1, iC1 + lActualYear, dQxLoc, psymRelQxTime->dGetValue(iC1)); 
	  dSxLoc = psymSx->dGetValue(iStartalter + iC1);
	  //      printf("\n iC= %d x=%3d y=%4d sx = %10.8f", iC1, iStartalter +iC1, iC1 + lActualYear, <dSxLoc); 
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + PREMIUM + iStartalter , MAN + PREMIUM + iStartalter, (1. - dSxLoc) * (1. - dQxLoc));
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + PREMIUM + iStartalter , GLMDEATH, (1. - dSxLoc) * dQxLoc);
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + PREMIUM + iStartalter , SURRENDER, dSxLoc);
	}

   
    }
  // Kapital Frau
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, KTAF, 1 /* for woman */, iStartalter + iC1 , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	  dSxLoc = psymSx->dGetValue(iStartalter + iC1);
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + PREMIUM + iStartalter , WOMAN + PREMIUM + iStartalter, (1. - dSxLoc) * (1. - dQxLoc));
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + PREMIUM + iStartalter , GLMDEATH, (1. - dSxLoc) * dQxLoc);
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + PREMIUM + iStartalter , SURRENDER, dSxLoc);
	}
   
    }
  // Rente Mann
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, RTAF, MAN, iStartalter + iC1 , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	  dSxLoc = psymSx->dGetValue(iStartalter + iC1);
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + ANNUITY + iStartalter , MAN + ANNUITY + iStartalter, (1. - dSxLoc) * (1. - dQxLoc));
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + ANNUITY + iStartalter , GLMDEATH, (1. - dSxLoc) * dQxLoc);
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + ANNUITY + iStartalter , SURRENDER, dSxLoc);
	}
   
    }
  // Rente Frau
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, RTAF, 1 /*woman*/, iStartalter + iC1 , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	  dSxLoc = psymSx->dGetValue(iStartalter + iC1);
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + ANNUITY + iStartalter , WOMAN + ANNUITY + iStartalter, (1. - dSxLoc) * (1. - dQxLoc));
 	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + ANNUITY + iStartalter , GLMDEATH, (1. - dSxLoc) * dQxLoc);
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + ANNUITY + iStartalter , SURRENDER, dSxLoc);
	}
    }
  // 2. Belegen der Zinsen
  // --------------------------------------
  for(iC1=0; iC1<STARTTIME; ++iC1)
    {
      double dLocDisc;
      dLocDisc = psymDisc->dGetValue(iC1);
      //    printf("\ t=%d disc = %10.8f ", iC1, dLocDisc);
      for(iC2=0; iC2 < 402; ++ iC2) dTemp = MARKOVLV::dSetDisc(iC1, iC2, iC2, dLocDisc);
    }
  lValid = false;
}

 
double         VAMOD::dGetMeanDK(long lTime, long lNrSim)
{
#ifdef TRACE_VAMOD
  {
    double a = dGetMeanDKAnnMort(lTime,lNrSim)+dGetMeanDKPrem(lTime,lNrSim);
    MARKOVLV::vPrintTeX(psymTrace, true, "VAMOD", false);
  }
#endif
  return(dGetMeanDKAnnMort(lTime,lNrSim)+dGetMeanDKPrem(lTime,lNrSim));
}

double         VAMOD::dGetMeanDKAnnMort(long lTime, long lNrSim)
{
  double dTemp=0;
  double dFact=SIMTIMEFACT;
  int iC1;
#ifdef AUTOTIMEREP
  time_t  tNow2, tStart = time(NULL);
  tNow2 = tStart;
#endif
  for (;lNrActSim< lNrSim;++lNrActSim)
    {
#ifdef AUTOTIMEREP
      if (time(NULL)-tNow2 > AUTOTIMEREP)
	{
	  tNow2 = time(NULL);
          printf ("\n Sim %ld Elapsed Time %10d sec (Remain %10.1f h)", lNrActSim, time(NULL)-tStart, (time(NULL)-tStart)*(lNrSim - lNrActSim)/(3600*(0.0001+lNrActSim)));
	}
#endif
      vGenerateTrajectory();
    }
  if (lNrActSim > 0)
    {
      dFact /= lNrActSim;
    }
  else
    {
      dFact = 0;
    }
  if(!lValid)
    {
      vUpdateOperator();
      MARKOVLV::vSetStartTime(STARTTIME);
      MARKOVLV::vSetStopTime(STOPTIME);
      lValid = true;
    }

  for(iC1= ANNUITY; iC1 < GLMNRSTATES; ++ iC1) dTemp += MARKOVLV::dGetDK(lTime,iC1,1l);
  return(dFact*dTemp);
}
double         VAMOD::dGetMeanDKPrem(long lTime, long lNrSim)
{
  double dTemp=0;
  double dFact=SIMTIMEFACT;
  int iC1;
#ifdef AUTOTIMEREP
  time_t  tNow2, tStart = time(NULL);
  tNow2 = tStart;
#endif
  for (;lNrActSim< lNrSim;++lNrActSim)
    {
#ifdef AUTOTIMEREP
      if (time(NULL)-tNow2 > AUTOTIMEREP)
	{
	  tNow2 = time(NULL);
          printf ("\n Sim %ld Elapsed Time %10d sec (Remain %10.1f h)", lNrActSim, time(NULL)-tStart, (time(NULL)-tStart)*(lNrSim - lNrActSim)/(3600*(0.0001+lNrActSim)));
	}
#endif
      vGenerateTrajectory();
    }
  if (lNrActSim > 0)
    {
      dFact /= lNrActSim;
    }
  else
    {
      dFact = 0;
    }  
  if(!lValid)
    {
      vUpdateOperator();

      MARKOVLV::vSetStartTime(STARTTIME);
      MARKOVLV::vSetStopTime(STOPTIME);
      lValid = true;
    }
  for(iC1= 0; iC1 < ANNUITY; ++ iC1) dTemp += MARKOVLV::dGetDK(lTime,iC1,1l);
  return(dFact*dTemp);
 }
double	       VAMOD::dGetDKDetail(long lTime, long lState)
{
  double dFact=SIMTIMEFACT;
  if (lNrActSim > 0)
    {
      dFact /= lNrActSim;
    }
  else
    {
      dFact = 0;
    }
  if(!lValid)
    {
      vUpdateOperator();

      MARKOVLV::vSetStartTime(STARTTIME);
      MARKOVLV::vSetStopTime(STOPTIME);
      lValid = true;
    }
  return(dFact*MARKOVLV::dGetDK(lTime,lState,1l));
}
 

double         VAMOD::dGetMeanCF(long lTime, long lNrSim)
{
  return(dGetMeanCFAnn(lTime, lNrSim)+dGetMeanCFPrem(lTime, lNrSim)+dGetMeanCFMort(lTime, lNrSim));
}

double         VAMOD::dGetMeanCFAnn(long lTime, long lNrSim)
{
  double dFact=SIMTIMEFACT;
  double dTemp = dGetMeanDK(0, lNrSim);
  int iC1;
  if (lNrActSim > 0)
    {
      dFact /= lNrActSim;
    }
  else
    {
      dFact = 0;
    }
  dTemp = 0.;
  for(iC1= ANNUITY; iC1 < GLMNRSTATES; ++ iC1) dTemp += MARKOVLV::dGetCF(lTime, iC1, iC1) + MARKOVLV::dGetCF(lTime, iC1, SURRENDER); 
  return(dFact*dTemp);
}

double         VAMOD::dGetMeanCFPrem(long lTime, long lNrSim)
{
  double dFact=SIMTIMEFACT;
  double dTemp = dGetMeanDK(0, lNrSim);
  int iC1;
    if (lNrActSim > 0)
    {
      dFact /= lNrActSim;
    }
  else
    {
      dFact = 0;
    }
  dTemp = 0.;
  for(iC1= 0; iC1 < ANNUITY; ++ iC1) dTemp += MARKOVLV::dGetCF(lTime, iC1, iC1) + MARKOVLV::dGetCF(lTime, iC1, GLMDEATH) + MARKOVLV::dGetCF(lTime, iC1, SURRENDER); 
  return(dFact*dTemp);
}
double         VAMOD::dGetMeanCFMort(long lTime, long lNrSim)
{
  double dFact=SIMTIMEFACT;
  double dTemp = dGetMeanDK(0, lNrSim);
  int iC1;
    if (lNrActSim > 0)
    {
      dFact /= lNrActSim;
    }
  else
    {
      dFact = 0;
    }
  dTemp = 0.;
  for(iC1= ANNUITY; iC1 < GLMNRSTATES; ++ iC1) dTemp += MARKOVLV::dGetCF(lTime, iC1, GLMDEATH); 
  return(dFact*dTemp);
  
}
  
double VAMOD::dGetQx(long lOrder, long lTafel, long lSex, long lTime, long lYear)
{
  long lDeltaT = lYear - lBaseYear[lSex];
  double dQxKorr = 1.;
  double dFxKorr = 1.;
  double dTemp;
  //if (lDeltaT > lMaxProj) lDeltaT = lMaxProj;
  dTemp = dQxKorr * psymQx[lSex]->dGetValue(lTime) * exp(dFxKorr * psymFx[lSex]->dGetValue(lTime) * (lDeltaT));
  if(dTemp <0) dTemp =0.;
  if(dTemp >1) dTemp =1.;
  return(dTemp);
}

double  VAMOD::dSetRelativeQxForTime(long lTime, double dValue)
{
  lValid = false;
  //printf("\n Add Qx Time %5d %10lf",lTime, psymRelQxTime->dSetValue(lTime, dValue));
  return(psymRelQxTime->dSetValue(lTime, dValue));
}


int VAMOD::iReadInforce(int iP, int iL, char * strFileName)
{
  // Set Inforce File [File]
  int iMsg = 0;
  FILE * psymFile;
  char strBuffer[1024];
  char * pcChar;
  long lNrLines = 0;

  psymFile = fopen(strFileName,"r");
  if (psymFile == NULL)
    {
      return(1);
    }
  VAINFORCE::vClearPersons();
  while(!feof(psymFile))
    {
      if(fgets(strBuffer,1024,psymFile))
	{
	  // STRUKTUR        Tarif (A/G)  Geschlecht(1/2) Alter Schlussalter  Leistung Prämie Technischer Zins
	  //   void          vAddAnnuity(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn); 
	  //   void          vAddEndowment(long lSex, long lX, long lS, double dLeist, double dPraxcem, double dITechn);
	  int iAge, iSex, iSA;
	  char strTar[50];  
	  double dL, dP, dTi;
	  pcChar = strBuffer;
	  while(pcChar)
	    {
	      if(*pcChar != ' ') break;
	      ++pcChar;
	    }
            iAnalyseToken(pcChar);

          //	  sscanf(pcChar,"%s %d %d %d %lf %lf %lf", strTar, &iSex, &iAge, &iSA,  &dL, &dP, &dTi);
#ifdef TRACE_VAMOD
	  //printf("\n Step 1: %s %d %d %d %lf %lf %lf", strTar, iSex, iAge, iSA,  dL, dP, dTi);
#else
	  if(!(lNrLines % 100)) printf("\n Read %4d Lines",lNrLines);
#endif
	  ++lNrLines;
	}
    }
  iMsg= fclose(psymFile);
  return(0);
  printf("\n Done: read of inforce %5d", lNrLines);
}


void   VAMOD::vPrintTex(char * strName)
{
  FILE * psymFile;
  printf("\n Start Printing Tex File");
  psymFile = fopen(strName,"w");
  if (psymFile != NULL)
    MARKOVLV::vPrintTeX(psymFile, true, "VA TRACE", true);
  else
    printf("\n Open Tex File failed \n \n");
  printf("\n Tex Output to %s \n > done \n", strName);
  fclose(psymFile);  
}
void VAMOD::vGenerateTrajectory()
{
  double dLocPerf[SIMTIMESTEPS][NRFUNDS];
  long lC1,lC2;
  double dOldT, dNewT;
  int iX, iT;
  double dEps = 0.001;
  VAPERSON * pPers;
  lValid = false;
// JUST_COPIED_FROM_PY

//   def DoOneSimulationForPortfolio(self,psymPolicies, symLocPar):
//       LocPerf = np.zeros([self.TimeSteps,3])
//       LocPerf[:,2] = 1. + self.fRiskFree * self.dT
  for (lC1=0;lC1<SIMTIMESTEPS; ++lC1)
    {
      dLocPerf[lC1][2]= 1+symPara.dRiskFree * SIMDELTATA;
    }
  SIMLIB::vNewTrajectory();
  dOldT = 0.;

//       #  FOR THE MOMENT NO SX
//       sx = symLocPar["sx"]
//       qx = symLocPar["qx"]
//       f0 = symLocPar["Fund0"]
           
//       # 1. Ajust PolicyValues to given Levels
//       for p in psymPolicies:
//           p.fGWBCurrent = p.fGWB
//           p.fGWBGuCurrent = p.fGuGWB
//           p.fVA = p.fFV * f0 
//           p.iCurrentX = p.iX + 0.001 # to avoid rounding problems
//           p.fAnnuity = 0.
  for(VAINFORCE::vGotoStart();psymCurrentPers !=NULL;VAINFORCE::nNext())
    {
      pPers = psymCurrentPers;
      pPers->symI.dCurrentVA = pPers->symI.dEE; 
      pPers->symI.dCurrentRatchet = pPers->symI.dEE; 
      pPers->symI.dCurrentRatchetAnnuity = pPers->symI.dEE * pPers->symB.dPctAnnuity;
#ifdef TRACE_VAMOD
      printf("%ld: VA %f Benef %f \n",0,pPers->symI.dCurrentVA, 0);
#endif
    }
          
//       for i in range(self.TimeSteps):
  for(lC1=0; lC1<SIMTIMESTEPS; ++lC1)
    {
//           newT = oldT + self.dT
      dNewT = dOldT + SIMDELTATA;
//           LocPerf[i,0] = self.sim.dGetValue(1,newT) / self.sim.dGetValue(1,oldT)
//           LocPerf[i,1] = self.sim.dGetValue(2,newT) / self.sim.dGetValue(2,oldT)
      dLocPerf[lC1][0] = SIMLIB::dGetValue(1,dNewT) / SIMLIB::dGetValue(1,dOldT);
      dLocPerf[lC1][1] = SIMLIB::dGetValue(2,dNewT) / SIMLIB::dGetValue(2,dOldT);
#ifdef TRACE_VAMOD
      printf("%ld: Perf %lf %lf \n",lC1, dLocPerf[lC1][0],dLocPerf[lC1][1]);
#endif
//           oldT = newT
      dOldT = dNewT;
      iT = int(lC1 / 12);
//  =============================================================================
//
//  NOTE: For the Moment VERY simple.
//
//  =============================================================================  
      for(VAINFORCE::vGotoStart();psymCurrentPers !=NULL;VAINFORCE::nNext())
        {
          double dBenefit=0., dPremium=0., dAnnuity=0., dSAR=0., dLoss =0;
          double dPerf;
          pPers = psymCurrentPers;
          iX = pPers->lAge + iT;
//           if i % 12 == 0: # attempt to make it faster
//               iT = i / 12 (done above - no need to do it in the inner loop!)
//               for p in psymPolicies:
//               # 2. Check if Withdrawal date or Annuity Date
//               #    Including possible Losses and Premiums
//               #    In this case also Look at Cash flows flowing
//               # 2.1 Ajust GWB for Bonus : note assume current value does not need to be adjusted.
//                   if 0 < iT <= p.iGuGWBRemainT:
//                       p.fGWBGuCurrent += p.fDeltaGuGWB
//                       if p.fGWBCurrent < p.fGWBGuCurrent:
//                           p.fGWBCurrent = p.fGWBGuCurrent
//               # 2.2 Premium to be withdarwn
          dBenefit = MAX(pPers->symI.dCurrentVA, pPers->symI.dCurrentRatchet);
#ifdef TRACE_VAMOD
          printf("%d: VA %lf Benef %lf \n",iX, pPers->symI.dCurrentVA, dBenefit);
#endif
          // =================================================================
          // OLD NOTE--> THIS IS THE CHEAP TRICK TO ENSURE THAT BENEFITS DO NOT REDUCE
          // HAS been refined - now missing still ratchets
          // =================================================================
          // dBenefit = MAX(dBenefit, pPers->symI.dEE);
          if (iX >= pPers->symB.lStartGuaranteeAge)
            {
              double dGuarantee=0.;
              int iGTime = MAX(0,MIN(pPers->symB.lEndGuaranteeAge,iX) -pPers->symB.lStartGuaranteeAge);
              if (pPers->symB.bLinear)
                {
                  dGuarantee = pPers->symB.dStartValueGuarantee * (1 + iGTime *  pPers->symB.dIncreasePA);
                }
              if (pPers->symB.bExponential)
                {
                  dGuarantee = pPers->symB.dStartValueGuarantee * pow(1 + pPers->symB.dIncreasePA,iGTime);
                }
              dBenefit = MAX(dBenefit, dGuarantee);
            }
          dPremium =  MIN(pPers->symI.dCurrentVA, SIMDELTATA * dBenefit * pPers->symB.dPctPremium);
          pPers->symI.dCurrentVA -= dPremium;
#ifdef TRACE_VAMOD
          printf("P %d: VA %lf Benef %lf \n",iX, pPers->symI.dCurrentVA, dBenefit);
#endif
//               # 2.3 Annuiy to be withdarwn
          if (iX >= pPers->symB.lSAnnuity)
            {
              dAnnuity = SIMDELTATA * MAX(pPers->symI.dCurrentRatchetAnnuity,dBenefit * pPers->symB.dPctAnnuity);
              pPers->symI.dCurrentRatchetAnnuity = MAX(dAnnuity,pPers->symI.dCurrentRatchetAnnuity);

//                   if (p.iSW <= p.iCurrentX < p.iS):                           # <-- would have and fGWB > 0
//                       p.fAnnuity = max(p.fAnnuity, p.fGWBCurrent * p.fGWBPct) # NEED TO CHECK WHETHER CAN WITHDRAW IF GWB < 0 - this would mean that except for life annuities would stop in this case
//                       p.fVA -= p.fAnnuity
//                       p.fGWBCurrent -= p.fAnnuity
//                   if p.iForLife and p.iCurrentX >= p.iS:
//                       p.fAnnuity = max(p.fAnnuity, p.fGWBCurrent * p.fGWBPct)
//                       p.fVA -= p.fAnnuity
            }
          if (iX < pPers->symB.lSTerm)
            {
              dSAR = SIMDELTATA * MAX(0.,dBenefit * pPers->symB.dPctTerm - pPers->symI.dCurrentVA);
//               # 2.3a
                      
//                   if (p.iGMDB and p.iCurrentX < p.iGMDBiS):
//                      fGMDB = max(0., p.fGWBCurrent - p.fVA)
//                   else:
//                      fGMDB = 0.
            }

          if (iX == pPers->symB.lEndowmentAge)
            {
              dAnnuity += SIMDELTATA * dBenefit * pPers->symB.dPctEndowment;
//               # 2.3a
                      
//                   if (p.iGMDB and p.iCurrentX < p.iGMDBiS):
//                      fGMDB = max(0., p.fGWBCurrent - p.fVA)
//                   else:
//                      fGMDB = 0.
            }

          pPers->symI.dCurrentVA -= dAnnuity;
#ifdef TRACE_VAMOD
          printf("A %d: VA %lf Benef %lf \n",iX, pPers->symI.dCurrentVA, dBenefit);
#endif
//               # 2.4 Accounting                      
//                   Loss = max(0, -p.fVA)
          dLoss = MAX(0, -pPers->symI.dCurrentVA);
          pPers->symI.dCurrentVA += dLoss;
#ifdef TRACE_VAMOD
          printf("L %d: VA %lf Benef %lf \n",iX, pPers->symI.dCurrentVA, dBenefit);
#endif
//                   p.fVA += Loss
//                   if Loss or Prem or p.iGMDB:
//                       self.lv.vSetStopTime(int(p.iX))
//                       tPx = self.lv.dGetTpx(iT)
//                       tQx = self.lv.dGetTqx(iT)
// HERE WE DO IT DIFFERENTLY VIA MARKOV OBJECT
          vAddDeath(pPers->lGender, pPers->lAge, iX, 0, dSAR, 0., 0.); 
          vAddEndowment(pPers->lGender, pPers->lAge, iX, 12, dLoss, 0., 0.); 
          vAddPremium(pPers->lGender, pPers->lAge, iX, 1, 0., dPremium, 0.); 
//                       #print "%10.2f tPx %10.2f  tQx %10.2f" % (p.iCurrentX, tPx, tQx)
//                       self.fAggregLossT[iT] += tPx * Loss 
//                       self.fAggregGMDBT[iT] += fGMDB * tQx
//                       self.fAggregPremT[iT] += tPx * Prem
//               # 3. Do Write Forwards of Funds + Ratchet
          dPerf  =  dLocPerf[lC1][0] * pPers->symI.dSAA[0];
          dPerf +=  dLocPerf[lC1][1] * pPers->symI.dSAA[1];
          dPerf +=  dLocPerf[lC1][2] * pPers->symI.dSAA[2];
#ifdef TRACE_VAMOD
          printf("%d: VA %lf Perf %lf \n",iX, pPers->symI.dCurrentVA, dPerf);
#endif
          pPers->symI.dCurrentVA *= dPerf;
          if(pPers->symB.lRatchet)
	    {
#ifdef TRACE_VAMOD
	      printf("%d: Ratchet %ld Old Value %lf \n",iX, pPers->symB.lRatchet,pPers->symI.dCurrentRatchet);
#endif
	      if ((pPers->symI.dCurrentVA > pPers->symI.dCurrentRatchet) && !(lC1%(pPers->symB.lRatchet)))
		{
#ifdef TRACE_VAMOD
          printf("Period %d: New Value %lf \n",lC1, pPers->symI.dCurrentRatchet);
#endif

		  pPers->symI.dCurrentRatchet=pPers->symI.dCurrentVA;
		}
	    }
//                   if p.fVA:
//                       if p.iX < p.iS:
//                         perf = p.fPart[0] * LocPerf[i,0] + p.fPart[1] * LocPerf[i,1] + p.fPart[2] * LocPerf[i,2]
//                       else:
//                         perf = LocPerf[i,2] 
//                       p.fVA *= perf
//                       if p.iRatchet and i%p.iRatchet == 0 and p.fVA > p.fGWBCurrent:
//                           p.fGWBCurrent = p.fVA
//                   p.iCurrentX += self.dT
//           else:    
//               for p in psymPolicies:
//               # 2. Check if Withdrawal date or Annuity Date
//               #    Including possible Losses and Premiums
//               #    In this case also Look at Cash flows flowing
          
//               # 3. Do Write Forwards of Funds + Ratchet
//                   if p.fVA:
//                       if p.iX < p.iS:
//                         perf = p.fPart[0] * LocPerf[i,0] + p.fPart[1] * LocPerf[i,1] + p.fPart[2] * LocPerf[i,2]
//                       else:
//                         perf = LocPerf[i,2]                      
//                       p.fVA *= perf
//                       if p.iRatchet and i%p.iRatchet == 0 and p.fVA > p.fGWBCurrent:
//                           p.fGWBCurrent = p.fVA
//                   p.iCurrentX += self.dT
        }
    }
}


  void   VAMOD::vNewSeed(long lSeed)
  {
    this->lSeed = lSeed;
  }
  void   VAMOD::vResetMeanResults()
  {
    lNrActSim = 0l;
    MARKOVLV::vReset();
  }

int  VAMOD::iSetTable(int iSex, char * pcId, double dTech) 
{
  int iC1,iC2;
  int iX0;
  int iXOmega;
  lValid = false;
  //psymQx->vReset();
  if (!this->psymTable1)
    this->psymTable1 = new TABLESERVER();
  this->psymTable1->vSetTable(pcId);
  iC2= this->psymTable1->iTableNumber();
  if (iC2<0)
    return(iC2);
  iX0 = this->psymTable1->iX0();
  iXOmega = this->psymTable1->iXOmega();
  //vSetStartTime(iXOmega+1);
  //dTech = this->psymTable1->dITech();
  for(iC1=0; iC1<2500; ++iC1)
    {
      dSetDisc(iC1, 1./(1. + dTech));
    }
  for(iC1=0; iC1 <= iXOmega; ++iC1)
    {
      dSetQx(0, 0, iSex, iC1, this->psymTable1->dGetValue(iC1));
    }
  return(iC2);
}


