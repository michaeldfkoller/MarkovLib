///////////////////////////////////////////////////////////////////
//                                                                //
// CAPITAL LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////
#include "capital.h"
#ifdef FOR_OLE
#pragma message ("In order to avoid double references to omarkov.cpp we include only header")
#include "omarkov.h"
#else
#include "omarkov.cpp"
#endif

CAPITALLV::CAPITALLV():MARKOVLV(250l,2l,1l)
{
  //  MARKOVLV::MARKOVLV(250l,2l,1l);
  vSetNrStates(2l);
  lSAge  =0l;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymDeathBenefit= new LV_VECTOR(250, 0, 0);
  psymSurvivalBenefit= new LV_VECTOR(250, 0, 0);
  psymPremium= new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = 250;
  // For EV
  psymQx2Level             = new LV_VECTOR(250, 0, 0);
  psymSx2                  = new LV_VECTOR(250, 0, 0);
  psymRDR                  = new LV_VECTOR(250, 0, 0);
  psymSurenderPenaltyInMR  = new LV_VECTOR(250, 0, 0);
  psymSHMarginInMR         = new LV_VECTOR(250, 0, 0);
  psymSolaCapitalInMR      = new LV_VECTOR(250, 0, 0);
  psymInvReturn            = new LV_VECTOR(250, 0, 0);
  psymEV                   = new MARKOVLV(250, 3, 1); // Overrides Defaults;
}

CAPITALLV::CAPITALLV(long lMaxTimesIpt):MARKOVLV(250l,2l,1l)
{
  //  MARKOVLV::MARKOVLV(250l,3l,1l);
  vSetNrStates(3l);
  lSAge  =0l;
  psymQx = new LV_VECTOR(250, 0, 0);
  psymFx = new LV_VECTOR(250, 0, 0);
  psymDisc = new LV_VECTOR(2500, 0, 0);
  psymDeathBenefit= new LV_VECTOR(250, 0, 0);
  psymSurvivalBenefit= new LV_VECTOR(250, 0, 0);
  psymPremium= new LV_VECTOR(250, 0, 0);
  lBaseYear = 2000l;
  lActualYear = 2000l;
  lValid = false;
  lMaxTime = lMaxTimesIpt;
  // For EV
  psymQx2Level             = new LV_VECTOR(250, 0, 0);
  psymSx2                  = new LV_VECTOR(250, 0, 0);
  psymRDR                  = new LV_VECTOR(250, 0, 0);
  psymSurenderPenaltyInMR  = new LV_VECTOR(250, 0, 0);
  psymSHMarginInMR         = new LV_VECTOR(250, 0, 0);
  psymSolaCapitalInMR      = new LV_VECTOR(250, 0, 0);
  psymInvReturn            = new LV_VECTOR(250, 0, 0);
  psymEV                   = new MARKOVLV(250, 3, 1); // Overrides Defaults;
} 
CAPITALLV::~CAPITALLV()
{
  delete(psymQx);
  delete(psymFx);
  delete(psymDisc);
  delete(psymDeathBenefit);
  delete(psymSurvivalBenefit);
  delete(psymPremium);
  // For EV
  delete(psymQx2Level);
  delete(psymSx2);
  delete(psymRDR);
  delete(psymSurenderPenaltyInMR);
  delete(psymSHMarginInMR);
  delete(psymSolaCapitalInMR);
  delete(psymInvReturn);
  delete(psymEV);
}

int  CAPITALLV::iSetTable(char * pcId)
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

void CAPITALLV::vSetStartTime(long lTime)
{
  lValid = false;

  MARKOVLV::vSetStartTime(lTime);
  psymEV->vSetStartTime(lTime);
}

void CAPITALLV::vSetStopTime(long lTime)
{
  lValid = false;

  MARKOVLV::vSetStopTime(lTime);
  psymEV->vSetStopTime(lTime);
}

void CAPITALLV::vSetSurvival(long lTime, double dValue)
{
  int iC;
  lValid = false;
  for(iC=0; iC < 250;++iC)
    psymSurvivalBenefit->dSetValue(iC, 0.);
  if(lTime >= 1)
    psymSurvivalBenefit->dSetValue(lTime-1, dValue);
}
void CAPITALLV::vSetDeath(double dValue)
{
  int iC;
  lValid = false;
  for(iC=0; iC < 250;++iC)
    psymDeathBenefit->dSetValue(iC, dValue);
}

