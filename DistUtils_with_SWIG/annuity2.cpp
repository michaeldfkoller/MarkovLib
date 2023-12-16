////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme (2 lives)                           //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum  3.2011: erstellt                                        //
//                                                                //
////////////////////////////////////////////////////////////////////
#include "annuity2.h"
#ifdef FOR_OLE
#pragma message ("In order to avoid double references to omarkov.cpp we include only header")
#include "omarkov.h"
#else
#include "omarkov.cpp"
#endif

ANNUITYLV2::ANNUITYLV2():MARKOVLV(250l,4l,1l)
{
  int iC;
  double dTemp;
  //  MARKOVLV::MARKOVLV(250l,4l,1l);
  vSetNrStates(4l);
  lSAge1  =0l;
  lSAge1  =0l;
  psymQx1 = new LV_VECTOR(250, 0, 0);
  psymFx1 = new LV_VECTOR(250, 0, 0);
  psymQx2 = new LV_VECTOR(250, 0, 0);
  psymFx2 = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymBenefit  = new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = 250;
  dPreGen = 1;
  for(iC=0; iC<3; ++ iC)
    {
      this->dPre[iC] = dPreGen;
      dPost[iC] = 1. - dPre[iC];
      dBenefit[iC]  = 1.;
    }
  lYMinusX = 0;
  for (iC = 0; iC < 250; ++iC) 
    {
      dTemp = psymBenefit->dSetValue(iC, 1.);
    }  
}

ANNUITYLV2::ANNUITYLV2(long lMaxTimesIpt, double dPre):MARKOVLV(250l,4l,1l)
{
  int iC;
  double dTemp;
  //  MARKOVLV::MARKOVLV(250l,4l,1l);
  vSetNrStates(4l);
  lSAge1  =0l;
  lSAge1  =0l;
  psymQx1 = new LV_VECTOR(250, 0, 0);
  psymFx1 = new LV_VECTOR(250, 0, 0);
  psymQx2 = new LV_VECTOR(250, 0, 0);
  psymFx2 = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymBenefit  = new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = lMaxTimesIpt;
  dPreGen = dPre;
  for(iC=0; iC<3; ++ iC)
    {
      this->dPre[iC] = dPreGen;
      this->dPost[iC] = 1. - this->dPre[iC];
      dBenefit[iC]  = 1.;
    }
  lYMinusX = 0;
  for (iC = 0; iC < 250; ++iC) 
    {
      dTemp = psymBenefit->dSetValue(iC, 1.);
    }  
} 
ANNUITYLV2::~ANNUITYLV2()
{
  delete(psymQx1);
  delete(psymFx1);
  delete(psymQx2);
  delete(psymFx2);
  delete(psymDisc);
  delete(psymBenefit);
}

int  ANNUITYLV2::iSetTable1(char * pcId)
{
  int iC1,iC2;
  int iX0;
  int iXOmega;
  double dTech;
  lValid = false;
  psymQx1->vReset();
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
      dSetQx1(iC1, this->psymTable1->dGetValue(iC1));
    }
  return(iC2);
}

int  ANNUITYLV2::iSetTable2(char * pcId)
{
  int iC1,iC2;
  int iX0;
  int iXOmega;
  //  double dTech;
  lValid = false;
  psymQx2->vReset();
  if (!this->psymTable2)
    this->psymTable2 = new TABLESERVER();
  this->psymTable2->vSetTable(pcId);
  iC2= this->psymTable2->iTableNumber();
  if (iC2<0)
    return(iC2);
  iX0 = this->psymTable2->iX0();
  iXOmega = this->psymTable2->iXOmega();
  //  vSetStartTime(iXOmega+1);
  //dTech = this->psymTable1->dITech();
  //for(iC1=0; iC1<2500; ++iC1)
  //  {
  //    dSetDisc(iC1, 1./(1.000000000001+ dTech));
  //  }
  for(iC1=0; iC1 <= iXOmega; ++iC1)
    {
      dSetQx2(iC1, this->psymTable2->dGetValue(iC1));
    }
  return(iC2);
}

