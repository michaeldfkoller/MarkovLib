////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum     3.2011: erstellt                                     //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef  _OANNUITY2_INCLUDED
#define _OANNUITY2_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "omarkov.h"


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
private:
  long           lSAge1;
  long           lSAge2;
  LV_VECTOR	 *psymQx1;
  LV_VECTOR	 *psymFx1;
  LV_VECTOR	 *psymQx2;
  LV_VECTOR	 *psymFx2;
  LV_VECTOR	 *psymDisc;
  LV_VECTOR      *psymBenefit;
  long           lBaseYear;
  long		 lActualYear;
  bool           lValid;
  long           lMaxTime;
  double         dPreGen;
  double         dBenefit[3];
  double         dPre[3];
  double         dPost[3];
  long           lYMinusX;
};

#endif







