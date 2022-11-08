////////////////////////////////////////////////////////////////////
//                                                                //
// Simlibobjekt fuer SDEs                                         //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum March 2011: erstellt                                     //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef _SIMLIB_INCLUDED
#define _SIMLIB_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#pragma message (" >>>>> More Default States")

#define USEGSL
#ifdef USEGSL
#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>
//#define RNDGENERATOR gsl_rng_mt19937
#define RNDGENERATOR gsl_rng_ranlxs1 // Medium luxus best _ranlx2d
#endif

#define SIMLIB_MAXDIM  150
#define SIMLIB_PARPERASSET  6
#define DELTATDEF 0.01
#define MINVOLA 0.0001

#define HESTON 1
#define REGIMESHIFT 2


// Die folgende Klasse implementiert einen verketteten Leistungs oder W'keits-vektor
#ifndef SIMLIB_FOR_VAMOD
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

class ILV_VECTOR
{
public:
  // Bem - lVonIpt und INachIpt ist eine Info von wo nach wo (eg i to j)
  // Die Werte sind long
  ILV_VECTOR(long lXDim, long lVonIpt, long lNachIpt);  // lXDim Laenge des Vect.
  ~ILV_VECTOR();
  void	        vReset();                               // Alles auf Null setzten
  long          lSetValue(long lX, long lValue);        // Wert setzten
  long          lAddValue(long lX, long lValue);        // Wert Addieren
  long          lGetValue(long lX);                     // Wert zurückerhalten
  void            vSetNextPtr(LV_VECTOR * psymNextIpt); // Pointer zum naechsten Element
  LV_VECTOR   *	psymNext; // Das ist fuer die Verkettung, der Pointer zum naechsten 
                          // Element, == NULL heisst letztes Element
  long		    lVon;
  long		    lNach;

private:
  long          lXMax;
  long      *	plValues; // Das sind die Werte
};

class LV_MATRIX
{
public:
  LV_MATRIX(long lXDim, long lYDim, long lIdentIpt);           // lX/YDim Dimension Matrix
  ~LV_MATRIX();
  void		  vReset();                                    // Werte auf Null setzten
  double	  dSetValue(long lX, long lY, double dValue);  // Wert belegen
  double          dAddValue(long lX, long lY, double dValue);  // Addieren usw.
  double          dMultiplyValue(long lX, long lY, double dValue);
  double          dGetValue(long lX, long lY);
  void            vSetNextPtr(LV_MATRIX * psymNextIpt);
  LV_MATRIX   *   psymNext;
private:
  long            lXMax;
  long            lYMax;
  long		  lIdent;
  double      *   pdValues;    // Pool aller Werte (doubles)
  double      **  ppdValues;   // Interne Matrix mit ppdValues[i][j] kann auf das entspr.
                               // Element zugegriffen werden 
};
#endif

typedef struct REGSTR
{
  int iCurrentState;
  double dDrift[2];
  double dSigma[2];
  double dQxOneYr[2];
  double dQxDT[2];
} REGSTR;

class SIMLIB
{
public:
  /*  SIMLIB(); */ 
  SIMLIB(long lDimensionAssets, double dDeltaT, long lNrTimeSteps, long lModel); // Overrides Defaults
  ~SIMLIB();
  bool bUseAnti; // To use antithetic variables 
  void	vReset();   // Alles Zuruecksetzen                
  void  vSetSeed(long lSeed);               
  void  vSetModel(long lModel);
  void  vNewTrajectory();
  void  vRerunTrajectory();
  void  vNewRND();
  void  vSetdWidWj(int i, int j, double dValue);
  void  vSetdMui(int i, double dValue);
  void  dBoundary(int i, double dValue);
  void  dSetParameter(int i, double dValue);
  void  vSetStartState(int i);
  void  vSetEquilibriumO(double dEq); // Equilibrium Prob State 0 (is used if StartState < 0)
  double dGetValue(int i, double dTime);
  double dGetValueRND(int i, double dTime);
  double dGetCholesky(int i, int j);
  REGSTR      symRegShift;
  
 private:
  LV_VECTOR * psymBoundary;
  LV_VECTOR * psymBoundaryInt;
  LV_VECTOR * psymCurrentX;
  LV_MATRIX * psymTrajectory;
  LV_MATRIX * psymW;
  LV_MATRIX * psymWAnti;
  LV_VECTOR * psymMu;
  LV_MATRIX * psymCoVar;
  LV_VECTOR * psymParam;
  bool bAnti; // the next run we use an antithetic if true
  long lDimensionAssets; 
  long lDimSDE;
  double dDeltaT; 
  double dDeltaTINV;
  double dT05; 
  long lNrTimeSteps;
  long lModel;
  long lSeed;
  long lSeedOLD;
  int      iStartState;
  double   dT;
  double   dEqP0; 
  double   dW[SIMLIB_MAXDIM];
  double   dWAnti[SIMLIB_MAXDIM];
  double   dX[SIMLIB_MAXDIM];
  double   dXPlus[SIMLIB_MAXDIM];
  double   dChol[SIMLIB_MAXDIM][SIMLIB_MAXDIM];
  bool     dNeedCalc;
  bool     bError;
  bool     bResetRND;
  bool     bNeedPrepare;     
  bool     bNeedsStepper;
  void     vPreStepper();
  void     vPostStepper();

#ifdef USEMERSENNE
  MTRand  * psymMT;
#endif

#ifdef USEGSL
  gsl_rng * pSymGSLr;
#endif


  double  (*dA)(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX);
  double  (*dB)(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX);
  double  (*dBPrime)(class SIMLIB * p, int i, int jPartial, double dTime, LV_VECTOR * psymParam, double * dX); // eg \frac{\partial b_i}{\partial x_j}
  double  dUniformRnd();
  double  dNormRnd();
  void    vNormRndMuSigma();
  void    vDoCholevski();
  void    vPrepare();

};

  double  dA_Heston(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX);
  double  dB_Heston(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX);
  double  dBPrime_Heston(class SIMLIB * p, int i, int jPartial, double dTime, LV_VECTOR * psymParam, double * dX);

  double  dA_Regime(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX);
  double  dB_Regime(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX);
  double  dBPrime_Regime(class SIMLIB * p, int i, int jPartial, double dTime, LV_VECTOR * psymParam, double * dX);

#endif
