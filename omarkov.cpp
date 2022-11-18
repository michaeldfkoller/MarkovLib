///////////////////////////////////////////////////////////////////
//                                                               //
// Markovobjekt fuer LV Zahlungsstroeme                          //
//                                                               //
// Autor Michael Koller                                          //
//                                                               //
// Datum: March 2011: erstellt                                   //
//                                                               //
///////////////////////////////////////////////////////////////////

//#include "pch.h"
#include "omarkov.h"


const char * strPrgVersionStatic = "%% This is omarkov V2.10 - Michael Koller 2011/2022 For GitHub\n";

// Wenn deterministischer Zins, so steht der Zins für alle Elemente auf der Diagonale

// DIE FOLGENDEN ZEILEN FUER INLINE CODE - eg Zufallszahlgenerator + Tex

#define IM1 2147483563
#define IM2 2147483399
#define AM (1.0/IM1)
#define IMM1 (IM1-1)
#define IA1 40014
#define IA2 40692
#define IQ1 53668
#define IQ2 52774
#define IR1 12211
#define IR2 3791
#define NTAB 32
#define NDIV (1+IMM1/NTAB)
#define EPS 1.2e-7
#define RNMX (1.0-EPS)

float ran2(long *idum)
{
  int j;
  long k;
  static long idum2=123456789;
  static long iy=0;
  static long iv[NTAB];
  float temp;

  if (*idum <= 0) {
    if (-(*idum) < 1) *idum=1;
    else *idum = -(*idum);
    idum2=(*idum);
    for (j=NTAB+7;j>=0;j--) {
      k=(*idum)/IQ1;
      *idum=IA1*(*idum-k*IQ1)-k*IR1;
      if (*idum < 0) *idum += IM1;
      if (j < NTAB) iv[j] = *idum;
    }
    iy=iv[0];
  }
  k=(*idum)/IQ1;
  *idum=IA1*(*idum-k*IQ1)-k*IR1;
  if (*idum < 0) *idum += IM1;
  k=idum2/IQ2;
  idum2=IA2*(idum2-k*IQ2)-k*IR2;
  if (idum2 < 0) idum2 += IM2;
  j=iy/NDIV;
  iy=iv[j]-idum2;
  iv[j] = *idum;
  if (iy < 1) iy += IMM1;
  if ((temp=AM*iy) > RNMX) return RNMX;
  else return temp;
}
#undef IM1
#undef IM2
#undef AM
#undef IMM1
#undef IA1
#undef IA2
#undef IQ1
#undef IQ2
#undef IR1
#undef IR2
#undef NTAB
#undef NDIV
#undef EPS
#undef RNMX
/* (C) Copr. 1986-92 Numerical Recipes Software +1[L. */

void vPrintTexNumber(FILE* psymFile, double dNumber)
{
  const char *pcTexFormat[]=
  {
    " & %10.6f",  // For small numbers
    " & %10.3f",  // for big numbers such as cash flows and mr
    " & %10.1f"   // for big numbers such as cash flows and mr
  };

    if (dNumber > 10000 || dNumber < -10000  ) fprintf(psymFile,pcTexFormat[2],dNumber);
    else{
         if (dNumber > 100 || dNumber < -100  ) fprintf(psymFile,pcTexFormat[1],dNumber);
         else fprintf(psymFile,pcTexFormat[0],dNumber);
         }
}


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
///////////////////////////////////////////////////////////////////////////////
// Die folgende Klasse implementiert einen verketteten Leistungs oder W'keits-vektor

ILV_VECTOR::ILV_VECTOR(long lXDim, long lVonIpt, long lNachIpt)
{
  lXMax    = lXDim;
  plValues = new long [lXMax];
  lVon     = lVonIpt;
  lNach    = lNachIpt;
  psymNext = NULL;
  memset(plValues, 0, lXMax * sizeof(long));
}

ILV_VECTOR::~ILV_VECTOR()
{
  delete(plValues);
}

void ILV_VECTOR::vReset()
{
  memset(plValues, 0, lXMax * sizeof(long));
}

long ILV_VECTOR::lSetValue(long lX, long lValue)
{
  if(lX >= 0 && lX < lXMax)
    {
      plValues[lX] = lValue;
      return(plValues[lX]);
    }	
  return(lValue - 1);
}

long ILV_VECTOR::lAddValue(long lX, long lValue)
{
  if(lX >= 0 && lX < lXMax)
    {
      plValues[lX] += lValue;
      return(plValues[lX]);
    }	
  return(0);
}

long ILV_VECTOR::lGetValue(long lX)
{
  if(lX >= 0 && lX < lXMax)
    {
      return(plValues[lX]);
    }	
  return(0);
}
/////////////////////////////////////////////////////////////////////

LV_MATRIX::LV_MATRIX(long lXDim, long lYDim, long lIdentIpt)
{
  long lIc1;
  double * pdTemp;
  pdValues = new double [lXDim*lYDim];
  ppdValues = new double * [lXDim]; 
  pdTemp = pdValues;
  for(lIc1 = 0; lIc1 < lXDim; ++ lIc1)
    {
      ppdValues[lIc1] = pdTemp;
      pdTemp += lYDim;
    }
  lXMax    = lXDim;
  lYMax    = lYDim;
  lIdent   = lIdentIpt;
  psymNext = NULL;
  memset(pdValues, 0, lXMax * lYMax * sizeof(double));
}

LV_MATRIX::~LV_MATRIX()
{
  delete(pdValues);
  delete(ppdValues);
}

void LV_MATRIX::vReset()
{
  memset(pdValues, 0, lXMax * lYMax * sizeof(double));
}

double LV_MATRIX::dSetValue(long lX, long lY, double dValue)
{
  if(lX >= 0 && lX < lXMax && lY >= 0 && lY < lYMax  )
    {
      ppdValues[lX][lY] = dValue;
      return(ppdValues[lX][lY]);
    }	
  return(dValue - 1.);
}

double LV_MATRIX::dAddValue(long lX, long lY, double dValue)
{
  if(lX >= 0 && lX < lXMax && lY >= 0 && lY < lYMax  )
    {
      ppdValues[lX][lY] += dValue;
      return(ppdValues[lX][lY]);
    }	
  return(0.);
}

double LV_MATRIX::dMultiplyValue(long lX, long lY, double dValue)
{
  if(lX >= 0 && lX < lXMax && lY >= 0 && lY < lYMax  )
    {
      ppdValues[lX][lY] *= dValue;
      return(ppdValues[lX][lY]);
    }	
  return(0.);
}

double LV_MATRIX::dGetValue(long lX, long lY)
{
  if(lX >= 0 && lX < lXMax && lY >= 0 && lY < lYMax  )
    {
      return(ppdValues[lX][lY]);
    }	
  return(0.);
}


MARKOVLV::MARKOVLV(long lMaxTimesIpt, long lMaxStatesIpt, long lNrDefMomentsIpt)
{
  long lC1;
  LV_VECTOR ** psymVectTemp;

  // Im folgenden werden Alle defaults gesetzt. NULL bedeutet dass wir hier einen
  // Null pointer haben eg 0x0000. Das bedeutet, dass keine Elemente in der 
  // entsprechenden Kette vorhanden sind und kein Memory alloziert
  lMaxTimes  = lMaxTimesIpt;
  if (lMaxTimes < 0) lMaxTimes = 1;
  lMaxStates = lMaxStatesIpt;
  if (lMaxStates < 0) lMaxStates = 1; // Both to avoid memory leaks
  lStartTime = 0l;
  lStopTime  = 0l;
  lNrStates  = 0l;
  lNrDefaultMoments = lNrDefMomentsIpt;
  psymPre    = NULL;
  psymPost   = NULL;
  psymPij    = NULL;
  psymDisc   = NULL;
  psymDK     = NULL;
  psymCF     = NULL;
  dAddBenefits = false; 
  psymTable1 = NULL;
  psymTable2 = NULL;

#ifdef  DUMP_MARKOV_OBJ
  {
    FILE * psymDFObj;
    psymDFObj = fopen("c:\\omark.dat","w");
    fprintf(psymDFObj,"\n Objekt Markov: Dump");
  }
#endif

  // Die Idee der folgenden Pointers zB ppsymPreInfo ist auf das entsprechende Element in
  // den entsprechenden Datapools (in diesem Fall psymPre) zu zeigen um so einfach darauf
  // zugreifen zu koennen. Somit werden zuerst die entsprechenden Pointers angelegt und
  // mit NULL belegt, was heisst, dass dieser Vektor noch nicht existiert.
  // DIESE ARBEIT STARTET HIER ....
  ppsymPreInfo = new LV_VECTOR * [lMaxStates];
  for(lC1=0; lC1 < lMaxStates; ++ lC1)  ppsymPreInfo[lC1] = NULL;

  pppsymPostInfo = new LV_VECTOR ** [lMaxStates];
  psymVectTemp   = new LV_VECTOR *  [lMaxStates*lMaxStates];
  for(lC1=0; lC1 < lMaxStates*lMaxStates; ++ lC1)  psymVectTemp[lC1] = NULL;
  for(lC1=0; lC1 < lMaxStates; ++ lC1)
    {
      pppsymPostInfo[lC1]  = psymVectTemp;
      psymVectTemp        += lMaxStates; 
    }

  pppsymPijInfo  = new LV_VECTOR ** [lMaxStates];
  psymVectTemp   = new LV_VECTOR *  [lMaxStates*lMaxStates];
  for(lC1=0; lC1 < lMaxStates*lMaxStates; ++ lC1)  psymVectTemp[lC1] = NULL;
  for(lC1=0; lC1 < lMaxStates; ++ lC1)
    {
      pppsymPijInfo[lC1]  = psymVectTemp;
      psymVectTemp        += lMaxStates; 
    }


  pppsymDiscInfo = new LV_VECTOR ** [lMaxStates];
  psymVectTemp   = new LV_VECTOR *  [lMaxStates*lMaxStates];
  for(lC1=0; lC1 < lMaxStates*lMaxStates; ++ lC1)  psymVectTemp[lC1] = NULL;
  for(lC1=0; lC1 < lMaxStates; ++ lC1)
    {
      pppsymDiscInfo[lC1]  = psymVectTemp;
      psymVectTemp        += lMaxStates; 
    }

  ppsymCFInfo = new LV_MATRIX * [lMaxStates];
  for(lC1=0; lC1 < lMaxStates; ++ lC1) ppsymCFInfo[lC1] = NULL;

  // ... ENDET HIER

  lDKCalculated       = 0l; // Keine DKs berechnet
  lCFCalculated       = 0l; // Keine CFs berechnet
  bGetData            = false; // Wir schreiben Data
  bStochasticInterest = DEF_STOC_INT; // Normalerweise standart Zinsmodell
  for(lC1=0; lC1 < MAXMOMENTE; ++ lC1)
    psymDKInfo[lC1] = NULL; // Keine DK Pointers vorhanden

  // FOR risk premium
  lTechZerCalculated = 0; // Technische Zerlegung nicht berechnet
  plFolgezustand = new long [lMaxStates];
  for(lC1=0; lC1 < lMaxStates; ++ lC1) plFolgezustand[lC1] = lC1;

  // Fuer Simulation
  psymAktTraj = NULL;
  psymAktDisc = NULL;
  psymAktCF   = NULL;
  psymAktDK   = NULL;
  lSeed       = 1234567l;
  lInitState  = 0l;
  lNrTrajSim  = 0l;
  psymAggregCF= NULL;
  psymAggregDK= NULL;
} 


