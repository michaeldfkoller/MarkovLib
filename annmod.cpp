///////////////////////////////////////////////////////////////////
//                                                               //
// ANNMOD LV Zahlungsstroeme                                     //
//                                                               //
// Autor Michael Koller                                          //
//                                                               //
// Datum 3.2011: erstellt                                        //
//                                                               //
///////////////////////////////////////////////////////////////////
#include "annmod.h"

#ifdef FOR_OLE
#pragma message ("In order to avoid double references to omarkov.cpp we include only header")
#include "omarkov.h"
#else
#include "omarkov.cpp"
#endif

#define TRACE_ANNMOD
#define MAN             0l    // Maenner starten bei 0 (bis 99)
#define WOMAN           100l  // Maenner starten bei 100 (bis 199)
#define ONELIFE         0l    // Einlebige starten bei 0
#define TWOLIFE__XX     200l  // (x,x) Paare bei 200
#define TWOLIFE__XY     300l  // (x,y) Paare bei 300
#define TWOLIFE__YY     400l  // (y,y) Paare bei 400
#define DELTAXYM10        0l  // Offest x-y = -10
#define DELTAXYM3       300l  // Offest x-y = -3
#define DELTAXYP3       600l  // Offest x-y = +3
#define DELTAXYP8       900l  // Offest x-y = +8
#define DELTAXYP13     1200l  // Offest x-y = +13
#define MAXAGE           99l  
#define ZINSRENTE      1700l  // In Zustand 1700 Zinsrente
#define ANNDEATH       1701l  // In Zustand 1701 Tod
#define FIRSTORDER        0l
#define SECONDORDER       1l
#define KTAF              0l
#define RTAF              1l
#define STARTTIME       120l
#define STOPTIME          0l
#define ANNNRSTATES    1702l


ANNMOD::ANNMOD():MARKOVLV(250l, ANNNRSTATES ,1l)
{
  //TODOS: a) Steigerung expo für alle renten
  int iC1, iC2, iC3;
  long lNTimes = 4;
  double dTemp;
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  

  //  MARKOVLV::MARKOVLV(250l, ANNNRSTATES ,1l);
  vSetNrStates(ANNNRSTATES);
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
  lActualYear = 2000;

  dStatDK =0;
  dFVDK   =0;
  lValid = false;
  dAddBenefits = true;

#ifdef TRACE_ANNMOD
  psymTrace = fopen("trace_ANNMOD.dat","w");
#else
  psymTrace = NULL;
#endif

  psymAex = new ANNUITYLV(250, dPre); // Overrides Defaults
  psymPraem = new CAPITALLV(250); // Overrides Defaults
  psymAx = new CAPITALLV(250); // Overrides Defaults

  for (iC1 = 0; iC1 < 250; ++iC1) dTemp = psymRelQxTime->dSetValue(iC1, 1.);
}

ANNMOD::~ANNMOD()
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
#ifdef TRACE_ANNMOD
  fclose(psymTrace);
#endif

  delete(psymAex);
  delete(psymPraem);
  delete(psymAx);

  
}


