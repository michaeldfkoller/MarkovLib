///////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Luisa Koller                                            //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#include "lvvect.cpp"
#include "annuity.h"

ANNUITYLV::ANNUITYLV()
{
  int iC1;
  double dTemp;
  lGTime =0l;
  lSAge  =0l;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymBenefit  = new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = 250;
  this->dPre = 1.;
  dPost = 1. - dPre;
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }  
}

ANNUITYLV::ANNUITYLV(long lMaxTimesIpt, double dPre)
{
  int iC1;
  double dTemp;
  lGTime =0l;
  lSAge  =0l;
  lMaxProj = 10000l;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymRelQxTime = new LV_VECTOR(250, 0, 0);
  psymBenefit  = new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = lMaxTimesIpt;
  this->dPre = dPre;
  dPost = 1. - dPre;
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }
} 

ANNUITYLV::~ANNUITYLV()
{
  delete(psymQx);
  delete(psymFx);
  delete(psymDisc);
  delete(psymRelQxTime);
  delete(psymBenefit);
}

void ANNUITYLV::vSetStartTime(long lTime)
{
  lValid = false;
  lStartTime = lTime;
}

void ANNUITYLV::vSetStopTime(long lTime)
{
  lValid = false;
  lStopTime = lTime;
}

void ANNUITYLV::vSetSAge(long lTime)
{
  lValid = false;
  lSAge  =lTime;
}

double ANNUITYLV::dSetQx(long lTime, double dValue)
{
  lValid = false;
  return(psymQx->dSetValue(lTime, dValue));
}

double ANNUITYLV::dSetFx(long lTime, double dValue)
{
  lValid = false;
  return(psymFx->dSetValue(lTime, dValue));
}

double ANNUITYLV::dSetBaseYear(long lTime)
{
  lValid = false;
  lBaseYear = lTime;
  return((double) lTime);
}

double ANNUITYLV::dSetActualYear(long lTime)
{
  lValid = false;
  lActualYear = lTime;
  return((double) lTime);
}

double ANNUITYLV::dSetDisc(long lTime, double dValue)
{
  lValid = false;
  return(psymDisc->dSetValue(lTime, dValue));

}

double ANNUITYLV::dGetDK(long lTime)
{
  int iC1, iC2 = lStopTime;
  double dQxLoc, dTemp, dLocDisc, dLeist, dDK;
  dDK = 0.;
  for(iC1= lStartTime-1; iC1 >= lTime; --iC1)
    {
      dQxLoc = dGetQx(iC1 , iC1 - lStopTime + lActualYear);
      dLocDisc = psymDisc->dGetValue(iC1 - lStopTime + lActualYear);
      dLeist = psymBenefit->dGetValue(iC1);
      if (iC1 < lSAge) dLeist=0.;
      dDK = dLeist * dPre + (1-dQxLoc) * dLocDisc * ( dDK +  dLeist * dPost);
    }
  return(dDK);
}

double ANNUITYLV::dGetQx(long lTime, long lYear)
{
  long lDeltaT = lYear - lBaseYear;
  if (lDeltaT > lMaxProj) lDeltaT = lMaxProj;
  return(psymQx->dGetValue(lTime) * exp(psymFx->dGetValue(lTime) * (lDeltaT)));
}

double ANNUITYLV::dSetPre(double dValue)
{
  this->dPre = dValue;
  dPost = 1. - dPre;
  return(this->dPre);
}