MARKOVLV::~MARKOVLV()
{ 
// Hier wird alles aufgeraeumt und die Daten frei gegeben
  LV_VECTOR * psymVectTmp, * psymOld;
  LV_MATRIX * psymMatrTmp, * psymMatrOld;

  // Wir gehen jeder Kette entlang und geben das entsprechende Memory frei
  // mit psymVectTmp = psymVectTmp->psymNext hangeln wir uns entlang der Kette
  // So lange bis wir auf das letzte Element kommen, 
  // bei welchem psymVectTmp == NULL
  // DIESE ARBEIT STARTED HIER .....
  for(psymVectTmp = psymPre;psymVectTmp != NULL;)
    { 
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymVectTmp = psymPost;psymVectTmp != NULL;)
    {
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymVectTmp = psymPij;psymVectTmp != NULL;)
    {
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymVectTmp = psymDisc;psymVectTmp != NULL;)
    {
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymMatrTmp = psymDK;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }

  for(psymMatrTmp = psymCF;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }
  // ... ENDET HIER, jetzt muessen wir noch die 
  //                     Infopointers loeschen:
  delete(*pppsymPostInfo);
  delete(*pppsymPijInfo);
  delete(*pppsymDiscInfo);
  delete(pppsymPostInfo);
  delete(pppsymPijInfo);
  delete(pppsymDiscInfo);
  delete(ppsymPreInfo);
  delete(ppsymCFInfo);
  delete(plFolgezustand);
  if(psymAktTraj  != NULL) delete(psymAktTraj);
  if(psymAktCF    != NULL) delete(psymAktCF);
  if(psymAktDK    != NULL) delete(psymAktDK);
  if(psymAggregCF != NULL) delete(psymAggregCF);
  if(psymAggregDK != NULL) delete(psymAggregDK);
  if(psymAktDisc  != NULL) delete(psymAktDisc);
  if(psymTable1   != NULL) delete(psymTable1);
  if(psymTable2   != NULL) delete(psymTable2);

  lNrTrajSim     = 0l;
}

void MARKOVLV::vReset()
{ // Im wesentlichen werden die volatilen Teile der Daten wie beim
  // Destruktor geloescht - Kommentare she dort
  // Im Gegensatz zum Destruktor werden die Info-pointers nicht geloescht
  // und nur auf NULL (eg "keine Daten vorhanden") gesetzt

  LV_VECTOR * psymVectTmp, * psymOld;
  LV_MATRIX * psymMatrTmp, * psymMatrOld;
  long lC1;

  lDKCalculated =0l;
  lCFCalculated =0l;
  dAddBenefits = false;

  for(psymVectTmp = psymPre;psymVectTmp != NULL;)
    {
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymVectTmp = psymPost;psymVectTmp != NULL;)
    {
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymVectTmp = psymPij;psymVectTmp != NULL;)
    {
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymVectTmp = psymDisc;psymVectTmp != NULL;)
    {
      psymOld = psymVectTmp;
      psymVectTmp = psymVectTmp->psymNext;
      delete(psymOld);
    }

  for(psymMatrTmp = psymDK;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }

  for(psymMatrTmp = psymCF;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }
  for(lC1=0; lC1 < lMaxStates*lMaxStates; ++ lC1)  
    {
      (*pppsymPostInfo)[lC1] = NULL;
      (*pppsymPijInfo)[lC1] = NULL;
      (*pppsymDiscInfo)[lC1] = NULL;
    }

  for(lC1=0; lC1 < lMaxStates; ++ lC1)  
    {
      ppsymPreInfo[lC1] = NULL;
    }

  psymPre   = NULL;
  psymPost  = NULL;
  psymPij   = NULL;
  psymDisc  = NULL;
  psymDK    = NULL;
  psymCF    = NULL;

  for(lC1=0; lC1 < MAXMOMENTE; ++ lC1)
    psymDKInfo[lC1] = NULL;

  for(lC1=0; lC1 < lMaxStates; ++ lC1) 
    ppsymCFInfo[lC1] = NULL;

  for(lC1=0; lC1 < lMaxStates; ++ lC1) plFolgezustand[lC1] = lC1;


}

void MARKOVLV::vSetInternals(long lMaxTimesInput, long lMaxStatesInput)
{
  long lNrDefMomentsIpt = lNrDefaultMoments; 
  // Zuerst Löschen wir alles umd dann alles wieder aufzusetzen wie beim
  // Konstruktor
  {
    LV_VECTOR * psymVectTmp, * psymOld;
    LV_MATRIX * psymMatrTmp, * psymMatrOld;

    this->vReset(); // Dies loescht alles bei vorgegebener Sturktur
    // da hier aber die beiden 'Internals' neu gesetzt werden 
    // somit muessen die untenstehenden Daten zuerst geloescht und dann
    // wieder aufgesetzt werden.

    for(psymVectTmp = psymPre;psymVectTmp != NULL;)
      {
	psymOld = psymVectTmp;
	psymVectTmp = psymVectTmp->psymNext;
	delete(psymOld);
      }

    for(psymVectTmp = psymPost;psymVectTmp != NULL;)
      {
	psymOld = psymVectTmp;
	psymVectTmp = psymVectTmp->psymNext;
	delete(psymOld);
      }

    for(psymVectTmp = psymPij;psymVectTmp != NULL;)
      {
	psymOld = psymVectTmp;
	psymVectTmp = psymVectTmp->psymNext;
	delete(psymOld);
      }

    for(psymVectTmp = psymDisc;psymVectTmp != NULL;)
      {
	psymOld = psymVectTmp;
	psymVectTmp = psymVectTmp->psymNext;
	delete(psymOld);
      }

    for(psymMatrTmp = psymDK;psymMatrTmp != NULL;)
      {
	psymMatrOld = psymMatrTmp;
	psymMatrTmp = psymMatrTmp->psymNext;
	delete(psymMatrOld);
      }

    for(psymMatrTmp = psymCF;psymMatrTmp != NULL;)
      {
	psymMatrOld = psymMatrTmp;
	psymMatrTmp = psymMatrTmp->psymNext;
	delete(psymMatrOld);
      }

    delete(*pppsymPostInfo);
    delete(*pppsymPijInfo);
    delete(*pppsymDiscInfo);
    delete(pppsymPostInfo);
    delete(pppsymPijInfo);
    delete(pppsymDiscInfo);
    delete(ppsymPreInfo);
    delete(ppsymCFInfo);
    delete(plFolgezustand);

  } // Jetzt ist alles geloescht - wie beim Destruktor
  { // Und jetzt folgt derselbe Code fuer den Konstruktor mit
    // den neuen Parametern

    long lC1;
    LV_VECTOR ** psymVectTemp;

    lMaxTimes  = lMaxTimesInput;
    lMaxStates = lMaxStatesInput;
    lStartTime = 0l;
    lStopTime  = 0l;
    lNrStates  = 0l;
    lNrDefaultMoments = lNrDefMomentsIpt;
    psymPre    = NULL;
    psymPost   = NULL;
    psymPij    = NULL;
    psymDisc   = NULL;
    psymDK     = NULL;
    psymCF     = NULL;
    dAddBenefits = false;

    ppsymPreInfo = new LV_VECTOR * [lMaxStates];
    for(lC1=0; lC1 < lMaxStates; ++ lC1)  ppsymPreInfo[lC1] = NULL;

    pppsymPostInfo = new LV_VECTOR ** [lMaxStates];
    psymVectTemp   = new LV_VECTOR *  [lMaxStates*lMaxStates];
    for(lC1=0; lC1 < lMaxStates*lMaxStates; ++ lC1)  psymVectTemp[lC1] = NULL;
    for(lC1=0; lC1 < lMaxStates; ++ lC1)
      {
	pppsymPostInfo[lC1]  = psymVectTemp;
	psymVectTemp        += lMaxStates; 
      }

    pppsymPijInfo  = new LV_VECTOR ** [lMaxStates];
    psymVectTemp   = new LV_VECTOR *  [lMaxStates*lMaxStates];
    for(lC1=0; lC1 < lMaxStates*lMaxStates; ++ lC1)  psymVectTemp[lC1] = NULL;
    for(lC1=0; lC1 < lMaxStates; ++ lC1)
      {
	pppsymPijInfo[lC1]  = psymVectTemp;
	psymVectTemp        += lMaxStates; 
      }


    pppsymDiscInfo = new LV_VECTOR ** [lMaxStates];
    psymVectTemp   = new LV_VECTOR *  [lMaxStates*lMaxStates];
    for(lC1=0; lC1 < lMaxStates*lMaxStates; ++ lC1)  psymVectTemp[lC1] = NULL;
    for(lC1=0; lC1 < lMaxStates; ++ lC1)
      {
	pppsymDiscInfo[lC1]  = psymVectTemp;
	psymVectTemp        += lMaxStates; 
      }

    ppsymCFInfo = new LV_MATRIX * [lMaxStates];
    for(lC1=0; lC1 < lMaxStates; ++ lC1) ppsymCFInfo[lC1] = NULL;

    lDKCalculated       = 0l;
    lCFCalculated       = 0l;
    bGetData            = false;
    bStochasticInterest = DEF_STOC_INT;
    for(lC1=0; lC1 < MAXMOMENTE; ++ lC1)
      psymDKInfo[lC1] = NULL;

    lTechZerCalculated = 0;
    plFolgezustand = new long [lMaxStates];
    for(lC1=0; lC1 < lMaxStates; ++ lC1) plFolgezustand[lC1] = lC1;
  }

  if(psymAktTraj  != NULL) delete(psymAktTraj);
  if(psymAktCF    != NULL) delete(psymAktCF);
  if(psymAktDK    != NULL) delete(psymAktDK);
  if(psymAggregCF != NULL) delete(psymAggregCF);
  if(psymAggregDK != NULL) delete(psymAggregDK);
  if(psymAktDisc  != NULL) delete(psymAktDisc);
  lNrTrajSim     = 0l;
  psymAktTraj = NULL;
  psymAktDisc = NULL;
  psymAktCF   = NULL;
  psymAktDK   = NULL;
  lSeed       = 1234567l;
  lInitState  = 0l;
  lNrTrajSim  = 0l;
  psymAggregCF= NULL;
  psymAggregDK= NULL;
}