double         ANNMOD::dSetQx(long lTable, long lType, long lSex, long lTime, double dValue)  
                                  // Table 0=K, 1= R Type 0 = 2 Ordn 1= erster Ordn  
{
  if (lTable != 0 && lTable != 1) return(-1);
  if (lType  != 0 && lType != 1) return(-1);
  if (lSex   != 0 && lSex != 1) return(-1);
  lValid = false;
#ifdef TRACE_ANNMOD
  if(psymTrace) fprintf(psymTrace,"\nQX>> Qx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif
  return(psymQx[lTable][lType][lSex]->dSetValue(lTime, dValue));
  
}

double         ANNMOD::dSetFx(long lTable, long lType, long lSex, long lTime, double dValue)
{
  if (lTable != 0 && lTable != 1) return(-1);
  if (lType  != 0 && lType  != 1) return(-1);
  if (lSex   != 0 && lSex   != 1) return(-1);
  lValid = false;
#ifdef TRACE_ANNMOD
  if(psymTrace) fprintf(psymTrace,"\nFX>> Fx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif
  return(psymFx[lTable][lType][lSex]->dSetValue(lTime, dValue));
}

double         ANNMOD::dSetSx(long lTable, long lType, long lSex, long lTime, double dValue)
{
  // remark only one sx
  lValid = false;
#ifdef TRACE_ANNMOD
  if(psymTrace) fprintf(psymTrace,"\nSX>> Sx[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10.8f", lTable, lType, lSex, dValue);
#endif          
  return(psymSx->dSetValue(lTime, dValue));

}

double         ANNMOD::dSetBaseYear(long lTable, long lType, long lSex, long lTime)
{
  if (lTable != 0 && lTable != 1) return(-1);
  if (lType  != 0 && lType  != 1) return(-1);
  if (lSex   != 0 && lSex   != 1) return(-1);
  lValid = false;
#ifdef TRACE_ANNMOD
  if(psymTrace) fprintf(psymTrace,"\nBY>> BaseYear[Table(K/R)=%1d][Typ(1/2Ord)=%1d][Sex(0/1)=%1d] = %10ld", lTable, lType, lSex, lTime);
#endif      
  lBaseYear[lTable][lType][lSex]=lTime;
  return(lBaseYear[lTable][lType][lSex]);
}

double         ANNMOD::dSetActualYear(long lTime)
{
  lValid = false;
#ifdef TRACE_ANNMOD
  if(psymTrace) fprintf(psymTrace,"\nAY>> ActuarYear = %10ld", lTime);
#endif      
  lActualYear = lTime;
  return(lActualYear);
}

double         ANNMOD::dSetDisc(long lTime, double dValue)
{
  lValid = false;
#ifdef TRACE_ANNMOD
  if(psymTrace) fprintf(psymTrace,"\nDI>> Disc[t=%4d] = %10.8lf",lTime, dValue);
#endif  
  return(psymDisc->dSetValue(lTime, dValue));
}

// Einlebig
void           ANNMOD::vAddAnnuity1(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease)
{
  double dTemp; 
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  double dPost= (lNTimes - 1) /( 2. * lNTimes);
  int iC1, iC2 =0;
  double dBeta;
  
  int iStateStar= WOMAN * lSex + ONELIFE +lX;
     
  if (lX <0 || lX > MAXAGE) { return;}
     
  dPre  *= dLeist;
  dPost *= dLeist;
  iC2=0;
     
  for(iC1 = lX; iC1 < lS; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre(iC2, iStateStar, iStateStar, -dPraem);
      ++iC2;
    }

  dBeta = 1.;
  for(iC1 = lS; iC1 < STARTTIME; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre (iC2, iStateStar, iStateStar, dPre  * dBeta);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, iStateStar, dPost * dBeta);
      ++iC2; dBeta *= 1+ dIncrease;
    }
}

// Zinsrente
void           ANNMOD::vAddAnnuity0(long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn , double dIncrease)
{
  double dTemp; 
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  double dPost= (lNTimes - 1) /( 2. * lNTimes);
  int iC1, iC2 =0;
  double dV = 1./(1.+dITechn);
  double dBeta;
     
  int iStateStar= ZINSRENTE;
     
   
  dPre  *= dLeist;
  dPost *= dLeist;
  iC2=0;
  
  dBeta = 1;
  for(iC1 = lX; iC1 < lS; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre (iC2, iStateStar, iStateStar, dPre * dBeta);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, iStateStar, dPost * dBeta);
      ++iC2; dBeta *= 1+ dIncrease;
    }
}

// Zweilebig joint life
void           ANNMOD::vAddAnnuity2xy(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease)
{
  double dTemp; 
  double dPre = (lNTimes + 1) /( 2. * lNTimes);
  double dPost= (lNTimes - 1) /( 2. * lNTimes);
  long   lDeltaXY;
  int iC1, iC2 =0;
  double dBeta;
     
  int iStateStar= lX;
  
  if (lX <0 || lX > MAXAGE) { return;}
  
  if (lSex1 == WOMAN && lSex2 == WOMAN)
    {
      iStateStar+= TWOLIFE__XX;
    }

  if (lSex1 == WOMAN && lSex2 == MAN)
    {
      long lTemp = lX;
      lS += lY - lX;
      lX = lY;
      lY = lTemp;
      lSex1 = MAN; 
      lSex2 = WOMAN;
    }

  if (lSex1 == MAN && lSex2 == WOMAN)
    {
      iStateStar+= TWOLIFE__XY;
    }

  if (lSex1 == MAN && lSex2 == MAN)
    {
      iStateStar += TWOLIFE__YY;
    }

  // DELTAXY-10        0l    ]-infty , -7]
  // DELTAXY-3       300l    ]-7     , 0]
  // DELTAXY+3       600l    ]0      , 5]
  // DELTAXY+8       900l    ]5      , 10]
  // DELTAXY+13XY   1200l    ]10     , infty]

  lDeltaXY = lX - lY;
  // NOP if( lDeltaXY > -2000 && lDeltaXY <= -7) 
  if( lDeltaXY > -7 && lDeltaXY <=  0) iStateStar += DELTAXYM3;
  if( lDeltaXY >  0 && lDeltaXY <=  5) iStateStar += DELTAXYP3;
  if( lDeltaXY >  5 && lDeltaXY <= 10) iStateStar += DELTAXYP8;
  if( lDeltaXY > 10                  ) iStateStar += DELTAXYP13;


  dPre  *= dLeist;
  dPost *= dLeist;
  iC2=0;
     
  for(iC1 = lX; iC1 < lS; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre(iC2, iStateStar, iStateStar, -dPraem);
      ++iC2;
    }

  dBeta = 1.;
  for(iC1 = lS; iC1 < STARTTIME; ++ iC1)
    {
      dTemp = MARKOVLV::dSetPre (iC2, iStateStar, iStateStar, dPre * dBeta);
      dTemp = MARKOVLV::dSetPost(iC2, iStateStar, iStateStar, dPost * dBeta);
      ++iC2; dBeta *= 1+ dIncrease;
    }
}

