#ifndef __VASTRUCT
#define __VASTRUCT

#define NRFUNDS 5

typedef struct VABENEFITS
{
  // Definition of Guarantee Vector
  double dStartValueGuarantee;
  double dIncreasePA; // This is the parameter for the annual increase in the form += alpha or *= 1+alpha
  int    iStartGuaranteeAge;
  int    iEndGuaranteeAge;
  bool   bLinear;
  bool   bExponential;
  // Take also Fund Value into Account and make max - and how (eg Ratchet)
  bool   bMaxWithFunds; //Otherwise only guarantee
  int    iRatchet;  // 0 - no otherwise every iRatchet Periods
  // Which Types of Benfits
  // note if Age < Current Age --> No Benefit
  int    iEndowmentAge; //0 - no endowment - otherwise maturity age
  int    iSTerm; // 0 - no term benefit otherwise s-age
  int    iSAnnuity; // Start age Annuity
  int    iSLastAnnuity; // Age at which Annuity ceases (\infty for lifelong)
  int    iSPrem; //Last Age with Premium 
  // Levels of Benefits
  double dPctEndowment; 
  double dPctTerm;
  double dPctAnnuity;
  double dPctPremium;   
} VABENEFITS;

typedef struct VAINVESTMENT
{
  // This Structure is also for rolling forwards
  double dEE;
  double dSAA[NRFUNDS];
  int iAgeRiskFree; // Means if Age >=iAgeRiskFree All assets in risk free (asset 0) 
  // This are the current Cash Flows and 
  double dPerformance[NRFUNDS];
  double dCurrentVA; // F(t)
  double dCurrentRatchet; // R(t) 
  double dCurrentCashFlow; //CF(t)
  double dCurrentLoss; // X(t)
} VAINVESTMENT;

typedef struct VAPERSON
{
  long lId;
  int iAge;
  int iGender;
  int iBirthYear;
  VABENEFITS * psymB;
  VAINVESTMENT * psymI; 
} VAPERSON;

#endif
