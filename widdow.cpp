///////////////////////////////////////////////////////////////////
//                                                                //
// CAPITAL LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////
#include "widdow.h"
#ifdef FOR_OLE
#pragma message ("In order to avoid double references to omarkov.cpp we include only header")
#include "omarkov.h"
#else
#include "omarkov.cpp"
#endif

WIDDOWLV::WIDDOWLV():MARKOVLV(250l,2l,1l)
{
  int iC1;
  double dTemp;
  //  MARKOVLV::MARKOVLV(250l,2l,1l);
  vSetNrStates(2l);
  lSAge  =0l;
  dPre   =1;
  lMaxProj = 10000l;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymHx = new LV_VECTOR(250, 0, 0);
  psymYx= new LV_VECTOR(250, 0, 0);
  psymBenefit  = new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = 250;
  psymAnnuity = new ANNUITYLV(250, dPre);
  psymAnnuity->vSetStartTime(130);
  psymAnnuity->vSetSAge(0);
  psymAnnuity->vSetG(0);
  MARKOVLV::vSetStartTime(130); // default start time 130 as widdow pensions usually do not end at a certain time
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }  
}

WIDDOWLV::WIDDOWLV(long lMaxTimesIpt):MARKOVLV(250l,2l,1l)
{
  int iC1;
  double dTemp;
  //  MARKOVLV::MARKOVLV(250l,2l,1l);
  vSetNrStates(2l);
  lSAge  =0l;
  dPre   =1;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymHx = new LV_VECTOR(250, 0, 0);
  psymYx= new LV_VECTOR(250, 0, 0);
  psymBenefit  = new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = lMaxTimesIpt;
  psymAnnuity = new ANNUITYLV(250, dPre);
  psymAnnuity->vSetStartTime(130);
  psymAnnuity->vSetSAge(0);
  psymAnnuity->vSetG(0);
  MARKOVLV::vSetStartTime(130); // default start time 130 as widdow pensions usually do not end at a certain time
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }  
} 

WIDDOWLV::~WIDDOWLV()
{
  delete(psymQx);
  delete(psymFx);
  delete(psymDisc);
  delete(psymHx);
  delete(psymYx);
  delete(psymAnnuity);
  delete(psymBenefit);
}

void WIDDOWLV::vSetStartTime(long lTime)
{
  lValid = false;
  MARKOVLV::vSetStartTime(lTime);
}

void WIDDOWLV::vSetStopTime(long lTime)
{
  lValid = false;
  MARKOVLV::vSetStopTime(lTime);
}

double WIDDOWLV::dSetQx(long lTime, double dValue)
{
  lValid = false;
  return(psymQx->dSetValue(lTime, dValue));
}

double WIDDOWLV::dSetQy(long lTime, double dValue)
{
  lValid = false;
  return(psymAnnuity->dSetQx(lTime, dValue));
}

double WIDDOWLV::dSetFx(long lTime, double dValue)
{
  lValid = false;
  return(psymFx->dSetValue(lTime, dValue));
}

double WIDDOWLV::dSetFy(long lTime, double dValue)
{
  lValid = false;
  return(psymAnnuity->dSetFx(lTime, dValue));
}

double WIDDOWLV::dSetBaseYear(long lTime)
{
  double dTemp;
  lValid = false;
  lBaseYear = lTime;
  dTemp=psymAnnuity->dSetBaseYear(lTime);
  return((double) lTime);
}

double WIDDOWLV::dSetActualYear(long lTime)
{
  lValid = false;
  lActualYear = lTime;
  return((double) lTime);
}

double WIDDOWLV::dSetDisc(long lTime, double dValue)
{
  double dTemp;
  lValid = false;
  if(lTime < 0)
    { 
      int iC;
      for(iC=0; iC < 2500; ++ iC)
	{
	  dTemp = psymDisc->dSetValue(iC, dValue);
	  dTemp = psymAnnuity->dSetDisc(iC, dValue);
	}
      return(dTemp);
    }
  else
    {
      dTemp = psymAnnuity->dSetDisc(lTime, dValue);
      return(psymDisc->dSetValue(lTime, dValue));
    }
}