void ANNUITYLV2::vSetStartTime(long lTime)
{
  MARKOVLV::vSetStartTime(lTime);
}

void ANNUITYLV2::vSetStopTime(long lTime)
{
  MARKOVLV::vSetStopTime(lTime);
}
void ANNUITYLV2::vSetSAge1(long lTime)
{
  lValid = false;
  lSAge1  =lTime;
}
void ANNUITYLV2::vSetSAge2(long lTime)
{
  lValid = false;
  lSAge2  =lTime;
}
double ANNUITYLV2::dSetQx1(long lTime, double dValue)
{
  lValid = false;
  return(psymQx1->dSetValue(lTime, dValue));
}
double ANNUITYLV2::dSetFx1(long lTime, double dValue)
{
  lValid = false;
  return(psymFx1->dSetValue(lTime, dValue));
}
double ANNUITYLV2::dSetQx2(long lTime, double dValue)
{
  lValid = false;
  return(psymQx2->dSetValue(lTime, dValue));
}
double ANNUITYLV2::dSetFx2(long lTime, double dValue)
{
  lValid = false;
  return(psymFx2->dSetValue(lTime, dValue));
}
double ANNUITYLV2::dSetBaseYear(long lTime)
{
  lValid = false;
  lBaseYear = lTime;
  return((double) lTime);
}

double ANNUITYLV2::dSetActualYear(long lTime)
{
  lValid = false;
  lActualYear = lTime;
  return((double) lTime);
}

