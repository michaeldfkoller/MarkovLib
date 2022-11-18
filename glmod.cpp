//////////////////////////////////////////////////////////////////
//                                                               //
// GLMod LV Zahlungsstroeme                                      //
//                                                               //
// Autor Michael Koller                                          //
//                                                               //
// Datum 3.2011: erstellt                                        //
//                                                               //
///////////////////////////////////////////////////////////////////

#define PRO_MARKOV_STANDALONE
#ifdef PRO_MARKOV_STANDALONE
#define FOR_OLE
#include "annuity.h"
#include "capital.h"
#else
#include "annuity.cpp"
#include "capital.cpp"
#endif
#include "glmod.h"

#ifdef FOR_OLE
#pragma message ("In order to avoid double references to omarkov.cpp we include only header")
#include "omarkov.h"
#else
#include "omarkov.cpp"
#endif

#define TRACE_GLMOD
#define TRACE_PLUS
#define MAN               0l
#define WOMAN           100l
#define CAPITAL           0l
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

GLMOD::GLMOD():MARKOVLV(250l, GLMNRSTATES ,1l)
{
  int iC1, iC2, iC3;
  long lNTimes = 4;
  double dTemp;
  double dPre = (lNTimes + 1) /( 2. * lNTimes);

  //  MARKOVLV::MARKOVLV(250l, GLMNRSTATES ,1l);
  vSetNrStates(GLMNRSTATES);
  for(iC1= 0; iC1 < 2; ++iC1)
    {
      for(iC2= 0; iC2 < 2; ++iC2)
        {
          for(iC3= 0; iC3 < 2; ++iC3)
            {
	      psymQx[iC1][iC2][iC3]    = new LV_VECTOR(250, 0, 0);
	      psymFx[iC1][iC2][iC3]    = new LV_VECTOR(250, 0, 0);
	      lBaseYear[iC1][iC2][iC3] = 2000l;
            }
        }
    }

  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymSx   = new LV_VECTOR(250, 0, 0);
  psymRelQxTime = new LV_VECTOR(250, 0, 0);
  psymTilde = new LV_VECTOR(250, 0, 0);
  lActualYear = 2000;

  iQxStress = 0;                            
  dQxStress = 0;   // qx -> (1 +/- alpha) x qx
  iFxStress = 0;                            
  dFxStress = 0;   // qx -> (1 +/- alpha) x qx
  iSxStress = 0;                            
  dSxStress = 0;   // sx -> dFxStress
  iYieldStress=0;                         
  dYieldStress=0;   // yield -> yield +/- alpha

  dStatDK =0;
  dFVDK   =0;
  bTildeCalc = false;
  lValid = false;
  dAddBenefits = true;

#ifdef TRACE_GLMOD
  psymTrace = fopen("trace_GLMOD.dat","w");
#else
  psymTrace = NULL;
#endif

  dAexRKW = 1.;
  dAxRKW  = 1.;
  //ANNUITYLV  * psymAex;
  //CAPITALLV  * psymPraem;
  psymAex = new ANNUITYLV(250, dPre); // Overrides Defaults
  psymPraem = new CAPITALLV(250); // Overrides Defaults
  psymAx = new CAPITALLV(250); // Overrides Defaults

  for (iC1 = 0; iC1 < 250; ++iC1) dTemp = psymRelQxTime->dSetValue(iC1, 1.);
}

GLMOD::~GLMOD()
{
  int iC1, iC2, iC3;
  for(iC1= 0; iC1 < 2; ++iC1)
    {
      for(iC2= 0; iC2 < 2; ++iC2)
        {
          for(iC3= 0; iC3 < 2; ++iC3)
            {
              delete(psymQx[iC1][iC2][iC3]);
              delete(psymFx[iC1][iC2][iC3]);
            }
        }
    }   
  delete(psymDisc);
  delete(psymSx);
  delete(psymRelQxTime);
  delete(psymTilde);
#ifdef TRACE_GLMOD
  fclose(psymTrace);
#endif

  delete(psymAex);
  delete(psymPraem);
  delete(psymAx);
}