void  CAPITALLV::vSetPremium(double dValue)
{
  int iC;
  lValid = false;
  for(iC=0; iC < 250;++iC)
    psymPremium->dSetValue(iC, -dValue);
}

void CAPITALLV::vSetSurvivalGen(long lTime, double dValue)
{
  lValid = false;
  // Unterschied zu oben - es werden nicht alle anderen auf
  // Null gesetzt
  if(lTime >= 1)
    psymSurvivalBenefit->dSetValue(lTime-1, dValue);
}
void CAPITALLV::vSetDeathGen(long lTime, double dValue)
{
  lValid = false;
  // Unterschied zu oben nur ein Wert wird veraendert
    psymDeathBenefit->dSetValue(lTime, dValue);
}

void  CAPITALLV::vSetPremiumGen(long lTime, double dValue)
{
  lValid = false;
  // Unterschied zu oben nur ein Wert wird veraendert
    psymPremium->dSetValue(lTime, -dValue);
}

double CAPITALLV::dSetQx(long lTime, double dValue)
{
  lValid = false;
  return(psymQx->dSetValue(lTime, dValue));
}
double CAPITALLV::dSetFx(long lTime, double dValue)
{
  lValid = false;
  return(psymFx->dSetValue(lTime, dValue));
}
double CAPITALLV::dSetBaseYear(long lTime)
{
  lValid = false;
  lBaseYear = lTime;
  return((double) lTime);
}

double CAPITALLV::dSetActualYear(long lTime)
{
  lValid = false;
  lActualYear = lTime;
  return((double) lTime);
}

double CAPITALLV::dSetDisc(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 2500; ++ iC)
	dTemp = psymDisc->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymDisc->dSetValue(lTime, dValue));

}
double CAPITALLV::dGetDK(long lTime)
{
  int iC1, iC2= MARKOVLV::lGetStopTime();
  double dQxLoc, dSxLoc, dTemp, dLocDisc, dDKLocBoY,dDKLocEoY, dSHPartMR, dLocDisc2, dCostOfCapital;
  if (lValid == true) return(MARKOVLV::dGetDK(lTime,0l,1l));
  // Set Different Markov Elements before Calc
  lValid = true;
  lSAge = MARKOVLV::lGetStartTime();
  MARKOVLV::vReset();
  psymEV->vReset();
  psymEV->vSetNrStates(3);
  // A) For Mathematical Reserve
  // 1. Set Probabilities
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dQxLoc = dGetQx(iC1 , iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dTemp = MARKOVLV::dSetPij(iC1, 0, 0, 1. - dQxLoc);
      dTemp = MARKOVLV::dSetPij(iC1, 0, 1, dQxLoc);
    }
  // 2. Set LV 
  for(iC1=0; iC1<lSAge; ++iC1)
    {
      dTemp = MARKOVLV::dSetPre (iC1, 0, 0, psymPremium->dGetValue(iC1));
      dTemp = MARKOVLV::dSetPost(iC1, 0, 0, psymSurvivalBenefit->dGetValue(iC1));
      dTemp = MARKOVLV::dSetPost(iC1, 0, 1, psymDeathBenefit->dGetValue(iC1));
    }
  // 3. Set Discount
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dLocDisc = psymDisc->dGetValue(iC1 - MARKOVLV::lGetStopTime() + lActualYear);
      dTemp = MARKOVLV::dSetDisc(iC1, 0, 0, dLocDisc);
      dTemp = MARKOVLV::dSetDisc(iC1, 1, 1, dLocDisc);
    }
  // B) For Embedded Value
  // 1. Set Probabilities
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dQxLoc = dGetQx(iC1 , iC1 - MARKOVLV::lGetStopTime() + lActualYear)*psymQx2Level->dGetValue(iC1);
      dSxLoc = psymSx2->dGetValue(iC1);
      dTemp = psymEV->dSetPij(iC1, 0, 0, 1. - dQxLoc - dSxLoc);
      dTemp = psymEV->dSetPij(iC1, 0, 1, dQxLoc);
      dTemp = psymEV->dSetPij(iC1, 0, 2, dSxLoc);
    }
  // 2. Set LV 
  for(iC1=0; iC1<lSAge; ++iC1)
    {
      dDKLocBoY = MARKOVLV::dGetDK(iC1  ,0l,1l);
      dDKLocEoY = MARKOVLV::dGetDK(iC1+1,0l,1l);
      dLocDisc  = 1./psymDisc->dGetValue(iC1 - MARKOVLV::lGetStopTime() + lActualYear)-1.;
      dSHPartMR = dDKLocBoY * psymSHMarginInMR->dGetValue(iC1);
      dLocDisc2 = 1.+psymRDR->dGetValue(iC1);
      dCostOfCapital = psymSolaCapitalInMR->dGetValue(iC1)*dDKLocBoY*((1+psymInvReturn->dGetValue(iC1))/dLocDisc2 -1.);
      // BoY Gets MR
      // EoY Pays MR + Benefits and gets Interest on MR BoY + SH_Part of additional return
      dTemp = psymEV->dSetPre  (iC1, 0, 0, dCostOfCapital + dDKLocBoY/dLocDisc2);
      dTemp = psymEV->dSetPost (iC1, 0, 0, dDKLocBoY*dLocDisc + dSHPartMR - dDKLocEoY - psymSurvivalBenefit->dGetValue(iC1));
      dTemp = psymEV->dSetPost (iC1, 0, 1, dDKLocBoY*dLocDisc + dSHPartMR             - psymDeathBenefit->dGetValue(iC1));
      dTemp = psymEV->dSetPost (iC1, 0, 2, dDKLocBoY*dLocDisc + dSHPartMR - dDKLocEoY + psymSurenderPenaltyInMR->dGetValue(iC1) * dDKLocEoY - psymSurvivalBenefit->dGetValue(iC1) + psymSurenderPenaltyInMR->dGetValue(iC1) * psymSurvivalBenefit->dGetValue(iC1));
    }
  // 3. Set Discount
  for(iC1=0; iC1<lMaxTime; ++iC1)
    {
      dLocDisc = 1./(1.+psymRDR->dGetValue(iC1));
      dTemp = psymEV->dSetDisc(iC1, 0, 0, dLocDisc);
      dTemp = psymEV->dSetDisc(iC1, 1, 1, dLocDisc);
      dTemp = psymEV->dSetDisc(iC1, 2, 2, dLocDisc);
    }
  
  // A) 4. Calc DK
  return(MARKOVLV::dGetDK(lTime,0l,1l));
}