double ANNUITYLV2::dSetDisc(long lTime, double dValue)
{
  lValid = false;
  return(psymDisc->dSetValue(lTime, dValue));

}
double ANNUITYLV2::dGetDK(long lTime, long lState)
{
  int iC1, iC2= MARKOVLV::lGetStopTime();
  double dQxLoc1, dQxLoc2, dTemp, dLocDisc, dLeist;
  if (lValid == true) return(MARKOVLV::dGetDK(lTime,lState,1l));
  // Set Different Markov Elements before Calc
  lValid = true;
  MARKOVLV::vReset();
  // 1. Set Probabilities
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dQxLoc1 = dGetQx1(iC1 , iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dQxLoc2 = dGetQx2(iC1 , iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dTemp = MARKOVLV::dSetPij(iC1, 0, 0, (1. - dQxLoc1)*(1. - dQxLoc2));
      dTemp = MARKOVLV::dSetPij(iC1, 0, 1, (1. - dQxLoc1)* dQxLoc2);
      dTemp = MARKOVLV::dSetPij(iC1, 0, 2, dQxLoc1 * (1. - dQxLoc2));
      dTemp = MARKOVLV::dSetPij(iC1, 0, 3, dQxLoc1 * dQxLoc2 );
      dTemp = MARKOVLV::dSetPij(iC1, 1, 1, (1. - dQxLoc1));
      dTemp = MARKOVLV::dSetPij(iC1, 1, 3,  dQxLoc1);
      dTemp = MARKOVLV::dSetPij(iC1, 2, 2, (1. - dQxLoc2));
      dTemp = MARKOVLV::dSetPij(iC1, 2, 3, dQxLoc2);
    }
  // 2. Set LV 
  for(iC1=lSAge1; iC1<lMaxTime; ++iC1)
    { 
      dLeist = psymBenefit->dGetValue(iC1);
      dTemp = MARKOVLV::dSetPre(iC1, 0, 0, dLeist * dPre[0]);
      dTemp = MARKOVLV::dSetPost(iC1, 0, 0, dLeist * dPost[0]);
      dTemp = MARKOVLV::dSetPre(iC1, 1, 1, dLeist * dPre[1]);
      dTemp = MARKOVLV::dSetPost(iC1, 1, 1, dLeist * dPost[1]);
      dTemp = MARKOVLV::dSetPost(iC1, 0, 1, dLeist * dPost[1]);
    }
  for(iC1=lSAge2; iC1<lMaxTime; ++iC1)
    {
      dLeist = psymBenefit->dGetValue(iC1);
      dTemp = MARKOVLV::dSetPre(iC1, 2, 2, dLeist * dPre[2]);
      dTemp = MARKOVLV::dSetPost(iC1, 2, 2, dLeist * dPost[2]);
      dTemp = MARKOVLV::dSetPost(iC1, 0, 2, dLeist * dPost[2]);
    }
  // 3. Set Discount
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dLocDisc = psymDisc->dGetValue(iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dTemp = MARKOVLV::dSetDisc(iC1, 0, 0, dLocDisc);
      dTemp = MARKOVLV::dSetDisc(iC1, 1, 1, dLocDisc);
      dTemp = MARKOVLV::dSetDisc(iC1, 2, 2, dLocDisc);
      dTemp = MARKOVLV::dSetDisc(iC1, 3, 3, dLocDisc);
    }
  // 4. Calc DK
  return(MARKOVLV::dGetDK(lTime,lState,1l));
}

double ANNUITYLV2::dGetCF(long lTime)
{
  double dTemp;
  if (lValid == false) dTemp = ANNUITYLV2::dGetDK(lTime, 0);
  return(MARKOVLV::dGetCF(lTime, 0, 0) + MARKOVLV::dGetCF(lTime, 0, 1) + MARKOVLV::dGetCF(lTime, 0, 3) + MARKOVLV::dGetCF(lTime, 0, 4)  );
}

double ANNUITYLV2::dGetQx1(long lTime, long lYear)
{
  return(psymQx1->dGetValue(lTime) * exp(psymFx1->dGetValue(lTime) * (lYear - lBaseYear)));
}
double ANNUITYLV2::dGetQx2(long lTime, long lYear)
{
  lTime += lYMinusX;  // Everything is calculated based on the age of the first life !!
  return(psymQx2->dGetValue(lTime) * exp(psymFx2->dGetValue(lTime) * (lYear - lBaseYear)));
}

double  ANNUITYLV2::dSetY_Minus_X(long lYAge, long lXAge)
{
  lValid = false;
  lYMinusX = lYAge - lXAge;
  return(lYMinusX);
}
double  ANNUITYLV2::dSetBenefit(long lState, double dValue)
{
  lValid = false;
  if(lState >= 0 && lState <= 2)
    {
      dBenefit[lState]  = dValue;
      this->dPre[lState] = dPreGen * dValue;
      dPost[lState] = dValue - dPre[lState];
      return(dValue);
    }
  else
    return(0.);
}

double ANNUITYLV2::dSetPre(double dValue)
{
int iC;
double dTemp; 
dPreGen = dValue;
for(iC=0; iC<3 ; ++iC)
  {
  dTemp = this->dPre[iC] + this->dPost[iC];
  this->dPre[iC] = dPreGen * dValue;
  dPost[iC] = dValue - dPre[iC];
  }
return(this->dPreGen);
}

void         ANNUITYLV2::vLeistReset()
{
  double dTemp;
  long iC1;
  for (iC1 = 0; iC1 < 250; ++iC1) 
    {
      dTemp = psymBenefit->dSetValue(iC1, 1.);
    }  
}

void         ANNUITYLV2::vSetLeistLinear(long lTimeFrom, long lTimeTo, double dStartValue, double dIncrement)
{
  double dTemp = dStartValue, dTemp2;
  long iC1;
  for (iC1 = lTimeFrom; iC1 <= lTimeTo; ++iC1) 
    {
      dTemp2 = psymBenefit->dSetValue(iC1, dTemp);
      dTemp += dIncrement;
    }  
}
void         ANNUITYLV2::vSetLeistExp(long lTimeFrom, long lTimeTo, double dStartValue, double dFactor)
{
  double dTemp = dStartValue, dTemp2;
  long iC1;
  for (iC1 = lTimeFrom; iC1 <= lTimeTo; ++iC1) 
    {
      dTemp2 = psymBenefit->dSetValue(iC1, dTemp);
      dTemp *= dFactor;
    }  
} 