double         GLMOD::dSetQx(long lTable, long lType, long lSex, long lTime, double dValue)  // Table 0=K, 1= R Type 0 = 2 Ordn 1= erster Ordn  
{
  if (lTable != 0 && lTable != 1) return(-1);
  if (lType  != 0 && lType != 1) return(-1);
  if (lSex   != 0 && lSex != 1) return(-1);
  lValid = false;
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\nQX>> Qx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif
  return(psymQx[lTable][lType][lSex]->dSetValue(lTime, dValue));
}

double         GLMOD::dSetFx(long lTable, long lType, long lSex, long lTime, double dValue)
{
  if (lTable != 0 && lTable != 1) return(-1);
  if (lType  != 0 && lType  != 1) return(-1);
  if (lSex   != 0 && lSex   != 1) return(-1);
  lValid = false;
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\nFX>> Fx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif
  return(psymFx[lTable][lType][lSex]->dSetValue(lTime, dValue));
}

double         GLMOD::dSetSx(long lTable, long lType, long lSex, long lTime, double dValue)
{
  // remark only one sx
  lValid = false;
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\nSX>> Sx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif          
  return(psymSx->dSetValue(lTime, dValue));

}

double         GLMOD::dSetBaseYear(long lTable, long lType, long lSex, long lTime)
{
  if (lTable != 0 && lTable != 1) return(-1);
  if (lType  != 0 && lType  != 1) return(-1);
  if (lSex   != 0 && lSex   != 1) return(-1);
  lValid = false;
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\nBY>> BaseYear[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10ld", lTable, lType, lSex, lTime);
#endif      
  lBaseYear[lTable][lType][lSex]=lTime;
  return(lBaseYear[lTable][lType][lSex]);
}

double         GLMOD::dSetActualYear(long lTime)
{
  lValid = false;
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\nAY>> ActuarYear = %10ld", lTime);
#endif      
  lActualYear = lTime;
  return(lActualYear);
}

double         GLMOD::dSetDisc(long lTime, double dValue)
{
  lValid = false;
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\nDI>> Disc[t=%4d] = %10.8lf",lTime, dValue);
#endif  
  return(psymDisc->dSetValue(lTime, dValue));
}

void           GLMOD::vStress(long lType, double dValue) // Idee lType = 0 -> Reset  1= = ...
{
  if(lType == RESETSTRESS ) {iQxStress=0; iFxStress=0; iSxStress =0; iYieldStress=0;}
  if(lType == QXSTRESS    ) {iQxStress=1; dQxStress = dValue;}
  if(lType == FXSTRESS    ) {iFxStress=1; dFxStress = dValue;}
  if(lType == SXSTRESS    ) {iSxStress=1; dSxStress = dValue;}
  if(lType == YIELDSTRESS ) {iYieldStress=1; dYieldStress = dValue;}
  lValid = false;
}

void           GLMOD::vAddAnnuity(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn)
{
  double dTemp; 
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  double dPost= (lNTimes - 1) /( 2. * lNTimes);
  int iC1, iC2 =0;
  double dV = 1./(1.+dITechn);
     
  //ANNUITYLV  * psymAex;
  //CAPITALLV  * psymPraem;

  //psymAex = new ANNUITYLV(250, dPre); // Overrides Defaults
  //psymPraem = new CAPITALLV(250); // Overrides Defaults
  dTemp = psymAex->dSetPre(dPre);
  psymAex->vSetStartTime(STARTTIME);
  psymAex->vSetStopTime(lX);
  psymAex->vSetSAge(lS);
  psymAex->vSetG(0);

  psymPraem->vSetStartTime(lS);
  psymPraem->vSetStopTime(lX);
  psymPraem->vSetPremium(dPraem);

  for (iC1=lX; iC1 < STARTTIME; ++iC1)
    {
      psymAex->dSetQx(iC1, psymQx[FIRSTORDER][RTAF][lSex]->dGetValue(iC1));  // lNach irrelevant
      psymAex->dSetFx(iC1, psymFx[FIRSTORDER][RTAF][lSex]->dGetValue(iC1));
      psymAex->dSetDisc(lActualYear+iC1-lX, dV);
      
      psymPraem->dSetQx(iC1, psymQx[FIRSTORDER][RTAF][lSex]->dGetValue(iC1));  // lNach irrelevant
      psymPraem->dSetFx(iC1, psymFx[FIRSTORDER][RTAF][lSex]->dGetValue(iC1));
      psymPraem->dSetDisc(lActualYear+iC1-lX, dV);


    }
  psymAex->dSetBaseYear(lBaseYear[FIRSTORDER][RTAF][lSex]);
  psymAex->dSetActualYear(lActualYear);
     
     
  int iStateStar= WOMAN * lSex + ANNUITY +lX;
     
  if (lX <0 || lX > MAXAGE) { return;}
     
  dPre  *= dLeist;
  dPost *= dLeist;
  iC2=0;
     
  for(iC1 = lX; iC1 < lS; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre(iC2, iStateStar, iStateStar, -dPraem);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, SURRENDER, (psymAex->dGetDK(iC1) * dLeist + psymPraem->dGetDK(iC1)) * dAexRKW);  
      ++iC2;
    }
  for(iC1 = lS; iC1 < STARTTIME; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre (iC2, iStateStar, iStateStar, dPre);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, iStateStar, dPost);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, SURRENDER, (psymAex->dGetDK(iC1) * dLeist + psymPraem->dGetDK(iC1)) * dAexRKW);
      ++iC2;
    }
     
  dStatDK += psymAex->dGetDK(lX) * dLeist + psymPraem->dGetDK(lX);
