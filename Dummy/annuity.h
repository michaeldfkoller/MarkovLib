////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Luisa Koller                                             //
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
#include "lvvect.h"


 class ANNUITYLV  
{
public:
  ANNUITYLV();
  ANNUITYLV(long lMaxTimesIpt, double dPre); // Overrides Defaults
  ~ANNUITYLV();
  void           vSetStartTime(long lTime);
  void           vSetStopTime(long lTime);
  void           vSetSAge(long lTime);
  double         dSetQx(long lTime, double dValue);  // lNach irrelevant
  double         dSetFx(long lTime, double dValue);
  double         dSetBaseYear(long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);
  double	 dGetDK(long lTime); // Berechnet DK's
  double         dGetQx(long lTime, long lYear);
  double         dSetPre(double dValue);

private:
  long		 lGTime;
  long           lSAge;
  long           lMaxProj;
  long           lStartTime;
  long           lStopTime;
  LV_VECTOR	 *psymQx;
  LV_VECTOR	 *psymFx;
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