void MARKOVLV::vSetStartTime(long lTime)
{ // Hier wird die Startzeit gesetzt
  LV_MATRIX * psymMatrTmp;
  lStartTime = lTime;
  if(lTime <0) lStartTime = 0; // Plausibility checks
  if(lTime >= lMaxTimes) lStartTime = lMaxTimes-1;
  if(lDKCalculated > 0) lDKCalculated = -lDKCalculated; // wenn berechnet, muss das neu
  // berechnet werden. Dies bedeutet diese negative Zahl
  for(psymMatrTmp = psymDK;psymMatrTmp != NULL;psymMatrTmp = psymMatrTmp->psymNext)
    psymMatrTmp->vReset(); // Da die DKs nicht mehr gueltig sind, werden die auf Null gesetzt
  if(lCFCalculated > 0) lCFCalculated = -lCFCalculated; // Dto fuer Cash flows
  for(psymMatrTmp = psymCF;psymMatrTmp != NULL;psymMatrTmp = psymMatrTmp->psymNext)
    psymMatrTmp->vReset(); // auch hier CF auf Null gesetzt
}

void MARKOVLV::vSetStopTime(long lTime)
{ // Hier wird die Stopzeit neu gesetzt
  LV_MATRIX * psymMatrTmp;
  lStopTime = lTime;
  if(lTime <0) lStopTime = 0;
  if(lTime >= lMaxTimes) lStopTime = lMaxTimes-1;
  if(lDKCalculated > 0) lDKCalculated = -lDKCalculated; // Wie oben Berechnung ungueltig
  // und zuruecksetzten der Werte auf Null
  for(psymMatrTmp = psymDK;psymMatrTmp != NULL;psymMatrTmp = psymMatrTmp->psymNext)
    psymMatrTmp->vReset();
  if(lCFCalculated > 0) lCFCalculated = -lCFCalculated;
  for(psymMatrTmp = psymCF;psymMatrTmp != NULL;psymMatrTmp = psymMatrTmp->psymNext)
    psymMatrTmp->vReset();
}

void MARKOVLV::vSetNrStates(long lNrStatesIpt)
{ // Setzten der Anzahl Zustaende
  long lC1;
  LV_MATRIX * psymMatrTmp, * psymMatrOld;
  lNrStates = lNrStatesIpt;
  if(lNrStatesIpt <0) lNrStates = 1;
  if(lNrStatesIpt >= lMaxStates) lNrStates = lMaxStates; // Hier muss man aufpassen!!
  // Wenn das Objekt zB mit max 5 zustaenden kreiert wurde kann man hier nicht 8 zustaende
  // wollen. Das prg setzt auf das max - im Bsp 5
  lDKCalculated = 0; // Jetzt wird alles zurueckgesetzt - im Gegensatz zu dem aendern der Zeiten
  lCFCalculated = 0; // Im Folgenden alle Datenstrukturen loeschen.
  for(psymMatrTmp = psymDK;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }

  for(psymMatrTmp = psymCF;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }
  for(lC1=0; lC1 < MAXMOMENTE; ++ lC1)
    psymDKInfo[lC1] = NULL;

}

void   MARKOVLV::vSetGetData(bool bStatus)
{
  bGetData = bStatus;
}

double MARKOVLV::dSetPre(long lTime, long lVon, long lNach, double dValue)
{ // Hier wird a_i(t) gesetzt, danach alle andern. 
  // Das interessante ist die Datenstruktur. Falls bereits ein Vektor angelegt ist,
  // so muss der wert nur gesetzt werden (CC). andernfalls muss am ende der entsprechenden
  // kette ein neuer vektor (AA) angelegt werden. Hierfuer muss der letzte wert gefunden 
  // werden (BB)
  LV_VECTOR * psymTemp;
  if(bGetData)
    {
      if(ppsymPreInfo[lVon] == NULL)
	{
	  return(0.);
	}
      return(ppsymPreInfo[lVon]->dGetValue(lTime));
    }

  if(ppsymPreInfo[lVon] == NULL) // Wir sind in Fall AA und suchen BB
    {
      if(psymPre == NULL) // erster wert BB gefunden
	{	
	  psymPre = new LV_VECTOR(lMaxTimes, lVon, lVon); // neuer vektor AA
	  ppsymPreInfo[lVon] = psymPre; // wo sitzt er
	}
      else
	{
	  for(psymTemp=psymPre; psymTemp->psymNext != NULL;) // wir suchen letzten wert
	    psymTemp =psymTemp -> psymNext;
	  psymTemp -> psymNext = new LV_VECTOR(lMaxTimes, lVon, lVon); // gefunden BB und setzen AA
	  ppsymPreInfo[lVon] = psymTemp -> psymNext;
			
	}
    }
  if (dAddBenefits) return(ppsymPreInfo[lVon]->dAddValue(lTime, dValue)); // Jetzt setzen wird Wert CC
  else return(ppsymPreInfo[lVon]->dSetValue(lTime, dValue)); // CC
}

double MARKOVLV::dSetPost(long lTime, long lVon, long lNach, double dValue)
{ // Genau wie oben setze nur Marker AA, BB, CC
  LV_VECTOR * psymTemp;
  if(bGetData)
    {
      if(pppsymPostInfo[lVon][lNach] == NULL)
	{
	  return(0.);
	}
      return(pppsymPostInfo[lVon][lNach]->dGetValue(lTime));
    }

  if(pppsymPostInfo[lVon][lNach] == NULL)
    {
      if(psymPost == NULL)  // BB
	{	
	  psymPost = new LV_VECTOR(lMaxTimes, lVon, lNach); // AA
	  pppsymPostInfo[lVon][lNach] = psymPost; // und setzen info
	}
      else
	{
	  for(psymTemp=psymPost; psymTemp->psymNext != NULL;) // BB
	    psymTemp =psymTemp -> psymNext;
	  psymTemp -> psymNext = new LV_VECTOR(lMaxTimes, lVon, lNach); // AA
	  pppsymPostInfo[lVon][lNach] = psymTemp -> psymNext; // und setzen info
			
	}
    }
  if (dAddBenefits) return(pppsymPostInfo[lVon][lNach]->dAddValue(lTime, dValue));
  else return(pppsymPostInfo[lVon][lNach]->dSetValue(lTime, dValue)); // CC
}


double MARKOVLV::dSetPij(long lTime, long lVon, long lNach, double dValue)
{ // ANALOG post
  LV_VECTOR * psymTemp;
  if(bGetData)
    {
      if(pppsymPijInfo[lVon][lNach] == NULL)
	{
	  return(0.);
	}
      return(pppsymPijInfo[lVon][lNach]->dGetValue(lTime));
    }

  if(pppsymPijInfo[lVon][lNach] == NULL)
    {
      if(psymPij == NULL) 
	{	
	  psymPij = new LV_VECTOR(lMaxTimes, lVon, lNach);
	  pppsymPijInfo[lVon][lNach] = psymPij;
	}
      else
	{
	  for(psymTemp=psymPij; psymTemp->psymNext != NULL;)
	    psymTemp =psymTemp -> psymNext;
	  psymTemp -> psymNext = new LV_VECTOR(lMaxTimes, lVon, lNach);
	  pppsymPijInfo[lVon][lNach] = psymTemp -> psymNext;
			
	}
    }
  return(pppsymPijInfo[lVon][lNach]->dSetValue(lTime, dValue));
}
	

double MARKOVLV::dSetDisc(long lTime, long lVon, long lNach, double dValue)
{ // analog post
  LV_VECTOR * psymTemp;
  if(bStochasticInterest == false) lNach = lVon;
  if(bGetData)
    {
      if(pppsymDiscInfo[lVon][lNach] == NULL)
	{
	  return(0.);
	}
      return(pppsymDiscInfo[lVon][lNach]->dGetValue(lTime));
    }

  if(pppsymDiscInfo[lVon][lNach] == NULL)
    {
      if(psymDisc == NULL) 
	{	
	  psymDisc = new LV_VECTOR(lMaxTimes, lVon, lNach);
	  pppsymDiscInfo[lVon][lNach] = psymDisc;
	}
      else
	{
	  for(psymTemp=psymDisc; psymTemp->psymNext != NULL;)
	    psymTemp =psymTemp -> psymNext;
	  psymTemp -> psymNext = new LV_VECTOR(lMaxTimes, lVon, lNach);
	  pppsymDiscInfo[lVon][lNach] = psymTemp -> psymNext;
	}
    }
  return(pppsymDiscInfo[lVon][lNach]->dSetValue(lTime, dValue));
}
	

void MARKOVLV::vSetInterestModel(bool bStocInterest)
{
  if(bStochasticInterest != bStocInterest) vReset();  
  bStochasticInterest = bStocInterest;
}

void MARKOVLV::vSetDefaultNrMoments(long lNrMoments)
{ // wie beim aendern der Zeiten etc, selbes vorgehen
  LV_MATRIX * psymMatrTmp, * psymMatrOld;
  long lC1;

  for(psymMatrTmp = psymDK;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }

  for(psymMatrTmp = psymCF;psymMatrTmp != NULL;)
    {
      psymMatrOld = psymMatrTmp;
      psymMatrTmp = psymMatrTmp->psymNext;
      delete(psymMatrOld);
    }

  for(lC1=0; lC1 < MAXMOMENTE; ++ lC1)
    psymDKInfo[lC1] = NULL;

  for(lC1=0; lC1 < lMaxStates; ++ lC1) 
    ppsymCFInfo[lC1] = NULL;

  lDKCalculated =0l;
  lCFCalculated =0l;

  lNrDefaultMoments = lNrMoments;
}