#ifdef TRACE_GLMOD     
  if(psymTrace) fprintf(psymTrace,"\n vAddAnnuity  S %d, x %d SL %d L %10.4f P %10.4f iT %10.4f  DK %10.2f",lSex, lX, lS, dLeist, dPraem, dITechn, psymAex->dGetDK(lX) * dLeist + psymPraem->dGetDK(lX));
#endif     
  for (iC1=lX; iC1 < STARTTIME; ++iC1)
    {
      double dTL = psymDisc->dGetValue(iC1);
      psymAex->dSetDisc(lActualYear+iC1-lX, dTL);
    }
     
  dFVDK += psymAex->dGetDK(lX) * dLeist + psymPraem->dGetDK(lX);
#ifdef TRACE_GLMOD     
  if(psymTrace) fprintf(psymTrace," FV %10.2f",psymAex->dGetDK(lX) * dLeist + psymPraem->dGetDK(lX));
#endif    
  //  delete(psymAex);
  //  delete(psymPraem);

}

void           GLMOD::vAddEndowment(long lSex, long lX, long lS, double dLeist, double dPraem, double dITechn)
{
  double dTemp; 
  double dV = 1./(1.+dITechn);
  int iC1, iC2 =0;
     
  // CAPITALLV  * psymAx;
  // psymAx = new CAPITALLV(250); // Overrides Defaults
  psymAx->vSetStartTime(lS);
  psymAx->vSetStopTime(lX);
  psymAx->vSetSurvival(lS, dLeist);
  psymAx->vSetDeath(dLeist);
  psymAx->vSetPremium(dPraem);

     
  for (iC1=lX; iC1 < STARTTIME; ++iC1)
    {
      psymAx->dSetQx(iC1, psymQx[FIRSTORDER][RTAF][lSex]->dGetValue(iC1));  // lNach irrelevant
      psymAx->dSetFx(iC1, psymFx[FIRSTORDER][RTAF][lSex]->dGetValue(iC1));
      psymAx->dSetDisc(lActualYear+iC1-lX, dV);
    }
  psymAx->dSetBaseYear(lBaseYear[FIRSTORDER][RTAF][lSex]);
  psymAx->dSetActualYear(lActualYear);
  

  int iStateStar= WOMAN * lSex + CAPITAL +lX;
  if (lX <0 || lX > MAXAGE) {return;}
  iC2=0;
  for(iC1 = lX; iC1 < lS; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre (iC2, iStateStar, iStateStar, -dPraem);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, GLMDEATH, dLeist);
      if(iC1 == lS - 1) dTemp = MARKOVLV::dSetPost(iC2, iStateStar, iStateStar, dLeist);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, SURRENDER, psymAx->dGetDK(iC1) * dAxRKW);
      ++iC2;
    }

  dStatDK += psymAx->dGetDK(lX);
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\n vAddCapital  S %d, x %d SL %d L %10.4f P %10.4f iT %10.8f DK %10.2f",lSex, lX, lS, dLeist, dPraem, dITechn, psymAx->dGetDK(lX));
#endif
  for (iC1=lX; iC1 < STARTTIME; ++iC1)
    {
      double dTL = psymDisc->dGetValue(iC1);
      psymAx->dSetDisc(lActualYear+iC1-lX, dTL);
    }
     
  dFVDK += psymAx->dGetDK(lX);
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace," FV %10.2f",psymAx->dGetDK(lX));
#endif
  //  delete(psymAx);

}

