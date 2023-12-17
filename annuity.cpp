///////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#include "annuity.h"
#ifdef FOR_OLE
#pragma message ("In order to avoid double references to omarkov.cpp we include only header")
#include "omarkov.h"
#else
#include "omarkov.cpp"
#endif

ANNUITYLV::ANNUITYLV():MARKOVLV(250l,3l,1l)
{
  int iC1;
  double dTemp;
  //  MARKOVLV::MARKOVLV(250l,3l,1l);
  vSetNrStates(3l);
  lGTime =0l;
  lSAge  =0l;
  lMaxProj = 10000l;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymSx = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymRelQxTime = new LV_VECTOR(250, 0, 0);
  psymBenefit  = new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = 250;
  this->dPre = 1.;
  dPost = 1. - dPre;
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymRelQxTime->dSetValue(iC1, 1.);
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }  
}

ANNUITYLV::ANNUITYLV(long lMaxTimesIpt, double dPre):MARKOVLV(250l,3l,1l)
{
  int iC1;
  double dTemp;
  //  MARKOVLV::MARKOVLV(250l,3l,1l);
  vSetNrStates(3l);
  lGTime =0l;
  lSAge  =0l;
  lMaxProj = 10000l;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymSx = new LV_VECTOR(250, 0, 0);
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
      dTemp = psymRelQxTime->dSetValue(iC1, 1.);
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }
} 

ANNUITYLV::~ANNUITYLV()
{
  delete(psymQx);
  delete(psymFx);
  delete(psymSx);
  delete(psymDisc);
  delete(psymRelQxTime);
  delete(psymBenefit);
}

int  ANNUITYLV::iSetTable(char * pcId)
{
  int iC1,iC2;
  int iX0;
  int iXOmega;
  double dTech;
  lValid = false;
  psymQx->vReset();
  if (!this->psymTable1)
    this->psymTable1 = new TABLESERVER();
  this->psymTable1->vSetTable(pcId);
  iC2= this->psymTable1->iTableNumber();
  if (iC2<0)
    return(iC2);
  iX0 = this->psymTable1->iX0();
  iXOmega = this->psymTable1->iXOmega();
  vSetStartTime(iXOmega+1);
  dTech = this->psymTable1->dITech();
  for(iC1=0; iC1<2500; ++iC1)
    {
      dSetDisc(iC1, 1./(1.000000000001+ dTech));
    }
  for(iC1=0; iC1 <= iXOmega; ++iC1)
    {
      dSetQx(iC1, this->psymTable1->dGetValue(iC1));
    }
  return(iC2);
}

void ANNUITYLV::vSetStartTime(long lTime)
{
  MARKOVLV::vSetStartTime(lTime);
}

void ANNUITYLV::vSetStopTime(long lTime)
{
  MARKOVLV::vSetStopTime(lTime);
}

void ANNUITYLV::vSetSAge(long lTime)
{
  lValid = false;
  lSAge  =lTime;
}

