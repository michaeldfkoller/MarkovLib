/* File: example.i */
%module markovlv
%{
#define SWIG_FILE_WITH_INIT
#include "omarkov.h"
#include "annuity.h"
#include "annuity2.h"
#include "capital.h"
#include "widdow.h"
#include "annmod.h"
#include "glmod.h"
#include "tableserver.h"
%}

class MARKOVLV
{
public:
  /*  MARKOVLV(); */ 
  MARKOVLV(long lMaxTimesIpt, long lMaxStatesIpt, long lNrDefMomentsIpt); // Overrides Defaults
  ~MARKOVLV();
  void		 vReset();   // Alles Zuruecksetzen                          
  void           vSetInternals(long lMaxTimes, long lMaxStates); // Diese Werte neu belegen
  void           vSetStartTime(long lTime); // Zeit an welcher Rekursion beginnt, zB 120
  void           vSetStopTime(long lTime);  // Zeit an welcher Rekursion stoppt zB 30
  void           vSetNrStates(long lNrStatesIpt); // Anzahl Zustaende des Modells
  void           vSetGetData(bool bStatus); // Falls true werden ueberschreiben die folgenden
  // 4 Funktionen keine Werte und geben die Werte nur zurueck
  // dSetPre - a_i^Pre(t)
  // dSetPost - a_{ij}^Post(t)
  // dSetPij  - p_{ij}(t)
  // dSetDisc - v_{i}(t) bzw v_{ij}(t) falls vSetInterestModel(true)
  double         dSetPre(long lTime, long lVon, long lNach, double dValue);  // lNach irrelevant
  double         dSetPost(long lTime, long lVon, long lNach, double dValue);
  double         dSetPij(long lTime, long lVon, long lNach, double dValue);
  double         dSetDisc(long lTime, long lVon, long lNach, double dValue);
  void           vSetInterestModel(bool bStocInterest);  // true heisst stochastischer Zins
  void	         vSetDefaultNrMoments(long lNrMoments);  // Wenn man hoehere Momente will
  double	 dGetDK(long lTime, long lState, long lMoment); // Berechnet DK's - eg V_i(t) falls
                                                                // lMoment = 1
  double	 dGetCF(long lTime, long lInitState, long lTimeState); // Berechnet erwartete CF
                 // E[CF(t) x \chi_{I_t = lTimeState} | X(Stopzeit) = lInitState]
                 // Wenn man den total CF will muss man also 
                 // summe_i dGetCF(long lTime, long lInitState, i) rechnen
  double         dGetRP(long lTime, long lState); // Berechnet Risikopraemie
  double         dGetSP(long lTime, long lState); // Berechnet Sparpraemie
  double         dGetRegP(long lTime, long lState); // Berechnet Regulaeren Zahlungsstrom
  long           lSetFolgezustand(long lStateVon, long lStateNach);
  long           lGetMaxTime();
  long           lGetNrStates();
  long           lGetStartTime();
  long           lGetStopTime();
  bool           dAddBenefits;
  void           vSetInitState(long lInitState);
  void           vGenerateTrajectory();
  long           vGetState(long lTime);
  double         dGetRandCF(long lTime);
  double         dGetRandDK(long lTime, long lMoment);
  double         dGetMeanCF(long lTime, long lState, long lNrSim);
  double         dGetMeanDK(long lTime, long lState, long lNrSim);
  void           vNewSeed(long lSeed);
  void           vResetMeanResults();
  long           lSeed;
  void vPrintTeX(FILE * psymTeXFile, bool bWithHeader, char * pcTitle, bool bAllEntries);
};

class CAPITALLV:MARKOVLV  // Remark to access a method of MARKOV use MARKOVLV::Method(Args)
{
public:
  CAPITALLV();
  CAPITALLV(long lMaxTimesIpt); // Overrides Defaults
  ~CAPITALLV();
  int            iSetTable(char * pcId);
  void           vSetStartTime(long lTime);
  void           vSetStopTime(long lTime);
  void           vSetSurvival(long lTime, double dValue);
  void           vSetDeath(double dValue);
  void           vSetPremium(double dValue);
  void           vSetSurvivalGen(long lTime, double dValue); // nur einzelne Werte werden 
  void           vSetDeathGen(long lTime, double dValue);                // ueberschrieben statt
  void           vSetPremiumGen(long lTime, double dValue);              // allen
  double         dSetQx(long lTime, double dValue);  // lNach irrelevant
  double         dSetFx(long lTime, double dValue);
  double         dSetBaseYear(long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);
  double	 dGetDK(long lTime); // Berechnet DK's
  double         dGetCF(long lTime);
  double         dGetQx(long lTime, long lYear);
  double         dSetQx2Level(long lTime, double dValue);
  double         dSetSx2(long lTime, double dValue);
  double         dSetRDR(long lTime, double dValue);
  double         dSetSurenderPenaltyInMR(long lTime, double dValue);
  double         dSetSHMarginInMR(long lTime, double dValue);
  double         dSetSolaCapitalInMR(long lTime, double dValue);
  double         dSetInvReturn(long lTime, double dValue);
  double         dGetEV(long lTime);

};