double WIDDOWLV::dGetDK(long lTime)
{
  int iC1, iC2= MARKOVLV::lGetStopTime(),iC3;
  double dQxLoc, dTemp, dLocDisc;
  if (lValid == true) return(MARKOVLV::dGetDK(lTime,0l,1l));
  // Set Different Markov Elements before Calc
  lValid = true;
  lSAge = MARKOVLV::lGetStartTime();
  MARKOVLV::vReset();
  // 1. Set Probabilities
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dQxLoc = dGetQx(iC1 , iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dTemp = MARKOVLV::dSetPij(iC1, 0, 0, 1. - dQxLoc);
      dTemp = MARKOVLV::dSetPij(iC1, 0, 1, dQxLoc*psymHx->dGetValue(iC1));
    }
  // 2. Set LV 
  for(iC1=iC2; iC1<lSAge; ++iC1)
    {
      long lYx = (long)(0.5+psymYx->dGetValue(iC1));
      psymAnnuity->vSetStopTime(lYx);
      psymAnnuity->dSetActualYear(iC1 - iC2 + lActualYear);
      psymAnnuity->vLeistReset();
      for(iC3=iC1; iC3 < 130; ++iC3)
	{
	  psymAnnuity->vSetLeistLinear(iC3, iC3, psymBenefit->dGetValue(iC3), 0);
	}
      dTemp = MARKOVLV::dSetPost(iC1, 0, 1, psymAnnuity->dGetDK(lYx));
    }
  // 3. Set Discount
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dLocDisc = psymDisc->dGetValue(iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dTemp = MARKOVLV::dSetDisc(iC1, 0, 0, dLocDisc);
      dTemp = MARKOVLV::dSetDisc(iC1, 1, 1, dLocDisc);
    }
  // 4. Calc DK
  return(MARKOVLV::dGetDK(lTime,0l,1l));
}

double WIDDOWLV::dGetCF(long lTime)
{
  double dTemp;
  if (lValid == false) dTemp = WIDDOWLV::dGetDK(lTime);
  return(MARKOVLV::dGetCF(lTime, 0, 0) + MARKOVLV::dGetCF(lTime, 0, 1) );
}

double WIDDOWLV::dGetQx(long lTime, long lYear)
{
  long lDeltaT = lYear - lBaseYear;
  if (lDeltaT > lMaxProj) lDeltaT = lMaxProj;
  return(psymQx->dGetValue(lTime) * exp(psymFx->dGetValue(lTime) * (lDeltaT)));
}

double WIDDOWLV::dSetHx(long lTime, double dValue)
{
  lValid = false;
  return(psymHx->dSetValue(lTime, dValue));
}

double WIDDOWLV::dSetYx(long lTime, double dValue)
{
  lValid = false;
  return(psymYx->dSetValue(lTime, dValue));
}

double WIDDOWLV::dSetPre(double dValue)
{ 
  double dTemp;
  lValid = false;
  dTemp = psymAnnuity->dSetPre(dValue);
  return(dPre = dValue);
}

void         WIDDOWLV::vLeistReset()
{
  double dTemp;
  long iC1;
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }  
}

void         WIDDOWLV::vSetLeistLinear(long lTimeFrom, long lTimeTo, double dStartValue, double dIncrement)
{
  double dTemp = dStartValue, dTemp2;
  long iC1;
  for (iC1 = lTimeFrom; iC1 <= lTimeTo; ++iC1) 
    {
      dTemp2 = psymBenefit->dSetValue(iC1, dTemp);
      dTemp += dIncrement;
    }  
}
void         WIDDOWLV::vSetLeistExp(long lTimeFrom, long lTimeTo, double dStartValue, double dFactor)
{
  double dTemp = dStartValue, dTemp2;
  long iC1;
  for (iC1 = lTimeFrom; iC1 <= lTimeTo; ++iC1) 
    {
      dTemp2 = psymBenefit->dSetValue(iC1, dTemp);
      dTemp *= dFactor;
    }  
} 











