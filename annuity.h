////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef  _OANNUITY_INCLUDED
#define _OANNUITY_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "omarkov.h"


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
private:
  long		 lGTime;
  long           lSAge;
  long           lMaxProj;
  LV_VECTOR	 *psymQx;
  LV_VECTOR	 *psymFx;
  LV_VECTOR	 *psymSx;
  LV_VECTOR	 *psymDisc;
  LV_VECTOR	 *psymRelQxTime;
  LV_VECTOR      *psymBenefit;
  long           lBaseYear;
  long		 lActualYear;
  bool           lValid;
  long           lMaxTime;
  double         dPre;
  double         dPost;
};

#endif