class ANNUITYLV:MARKOVLV  // Remark to access a method of MARKOV use MARKOVLV::Method(Args)
{
public:
  ANNUITYLV();
  ANNUITYLV(long lMaxTimesIpt, double dPre); // Overrides Defaults
  ~ANNUITYLV();
  int            iSetTable(char * pcId);
  void           vSetStartTime(long lTime);
  void           vSetStopTime(long lTime);
  void           vSetSAge(long lTime);
  void           vSetG(long lTime);
  void           vSetMaxProj(long lMaxYearImp);
  double         dSetQx(long lTime, double dValue);  // lNach irrelevant
  double         dSetFx(long lTime, double dValue);
  double         dSetSx(long lTime, double dValue);
  double         dSetBaseYear(long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);
  double	 dGetDK(long lTime); // Berechnet DK's
  double         dGetCF(long lTime);
  double         dGetQx(long lTime, long lYear);
  double         dGetTqx(long lTime);
  double         dGetTpx(long lTime);
  double         dSetPre(double dValue);
  double         dSetRelativeQxForTime(long lTime, double dValue); // eg x_0 + time we multiply the qx correspondingly
  void           vLeistReset();
  void           vSetLeistLinear(long lTimeFrom, long lTimeTo, double dStartValue, double dIncrement); // each time += dIncr
  void           vSetLeistExp(long lTimeFrom, long lTimeTo, double dStartValue, double dFactor); // each time *= dFactor
};

class ANNUITYLV2:MARKOVLV  // Remark to access a method of MARKOV use MARKOVLV::Method(Args)
{
public:
  ANNUITYLV2();
  ANNUITYLV2(long lMaxTimesIpt, double dPre); // Overrides Defaults
  ~ANNUITYLV2();
  int            iSetTable1(char * pcId);
  int            iSetTable2(char * pcId);
  void           vSetStartTime(long lTime);
  void           vSetStopTime(long lTime);
  void           vSetSAge1(long lTime);
  void           vSetSAge2(long lTime);
  double         dSetQx1(long lTime, double dValue);  // lNach irrelevant
  double         dSetFx1(long lTime, double dValue);
  double         dSetQx2(long lTime, double dValue);  // lNach irrelevant
  double         dSetFx2(long lTime, double dValue);
  double         dSetBaseYear(long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);
  double	 dGetDK(long lTime, long lState); // Berechnet DK's
  double         dGetCF(long lTime);
  double         dGetQx1(long lTime, long lYear);
  double         dGetQx2(long lTime, long lYear);
  double         dSetY_Minus_X(long lYAge, long lXAge);
  double         dSetBenefit(long lState, double dValue);
  double         dSetPre(double dValue);
  void           vLeistReset();
  void           vSetLeistLinear(long lTimeFrom, long lTimeTo, double dStartValue, double dIncrement); // each time += dIncr
  void           vSetLeistExp(long lTimeFrom, long lTimeTo, double dStartValue, double dFactor); // each time *= dFactor
};

class WIDDOWLV:MARKOVLV  // Remark to access a method of MARKOV use MARKOVLV::Method(Args)
{
public:
  WIDDOWLV();
  WIDDOWLV(long lMaxTimesIpt); // Overrides Defaults
  ~WIDDOWLV();
  void           vSetStartTime(long lTime);
  void           vSetStopTime(long lTime);
  double         dSetQx(long lTime, double dValue);  // lNach irrelevant
  double         dSetQy(long lTime, double dValue);  // lNach irrelevant
  double         dSetFx(long lTime, double dValue);
  double         dSetFy(long lTime, double dValue);
  double         dSetHx(long lTime, double dValue);
  double         dSetYx(long lTime, double dValue);
  double         dSetBaseYear(long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);
  double	 dGetDK(long lTime); // Berechnet DK's
  double         dGetCF(long lTime);
  double         dGetQx(long lTime, long lYear);
  double         dSetPre(double dValue);
  void           vLeistReset();
  void           vSetLeistLinear(long lTimeFrom, long lTimeTo, double dStartValue, double dIncrement); // each time += dIncr
  void           vSetLeistExp(long lTimeFrom, long lTimeTo, double dStartValue, double dFactor); // each time *= dFactor
};


