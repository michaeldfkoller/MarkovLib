

#ifndef __VASTRUCT
#define __VASTRUCT

#define NRFUNDS 5

typedef struct VABENEFITS
{
double dStartValueGuarantee; // Start VAlue of Guarantee 
double dIncreasePA; // This is the parameter for the annual increase in the form += alpha or *= 1+alpha 
long lStartGuaranteeAge; // Age at which guarantee startes to increase 
long lEndGuaranteeAge; // Age at which guarantee stops to increase 
bool bLinear; // When true (1) there is a linear increase 
bool bExponential; // When true (1) there is a exponential increase 
bool bMaxWithFunds; // Otherwise only guarantee 
long lRatchet; // 0 - no otherwise every lRatchet Periods 
long lEndowmentAge; // Endowment Age: 0 - no endowment - otherwise maturity age 
long lSTerm; // Term insurance: 0 - no term benefit otherwise s-age 
long lSAnnuity; // Start Age annuity in payment 
long lSLastAnnuity; // Age at which annuity stops (infty forever) 
double dPctEndowment; // Amount Endowment benefit in pct benefit 
double dPctTerm; // Amount Term benefit in pct benefit 
double dPctAnnuity; // Amount Annuity benefit in pct benefit 
double dPctPremium; // Amount Premium in pct benefit 

} VABENEFITS;

typedef struct VAINVESTMENT
{
double dEE; // Single Premium 
double dSAA[NRFUNDS]; // Pct Investment in Funds 1 
long lAgeRiskFree; // Age at which the funds are invested risk free 
double dPerformance[NRFUNDS]; // Performance of Funds 
double dCurrentVA; // F(t) 
double dCurrentRatchet; // R(t) 
double dCurrentCashFlow; // CF(t) 
double dCurrentLoss; // X(t) 
double dCurrentRatchetAnnuity; // X(t) 

} VAINVESTMENT;

typedef struct VAPERSON
{
long lId; // Id of Person 
long lAge; // Actual Age of Person 
long lGender; // Gender of person 0 = Male, 1 = female 
long lBirthYear; // Year wehn person was born eg 1950 
VABENEFITS symB; // Structure to benefits 
VAINVESTMENT symI; // Structure to investments 
VAPERSON * psymNext; // Next Person 

} VAPERSON;

typedef struct VAPAR
{
double dSigBond; // Vola of Bonds 
double dSigEquityShort; // Vola of Equities Short 
double dSigEquityLong; // Vola of Equities Long 
double dFundStartLevel; // Vola of Equities Short 
double dRiskFree; // Risk Free Interest Rate 
double lSeed; // Seed for RSG 

} VAPAR;

#endif