double MARKOVLV::dGetDK(long lTime, long lState, long lMoment)
{
  // Hier wird wirklich etwas gerechnet. Es gibt zwei Faelle. Wenn es berechnt ist
  // muss nur der Wert zurueckgegeben werden, sonst rechnen
  int lC1;
  LV_MATRIX * psymTempMatr;
  if(lMoment <= 0) lMoment = 1;
  if(lDKCalculated >= lMoment) // Alle Werte bis zum lDKCalculated Moment berechnet 
    {                          // ... gut und wir koennen nur den Wert zurueckgeben
      return(psymDKInfo[lMoment]->dGetValue(lTime, lState));
    }
  if(lDKCalculated == 0) // In diesem Fall muessen wir rechnen
    { // Zuerst muessen wir fuer jedes Moment eine matrix zeit x zustand 
      // bereitstellen ... START
      psymDK = new LV_MATRIX(lMaxTimes, lNrStates, 1l);
      psymTempMatr  = psymDK;
      psymDKInfo[1] = psymDK;

      for(lC1=2; lC1<= lNrDefaultMoments; ++lC1)
	{
	  psymTempMatr->psymNext = new LV_MATRIX(lMaxTimes, lNrStates, lC1);
	  psymDKInfo[lC1] = psymTempMatr->psymNext;
	  psymTempMatr    = psymTempMatr->psymNext;
        }
    } // .. END DATEN BEREITSTELLEN
  {   // Jetzt beginnen wir zu rechnen
    /* ------------------------------------------------------------- */
    /* 0. Variabeln definieren und belegen                           */
    /* ------------------------------------------------------------- */
    long   laufzeit;                                                   
    long   itemp, jtemp, kstate;                                                        
    long   istate, jstate;   /* zustand i -> zustand j               */
    double akt_disk;         /* diskont fuer aktuelle periode        */
    double p_ij_t;           /* uebergangswahrscheinlichkei  t       */
    double l_ij_tv, l_ij_tn; /* leistung die beim uebergang faeloig wird */
    double dBin[MAXMOMENTE][MAXMOMENTE];
    long   lOrdn;
    LV_VECTOR * psymTemp;

    /* ------------------------------------------------------------- */
    /* 1. Randbedingung belegen und relev Uebergaenge bestimmen      */                                     
    /* ------------------------------------------------------------- */
    for(itemp=0;itemp<MAXMOMENTE;++itemp)
      {
	memset(dBin[itemp],0,MAXMOMENTE*sizeof(double));
      }

    for(itemp=0;itemp<=lNrDefaultMoments;++itemp)
      {
	for(jtemp=0; jtemp<=itemp;++jtemp)
	  {
	    if(jtemp == 0 || jtemp == itemp)
	      {
		dBin[itemp][jtemp] =1.;
	      }
	    else
	      {
		dBin[itemp][jtemp] = dBin[itemp-1][jtemp-1] + dBin[itemp-1][jtemp];
	      }
	  }
      }

 

    /* ------------------------------------------------------------- */
    /* 2. Eigentliche Rechnung                                       */                    
    /* ------------------------------------------------------------- */
    /* an dieser stelle soll die verwendte formel erklaert werden    */
    /* mit Vj bezeichne man die reserve                              */
    /* dann gilt :                                                   */
    /* Vj(t) = summe(g) [ pjg(t,s)(z(j,g) + eing-disk * Vg(s)]       */
    /* wobei z(j,g) die faellige Leist bezeichnet                    */
    /* ------------------------------------------------------------- */
    for(laufzeit = lStartTime - 1; laufzeit >= lStopTime; --laufzeit)
      {   
  
	for(lOrdn=1;lOrdn<=lNrDefaultMoments;++lOrdn)
	  {	

	    for(psymTemp = psymPij;psymTemp != NULL; psymTemp = psymTemp->psymNext)
		  
	      {
		istate = psymTemp->lVon;
		jstate = psymTemp->lNach;  

		if(bStochasticInterest) kstate = jstate;
		else                    kstate = istate;
		  
		if(pppsymDiscInfo[istate][kstate] != NULL)
		  akt_disk = pppsymDiscInfo[istate][kstate]->dGetValue(laufzeit);   
                                                /* aktueller diskont fuer 1 periode */
		else
		  akt_disk = 0.;

 		/* uebergangsw'keit */
		p_ij_t =psymTemp->dGetValue(laufzeit);
		/* dabei faellige leistung */
		if(pppsymPostInfo[istate][jstate] != NULL)
		  l_ij_tn =pppsymPostInfo[istate][jstate]->dGetValue(laufzeit);
		else 
		  l_ij_tn = 0.;
		{
		  double dTeil = 0.;
		  double dFakt = 1.;
		  int    iLocC;
		  for(iLocC=0; iLocC<lOrdn;++iLocC)
		    {
	   dTeil  += dBin[lOrdn][iLocC]*dFakt*psymDKInfo[lOrdn-iLocC]->dGetValue(laufzeit+1,jstate);
	   dFakt  *= l_ij_tn;
		    }
		  dTeil  += dFakt;
		  psymDKInfo[lOrdn]->dAddValue(laufzeit,istate, p_ij_t* pow(akt_disk,lOrdn) * dTeil);
		}
		/* veraenderung der reserve */
		//l_ij_tn + *(m->reserve[jstate]+laufzeit + 1)));  
    
	      }
	    /*ie.: reserve +=        leistv+w'keit *(  diskont  *(leistn + reserve )) */
	  }
	for(istate = 0; istate < lNrStates; ++istate)
	  {
	    double dOld[MAXMOMENTE];
	    memset(dOld, 0, MAXMOMENTE * sizeof(double));
	    if(ppsymPreInfo[istate] != NULL)
	      l_ij_tv = ppsymPreInfo[istate]->dGetValue(laufzeit);  
	    else
	      l_ij_tv = 0.;
	    for(lOrdn=1;lOrdn<=lNrDefaultMoments;++lOrdn)
	      {
		dOld[lOrdn] =	psymDKInfo[lOrdn]->dGetValue(laufzeit,istate);
	      }

	    for(lOrdn=1;lOrdn<=lNrDefaultMoments;++lOrdn)
	      {
		double dTeil = 0.;
		double dFakt = 1.;
		int    iLocC;
			
		for(iLocC=0; iLocC<lOrdn;++iLocC)
		  {
		    dTeil  += dBin[lOrdn][iLocC] * dFakt *  dOld[lOrdn-iLocC]; 
		    dFakt  *= l_ij_tv;
		  }
		dTeil  += dFakt;
		psymDKInfo[lOrdn]->dSetValue(laufzeit,istate,dTeil);
	      }
	  }
      }
  }

  lDKCalculated = lNrDefaultMoments;  // Jetzt sagen wir dem objekt dass wir berechnet
                                      // laben, was wir wollten
  if(lMoment > lDKCalculated) return(0.);
  return(psymDKInfo[lMoment]->dGetValue(lTime, lState)); // geben resultat zurueck.
}

double MARKOVLV::dGetCF(long lTime, long lInitState, long lTimeState)
{
  int lC1;
  LV_MATRIX * psymTempMatr;
  if(lInitState >= lNrStates || lInitState < 0 || lTimeState >= lNrStates || lTimeState <0) return(0.);
  if(lCFCalculated > 0)
    {
      return(ppsymCFInfo[lInitState]->dGetValue(lTime, lTimeState));
    }
  if(lCFCalculated == 0)
    {
      psymCF = new LV_MATRIX(lMaxTimes, lNrStates, 1l);
      psymTempMatr  = psymCF;
      ppsymCFInfo[0] = psymCF;

      for(lC1=1; lC1< lNrStates; ++lC1)
	{
	  psymTempMatr->psymNext = new LV_MATRIX(lMaxTimes, lNrStates, lC1);
	  ppsymCFInfo[lC1] = psymTempMatr->psymNext;
	  psymTempMatr     = psymTempMatr->psymNext;
        }
    }
  /* Calculation of CF -- Start */
  {                                                                  
    /* ------------------------------------------------------------- */
    /* 0. Variabeln definieren und belegen                           */
    /* ------------------------------------------------------------- */
    long   laufzeit;                                                   
    long   istate, jstate, kstate;   /* zustand i -> zustand j       */
    long   lCStartState;
    double akt_disk;         /* diskont fuer aktuelle periode        */
    double p_ij_t;           /* uebergangswahrscheinlichkei  t       */
    double l_ij_tv, l_ij_tn; /* leistung die beim uebergang faeloig wird */
    LV_VECTOR * psymTemp;
    double * pdPNext;
    double * pdPJetzt;

    pdPJetzt = new double [lNrStates]; 
    pdPNext  = new double [lNrStates]; 
  
    for(lCStartState = 0; lCStartState < lNrStates; ++ lCStartState)
      {
	memset(pdPJetzt, 0, lNrStates * sizeof(double));
	pdPJetzt[lCStartState] = 1;

	/* ------------------------------------------------------------- */
	/* 2. Eigentliche Rechnung                                       */                                      
	/* ------------------------------------------------------------- */
	/* an dieser stelle soll die verwendte formel erklaert werden    */
	/* mit Vj bezeichne man die reserve                              */
	/* dann gilt :                                                   */
	/* Vj(t) = summe(g) [ pjg(t,s)(z(j,g) + eing-disk * Vg(s)]       */
	/* wobei z(j,g) die faellige Leist bezeichnet                    */
	/* ------------------------------------------------------------- */
	for(laufzeit = lStopTime ; laufzeit < lStartTime; ++laufzeit)
	  {   
	    memset(pdPNext, 0, lNrStates * sizeof(double));

	    for(psymTemp = psymPij;psymTemp != NULL; psymTemp = psymTemp->psymNext)
	      {
		istate = psymTemp->lVon;
		jstate = psymTemp->lNach;  

		if(bStochasticInterest) kstate = jstate;
		else                    kstate = istate;
	
		if(pppsymDiscInfo[istate][kstate] != NULL)
		  akt_disk = pppsymDiscInfo[istate][kstate]->dGetValue(laufzeit);   
                                    /* aktueller diskont fuer 1 periode */
		else
		  akt_disk = 0.;
		/* uebergangsw'keit */
		p_ij_t =psymTemp->dGetValue(laufzeit);
		pdPNext[jstate] += p_ij_t * pdPJetzt[istate];
		/* dabei faellige leistung */
		if(pppsymPostInfo[istate][jstate] != NULL)
		  l_ij_tn =pppsymPostInfo[istate][jstate]->dGetValue(laufzeit);
		else
		  l_ij_tn = 0.;

#ifndef ALLOCATE_CF_TO_EXACT_TIMES		
#pragma message (">>>> CF zu Zeit des beginns der Periode") 		
	  ppsymCFInfo[lCStartState]->dAddValue(laufzeit, istate, p_ij_t*( akt_disk * (l_ij_tn )));  
#else
#pragma message (">>>> CF zur exakte Zeit") 		
	  ppsymCFInfo[lCStartState]->dAddValue(laufzeit+1, jstate, p_ij_t* l_ij_tn );  
#endif
	      }
	    for(istate=0; istate<lNrStates; ++istate)
	      {
		if(ppsymPreInfo[istate] != NULL)
		  l_ij_tv = ppsymPreInfo[istate]->dGetValue(laufzeit);  
		else
		  l_ij_tv = 0.;
		ppsymCFInfo[lCStartState]->dAddValue(laufzeit, istate, l_ij_tv);  
	      }
       
	    /* 2a Überschieben mit Randverteilung */
	    for(istate = 0; istate < lNrStates; ++istate)    
	      ppsymCFInfo[lCStartState]->dMultiplyValue(laufzeit,istate, pdPJetzt[istate]);
	    for(istate = 0; istate < lNrStates; ++istate)    
	      pdPJetzt[istate] = pdPNext[istate] ;
	  }
      }
    delete(pdPJetzt);
    delete(pdPNext);
  } 
  /* Calculation of CF -- End */
  lCFCalculated = lNrStates; 
  return(ppsymCFInfo[lInitState]->dGetValue(lTime, lTimeState));
}

