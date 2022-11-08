////////////////////////////////////////////////////////////////////
//                                                                //
// Markovobjekt fuer LV Zahlungsstroeme                           //
//                                                                //
// Autor Luisa Koller                                             //
//                                                                //
// Datum March 2011: erstellt                                     //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef _LVVECT_INCLUDED
#define _LVVECT_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>

// Die folgende Klasse implementiert einen verketteten Leistungs oder W'keits-vektor

class LV_VECTOR
{
public:
  // Bem - lVonIpt und INachIpt ist eine Info von wo nach wo (eg i to j)
  // Die Werte sind doubles
  LV_VECTOR(long lXDim, long lVonIpt, long lNachIpt);   // lXDim Laenge des Vect.
  ~LV_VECTOR();
  void	          vReset();                             // Alles auf Null setzten
  double          dSetValue(long lX, double dValue);    // Wert setzten
  double          dAddValue(long lX, double dValue);    // Wert Addieren
  double          dGetValue(long lX);                   // Wert zurückerhalten
  void            vSetNextPtr(LV_VECTOR * psymNextIpt); // Pointer zum naechsten Element
  LV_VECTOR   *	psymNext; // Das ist fuer die Verkettung, der Pointer zum naechsten 
                          // Element, == NULL heisst letztes Element
  long		  lVon;
  long		  lNach;

private:
  long            lXMax;
  double      *	  pdValues; // Das sind die eigentlichen Daten
};


#endif