void           GLMOD::vAddWiddow(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn)
{
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  double dTemp; 
  double dV = 1./(1.+dITechn);
  int iC1, iC2 =0;
  int iDeltaXY = -3;

  if(lSex == 0){ iDeltaXY = -iDeltaXY;}
     
  dTemp = psymAex->dSetPre(dPre);
  psymAex->vSetStartTime(STARTTIME);
  psymAex->vSetStopTime(lX+iDeltaXY);
  psymAex->vSetSAge(0);
  psymAex->vSetG(0);

  for (iC1=lX; iC1 < STARTTIME; ++iC1)
    {
      psymAex->dSetQx(iC1, psymQx[FIRSTORDER][RTAF][1-lSex]->dGetValue(iC1));  // lNach irrelevant
      psymAex->dSetFx(iC1, psymFx[FIRSTORDER][RTAF][1-lSex]->dGetValue(iC1));
      psymAex->dSetDisc(lActualYear+iC1-lX, dV);
    }
  psymAex->dSetBaseYear(lBaseYear[FIRSTORDER][RTAF][1-lSex]);
  psymAex->dSetActualYear(lActualYear);
  

  int iStateStar= WOMAN * lSex + CAPITAL +lX;
  if (lX <0 || lX > MAXAGE) {return;}
  iC2=0;
  for(iC1 = lX; iC1 < lS; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre (iC2, iStateStar, iStateStar, -dPraem);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, GLMDEATH, dLeist*psymAex->dGetDK(iC1+iDeltaXY));
      // existiert nicht if(iC1 == lS - 1) dTemp = MARKOVLV::dSetPost(iC2, iStateStar, iStateStar, dLeist);
      // kein RKW dTemp = MARKOVLV::dSetPost(iC2, iStateStar, SURRENDER, psymAx->dGetDK(iC1) * dAxRKW);
      ++iC2;
    }

#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace,"\n vAddWiddow  #NV S %d, x %d SL %d L %10.4f P %10.4f iT %10.8f DK %10.2f",lSex, lX, lS, dLeist, dPraem, dITechn, 0);
#endif
  for (iC1=lX; iC1 < STARTTIME; ++iC1)
    {
      double dTL = psymDisc->dGetValue(iC1);
      psymAx->dSetDisc(lActualYear+iC1-lX, dTL);
    }
     
  dFVDK += psymAx->dGetDK(lX);
#ifdef TRACE_GLMOD
  if(psymTrace) fprintf(psymTrace," FV %10.2f",psymAx->dGetDK(lX));
#endif
  //  delete(psymAx);

}

void           GLMOD::vSetRKWAnnuity(long lType, double dAmount)
{
  iAexRKW = lType;                              dAexRKW = dAmount;   // yield -> yield +/- alpha
}
  
void           GLMOD::vSetRKWEndowment(long lType, double dAmount)
{
  iAxRKW = lType;                               dAxRKW= dAmount;   // yield -> yield +/- alpha
}