long     MARKOVLV::lGetMaxTime(){return(lMaxTimes);}
long     MARKOVLV::lGetNrStates(){return(lNrStates);}
long     MARKOVLV::lGetStartTime(){return(lStartTime);}
long     MARKOVLV::lGetStopTime(){return(lStopTime);}

double         MARKOVLV::dGetRP(long lTime, long lState) // Berechnet Risikopraemie
{
  long lNachNicht   = plFolgezustand[lState], kstate, lNach;
  double akt_disk, dWert= 0, dPart, dGeplant; 
  /* Nun abziehen des normalen Zustandes: funktional analog aber mit - */
  {
    lNach    = lNachNicht;
    dGeplant = dGetDK(lTime+1, lNach, 1l);
    if(pppsymPostInfo[lState][lNach] != NULL) 
      dGeplant += pppsymPostInfo[lState][lNach]->dGetValue(lTime+1);
  }
    
  for(lNach=0l; lNach < lNachNicht; ++lNach)
    {
      if(bStochasticInterest) kstate = lNach;
      else                    kstate = lState;
		  
      if(pppsymDiscInfo[lState][kstate] != NULL)
	akt_disk = pppsymDiscInfo[lState][kstate]->dGetValue(lTime);   
                                    /* aktueller diskont fuer 1 periode */
      else
	akt_disk = 0.;
      if(pppsymPijInfo[lState][lNach] != NULL)
	{
	  akt_disk = pppsymDiscInfo[lState][kstate]->dGetValue(lTime);
	  dPart = dGetDK(lTime+1, lNach, 1l) - dGeplant;
	  if(pppsymPostInfo[lState][lNach] != NULL) 
                          dPart += pppsymPostInfo[lState][lNach]->dGetValue(lTime+1);
	  dWert += akt_disk * pppsymPijInfo[lState][lNach]->dGetValue(lTime) * dPart;
	}
    }
  for(lNach=lNachNicht+1; lNach < lNrStates; ++lNach)
    {
      if(bStochasticInterest) kstate = lNach;
      else                    kstate = lState;
		  
      if(pppsymDiscInfo[lState][kstate] != NULL)
	akt_disk = pppsymDiscInfo[lState][kstate]->dGetValue(lTime);   
                                               /* aktueller diskont fuer 1 periode */
      else
	akt_disk = 0.;
      if(pppsymPijInfo[lState][lNach] != NULL)
	{
	  akt_disk = pppsymDiscInfo[lState][kstate]->dGetValue(lTime);
	  dPart = dGetDK(lTime+1, lNach, 1l) - dGeplant;
	  if(pppsymPostInfo[lState][lNach] != NULL) 
                          dPart += pppsymPostInfo[lState][lNach]->dGetValue(lTime+1);
	  dWert += akt_disk * pppsymPijInfo[lState][lNach]->dGetValue(lTime) * dPart;
	}
    }
  return(dWert);
}

double         MARKOVLV::dGetSP(long lTime, long lState) // Berechnet Sparpraemie 
{
  long lNach   = plFolgezustand[lState], kstate;
  double akt_disk; 
	
  if(bStochasticInterest) kstate = lNach;
  else                    kstate = lState;
		  
  if(pppsymDiscInfo[lState][kstate] != NULL)
    akt_disk = pppsymDiscInfo[lState][kstate]->dGetValue(lTime);   
                                           /* aktueller diskont fuer 1 periode */
  else
    akt_disk = 0.;
  return(akt_disk * dGetDK(lTime+1, lNach, 1l) - dGetDK(lTime, lState, 1l));
} 

double         MARKOVLV::dGetRegP(long lTime, long lState) // Berechnet Regulaeren Zahlungsstrom
{
  double dWert = 0;
  long lNach   = plFolgezustand[lState];
  if(ppsymPreInfo[lState]) dWert = ppsymPreInfo[lState]->dGetValue(lTime);
  if(pppsymPostInfo[lState][lNach]->dGetValue(lTime)) 
                               dWert += pppsymPostInfo[lState][lNach]->dGetValue(lTime);
  return(dWert);
}

long           MARKOVLV::lSetFolgezustand(long lStateVon, long lStateNach)
{
  if(!bGetData) 
    {
      plFolgezustand[lStateVon] = lStateNach;
      lTechZerCalculated = 0;
    }
  return(plFolgezustand[lStateVon]);
}

void           MARKOVLV::vSetInitState(long lInitState)
{
  this->lInitState = lInitState;
}

void          MARKOVLV::vGenerateTrajectory()
{
  /* Das ist die eigentliche Simualtionsroutine, welche hier sehr einfach implementiert ist. */
  long lTime;
  long lLastState;
  long lAktState, kstate;
  bool bExistTransition = false;
  double dSumProb, dRand;
  double l_ij_tv, l_ij_tn, akt_disk, dCF;
  double dDK;

  if (psymAktTraj == NULL) psymAktTraj = new ILV_VECTOR(lMaxTimes, 0, 0);
  if (psymAktCF   == NULL) psymAktCF   = new LV_VECTOR(lMaxTimes, 0, 0);;
  if (psymAktDK   == NULL) psymAktDK   = new LV_VECTOR(lMaxTimes, 0, 0);;
  if (psymAktDisc == NULL) psymAktDisc = new LV_VECTOR(lMaxTimes, 0, 0);;
  if (psymAggregCF== NULL) psymAggregCF= new LV_MATRIX(lMaxTimes, lNrStates, 0);
  if (psymAggregDK== NULL) psymAggregDK= new LV_MATRIX(lMaxTimes, lNrStates, 0);

  if(lStopTime <0) lStopTime = 0;
  if(lStopTime >= lMaxTimes) lStopTime = lMaxTimes-1;


  psymAktTraj->vReset();
  ++lNrTrajSim;
  lLastState  = lInitState;
  //printf("\n --> %ld ", lSeed);
  for (lTime = lStopTime; lTime < lStartTime; ++lTime)
    {
      dRand = ran2(&lSeed);
      dSumProb = 0.;
      bExistTransition = false;

      {
	for(lAktState=0; lAktState < lNrStates; ++ lAktState)
	  {
	    if(pppsymPijInfo[lLastState][lAktState] != NULL)
	      {
		bExistTransition = true;
		dSumProb += pppsymPijInfo[lLastState][lAktState]->dGetValue(lTime);
	      }
	    if (dSumProb > dRand)
	      {
		goto a;
	      }
	  }
	lAktState = lNrStates-1;
      }
    a:   psymAktTraj->lSetValue(lTime, lLastState);
	 
      //printf("\n %d -> %d %d", lTime, lAktState, lLastState); 
      if(!bExistTransition) 
	lAktState = lLastState;
      if(bStochasticInterest) kstate = lAktState;
      else                    kstate = lLastState;
      // Berechnen Zins t -> t + 1 
      if(pppsymDiscInfo[lLastState][kstate] != NULL)
	akt_disk = pppsymDiscInfo[lLastState][kstate]->dGetValue(lTime);   /* aktueller diskont fuer 1 periode */
      else
	akt_disk = 0.;
      psymAktDisc->dSetValue(lTime, akt_disk);
      // Berechnen Cash Flow per Anfang der Zeit t
      if(pppsymPostInfo[lLastState][lAktState] != NULL)
	l_ij_tn =pppsymPostInfo[lLastState][lAktState]->dGetValue(lTime);
      else
	l_ij_tn = 0.;
      if(ppsymPreInfo[lLastState] != NULL)
	l_ij_tv = ppsymPreInfo[lLastState]->dGetValue(lTime);  
      else
	l_ij_tv = 0.;

      dCF =l_ij_tv + akt_disk * l_ij_tn; 
      psymAktCF->dSetValue(lTime, dCF);
      psymAggregCF->dAddValue(lTime,lLastState, dCF);
      // Zeit Fortschreiben
      lLastState = lAktState;  
    }
  dDK = 0;
  for (lTime = lStartTime-1; lTime >= lStopTime; --lTime)
    {
      dDK = dDK * psymAktDisc->dGetValue(lTime) + psymAktCF->dGetValue(lTime);
      //printf("\n %d Disk %f CF %f DK %f",lTime, psymAktDisc->dGetValue(lTime), psymAktCF->dGetValue(lTime), dDK);
      psymAktDK->dSetValue(lTime,dDK);
      psymAggregDK->dAddValue(lTime,psymAktTraj->lGetValue(lTime),dDK);
    }

  //printf("\n lTime %d DK %f State %d TotDK %f", lTime, dDK, psymAktTraj->lGetValue(lTime), psymAggregDK->dGetValue(lTime,0));
}

long          MARKOVLV::vGetState(long lTime)
{
  if(psymAktTraj != NULL) return(psymAktTraj->lGetValue(lTime));
  else return(-1l);
}

double        MARKOVLV::dGetRandCF(long lTime)
{
  if(psymAktCF != NULL) return(psymAktCF->dGetValue(lTime));
  else return(-1.);
}

double        MARKOVLV::dGetRandDK(long lTime, long lMoment)
{
  if(psymAktDK != NULL) return(psymAktDK->dGetValue(lTime));
  else return(-1.);
}

double        MARKOVLV::dGetMeanCF(long lTime, long lState, long lNrSim)
{
  if(lNrSim == 0) return(0);
  while(lNrTrajSim < lNrSim)
    {
      vGenerateTrajectory();
    }
		
  return(psymAggregCF->dGetValue(lTime,lState)/lNrTrajSim); 
}

double        MARKOVLV::dGetMeanDK(long lTime, long lState, long lNrSim)
{
  if(lNrSim == 0) return(0);
  while(lNrTrajSim < lNrSim)
    {
      vGenerateTrajectory();
    }
		
  return(psymAggregDK->dGetValue(lTime,lState)/lNrTrajSim); 
}

