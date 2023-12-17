////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef  _OGLMOD_INCLUDED
#define _OGLMOD_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "omarkov.h"

#include "annuity.h"
#include "capital.h"

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
 private:
  bool           lValid;
  bool           bTildeCalc;
  LV_VECTOR	 *psymQx[2][2][2];  // Tafel1/2 ; K oder R ; sex
  LV_VECTOR	 *psymFx[2][2][2];
  LV_VECTOR	 *psymDisc;
  LV_VECTOR      *psymSx;
  LV_VECTOR	 *psymRelQxTime;
  LV_VECTOR      *psymTilde;
  long           lBaseYear[2][2][2];
  long		 lActualYear;

  int        iQxStress;                            double dQxStress;   // qx -> (1 +/- alpha) x qx
  int        iFxStress;                            double dFxStress;   // qx -> (1 +/- alpha) x qx
  int        iSxStress;                            double dSxStress;   // sx -> dFxStress
  int        iYieldStress;                         double dYieldStress;   // yield -> yield +/- alpha

  int        iAexRKW;                              double dAexRKW;   // yield -> yield +/- alpha
  int        iAxRKW;                               double dAxRKW;   // yield -> yield +/- alpha

  double     dStatDK;
  double     dFVDK;

  FILE   *   psymTrace;
  ANNUITYLV  * psymAex;
  CAPITALLV  * psymPraem;
  CAPITALLV  * psymAx;
  
};

#endif