double CAPITALLV::dGetCF(long lTime)
{
  double dTemp;
  if (lValid == false) dTemp = CAPITALLV::dGetDK(lTime);
  return(MARKOVLV::dGetCF(lTime, 0, 0) + MARKOVLV::dGetCF(lTime, 0, 1) );
}

double CAPITALLV::dGetQx(long lTime, long lYear)
{
  return(psymQx->dGetValue(lTime) * exp(psymFx->dGetValue(lTime) * (lYear - lBaseYear)));
}

double CAPITALLV::dSetQx2Level(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 250; ++ iC)
	      dTemp = psymQx2Level->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymQx2Level->dSetValue(lTime, dValue));
}  
double CAPITALLV::dSetSx2(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 250; ++ iC)
	dTemp = psymSx2->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymSx2->dSetValue(lTime, dValue));
}
double CAPITALLV::dSetRDR(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 250; ++ iC)
	dTemp = psymRDR->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymRDR->dSetValue(lTime, dValue));
}
double CAPITALLV::dSetSurenderPenaltyInMR(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 250; ++ iC)
	dTemp = psymSurenderPenaltyInMR->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymSurenderPenaltyInMR->dSetValue(lTime, dValue));
}
double CAPITALLV::dSetSHMarginInMR(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 250; ++ iC)
	dTemp = psymSHMarginInMR->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymSHMarginInMR->dSetValue(lTime, dValue));
}
double CAPITALLV::dSetSolaCapitalInMR(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 250; ++ iC)
	dTemp = psymSolaCapitalInMR->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymSolaCapitalInMR->dSetValue(lTime, dValue));
}

double CAPITALLV::dSetInvReturn(long lTime, double dValue)
{
  lValid = false;
  if(lTime < 0)
    { 
      double dTemp;
      int iC;
      for(iC=0; iC < 250; ++ iC)
	dTemp = psymInvReturn->dSetValue(iC, dValue);
      return(dTemp);
    }
  else
    return(psymInvReturn->dSetValue(lTime, dValue));
}

double CAPITALLV::dGetEV(long lTime)
{ 
  double dTemp;
  if(lValid == false) dTemp = CAPITALLV::dGetDK(lTime);
  return(psymEV->dGetDK(lTime,0l,1l));
}