void           GLMOD::vUpdateOperator()
{
  double dQxLoc, dSxLoc;
  int iStartalter, iVersicherungstyp, iC1, iC2;
  double dSxKorr = dSxStress;
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
	  if(iSxStress == 1 && iC1 == 0) dSxLoc = dSxKorr;
	  //      printf("\n iC= %d x=%3d y=%4d sx = %10.8f", iC1, iStartalter +iC1, iC1 + lActualYear, <dSxLoc); 
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + CAPITAL + iStartalter , MAN + CAPITAL + iStartalter, (1. - dSxLoc) * (1. - dQxLoc));
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + CAPITAL + iStartalter , GLMDEATH, (1. - dSxLoc) * dQxLoc);
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + CAPITAL + iStartalter , SURRENDER, dSxLoc);
	}

   
    }
  // Kapital Frau
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, KTAF, 1 /* for woman */, iStartalter + iC1 , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	  dSxLoc = psymSx->dGetValue(iStartalter + iC1);
	  if(iSxStress == 1 && iC1 == 0) dSxLoc = dSxKorr;
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + CAPITAL + iStartalter , WOMAN + CAPITAL + iStartalter, (1. - dSxLoc) * (1. - dQxLoc));
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + CAPITAL + iStartalter , GLMDEATH, (1. - dSxLoc) * dQxLoc);
	  dTemp = MARKOVLV::dSetPij(iC1, WOMAN + CAPITAL + iStartalter , SURRENDER, dSxLoc);
	}
   
    }
  // Rente Mann
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, RTAF, MAN, iStartalter + iC1 , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	  dSxLoc = psymSx->dGetValue(iStartalter + iC1);
	  if(iSxStress == 1 && iC1 == 0) dSxLoc = dSxKorr;
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
	  if(iSxStress == 1 && iC1 == 0) dSxLoc = dSxKorr;
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
      if(dLocDisc != 0 && iYieldStress)
	{
          dLocDisc  = (1./dLocDisc + dYieldStress);
          if (dLocDisc >= 1.) dLocDisc = 1./ dLocDisc;
	  else             dLocDisc = 1.;
	}
      for(iC2=0; iC2 < 402; ++ iC2) dTemp = MARKOVLV::dSetDisc(iC1, iC2, iC2, dLocDisc);
    }
  lValid = false;
}

double         GLMOD::dGetStatDK(void)
{
  return(dStatDK);
}

double         GLMOD::dGetFVDK(void)
{
  return(dFVDK);
}


double	     GLMOD::dGetDK(long lTime)
{
  double dTemp=0;
  int iC1;

  if(!lValid)
    {
      vUpdateOperator();

      MARKOVLV::vSetStartTime(STARTTIME);
      MARKOVLV::vSetStopTime(STOPTIME);
      lValid = true;
    }
  // printf("\n Get GLM DK");
  
  for(iC1= 0; iC1 < GLMNRSTATES; ++ iC1) dTemp += MARKOVLV::dGetDK(lTime,iC1,1l);
  return(dTemp);
}

double	 GLMOD::dGetDKDetail(long lTime, long lState) // Berechnet DK's fuer jeden State.
{
  double dTemp=0;
  int iC1;

  if(!lValid)
    {
      dTemp = dGetDK(0);
    }
  return(MARKOVLV::dGetDK(lTime,lState,1l));
}

double         GLMOD::dGetCF(long lTime)
{
  double dTemp;
  int iC1;
  if(!lValid) dTemp = dGetDK(0);
  dTemp = 0.;
  for(iC1= 0; iC1 < GLMNRSTATES; ++ iC1) dTemp += MARKOVLV::dGetCF(lTime, iC1, iC1) + MARKOVLV::dGetCF(lTime, iC1, GLMDEATH) + MARKOVLV::dGetCF(lTime, iC1, SURRENDER); 
  return(dTemp);
}

double         GLMOD::dGetCFDetail(long lTime, long lState)
{
  double dTemp;
  int iC1;
  if(!lValid) dTemp = dGetDK(0);

  return(MARKOVLV::dGetCF(lTime, lState, lState));
}


