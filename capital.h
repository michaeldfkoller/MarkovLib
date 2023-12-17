////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Micahel Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef  _OCAPITYL_INCLUDED
#define _OCAPITYL_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "omarkov.h"


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

private:
  long           lSAge;
  LV_VECTOR	 *psymQx;
  LV_VECTOR	 *psymFx;
  LV_VECTOR	 *psymDisc;
  LV_VECTOR	 *psymDeathBenefit;
  LV_VECTOR	 *psymSurvivalBenefit;
  LV_VECTOR	 *psymPremium;
  long           lBaseYear;
  long		 lActualYear;
  bool           lValid;
  long           lMaxTime;
// For Embedded Value
  LV_VECTOR	 *psymQx2Level;
  LV_VECTOR	 *psymSx2;
  LV_VECTOR      *psymRDR;
  LV_VECTOR      *psymSurenderPenaltyInMR;
  LV_VECTOR      *psymSHMarginInMR;
  LV_VECTOR      *psymSolaCapitalInMR;
  LV_VECTOR      *psymInvReturn;
  MARKOVLV       *psymEV;
};

#endif
