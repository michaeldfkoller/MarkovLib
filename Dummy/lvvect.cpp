///////////////////////////////////////////////////////////////////
//                                                               //
// Markovobjekt fuer LV Zahlungsstroeme                          //
//                                                               //
// Autor Luisa Koller                                            //
//                                                               //
// Datum: March 2011: erstellt                                   //
//                                                               //
///////////////////////////////////////////////////////////////////

#include "lvvect.h"

// Die folgende Klasse implementiert einen verketteten Leistungs oder W'keits-vektor

LV_VECTOR::LV_VECTOR(long lXDim, long lVonIpt, long lNachIpt)
{
  lXMax    = lXDim;
  pdValues = new double [lXMax];
  lVon     = lVonIpt;
  lNach    = lNachIpt;
  psymNext = NULL;
  memset(pdValues, 0, lXMax * sizeof(double));
}

LV_VECTOR::~LV_VECTOR()
{
  delete(pdValues);
}

void LV_VECTOR::vReset()
{
  memset(pdValues, 0, lXMax * sizeof(double));
}

double LV_VECTOR::dSetValue(long lX, double dValue)
{
  if(lX >= 0 && lX < lXMax)
    {
      pdValues[lX] = dValue;
      return(pdValues[lX]);
    }	
  return(dValue - 1.);
}

double LV_VECTOR::dAddValue(long lX, double dValue)
{
  if(lX >= 0 && lX < lXMax)
    {
      pdValues[lX] += dValue;
      return(pdValues[lX]);
    }	
  return(0.);
}

double LV_VECTOR::dGetValue(long lX)
{
  if(lX >= 0 && lX < lXMax)
    {
      return(pdValues[lX]);
    }	
  return(0.);
}