class GLMOD:MARKOVLV  // Remark to access a method of MARKOV use MARKOVLV::Method(Args)
{
 public:
  GLMOD();
  ~GLMOD();
  double         dSetQx(long lTable, long lType, long lSex, long lTime, double dValue);  // Table 0=K, 1= R Type 0 = 2 Ordn 1= erster Ordn  
  double         dSetFx(long lTable, long lType, long lSex, long lTime, double dValue);
  double         dSetSx(long lTable, long lType, long lSex, long lTime, double dValue);
  double         dSetBaseYear(long lTable, long lType, long lSex, long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);

  void           vStress(long lType, double dAmount); // Idee lType = 0 -> Reset  1= = ...
  void           vAddAnnuity(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn); 
  void           vAddEndowment(long lSex, long lX, long lS, double dLeist, double dPraem, double dITechn);
  void           vAddWiddow(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn);
  void           vSetRKWAnnuity(long lType, double dAmount);
  void           vSetRKWEndowment(long lType, double dAmount);
  void           vUpdateOperator();

  double	 dGetDK(long lTime); // Berechnet DK's
  double	 dGetDKDetail(long lTime, long lState); // Berechnet DK's fuer jeden State.
  double	 dGetDKTilde(long lTime); // Berechnet DK's gesehen aus Zeit Null
  double         dGetStatDK(void);
  double         dGetFVDK(void);
  double         dGetCF(long lTime);
  double         dGetCFDetail(long lTime, long lState);
  double         dGetStatDK(long lType);  // lType: 0=Stat 1=FV ohne sx
  double         dGetQx(long lOrder, long lTafel, long lSex, long lTime, long lYear);
  double         dSetRelativeQxForTime(long lTime, double dValue); // eg x_0 + time we multiply the qx correspondingly
  int            iReadInforce(int iP, int iL, char * strFileName);
  void           vPrintTex(char * strName);
};

class ANNMOD:MARKOVLV  // Remark to access a method of MARKOV use MARKOVLV::Method(Args)
{
 public:
  ANNMOD();
  ~ANNMOD();
  double         dSetQx(long lTable, long lType, long lSex, long lTime, double dValue);  // Table 0=K, 1= R Type 0 = 2 Ordn 1= erster Ordn  
  double         dSetFx(long lTable, long lType, long lSex, long lTime, double dValue);
  double         dSetSx(long lTable, long lType, long lSex, long lTime, double dValue);
  double         dSetBaseYear(long lTable, long lType, long lSex, long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);

  // Einlebig
  void           vAddAnnuity1(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease); 
  // Zinsrente
  void           vAddAnnuity0(long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease);
  // Zweilebig joint life
  void           vAddAnnuity2xy(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease); 
  // Zweilebig last life
  void           vAddAnnuity2xyBar(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease); 
  // Zweilebig y widdow annuity
  void           vAddAnnuity2xToy(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease); 
  // Zweilebig y widdow annuity
  void           vAddAnnuity2yTox(long lSex1, long lSex2, long lX, long lY, long lS, long lNTimes, double dLeist, double dPraem, double dITechn, double dIncrease); 
  

  void           vUpdateOperator();

  double	 dGetDK(long lTime); // Berechnet DK's
  double         dGetStatDK(void);
  double         dGetFVDK(void);
  double         dGetCF(long lTime);
  double         dGetStatDK(long lType);  // lType: 0=Stat 1=FV ohne sx

  double         dGetQx(long lOrder, long lTafel, long lSex, long lTime, long lYear);
  double         dSetRelativeQxForTime(long lTime, double dValue); // eg x_0 + time we multiply the qx correspondingly
};

class TABLESERVER
{
 
 public: 
  TABLESERVER();
  void   vSetTable(char *pcTable);
  double dGetValue(int iAge);
  int iTableNumber();
  int iX0();
  int iXOmega();
  int iT0();
  double dITech();
  int iGender();
  char * pcAllTarifs();
};
