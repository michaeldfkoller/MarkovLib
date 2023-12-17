////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef  _OAWIDDOW_INCLUDED
#define _OAWIDDOW_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "annuity.h"
#include "omarkov.h"


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
  double	     dGetDK(long lTime); // Berechnet DK's
  double         dGetCF(long lTime);
  double         dGetQx(long lTime, long lYear);
  double         dSetPre(double dValue);
  void           vLeistReset();
  void           vSetLeistLinear(long lTimeFrom, long lTimeTo, double dStartValue, double dIncrement); // each time += dIncr
  void           vSetLeistExp(long lTimeFrom, long lTimeTo, double dStartValue, double dFactor); // each time *= dFactor
private:
  long           lSAge;
  ANNUITYLV      *psymAnnuity;
   long          lMaxProj;
  LV_VECTOR	 *psymQx;
  LV_VECTOR	 *psymFx;
  LV_VECTOR	 *psymDisc;
  LV_VECTOR	 *psymHx;
  LV_VECTOR	 *psymYx;
  LV_VECTOR      *psymBenefit;
  long           lBaseYear;
  long		 lActualYear;
  bool           lValid;
  long           lMaxTime;
  double         dPre;
};

#endif