void          MARKOVLV::vNewSeed(long lSeed)
{
  this->lSeed = lSeed;
}

void          MARKOVLV::vResetMeanResults()
{
  if(psymAktTraj  != NULL) delete(psymAktTraj);
  psymAktTraj = NULL;
  if(psymAktCF    != NULL) delete(psymAktCF);
  psymAktCF = NULL;
  if(psymAktDK    != NULL) delete(psymAktDK);
  psymAktDK = NULL;
  if(psymAggregCF != NULL) delete(psymAggregCF);
  psymAggregCF = NULL;
  if(psymAggregDK != NULL) delete(psymAggregDK);
  psymAggregDK = NULL;
  if(psymAktDisc  != NULL) delete(psymAktDisc);
  psymAktDisc = NULL;
  lNrTrajSim     = 0l;
}

void MARKOVLV::vPrintTeXFileName(char * pcFileName, bool bWithHeader, char * pcTitle, bool bAllEntries)
{
  FILE * psymTeXFile;

  psymTeXFile = NULL; // fopen_s(pcFileName, "w");
  if(!psymTeXFile)
    {
      printf("\n Could not open FILE\n");
    }
  else
    {
      vPrintTeX(psymTeXFile, bWithHeader, pcTitle, bAllEntries);
      int iMsg;
      iMsg = fclose(psymTeXFile); 
    }
    

  
}

