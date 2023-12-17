////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef  _OANMOD_INCLUDED
#define _OANMOD_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "omarkov.h"


#include "annuity.h"
#include "capital.h"

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
 
 private:
  bool           lValid;

  LV_VECTOR	 * psymQx[2][2][2];  // Tafel1/2 ; K oder R ; sex
  LV_VECTOR	 * psymFx[2][2][2];
  LV_VECTOR	 * psymDisc;
  LV_VECTOR      * psymSx;
  LV_VECTOR	 * psymRelQxTime;
  long           lBaseYear[2][2][2];
  long		 lActualYear;

  double     dStatDK;
  double     dFVDK;

  FILE       * psymTrace;
  ANNUITYLV  * psymAex;
  CAPITALLV  * psymPraem;
  CAPITALLV  * psymAx;
  
};

#endif
