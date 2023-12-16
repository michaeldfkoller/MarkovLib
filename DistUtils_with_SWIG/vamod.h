#ifndef __VAINFORCE
#define __VAINFORCE

#include "simlib.h"
#include "omarkov.h"

#define MAX(a,b) (((a) > (b)) ? (a) : (b))
#define MIN(a,b) (((a) < (b)) ? (a) : (b))


class VAINFORCE
{
 public:
  VAINFORCE();
  ~VAINFORCE();
  void vClearPersons();
  void vNewPerson();
  void vGotoStart();
  void nNext();
  VAPERSON * pGetPerson(long lId);
  VAPERSON * pNewPerson();
  VAPERSON * psymCurrentPers;
  VAINFORCE * MyThis();

 private:
  VAPERSON * psymAllPers;

};

class VAMOD:VAINFORCE,MARKOVLV,SIMLIB
{
 public:
  VAMOD();
  ~VAMOD();
  double         dSetQx(long lTable, long lType, long lSex, long lTime, double dValue);  // Table 0=K, 1= R Type 0 = 2 Ordn 1= erster Ordn  
  double         dSetFx(long lTable, long lType, long lSex, long lTime, double dValue);
  double         dSetSx(long lTable, long lType, long lSex, long lTime, double dValue);
  double         dSetBaseYear(long lTable, long lType, long lSex, long lTime);
  double         dSetActualYear(long lTime);
  double         dSetDisc(long lTime, double dValue);
  int            iAnalyseToken(char * pcString);

  void           vGenerateTrajectory();
  double         dGetMeanCF(long lTime, long lNrSim);
  double         dGetMeanCFAnn(long lTime, long lNrSim);
  double         dGetMeanCFPrem(long lTime, long lNrSim);
  double         dGetMeanCFMort(long lTime, long lNrSim);
  double         dGetMeanDK(long lTime, long lNrSim);
  double         dGetMeanDKAnnMort(long lTime, long lNrSim);
  double         dGetMeanDKPrem(long lTime, long lNrSim);
  double	 dGetDKDetail(long lTime, long lState); // Berechnet DK's fuer jeden State.
  //  double         dGetCFDetail(long lTime, long lState);
  void           vNewSeed(long lSeed);
  void           vResetMeanResults();
  long           lSeed;

  void           vAddDeath(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn); 
  void           vAddEndowment(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn); 
  void           vAddPremium(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn); 

  void           vUpdateOperator();

  double         dGetQx(long lOrder, long lTafel, long lSex, long lTime, long lYear);
  double         dSetRelativeQxForTime(long lTime, double dValue); // eg x_0 + time we multiply the qx correspondingly
  int            iReadInforce(int iP, int iL, char * strFileName);
  void           vPrintTex(char * strName);
  VAPAR          symPara; // Parameters
  int            iSetTable(int iSex, char * pcId, double dTech); 

 private:
  bool           lValid;
  bool           bTildeCalc;
  LV_VECTOR	 *psymQx[2];  //  sex
  LV_VECTOR	 *psymFx[2];
  LV_VECTOR	 *psymDisc;
  LV_VECTOR      *psymSx;
  LV_VECTOR	 *psymRelQxTime;
  LV_VECTOR      *psymTilde;
  long           lBaseYear[2];
  long		 lActualYear;
  long           lNrActSim;

  FILE   *   psymTrace;
  };

#endif