// Zweilebig last life
void           ANNMOD::vAddAnnuity2xyBar(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn , double dIncrease)
{
  vAddAnnuity1(lSex1, lX, lS, lNTimes, dLeist, dPraem, dITechn, dIncrease);
  vAddAnnuity1(lSex2, lY, lS -lX + lY, lNTimes, dLeist, dPraem, dITechn, dIncrease);
  vAddAnnuity2xy(lSex1, lSex2, lX, lY, lS, lNTimes, -dLeist, -dPraem, dITechn, dIncrease);
}

// Zweilebig y widdow annuity
void           ANNMOD::vAddAnnuity2xToy(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease) 
{
  vAddAnnuity1(lSex2, lY, lS -lX + lY, lNTimes, dLeist, dPraem, dITechn, dIncrease);
  vAddAnnuity2xy(lSex1, lSex2, lX, lY, lS, lNTimes, -dLeist, -dPraem, dITechn, dIncrease);  
}

// Zweilebig y widdow annuity
void           ANNMOD::vAddAnnuity2yTox(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease) 
{
  vAddAnnuity1(lSex1, lX, lS, lNTimes, dLeist, dPraem, dITechn, dIncrease);
  vAddAnnuity2xy(lSex1, lSex2, lX, lY, lS, lNTimes, -dLeist, -dPraem, dITechn, dIncrease); 
}