void ANNUITYLV::vSetG(long lTime)
{
  lValid = false;
  lGTime = lTime;
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

double ANNUITYLV::dSetSx(long lTime, double dValue)
{
  lValid = false;
  return(psymSx->dSetValue(lTime, dValue));
}

double ANNUITYLV::dSetBaseYear(long lTime)
{
  lValid = false;
  lBaseYear = lTime;
  return((double) lTime);
}

void ANNUITYLV::vSetMaxProj(long lMaxYearImp)
{
  lValid = false;
  lMaxProj= lMaxYearImp;

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
  int iC1, iC2= MARKOVLV::lGetStopTime();
  double dQxLoc, dTemp, dLocDisc, dLeist;
  if (lValid == true) return(MARKOVLV::dGetDK(lTime,0l,1l));
  // Set Different Markov Elements before Calc
  lValid = true;
  MARKOVLV::vReset();
  // 1. Set Probabilities
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dTemp = psymRelQxTime->dGetValue(iC1 - MARKOVLV::lGetStopTime());
      if(iC1 - MARKOVLV::lGetStopTime() < 0) dTemp  = 1; 
      dQxLoc = dTemp  * dGetQx(iC1 , iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      if(dQxLoc < 0) dQxLoc = 0.;
      if(dQxLoc > 1) dQxLoc = 1.;
      dTemp = MARKOVLV::dSetPij(iC1, 0, 0, 1. - dQxLoc);
      dTemp = MARKOVLV::dSetPij(iC1, 1, 1, 1.);
      if(iC1 < lSAge ||  iC1 >= lSAge + lGTime)
	dTemp = MARKOVLV::dSetPij(iC1, 0, 2, dQxLoc); // 2 Zustand ohne Garantie
      else
	dTemp = MARKOVLV::dSetPij(iC1, 0, 1, dQxLoc); // Zustand 1 mit Garantie
    }
  // 2. Set LV 
  for(iC1=lSAge; iC1<lMaxTime; ++iC1)
    { 
      dLeist = psymBenefit->dGetValue(iC1);
      dTemp = MARKOVLV::dSetPre(iC1, 0, 0, dLeist * dPre);
      dTemp = MARKOVLV::dSetPost(iC1, 0, 0, dLeist * dPost);
    }
  for(iC1=lSAge; iC1<lSAge + lGTime; ++iC1)
    {
      dLeist = psymBenefit->dGetValue(iC1);
      dTemp = MARKOVLV::dSetPre(iC1, 1, 1, dLeist * dPre);
      dTemp = MARKOVLV::dSetPost(iC1, 1, 1, dLeist * dPost);
      dTemp = MARKOVLV::dSetPost(iC1, 0, 1, dLeist * dPost);
    }
  // 3. Set Discount
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dLocDisc = psymDisc->dGetValue(iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dTemp = MARKOVLV::dSetDisc(iC1, 0, 0, dLocDisc);
      dTemp = MARKOVLV::dSetDisc(iC1, 1, 1, dLocDisc);
      dTemp = MARKOVLV::dSetDisc(iC1, 2, 2, dLocDisc);
    }
  // 4. Calc DK
  return(MARKOVLV::dGetDK(lTime,0l,1l));
}

double ANNUITYLV::dGetCF(long lTime)
{
  double dTemp;
  if (lValid == false) dTemp = ANNUITYLV::dGetDK(lTime);
  return(MARKOVLV::dGetCF(lTime, 0, 0) + MARKOVLV::dGetCF(lTime, 0, 1) );
}

double ANNUITYLV::dGetQx(long lTime, long lYear)
{
  long lDeltaT = lYear - lBaseYear;
  if (lDeltaT > lMaxProj) lDeltaT = lMaxProj;
  return(psymQx->dGetValue(lTime) * exp(psymFx->dGetValue(lTime) * (lDeltaT)));
}

double  ANNUITYLV::dGetTpx(long lTime)
{
  double dTemp = 1.;
  int iC;
  for(iC=0;iC<lTime; ++iC)
    {
      //printf("\n tpx time %ld  iC %d  dTemp %10.4f  sx %10.4f  qx %10.4f \n", lTime, iC, dTemp, psymSx->dGetValue(MARKOVLV::lGetStopTime() +iC),   dGetQx(MARKOVLV::lGetStopTime() +iC,  lActualYear + iC)); 
      dTemp *= (1.- psymSx->dGetValue(MARKOVLV::lGetStopTime() +iC)) * (1- dGetQx(MARKOVLV::lGetStopTime() +iC,  lActualYear + iC));
    }
	return(dTemp);
}
double  ANNUITYLV::dGetTqx(long lTime)
{
  return(dGetTpx(lTime) * dGetQx(MARKOVLV::lGetStopTime() +lTime,  lActualYear + lTime)); 
}

double ANNUITYLV::dSetPre(double dValue)
{
  lValid = false;
  this->dPre = dValue;
  dPost = 1. - dPre;
  return(this->dPre);
}

double  ANNUITYLV::dSetRelativeQxForTime(long lTime, double dValue)
{
  lValid = false;
  return(psymRelQxTime->dSetValue(lTime, dValue));
}

void         ANNUITYLV::vLeistReset()
{
  double dTemp;
  long iC1;
  lValid = false;
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }  
}

void         ANNUITYLV::vSetLeistLinear(long lTimeFrom, long lTimeTo, double dStartValue, double dIncrement)
{
  double dTemp = dStartValue, dTemp2;
  long iC1;
  lValid = false;
  for (iC1 = lTimeFrom; iC1 <= lTimeTo; ++iC1) 
    {
      dTemp2 = psymBenefit->dSetValue(iC1, dTemp);
      dTemp += dIncrement;
    }  
}
void         ANNUITYLV::vSetLeistExp(long lTimeFrom, long lTimeTo, double dStartValue, double dFactor)
{
  double dTemp = dStartValue, dTemp2;
  long iC1;
  lValid = false; 
  for (iC1 = lTimeFrom; iC1 <= lTimeTo; ++iC1) 
    {
      dTemp2 = psymBenefit->dSetValue(iC1, dTemp);
      dTemp *= dFactor;
    }  
} 
