////////////////////////////////////////////////////////////////////
//                                                                //
// Markovobjekt fuer LV Zahlungsstroeme                           //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum March 2011: erstellt                                     //
//                                                                //
////////////////////////////////////////////////////////////////////

#ifndef _OMARKOV_INCLUDED
#define _OMARKOV_INCLUDED

#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <memory.h>
#include "tableserver.h"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wformat-security"
#pragma GCC diagnostic ignored "-W#pragma-messages"

#pragma message (" >>>>> More Default States")

/*
Die Werte sind gegeben wie folgt:
DEF_MAXTIMES  -- Standart max Zeit welche gebraucht wird
DEF_MAXSTATES -- Standart max Zustaende welche gebraucht wird
DEF_DEFNRMOMENTS -- Std wert fuer Anzahl Momente  
DEF_STOC_INT     -- false = normales Zinsmodell, nur abhaengig vom
                    Ausgangszustand
Wenn deterministischer Zins, so steht der Zins für alle Elemente auf der Diagonale

MAXMOMENTE    -- Max Momente welche das Prg berechnen kann
*/
#define DEF_MAXTIMES     200l  // Das ist ein uebersteuerbarer Defaultwert
#define DEF_MAXSTATES     40l  // Das ist ein uebersteuerbarer Defaultwert
#define DEF_DEFNRMOMENTS   1l  // Das ist ein uebersteuerbarer Defaultwert
#define DEF_STOC_INT   false   // Das ist ein uebersteuerbarer Defaultwert
#define MAXMOMENTE        10l  // ! Absolute Schranke
#define WITH_RP
#undef  ALLOCATE_CF_TO_EXACT_TIMES  // Falls defiert werden CF zu den exakten Zeiten alloziert
#define MAX_TEX_ROWS      8
#define MAX_TEX_LINES     50
#define WITH_TeX
#define WITH_SIMUALATION      // Implementation not completed
#define TEX_TAB         "lrrrrrrrr"
#define TECHEPS 1.e-10
#define INCL_ANNMOD  // To include ANNMOD


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

class MARKOVLV
{
public:
  /*  MARKOVLV(); */ 
  MARKOVLV(long lMaxTimesIpt, long lMaxStatesIpt, long lNrDefMomentsIpt); // Overrides Defaults
  ~MARKOVLV();
  void		 vReset();   // Alles Zuruecksetzen                          
  void           vSetInternals(long lMaxTimes, long lMaxStates); // Diese Werte neu belegen
  void           vSetStartTime(long lTime); // Zeit an welcher Rekursion beginnt, zB 120
  void           vSetStopTime(long lTime);  // Zeit an welcher Rekursion stoppt zB 30
  void           vSetNrStates(long lNrStatesIpt); // Anzahl Zustaende des Modells
  void           vSetGetData(bool bStatus); // Falls true werden ueberschreiben die folgenden
  // 4 Funktionen keine Werte und geben die Werte nur zurueck
  // dSetPre - a_i^Pre(t)
  // dSetPost - a_{ij}^Post(t)
  // dSetPij  - p_{ij}(t)
  // dSetDisc - v_{i}(t) bzw v_{ij}(t) falls vSetInterestModel(true)
  double         dSetPre(long lTime, long lVon, long lNach, double dValue);  // lNach irrelevant
  double         dSetPost(long lTime, long lVon, long lNach, double dValue);
  double         dSetPij(long lTime, long lVon, long lNach, double dValue);
  double         dSetDisc(long lTime, long lVon, long lNach, double dValue);
  void           vSetInterestModel(bool bStocInterest);  // true heisst stochastischer Zins
  void	         vSetDefaultNrMoments(long lNrMoments);  // Wenn man hoehere Momente will
  double	 dGetDK(long lTime, long lState, long lMoment); // Berechnet DK's - eg V_i(t) falls
                                                                // lMoment = 1
  double	 dGetCF(long lTime, long lInitState, long lTimeState); // Berechnet erwartete CF
                 // E[CF(t) x \chi_{I_t = lTimeState} | X(Stopzeit) = lInitState]
                 // Wenn man den total CF will muss man also 
                 // summe_i dGetCF(long lTime, long lInitState, i) rechnen
  double         dGetRP(long lTime, long lState); // Berechnet Risikopraemie
  double         dGetSP(long lTime, long lState); // Berechnet Sparpraemie
  double         dGetRegP(long lTime, long lState); // Berechnet Regulaeren Zahlungsstrom
  long           lSetFolgezustand(long lStateVon, long lStateNach);
  long           lGetMaxTime();
  long           lGetNrStates();
  long           lGetStartTime();
  long           lGetStopTime();
  bool           dAddBenefits;
  void           vSetInitState(long lInitState);
  void           vGenerateTrajectory();
  long           vGetState(long lTime);
  double         dGetRandCF(long lTime);
  double         dGetRandDK(long lTime, long lMoment);
  double         dGetMeanCF(long lTime, long lState, long lNrSim);
  double         dGetMeanDK(long lTime, long lState, long lNrSim);
  void           vNewSeed(long lSeed);
  void           vResetMeanResults();
  long           lSeed;
  void vPrintTeX(FILE * psymTeXFile, bool bWithHeader, char * pcTitle, bool bAllEntries);
  void vPrintTeXFileName(char * pcFileName, bool bWithHeader, char * pcTitle, bool bAllEntries);
    
  TABLESERVER * psymTable1;
  TABLESERVER * psymTable2;
 private: // Hier folgend die internen Variablen, welche der obigen Nomeklatur folgen
  long		 lMaxTimes;
  long		 lMaxStates;
  long           lStartTime;
  long		 lStopTime;
  long           lNrStates;
  long		 lNrDefaultMoments;
  LV_VECTOR	*psymPre;   // Das sind die verketteten Vektoren
  LV_VECTOR	*psymPost;  // Man beachte dass der Zusammenhang und das Synchronisieren
  LV_VECTOR	*psymPij;   // ppsymPreInfo; pppsymPostInfo; pppsymPijInfo;pppsymDiscInfo;
  LV_VECTOR	*psymDisc;  // erfolgt, eg pppsymPostInfo[istate][jstate]->dGetValue(time)
  LV_MATRIX	*psymDK;    // Das sind die Internen Vektoren um Daten zu speichern DKs
  LV_MATRIX	*psymCF;    // Das sind die Internen Vektoren um Daten zu speichern CFs
  LV_VECTOR    **ppsymPreInfo;
  LV_VECTOR   ***pppsymPostInfo;
  LV_VECTOR   ***pppsymPijInfo;
  LV_VECTOR   ***pppsymDiscInfo;
  LV_MATRIX     *psymDKInfo[MAXMOMENTE]; // psymDKInfo[moment] -> dGetValue(time, state) 
  LV_MATRIX    **ppsymCFInfo;            // ppsymCFInfo[lInitState]->dGetValue(lTime, lTimeState) 
  long          *plFolgezustand; 
  void		 vPrepareInfoPointers(); // Hier werden die Datenstrukturen vorbereitet.
  long           lDKCalculated; // DKs berechnet ?
  long           lCFCalculated; // CF Berechnet ?
  long           lTechZerCalculated; // Technische Zerlegung berechnet ?
  bool		 bGetData;
  bool		 bStochasticInterest;
  ILV_VECTOR  * psymAktTraj;
  LV_VECTOR   * psymAktCF;
  LV_VECTOR   * psymAktDK;
  LV_VECTOR   * psymAktDisc;
  long        lNrTrajSim;
  long        lInitState;
  LV_MATRIX   * psymAggregCF;
  LV_MATRIX   * psymAggregDK;
};

#endif












