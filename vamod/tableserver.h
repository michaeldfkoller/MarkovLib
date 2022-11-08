////////////////////////////////////////////////////////////////////
//                                                                //
// Annuity LV Zahlungsstroeme                                     //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum 3.2011: erstellt                                         //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef  _OTABLE_INCLUDED
#define _OTABLE_INCLUDED

#define ERROR -1
#define MAXCHARS 40000

#include <string.h>

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

 private:
  int iTableVal;
  int iX0Val;
  int iXOmegaVal;
  int iT0Val;
  double dITechVal; 
  int iGenderVal;
};

#endif