double	     GLMOD::dGetDKTilde(long lTime)
{
  double dTemp=0;
  double dT2;
  int iC1;
  
  if (!bTildeCalc || !lValid) 
    {
      for(iC1= STARTTIME -1; iC1 >= STOPTIME; -- iC1) 
	{
	  dTemp = dTemp * psymDisc->dGetValue(iC1) + dGetCF(iC1);
          dT2= psymTilde->dSetValue(iC1, dTemp);
	}
    bTildeCalc = true;
    }
  else
  {
      iC1=0;
  }

  return(psymTilde->dGetValue(iC1));
}


double         GLMOD::dGetStatDK(long lType)  // lType: 0=Stat 1=FV ohne sx
{
  if(lType == 0)      return(dStatDK);
  if(lType == 1)      return(dFVDK);
  
  return(0.);
}
  
double GLMOD::dGetQx(long lOrder, long lTafel, long lSex, long lTime, long lYear)
{
  long lDeltaT = lYear - lBaseYear[lOrder][lTafel][lSex];
  double dQxKorr = 1.;
  double dFxKorr = 1.;
  double dTemp;
  //if (lDeltaT > lMaxProj) lDeltaT = lMaxProj;
  if (iQxStress == 1) dQxKorr = 1 + dQxStress;
  if (iFxStress == 1) dFxKorr = 1 + dFxStress;
  dTemp = dQxKorr * psymQx[lOrder][lTafel][lSex]->dGetValue(lTime) * exp(dFxKorr * psymFx[lOrder][lTafel][lSex]->dGetValue(lTime) * (lDeltaT));
  if(dTemp <0) dTemp =0.;
  if(dTemp >1) dTemp =1.;
  return(dTemp);
}

double  GLMOD::dSetRelativeQxForTime(long lTime, double dValue)
{
  lValid = false;
  //printf("\n Add Qx Time %5d %10lf",lTime, psymRelQxTime->dSetValue(lTime, dValue));
  return(psymRelQxTime->dSetValue(lTime, dValue));
}

int GLMOD::iReadInforce(int iP, int iL, char * strFileName)
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

  while(!feof(psymFile))
    {
      if(fgets(strBuffer,1024,psymFile))
	{
	  // STRUKTUR        Tarif (A/G)  Geschlecht(1/2) Alter Schlussalter  Leistung Prämie Technischer Zins
	  //   void          vAddAnnuity(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn); 
	  //   void          vAddEndowment(long lSex, long lX, long lS, double dLeist, double dPraem, double dITechn);
	  int iAge, iSex, iSA;
	  char strTar[50];  
	  double dL, dP, dTi;
	  pcChar = strBuffer;
	  while(pcChar)
	    {
	      if(*pcChar != ' ') break;
	      ++pcChar;
	    }
	  sscanf(pcChar,"%s %d %d %d %lf %lf %lf", strTar, &iSex, &iAge, &iSA,  &dL, &dP, &dTi);
#ifdef TRACE_GLMOD
	  printf("\n Step 1: %s %d %d %d %lf %lf %lf", strTar, iSex, iAge, iSA,  dL, dP, dTi);
#else
	  if(!(lNrLines % 100)) printf("\n Read %4d Lines",lNrLines);
#endif
	  --iSex; if(iSex >=0 || iSex <=1)
		    {
		      if(strstr(strTar,"G")) vAddEndowment(iSex, iAge, iSA, iL*dL, iP*dP, dTi);
		      if(strstr(strTar,"A")) vAddAnnuity(iSex, iAge, iSA, 4, iL*dL, iP*dP, dTi);
		      if(strstr(strTar,"W")) vAddWiddow(iSex, iAge, iSA, 4, iL*dL, iP*dP, dTi);
		    }
	  ++lNrLines;
	}
    }
  iMsg= fclose(psymFile);
  
  printf("\n Done: read of inforce %5d", lNrLines);
  return(0);
}


void   GLMOD::vPrintTex(char * strName)
{
  FILE * psymFile;
  printf("\n Start Printing Tex File");
  psymFile = fopen(strName,"w");
  if (psymFile != NULL)
    MARKOVLV::vPrintTeX(psymFile, true, (char *) "GLM TRACE", true);
  else
    printf("\n Open Tex File failed \n \n");
  printf("\n Tex Output to %s \n > done \n", strName);
  fclose(psymFile);  
}