void MARKOVLV::vPrintTeX(FILE * psymTeXFile, bool bWithHeader, char * pcTitle, bool bAllEntries)
{
    
  const char *pcTeXStart[]=
  {
"\\documentclass[11pt,a4paper]{article} \n",
"\\typeout{================================================================}\n",
"%%================================================================\n",
"%%\\usepackage{cl2emono}\n",
"%%\\usepackage{mkfoot}\n",
"\\usepackage[T1]{fontenc}%%\n",
"\\usepackage[ansinew]{inputenc,}%%\n",
"\\usepackage{a4}%%\n",
"\\usepackage{makeidx,multind,mathcomp}\n",
"\\usepackage{enumerate}%%\n",
"\\usepackage{color}%%\n",
"\\usepackage{amsfonts,amsmath,amssymb,amsthm,txfonts} %%%% txfonts hinzugef\\""{u}gt 2.12.2002\n",
"\\usepackage{supertabular}%%\n",
"\\usepackage[pdftex]{graphicx}\n",
"%%================================================================\n",
"\\usepackage[pdftex,\n",
"            colorlinks=true,            %% Schrift von Links in Farbe (true), sonst mit Rahmen (false)\n",
"            bookmarksnumbered=true,     %% Lesezeichen im pdf mit Nummerierung\n",
"            bookmarksopen=true,         %% Oeffnet die Lesezeichen vom pdf beim Start\n",
"            bookmarksopenlevel=0,       %% Default ist maxdim\n",
"            pdfstartview=FitH,          %% startet mit Seitenbreite\n",
"            linkcolor=blue,             %% Standard 'red'\n",
"            citecolor=blue,             %% Standard 'green'\n",
"            urlcolor=cyan,              %% Standard 'cyan'\n",
"            filecolor=blue,             %%\n",
"            plainpages=false,pdfpagelabels]{hyperref} %%\n",
"%%%%================================================================\n",
"\\parindent 0mm\n",
//	  "\\documentclass[a4paper]{article}\n",
    "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n",
    "%% Document generated by OMARKOV.cpp \n",
//   "\\usepackage[latin1]{inputenc}\n",
//    "\\usepackage{a4,latexsym}\n",
    "\\begin{document}\n",
    "\\begin{small} \n",
    ""
  };
  const char *pcTeXEnd[]=
  {
    "\\end{small}\n",   
    "\\end{document}\n",
    ""
  };
  const char *pcTeXTabular[]=
  {
    "%% ---------- Start Tabular  %s ---------- \n", /* Agument zB Seite 5 */
    "\\par \\bigskip      \n",
    "\\begin{tabular}{%s} \n",  /* Argument z.B. llll */
    "\\end{tabular}       \n",
    "\\par \\bigskip      \n",
    "%% ---------- End Tabular ---------- \n"
  };

  const char * pcTeXSections[]=
  {
    "\\section{%s} \n", /* Argument Titel */
    "\\subsection{General} \n",
    "\\newpage \\subsection{Probabilites} \n",
    "\\newpage \\subsection{Technical Interest} \n",
    "\\newpage \\subsection{Prenummerando Benefits} \n",
    "\\newpage \\subsection{Postnummerando Benefits} \n",
    "\\newpage \\subsection{Mathematical Reserves} \n",
    "\\newpage \\subsection{Cash Flows} \n"
  };

#define BOXBREITE  1.5cm
  char pcTableEntry[] = "\\makebox[1.5cm][r]{%s}";
  char pcTableEntryL[] = "\\makebox[1.5cm][r]{%ld}";
  int iC1;
  long lC1, lC2, lTime, lTime2;
  long lState1[MAX_TEX_ROWS];
  long lState2[MAX_TEX_ROWS];
  bool bFillRows;
  long lRowNumber;
  bool bOrgbGetData = bGetData;
  bGetData = true;
  /* 1. Header */
  fprintf(psymTeXFile,strPrgVersionStatic);
  if(bWithHeader)
    {
      for(iC1=0; *pcTeXStart[iC1]; ++ iC1)
	fprintf(psymTeXFile,pcTeXStart[iC1]);
    }

  /* 2. Allgemein */
  fprintf(psymTeXFile,pcTeXSections[0],pcTitle);
  fprintf(psymTeXFile,pcTeXSections[1]);
  fprintf(psymTeXFile,pcTeXTabular[0],"General");
  fprintf(psymTeXFile,pcTeXTabular[1]);
  fprintf(psymTeXFile,pcTeXTabular[2],"ll");  
  fprintf(psymTeXFile,"Max. Time  & %ld \\\\ \n",lGetMaxTime());
  fprintf(psymTeXFile,"Nr States  & %ld \\\\ \n",lGetNrStates());
  fprintf(psymTeXFile,"Start Time & %ld \\\\ \n",lGetStartTime());
  fprintf(psymTeXFile,"Stop Time  & %ld \\\\ \n",lGetStopTime());
  fprintf(psymTeXFile,"Prg Version  & %s \\\\ \n",strPrgVersionStatic+1);
  fprintf(psymTeXFile,pcTeXTabular[3]);  
  fprintf(psymTeXFile,pcTeXTabular[4]);  
  fprintf(psymTeXFile,pcTeXTabular[5]);  
  

  /* 3. Probabilities */
  fprintf(psymTeXFile,pcTeXSections[2]);
  bFillRows  = true;
  lRowNumber = 0;
  for(lC1=0; lC1<lGetNrStates(); ++ lC1)
    {
      for(lC2=0; lC2<lGetNrStates(); ++ lC2)
	{
	  if(bFillRows)
	    {
	      bool bCheck = false;
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  double dValue = dSetPij(lTime, lC1, lC2, 0.);
		  if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		}

	      if(bAllEntries) bCheck = true; 
	      if(bCheck){
		lState1[lRowNumber] =lC1;
		lState2[lRowNumber] =lC2;
		++lRowNumber;
		if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
	      }
	    }
	  else
	    {
	      lTime2 = 0;
	      fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
	      fprintf(psymTeXFile,pcTeXTabular[1]);
	      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
	      fprintf(psymTeXFile,"From ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      fprintf(psymTeXFile,"To ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  fprintf(psymTeXFile,"%ld ", lTime);
		  for(iC1=0; iC1 < lRowNumber; ++ iC1)
		    vPrintTexNumber(psymTeXFile, dSetPij(lTime, lState1[iC1], lState2[iC1], 0.));

		  fprintf(psymTeXFile,"\\\\ \n");
		  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
		    {fprintf(psymTeXFile,pcTeXTabular[3]);
		    fprintf(psymTeXFile,pcTeXTabular[4]);
		    fprintf(psymTeXFile,pcTeXTabular[5]);  
		    fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
		    fprintf(psymTeXFile,pcTeXTabular[1]);
		    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
		    fprintf(psymTeXFile,"From ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    fprintf(psymTeXFile,"To ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    lTime2 = -1;
		    }
		  ++lTime2;
		}
	      fprintf(psymTeXFile,pcTeXTabular[3]);
	      fprintf(psymTeXFile,pcTeXTabular[4]);
	      fprintf(psymTeXFile,pcTeXTabular[5]);  
	      bFillRows  = true;
	      lRowNumber = 0;
	      if(bFillRows)
		{
		  bool bCheck = false;
		  for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		    {
		      double dValue = dSetPij(lTime, lC1, lC2, 0.);
		      if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		    }

		  if(bAllEntries) bCheck = true; 
		  if(bCheck){
		    lState1[lRowNumber] =lC1;
		    lState2[lRowNumber] =lC2;
		    ++lRowNumber;
		    if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
		  }
		}

	    }
	}
    }
  if(lRowNumber > 0)
    {
      lTime2 = 0;
      fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
      fprintf(psymTeXFile,pcTeXTabular[1]);
      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
      fprintf(psymTeXFile,"From ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      fprintf(psymTeXFile,"To ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	{
	  fprintf(psymTeXFile,"%ld ", lTime);
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
	     vPrintTexNumber(psymTeXFile, dSetPij(lTime, lState1[iC1], lState2[iC1], 0.));
      fprintf(psymTeXFile,"\\\\ \n");
	  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
	    {fprintf(psymTeXFile,pcTeXTabular[3]);
	    fprintf(psymTeXFile,pcTeXTabular[4]);
	    fprintf(psymTeXFile,pcTeXTabular[5]);  
	    fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
	    fprintf(psymTeXFile,pcTeXTabular[1]);
	    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
	    fprintf(psymTeXFile,"From ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    fprintf(psymTeXFile,"To ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    lTime2 = -1;
	    }
	  ++lTime2;
	}
      fprintf(psymTeXFile,pcTeXTabular[3]);
      fprintf(psymTeXFile,pcTeXTabular[4]);
      fprintf(psymTeXFile,pcTeXTabular[5]);  
      bFillRows  = true;
      lRowNumber = 0;
    }

  /* 3. Disconts  */
  fprintf(psymTeXFile,pcTeXSections[3]);
  bFillRows  = true;
  lRowNumber = 0;
  for(lC1=0; lC1<lGetNrStates(); ++ lC1)
    {
      long lStartLoc, lStopLoc;
      if(bStochasticInterest)
	{
	  lStartLoc = 0;
	  lStopLoc  = lGetNrStates();
	}
      else
	{
	  lStartLoc = lC1;
	  lStopLoc  = lStartLoc + 1;
	}
      for(lC2=lStartLoc; lC2<lStopLoc; ++ lC2)
	{
	  if(bFillRows)
	    {
	      bool bCheck = false;
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  double dValue = dSetDisc(lTime, lC1, lC2, 0.);
		  if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		}

	      if(bAllEntries) bCheck = true; 
	      if(bCheck){
		lState1[lRowNumber] =lC1;
		lState2[lRowNumber] =lC2;
		++lRowNumber;
		if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
	      }
	    }
	  else
	    {
	      lTime2 = 0;
	      fprintf(psymTeXFile,pcTeXTabular[0],"Disc.");
	      fprintf(psymTeXFile,pcTeXTabular[1]);
	      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
	      fprintf(psymTeXFile,"From ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      fprintf(psymTeXFile,"To ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  fprintf(psymTeXFile,"%ld ", lTime);
		  for(iC1=0; iC1 < lRowNumber; ++ iC1)
            vPrintTexNumber(psymTeXFile, dSetDisc(lTime, lState1[iC1], lState2[iC1], 0.));
		  fprintf(psymTeXFile,"\\\\ \n");
		  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
		    {fprintf(psymTeXFile,pcTeXTabular[3]);
		    fprintf(psymTeXFile,pcTeXTabular[4]);
		    fprintf(psymTeXFile,pcTeXTabular[5]);  
		    fprintf(psymTeXFile,pcTeXTabular[0],"Disc.");
		    fprintf(psymTeXFile,pcTeXTabular[1]);
		    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
		    fprintf(psymTeXFile,"From ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    fprintf(psymTeXFile,"To ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    lTime2 = -1;
		    }
		  ++lTime2;
		}
	      fprintf(psymTeXFile,pcTeXTabular[3]);
	      fprintf(psymTeXFile,pcTeXTabular[4]);
	      fprintf(psymTeXFile,pcTeXTabular[5]);  
	      bFillRows  = true;
	      lRowNumber = 0;
	      if(bFillRows)
		{
		  bool bCheck = false;
		  for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		    {
		      double dValue = dSetDisc(lTime, lC1, lC2, 0.);
		      if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		    }

		  if(bAllEntries) bCheck = true; 
		  if(bCheck){
		    lState1[lRowNumber] =lC1;
		    lState2[lRowNumber] =lC2;
		    ++lRowNumber;
		    if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
		  }
		}
	    }
	}
    }
  if(lRowNumber > 0)
    {
      lTime2 = 0;
      fprintf(psymTeXFile,pcTeXTabular[0],"Disc.");
      fprintf(psymTeXFile,pcTeXTabular[1]);
      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
      fprintf(psymTeXFile,"From ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      fprintf(psymTeXFile,"To ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	{
	  fprintf(psymTeXFile,"%ld ", lTime);
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
	    vPrintTexNumber(psymTeXFile, dSetDisc(lTime, lState1[iC1], lState2[iC1], 0.));
	  fprintf(psymTeXFile,"\\\\ \n");
	  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
	    {fprintf(psymTeXFile,pcTeXTabular[3]);
	    fprintf(psymTeXFile,pcTeXTabular[4]);
	    fprintf(psymTeXFile,pcTeXTabular[5]);  
	    fprintf(psymTeXFile,pcTeXTabular[0],"Disc.");
	    fprintf(psymTeXFile,pcTeXTabular[1]);
	    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
	    fprintf(psymTeXFile,"From ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    fprintf(psymTeXFile,"To ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    lTime2 = -1;
	    }
	  ++lTime2;
	}
      fprintf(psymTeXFile,pcTeXTabular[3]);
      fprintf(psymTeXFile,pcTeXTabular[4]);
      fprintf(psymTeXFile,pcTeXTabular[5]);  
      bFillRows  = true;
      lRowNumber = 0;
    }

  /* 4. Prenummerando */
  fprintf(psymTeXFile,pcTeXSections[4]);
  bFillRows  = true;
  lRowNumber = 0;
  for(lC1=0; lC1<lGetNrStates(); ++ lC1)
    {
      //	for(lC2=0; lC2<lGetNrStates(); ++ lC2)
      //	{
      if(bFillRows)
	{
	  bool bCheck = false;
	  for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	    {
	      double dValue = dSetPre(lTime, lC1, lC1, 0.);
	      if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
	    }

	  if(bAllEntries) bCheck = true; 
	  if(bCheck){
	    lState1[lRowNumber] =lC1;
	    lState2[lRowNumber] =lC1;
	    ++lRowNumber;
	    if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
	  }
	}
      else
	{
	  lTime2 = 0;
	  fprintf(psymTeXFile,pcTeXTabular[0],"Pre");
	  fprintf(psymTeXFile,pcTeXTabular[1]);
	  fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
	  fprintf(psymTeXFile,"From ");
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
	    {
	      fprintf(psymTeXFile," & ");
	      fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	    }
	  fprintf(psymTeXFile,"\\\\ \n");
	  fprintf(psymTeXFile,"To ");
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
	    {
	      fprintf(psymTeXFile," & ");
	      fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	    }
	  fprintf(psymTeXFile,"\\\\ \n");
	  for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	    {
	      fprintf(psymTeXFile,"%ld ", lTime);
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
                     vPrintTexNumber(psymTeXFile, dSetPre(lTime, lState1[iC1], lState2[iC1], 0.));

	      fprintf(psymTeXFile,"\\\\ \n");
	      if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
		{fprintf(psymTeXFile,pcTeXTabular[3]);
		fprintf(psymTeXFile,pcTeXTabular[4]);
		fprintf(psymTeXFile,pcTeXTabular[5]);  
		fprintf(psymTeXFile,pcTeXTabular[0],"Pre");
		fprintf(psymTeXFile,pcTeXTabular[1]);
		fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
		fprintf(psymTeXFile,"From ");
		for(iC1=0; iC1 < lRowNumber; ++ iC1)
		  {
		    fprintf(psymTeXFile," & ");
		    fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		  }
		fprintf(psymTeXFile,"\\\\ \n");
		fprintf(psymTeXFile,"To ");
		for(iC1=0; iC1 < lRowNumber; ++ iC1)
		  {
		    fprintf(psymTeXFile," & ");
		    fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		  }
		fprintf(psymTeXFile,"\\\\ \n");
		lTime2 = -1;
		}
	      ++lTime2;
	    }
	  fprintf(psymTeXFile,pcTeXTabular[3]);
	  fprintf(psymTeXFile,pcTeXTabular[4]);
	  fprintf(psymTeXFile,pcTeXTabular[5]);  
	  bFillRows  = true;
	  lRowNumber = 0;
	  if(bFillRows)
	    {
	      bool bCheck = false;
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  double dValue = dSetPre(lTime, lC1, lC1, 0.);
		  if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		}

	      if(bAllEntries) bCheck = true; 
	      if(bCheck){
		lState1[lRowNumber] =lC1;
		lState2[lRowNumber] =lC1;
		++lRowNumber;
		if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
	      }
	    }
	}
      //	}
    }
  if(lRowNumber > 0)
    {
      lTime2 = 0;
      fprintf(psymTeXFile,pcTeXTabular[0],"Pre");
      fprintf(psymTeXFile,pcTeXTabular[1]);
      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
      fprintf(psymTeXFile,"From ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      fprintf(psymTeXFile,"To ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	{
	  fprintf(psymTeXFile,"%ld ", lTime);
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
      	  vPrintTexNumber(psymTeXFile, dSetPre(lTime, lState1[iC1], lState2[iC1], 0.));
      fprintf(psymTeXFile,"\\\\ \n");
	  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
	    {fprintf(psymTeXFile,pcTeXTabular[3]);
	    fprintf(psymTeXFile,pcTeXTabular[4]);
	    fprintf(psymTeXFile,pcTeXTabular[5]);  
	    fprintf(psymTeXFile,pcTeXTabular[0],"Pre");
	    fprintf(psymTeXFile,pcTeXTabular[1]);
	    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
	    fprintf(psymTeXFile,"From ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    fprintf(psymTeXFile,"To ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    lTime2 = -1;
	    }
	  ++lTime2;
	}
      fprintf(psymTeXFile,pcTeXTabular[3]);
      fprintf(psymTeXFile,pcTeXTabular[4]);
      fprintf(psymTeXFile,pcTeXTabular[5]);  
      bFillRows  = true;
      lRowNumber = 0;
    }

  /* 5. Postnummerando */
  fprintf(psymTeXFile,pcTeXSections[5]);
  bFillRows  = true;
  lRowNumber = 0;
  for(lC1=0; lC1<lGetNrStates(); ++ lC1)
    {
      for(lC2=0; lC2<lGetNrStates(); ++ lC2)
	{
	  if(bFillRows)
	    {
	      bool bCheck = false;
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  double dValue = dSetPost(lTime, lC1, lC2, 0.);
		  if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		}

	      if(bAllEntries) bCheck = true; 
	      if(bCheck){
		lState1[lRowNumber] =lC1;
		lState2[lRowNumber] =lC2;
		++lRowNumber;
		if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
	      }
	    }
	  else
	    {
	      lTime2 = 0;
	      fprintf(psymTeXFile,pcTeXTabular[0],"Post");
	      fprintf(psymTeXFile,pcTeXTabular[1]);
	      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
	      fprintf(psymTeXFile,"From ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      fprintf(psymTeXFile,"To ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  fprintf(psymTeXFile,"%ld ", lTime);
		  for(iC1=0; iC1 < lRowNumber; ++ iC1)
       		 vPrintTexNumber(psymTeXFile, dSetPost(lTime, lState1[iC1], lState2[iC1], 0.));
		    fprintf(psymTeXFile,"\\\\ \n");
		  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
		    {fprintf(psymTeXFile,pcTeXTabular[3]);
		    fprintf(psymTeXFile,pcTeXTabular[4]);
		    fprintf(psymTeXFile,pcTeXTabular[5]);  
		    fprintf(psymTeXFile,pcTeXTabular[0],"Post");
		    fprintf(psymTeXFile,pcTeXTabular[1]);
		    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
		    fprintf(psymTeXFile,"From ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    fprintf(psymTeXFile,"To ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    lTime2 = -1;
		    }
		  ++lTime2;
		}
	      fprintf(psymTeXFile,pcTeXTabular[3]);
	      fprintf(psymTeXFile,pcTeXTabular[4]);
	      fprintf(psymTeXFile,pcTeXTabular[5]);  
	      bFillRows  = true;
	      lRowNumber = 0;
	      if(bFillRows)
		{
		  bool bCheck = false;
		  for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		    {
		      double dValue = dSetPost(lTime, lC1, lC2, 0.);
		      if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		    }

		  if(bAllEntries) bCheck = true; 
		  if(bCheck){
		    lState1[lRowNumber] =lC1;
		    lState2[lRowNumber] =lC2;
		    ++lRowNumber;
		    if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
		  }
		}
	    }
	 
	}
    }
  if(lRowNumber > 0)
    {
      lTime2 = 0;
      fprintf(psymTeXFile,pcTeXTabular[0],"Post");
      fprintf(psymTeXFile,pcTeXTabular[1]);
      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
      fprintf(psymTeXFile,"From ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      fprintf(psymTeXFile,"To ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	{
	  fprintf(psymTeXFile,"%ld ", lTime);
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
      	  vPrintTexNumber(psymTeXFile, dSetPost(lTime, lState1[iC1], lState2[iC1], 0.));

	  fprintf(psymTeXFile,"\\\\ \n");
	  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
	    {fprintf(psymTeXFile,pcTeXTabular[3]);
	    fprintf(psymTeXFile,pcTeXTabular[4]);
	    fprintf(psymTeXFile,pcTeXTabular[5]);  
	    fprintf(psymTeXFile,pcTeXTabular[0],"Post");
	    fprintf(psymTeXFile,pcTeXTabular[1]);
	    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
	    fprintf(psymTeXFile,"From ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    fprintf(psymTeXFile,"To ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    lTime2 = -1;
	    }
	  ++lTime2;
	}
      fprintf(psymTeXFile,pcTeXTabular[3]);
      fprintf(psymTeXFile,pcTeXTabular[4]);
      fprintf(psymTeXFile,pcTeXTabular[5]);  
      bFillRows  = true;
      lRowNumber = 0;
    }

  /* 6. MR */
  fprintf(psymTeXFile,pcTeXSections[6]);
  bFillRows  = true;
  lRowNumber = 0;
  for(lC1=1; lC1<=lDKCalculated; ++ lC1)
    {
      for(lC2=0; lC2<lGetNrStates(); ++ lC2)
	{
	  if(bFillRows)
	    {
	      lState1[lRowNumber] =lC1;
	      lState2[lRowNumber] =lC2;
	      ++lRowNumber;
	      if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false; 
	    }
	  else
	    {
	      lTime2 = 0;
	      fprintf(psymTeXFile,pcTeXTabular[0],"MR.");
	      fprintf(psymTeXFile,pcTeXTabular[1]);
	      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
	      fprintf(psymTeXFile,"Moment ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      fprintf(psymTeXFile,"State ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  fprintf(psymTeXFile,"%ld ", lTime);
		  for(iC1=0; iC1 < lRowNumber; ++ iC1)
    		  vPrintTexNumber(psymTeXFile, dGetDK(lTime, lState2[iC1], lState1[iC1]));

		  fprintf(psymTeXFile,"\\\\ \n");
		  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
		    {fprintf(psymTeXFile,pcTeXTabular[3]);
		    fprintf(psymTeXFile,pcTeXTabular[4]);
		    fprintf(psymTeXFile,pcTeXTabular[5]);  
		    fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
		    fprintf(psymTeXFile,pcTeXTabular[1]);
		    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
		    fprintf(psymTeXFile,"From ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    fprintf(psymTeXFile,"To ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    lTime2 = -1;
		    }
		  ++lTime2;
		}
	      fprintf(psymTeXFile,pcTeXTabular[3]);
	      fprintf(psymTeXFile,pcTeXTabular[4]);
	      fprintf(psymTeXFile,pcTeXTabular[5]);  
	      bFillRows  = true;
	      lRowNumber = 0;
	      if(bFillRows)
		{
		  lState1[lRowNumber] =lC1;
		  lState2[lRowNumber] =lC2;
		  ++lRowNumber;
		  if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false; 
		}
	    }
	 
	}
    }
  if(lRowNumber > 0)
    {
      lTime2 = 0;
      fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
      fprintf(psymTeXFile,pcTeXTabular[1]);
      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
      fprintf(psymTeXFile,"Moment ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      fprintf(psymTeXFile,"State ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	{
	  fprintf(psymTeXFile,"%ld ", lTime);
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
    		  vPrintTexNumber(psymTeXFile, dGetDK(lTime, lState2[iC1], lState1[iC1]));
	  fprintf(psymTeXFile,"\\\\ \n");
	  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
	    {fprintf(psymTeXFile,pcTeXTabular[3]);
	    fprintf(psymTeXFile,pcTeXTabular[4]);
	    fprintf(psymTeXFile,pcTeXTabular[5]);  
	    fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
	    fprintf(psymTeXFile,pcTeXTabular[1]);
	    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
	    fprintf(psymTeXFile,"From ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    fprintf(psymTeXFile,"To ");
	    for(iC1=0; iC1 < lRowNumber; ++ iC1)
	      {
		fprintf(psymTeXFile," & ");
		fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	      }
	    fprintf(psymTeXFile,"\\\\ \n");
	    lTime2 = -1;
	    }
	  ++lTime2;
	}
      fprintf(psymTeXFile,pcTeXTabular[3]);
      fprintf(psymTeXFile,pcTeXTabular[4]);
      fprintf(psymTeXFile,pcTeXTabular[5]);  
      bFillRows  = true;
      lRowNumber = 0;
    }

  /* 7. CF */
  fprintf(psymTeXFile,pcTeXSections[7]);
  bFillRows  = true;
  lRowNumber = 0;
  for(lC1=0; lC1<lCFCalculated; ++ lC1)
    {
      for(lC2=0; lC2<lGetNrStates(); ++ lC2)
	{
	  if(bFillRows)
	    {
	      bool bCheck = false;
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  double dValue = dGetCF(lTime, lC1, lC2);
		  if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		}

	      if(bAllEntries) bCheck = true; 
	      if(bCheck){
		lState1[lRowNumber] =lC1;
		lState2[lRowNumber] =lC2;
		++lRowNumber;
		if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
	      }
	    }
	  else
	    {
	      lTime2 = 0;
	      fprintf(psymTeXFile,pcTeXTabular[0],"From");
	      fprintf(psymTeXFile,pcTeXTabular[1]);
	      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
	      fprintf(psymTeXFile,"Moment ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      fprintf(psymTeXFile,"To ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		{
		  fprintf(psymTeXFile,"%ld ", lTime);
		  for(iC1=0; iC1 < lRowNumber; ++ iC1)
      		  vPrintTexNumber(psymTeXFile, dGetCF(lTime, lState1[iC1], lState2[iC1]));

		  fprintf(psymTeXFile,"\\\\ \n");
		  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
		    {fprintf(psymTeXFile,pcTeXTabular[3]);
		    fprintf(psymTeXFile,pcTeXTabular[4]);
		    fprintf(psymTeXFile,pcTeXTabular[5]);  
		    fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
		    fprintf(psymTeXFile,pcTeXTabular[1]);
		    fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
		    fprintf(psymTeXFile,"From ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    fprintf(psymTeXFile,"To ");
		    for(iC1=0; iC1 < lRowNumber; ++ iC1)
		      {
			fprintf(psymTeXFile," & ");
			fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		      }
		    fprintf(psymTeXFile,"\\\\ \n");
		    lTime2 = -1;
		    }
		  ++lTime2;
		}
	      fprintf(psymTeXFile,pcTeXTabular[3]);
	      fprintf(psymTeXFile,pcTeXTabular[4]);
	      fprintf(psymTeXFile,pcTeXTabular[5]);  
	      bFillRows  = true;
	      lRowNumber = 0;
	    
	      if(bFillRows)
		{
		  bool bCheck = false;
		  for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
		    {
		      double dValue = dGetCF(lTime, lC1, lC2);
		      if (fabs(dValue) > TECHEPS) {bCheck = true; break;}
		    }

		  if(bAllEntries) bCheck = true; 
		  if(bCheck){
		    lState1[lRowNumber] =lC1;
		    lState2[lRowNumber] =lC2;
		    ++lRowNumber;
		    if(lRowNumber >= MAX_TEX_ROWS) bFillRows  = false;
		  }
		}
	    }
	}
    }
  if(lRowNumber > 0)
    {
      lTime2 = 0;
      fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
      fprintf(psymTeXFile,pcTeXTabular[1]);
      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);  
      fprintf(psymTeXFile,"From ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      fprintf(psymTeXFile,"To ");
      for(iC1=0; iC1 < lRowNumber; ++ iC1)
	{
	  fprintf(psymTeXFile," & ");
	  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
	}
      fprintf(psymTeXFile,"\\\\ \n");
      for (lTime=lGetStopTime(); lTime <= lGetStartTime(); ++lTime)
	{
	  fprintf(psymTeXFile,"%ld ", lTime);
	  for(iC1=0; iC1 < lRowNumber; ++ iC1)
      		  vPrintTexNumber(psymTeXFile, dGetCF(lTime, lState1[iC1], lState2[iC1]));
	  fprintf(psymTeXFile,"\\\\ \n");
	  if(lTime2>=MAX_TEX_LINES && lTime !=lGetStartTime())
	    {
	      fprintf(psymTeXFile,pcTeXTabular[3]);
	      fprintf(psymTeXFile,pcTeXTabular[4]);
	      fprintf(psymTeXFile,pcTeXTabular[5]);  
	      fprintf(psymTeXFile,pcTeXTabular[0],"Prob.");
	      fprintf(psymTeXFile,pcTeXTabular[1]);
	      fprintf(psymTeXFile,pcTeXTabular[2],TEX_TAB);
	      fprintf(psymTeXFile,"From ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState1[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      fprintf(psymTeXFile,"To ");
	      for(iC1=0; iC1 < lRowNumber; ++ iC1)
		{
		  fprintf(psymTeXFile," & ");
		  fprintf(psymTeXFile,pcTableEntryL,lState2[iC1]);
		}
	      fprintf(psymTeXFile,"\\\\ \n");
	      lTime2 = -1;
	    }
	  ++lTime2;
	}
      fprintf(psymTeXFile,pcTeXTabular[3]);
      fprintf(psymTeXFile,pcTeXTabular[4]);
      fprintf(psymTeXFile,pcTeXTabular[5]);  
      bFillRows  = true;
      lRowNumber = 0;
    }
  /* 8. Footer */
  if(bWithHeader)
    {
      for(iC1=0; *pcTeXEnd[iC1]; ++ iC1)
	fprintf(psymTeXFile,pcTeXEnd[iC1]);
    }
  bGetData = bOrgbGetData;
}