void           ANNMOD::vUpdateOperator()
{
  double dQxLoc, dQyLoc;
  int iStartalter,  iC1, iC2, iC3, iYAge;
  double dTemp;
  int iShift[] ={ DELTAXYM10, DELTAXYM3, DELTAXYP3, DELTAXYP8, DELTAXYP13, 9999};
  int iDXY[]   ={ -10, -3, 3, 8, 13, 0};


  // DELTAXY-10        0l    ]-infty , -7]
  // DELTAXY-3       300l    ]-7     , 0]
  // DELTAXY+3       600l    ]0      , 5]
  // DELTAXY+8       900l    ]5      , 10]
  // DELTAXY+13XY   1200l    ]10     , infty]
  // TWOLIFE__XX     200l
  // TWOLIFE__XY     300l
  // TWOLIFE__YY     400l

  
  // 1. Belegen der Wahrscheinlichkeiten
  // --------------------------------------
  // Kapital Mann
  printf("\n Update Op");
  // Rente Mann
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, RTAF, MAN, iStartalter + iC1 , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + iStartalter , MAN + iStartalter, (1. - dQxLoc));
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + iStartalter , ANNDEATH,  dQxLoc);
	  for (iC3=0; iShift[iC3] < 100; ++iC3)
	    {
	      iYAge =  iStartalter + iC1 + iDXY[iC3];
	      if(iYAge < 0) iYAge = 0;
	      // now m -> m
	      dQyLoc = dGetQx(SECONDORDER, RTAF, MAN, iYAge , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	      dTemp = MARKOVLV::dSetPij(iC1, TWOLIFE__XX + iStartalter + iShift[iC3] , TWOLIFE__XX + iStartalter + iShift[iC3], (1. - dQxLoc)*(1. - dQyLoc));
	      dTemp = MARKOVLV::dSetPij(iC1, TWOLIFE__XX + iStartalter + iShift[iC3] , ANNDEATH,  1. - (1. - dQxLoc)*(1. - dQyLoc));
	      // now m -> f
	      dQyLoc = dGetQx(SECONDORDER, RTAF, 1 /*woman*/, iYAge , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	      dTemp = MARKOVLV::dSetPij(iC1, TWOLIFE__XY + iStartalter + iShift[iC3] , TWOLIFE__XY + iStartalter + iShift[iC3], (1. - dQxLoc)*(1. - dQyLoc));
	      dTemp = MARKOVLV::dSetPij(iC1, TWOLIFE__XY + iStartalter + iShift[iC3] , ANNDEATH,  1. - (1. - dQxLoc)*(1. - dQyLoc));
	    }
	}
   
    }
  // Rente Frau
  for(iStartalter = 0; iStartalter <= MAXAGE; ++ iStartalter)
    {
      for(iC1=0; iC1<STARTTIME; ++iC1)
	{
	  dQxLoc = dGetQx(SECONDORDER, RTAF, 1 /*woman*/, iStartalter + iC1 , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + iStartalter , MAN + iStartalter, (1. - dQxLoc));
	  dTemp = MARKOVLV::dSetPij(iC1, MAN + iStartalter , ANNDEATH,  dQxLoc);
	  for (iC3=0; iShift[iC3] < 100; ++iC3)
	    {
	      iYAge =  iStartalter + iC1 + iDXY[iC3];
	      if(iYAge < 0) iYAge = 0;
	      // now f -> f
	      dQyLoc = dGetQx(SECONDORDER, RTAF, 1 /*woman*/, iYAge , iC1 + lActualYear)* psymRelQxTime->dGetValue(iC1);
	      dTemp = MARKOVLV::dSetPij(iC1, TWOLIFE__YY + iStartalter + iShift[iC3] , TWOLIFE__YY + iStartalter + iShift[iC3], (1. - dQxLoc)*(1. - dQyLoc));
	      dTemp = MARKOVLV::dSetPij(iC1, TWOLIFE__YY + iStartalter + iShift[iC3] , ANNDEATH,  1. - (1. - dQxLoc)*(1. - dQyLoc));
	    }
	}
    }
  // 2. Belegen der Zinsen
  // --------------------------------------
  for(iC1=0; iC1<STARTTIME; ++iC1)
    {
      double dLocDisc;
      dLocDisc = psymDisc->dGetValue(iC1);
      //    printf("\ t=%d disc = %10.8f ", iC1, dLocDisc);
      for(iC2=0; iC2 < ANNNRSTATES; ++ iC2) dTemp = MARKOVLV::dSetDisc(iC1, iC2, iC2, dLocDisc);
    }
  lValid = false;
}

double         ANNMOD::dGetStatDK(void)
{
  return(dStatDK);
}

double         ANNMOD::dGetFVDK(void)
{
  return(dFVDK);
}


double	     ANNMOD::dGetDK(long lTime)
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
  
  for(iC1= 0; iC1 < ANNNRSTATES; ++ iC1) dTemp += MARKOVLV::dGetDK(lTime,iC1,1l);
  return(dTemp);
}

double         ANNMOD::dGetCF(long lTime)
{
  double dTemp;
  int iC1;
  if(!lValid) dTemp = dGetDK(0);
  dTemp = 0.;
  for(iC1= 0; iC1 < ANNNRSTATES; ++ iC1) dTemp += MARKOVLV::dGetCF(lTime, iC1, iC1) + MARKOVLV::dGetCF(lTime, iC1, ANNDEATH); 
  return(dTemp);
}

double         ANNMOD::dGetStatDK(long lType)  // lType: 0=Stat 1=FV ohne sx
{
  if(lType == 0)      return(dStatDK);
  if(lType == 1)      return(dFVDK);
  
  return(0.);
}
  
double  ANNMOD::dSetRelativeQxForTime(long lTime, double dValue)
{
  lValid = false;
  //printf("\n Add Qx Time %5d %10lf",lTime, psymRelQxTime->dSetValue(lTime, dValue));
  return(psymRelQxTime->dSetValue(lTime, dValue));
}

double ANNMOD::dGetQx(long lOrder, long lTafel, long lSex, long lTime, long lYear)
{
  long lDeltaT = lYear - lBaseYear[lOrder][lTafel][lSex];
  double dQxKorr = 1.;
  double dFxKorr = 1.;
  double dTemp;
  //if (lDeltaT > lMaxProj) lDeltaT = lMaxProj;
  //if (iQxStress == 1) dQxKorr = 1 + dQxStress;
  //if (iFxStress == 1) dFxKorr = 1 + dFxStress;
  dTemp = dQxKorr * psymQx[lOrder][lTafel][lSex]->dGetValue(lTime) * exp(dFxKorr * psymFx[lOrder][lTafel][lSex]->dGetValue(lTime) * (lDeltaT));
  if(dTemp <0) dTemp =0.;
  if(dTemp >1) dTemp =1.;
  return(dTemp);
}
