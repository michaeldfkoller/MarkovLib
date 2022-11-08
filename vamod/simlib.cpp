////////////////////////////////////////////////////////////////////
//                                                                //
// Simlibobjekt fuer SDEs                                         //
//                                                                //
// Autor Michael Koller                                           //
//                                                                //
// Datum March 2011: erstellt                                     //
//                                                                //
////////////////////////////////////////////////////////////////////

// ---------------------------------------------------------------//
//                                                                //
//  f'(x) ~ (f(x+D) - f(x-D)) / (2D)  + o(D)                      //
//                                                                //
//  f''(x) ~ (f(x+D) - 2f(x) + f(x-D)) / (D^2) + o(D^2)           //
//                                                                //
// ---------------------------------------------------------------//

#define USEMERSENNE
#include "MersenneTwister.h"
#include "simlib.h"


#pragma message (" >>>>> More Default States")

#define TEX_TAB         "lrrrrrrrr"


//const char *  strPrgVersionStatic = "% This is simlib V0.50 - Michael Koller 2011 \n";
#ifndef NORAN2
// Wenn deterministischer Zins, so steht der Zins für alle Elemente auf der Diagonale
#ifndef SIMLIB_FOR_VAMOD
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
#endif

void vPrintTexNumber(FILE* psymFile, double dNumber)
{
  char *pcTexFormat[]=
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

#endif

//  private:
//   LV_VECTOR * psymBoundary;
//   LV_VECTOR * psymCurrentX;
//   LV_MATRIX * psymTrajectory;
//   LV_VECTOR * psymMu;
//   LV_MATRIX * psymCoVar;
//   double   dDeltaT;
//   double   dT;
//   LV_MATRIX * dW;
// long     lSeed;


SIMLIB::SIMLIB(long lDimensionAssets, double dDeltaT, long lNrTimeSteps, long lModel)
{
  // 1. Allocate Local Variables
  bUseAnti = false; // default will use antithetik 
  bAnti = false; // eg need to first do rnd
  this->lDimensionAssets =lDimensionAssets;
  lDimSDE = lDimensionAssets + 1;
  this->dDeltaT =dDeltaT;
  this->lNrTimeSteps =lNrTimeSteps+1;
  this->lModel =lModel;
  dNeedCalc = true;
  bResetRND = true;
  bError = false;
  if (this->dDeltaT <= 0.)
    {
      this->dDeltaT = DELTATDEF;
    }
  this->dDeltaTINV = 1./this->dDeltaT;
  this->dT05 = pow(this->dDeltaT,0.5);
#ifdef TRACE
  printf("%20s:  %20s --> %10.6f \n", "Constructor", "DeltaT", this->dDeltaT);
  printf("%20s:  %20s --> %10.6f \n", "Constructor", "DeltaT 05", this->dT05);
  printf("%20s:  %20s --> %10.6f \n", "Constructor", "DeltaT INV", this->dDeltaTINV);
#endif
  // 2. Allocate dynamical memory
  psymBoundary = new LV_VECTOR(lDimSDE,0,0);
  psymBoundaryInt = new LV_VECTOR(lDimSDE,0,0);
  psymCurrentX = new LV_VECTOR(lDimSDE,0,0);
  psymTrajectory = new LV_MATRIX(lDimSDE,this->lNrTimeSteps,0);
  psymW          = new LV_MATRIX(lDimSDE,this->lNrTimeSteps,0);
  psymWAnti      = new LV_MATRIX(lDimSDE,this->lNrTimeSteps,0);
  psymMu = new LV_VECTOR(lDimSDE,0,0);
  psymCoVar      = new LV_MATRIX(lDimSDE,lDimSDE,0);
  psymParam = new LV_VECTOR(lDimSDE * SIMLIB_PARPERASSET,lDimSDE,0);
#ifdef USEMERSENNE
  psymMT= new MTRand(); 
#endif

#ifdef USEGSL
  pSymGSLr = gsl_rng_alloc(RNDGENERATOR);
  printf("================================================================\n");
  printf(" Using GSL RNG %-30s \n",gsl_rng_name (pSymGSLr));
  printf("================================================================\n");

#endif
  
  // 3. Set Model to Heston Model
  iStartState = 0;
  vSetModel(this->lModel);
}

SIMLIB::~SIMLIB()
{
  // 1. Delete dynamic allocated memory

  delete(psymBoundary);
  delete(psymBoundaryInt);
  delete(psymCurrentX);
  delete(psymTrajectory);
  delete(psymW);
  delete(psymWAnti);
  delete(psymMu);
  delete(psymCoVar);
  delete(psymParam);

}
void SIMLIB::vReset()
{
  bNeedPrepare = true;
  // empty not yet implemented
}
void  SIMLIB::vSetSeed(long lSeed)
{
#ifdef USEGSL
  gsl_rng_set(pSymGSLr,lSeed);
#else
#ifdef USEMERSENNE
  psymMT->seed(lSeed );
#else
  this->lSeed = lSeed;
  this->lSeedOLD = lSeed;
#endif
#endif
}
void  SIMLIB::vSetModel(long lModel)
{
  this->lModel = lModel;
  if (lModel == REGIMESHIFT)
    { 
      printf("Using Regime Shift model \n");
      dA = dA_Regime;
      dB = dB_Regime;
      dBPrime = dBPrime_Regime;
      bNeedPrepare = true;
      bNeedsStepper = true;
    }
  else
    {
      printf("Using Heston model \n");
      dA = dA_Heston;
      dB = dB_Heston;
      dBPrime = dBPrime_Heston;
      bNeedPrepare = false;
      bNeedsStepper = false;
    }

}
void  SIMLIB::vRerunTrajectory()
{
  // This is the actual solution of the SDE by means of a Milstein scheme
  // Note the numbering of the time is is i x dDeltaT for step i
  // Milstein Scheme:
  // ----------------
  // SDE  dX = a ds + b dW, where a and b have components a_i and b_i for i=1 ...n
  //
  // X_k(t+\Delta t) = X_k(t) + a_k \Delta t + b_k \Delta W + 1/2 (\sum_{j=1..n} b_l \frac{\partial b_k}{\partial x_l} ) \times ( (\Delta W)^2 - \Delta t)
  //
  // MK not sure - need to look up whether we do not have
  // X_k(t+\Delta t) = X_k(t) + a_k \Delta t + b_k \Delta W + 1/2 (\sum_{j=1..n} b_l \frac{\partial b_k}{\partial x_l} ) \times ( (\Delta W_l)(\Delta_k) - \rho(l,k) \Delta t)
#define USE_BRACKET_FOR_MILSTEIN
  //
  // This is strong order one scheme

  int i, j, k;
  double dTemp;
  double dSumTemp[lDimSDE];
  // 1. Reset Trajectory plus bounday condition
  lSeedOLD = lSeed;
  psymTrajectory->vReset();
  if (bNeedsStepper) vPreStepper();
  for(j=0; j<lDimSDE;++j)
    {
      dX[j] = psymBoundaryInt->dGetValue(j);
      dTemp = psymTrajectory->dSetValue(j,0,dX[j]);
    }
  dT = 0.;
  // 2. Loop over time
  for(i=0; i< lNrTimeSteps; ++i)
    {
      // 2.1 one timestep
      // old code    vNormRndMuSigma();
      for(j=0; j<lDimSDE;++j)
	{
	  dSumTemp[j] = 0;
	  for(k=0; k<lDimSDE;++k)
	    {
#ifdef USE_BRACKET_FOR_MILSTEIN
	      dSumTemp[j] += dB(this,k, dT, psymParam, dX) * dBPrime(this,j, k, dT, psymParam, dX) * (psymW->dGetValue(k,i)*psymW->dGetValue(j,i)* dDeltaT - psymCoVar->dGetValue(k,j) * dDeltaT) ;
#else
	      dSumTemp[j] += dB(this,k, dT, psymParam, dX) * dBPrime(this,j, k, dT, psymParam, dX);
#endif
#ifdef TRACE
	      printf("%20s:  i:%6d  j:%6d   k:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, k "dB(k, dT, psymParam, dX)", dB(this,k, dT, psymParam, dX));
	      printf("%20s:  i:%6d  j:%6d   k:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, k "dBPrime(j, k, dT, psymParam, dX)", dBPrime(this,j, k, dT, psymParam, dX));
	      printf("%20s:  i:%6d  j:%6d   k:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, k "dSumTemp After Sum", dSumTemp[j]);
#endif

	    }
	} 
      for(j=0; j<lDimSDE;++j)
	{
	  // v-old code dXPlus[j]  = dX[j] + dA(j,dT, psymParam, dX) * dDeltaT + dB(j,dT, psymParam, dX) * dW[j] * dT05 +  0.5 * dB(j,dT, psymParam, dX) * dBPrime(j,dT, psymParam, dX) * (dW[j] * dW[j] - 1.) * dDeltaT;
	  //old code - wrong second order term dXPlus[j]  = dX[j] + dA(j,dT, psymParam, dX) * dDeltaT + dB(j,dT, psymParam, dX) * psymW->dGetValue(j,i) * dT05 +  0.5 * dB(j,dT, psymParam, dX) * dBPrime(j,dT, psymParam, dX) * (psymW->dGetValue(j,i)*psymW->dGetValue(j,i) - 1.) * dDeltaT;
#ifdef USE_BRACKET_FOR_MILSTEIN
          dXPlus[j]  = dX[j] + dA(this,j,dT, psymParam, dX) * dDeltaT + dB(this,j,dT, psymParam, dX) * psymW->dGetValue(j,i) * dT05 +  0.5 * dSumTemp[j];
#else
          dXPlus[j]  = dX[j] + dA(this,j,dT, psymParam, dX) * dDeltaT + dB(this,j,dT, psymParam, dX) * psymW->dGetValue(j,i) * dT05 +  0.5 * dSumTemp[j] * (psymW->dGetValue(j,i)*psymW->dGetValue(j,i) - 1.) * dDeltaT;
#endif
#ifdef TRACE
	  printf("%20s:  i:%6d  j:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, "dX", dX[j] );
	  printf("%20s:  i:%6d  j:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, "dXPl", dXPlus[j] );
	  printf("%20s:  i:%6d  j:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, "dW", psymW->dGetValue(j,i) );
	  printf("%20s:  i:%6d  j:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, "dA", dA(this,j,dT, psymParam, dX));
	  printf("%20s:  i:%6d  j:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, "dB", dB(this,j,dT, psymParam, dX));
	  printf("%20s:  i:%6d  j:%6d %5s--> %10.6f \n", "SDE - STEP", i, j, "dB'", dBPrime(this,j,dT, psymParam, dX));
#endif

	}
#ifdef MINVOLA
      if (dXPlus[0] < 0)
	dXPlus[0] = - dXPlus[0];
#endif 
      // 2.2 copy and save trajectory
      dT += dDeltaT;
      memcpy(dX, dXPlus, SIMLIB_MAXDIM * sizeof(double));
      for(j=0; j<lDimSDE;++j)
	{
	  dTemp = psymTrajectory->dSetValue(j,i+1,dX[j]);
	}
      if (bNeedsStepper) vPostStepper();
    }
}

void  SIMLIB::vNewTrajectory()
{ if (bNeedPrepare)
    {
    vPrepare();
    }
  if (bUseAnti && bAnti)
    {
      LV_MATRIX * psymWTemp;
      psymWTemp = psymW; psymW = psymWAnti; psymWAnti = psymWTemp;
      vRerunTrajectory();      
      bAnti = false;
    }
  else
    {
      vNewRND();
      vRerunTrajectory();      
      bAnti = true;
    }
}

void  SIMLIB::vNewRND()
{
  int i, j;
  double dTemp;
  // 1. Reset Trajectory plus bounday condition
  psymW->vReset();
  psymWAnti->vReset();
  // 2. Loop over time
  for(i=0; i< lNrTimeSteps; ++i)
    {
      // 2.1 one timestep
      vNormRndMuSigma();
      for(j=0; j<lDimSDE;++j)
	{
	  dTemp = psymW->dSetValue(j,i,dW[j]);
	  dTemp = psymWAnti->dSetValue(j,i,dWAnti[j]);
	}
    }
}

void  SIMLIB::vSetdWidWj(int i, int j, double dValue)
{
  double dTemp;
  dTemp = psymCoVar->dSetValue(i,j,dValue);
  dTemp = psymCoVar->dSetValue(j,i,dValue);
  dNeedCalc = true;
}

void  SIMLIB::vSetdMui(int i, double dValue)
{
  double dTemp;
  dTemp = psymMu->dSetValue(i,dValue);
}

void  SIMLIB::dBoundary(int i, double dValue)
{
  double dTemp;
  dTemp = psymBoundary->dSetValue(i,dValue);
  dTemp = psymBoundaryInt->dSetValue(i,dValue);
}

void  SIMLIB::dSetParameter(int i, double dValue)
{
  double dTemp;
  dTemp = psymParam->dSetValue(i,dValue);
}

void   SIMLIB::vSetStartState(int i)
{
  printf("\n Start State %d", i);
  iStartState =i;
}

void  SIMLIB::vSetEquilibriumO(double dEq) // Equilibrium Prob State 0 (is used if StartState < 0)
{
  dEqP0 = dEq;
}


double SIMLIB::dGetValue(int i, double dTime)
{
  long lIndex = (long)(0.5 + dTime * dDeltaTINV);
  return(psymTrajectory->dGetValue(i,lIndex));
}

double SIMLIB::dGetValueRND(int i, double dTime)
{
  long lIndex = (long)(0.5 + dTime * dDeltaTINV);
  return(psymW->dGetValue(i,lIndex));
}


double SIMLIB::dGetCholesky(int i, int j)
{
  if (dNeedCalc)
    vDoCholevski();
  if (bError)
    return(-1.);
  return(dChol[i][j]);
}  

void SIMLIB::vDoCholevski()
{
  double dSum;
  int i,j,k, n = lDimSDE;
  dNeedCalc = false;
  bError = false;
  for(i=0; i<lDimSDE; ++i)
    {
      for(j=0; j<lDimSDE; ++j)
	{
	  dChol[i][j] = 0.; 
	}
    }
  for(i = 0; i< n; ++i)
    {
      for(j = 0;j< i; ++j)
	{
	  dSum = psymCoVar->dGetValue(i,j);
	  for(k = 0; k<j ;++k)
	    dSum -= dChol[i][k] * dChol[j][k];
          dChol[i][j] = dSum / dChol[j][j];
	} //Next j
      dSum = psymCoVar->dGetValue(i,i);
      for(k = 0; k< i; ++k)
	dSum -= dChol[i][k] * dChol[i][k];
      if (dSum <= 0)
	{
	  bError = true;
	  return;
	}                  // A ist nicht positiv definit
      else
	{
	  dChol[i][i] = pow(dSum, 0.5); // Summe ist positiv
	}
    } //Next i

#ifdef TRACE  
  printf("%20s:  %20s --> %10.6f \n", "Cholewski", "----", 0.);
  if (bError)
    printf("%20s:  %20s --> %10.6f \n", "!! Cholewski", "ERROR", 1.);
  for(i = 0; i< n; ++i)
    {
      for(j = 0;j< n; ++j)
	{
	  printf("%20s:  i:%6d  j:%6d %5s--> %10.6f \n", "Cholewski - Res", i, j, "dChol", dChol[i][j] );
	}
    }
#endif


}

double  SIMLIB::dUniformRnd()
{
#ifdef USEGSL
  return(gsl_rng_uniform(pSymGSLr));
#else
#ifdef USEMERSENNE
  return(psymMT->randExc());
#else
  return(ran2(&lSeed));
#endif
#endif
}

double  SIMLIB::dNormRnd()
{
#ifdef USEGSL
  return(gsl_ran_gaussian(pSymGSLr,1.));
#else
  static int iset=0;
  static float gset;
  float fac,rsq,v1,v2;

  if  (iset == 0 || bResetRND == true) {
    bResetRND = false;
    do {
      v1=2.0*dUniformRnd()-1.0;
      v2=2.0*dUniformRnd()-1.0;
      rsq=v1*v1+v2*v2;
    } while (rsq >= 1.0 || rsq == 0.0);
    fac=sqrt(-2.0*log(rsq)/rsq);
    gset=v1*fac;
    iset=1;
    return(v2*fac);
  } else {
    iset=0;
    return gset;
  }
#endif
}

void    SIMLIB::vNormRndMuSigma()
{
  double dTemp[lDimSDE];
  double dTempAnti[lDimSDE];
  int i, j;
  if (dNeedCalc)
    vDoCholevski();
  // Correlierte Normalverteilung mit Jahlich gegebener CoV
  for(i=0; i<lDimSDE; ++i)
    {
      dTemp[i] = dNormRnd();
      dTempAnti[i] = -dTemp[i]; 
      dW[i] = psymMu->dGetValue(i);
      dWAnti[i] = dW[i];
    }
  for(i=0; i<lDimSDE; ++i)
    {
      for(j=0; j<lDimSDE; ++j)
	dW[i] += dChol[i][j] * dTemp[j];
      dWAnti[i] += dChol[i][j] * dTempAnti[j];
    }
}

void    SIMLIB::vPrepare()
{
  // ATTENTION - NEED TO DECIDE ON MODEL IF USED BY MORE THAN ONE MODEL
  // Paramters
  // 0 /3  -- mu for regime 1 and 2
  // 1 /4  -- sigma for regime 1 and 2
  // 2 /5  -- qx for regime 1 and 2
  printf("\n Enter Prepare");
  symRegShift.dDrift[0] =psymParam->dGetValue(0);  
  printf("\n Drift 0 %10.2f", symRegShift.dDrift[0]);
  symRegShift.dDrift[1] =psymParam->dGetValue(3);  
  printf("\n Drift 1 %10.2f", symRegShift.dDrift[1]);
  symRegShift.dSigma[0] =psymParam->dGetValue(1);  
  printf("\n Si 0 %10.2f", symRegShift.dSigma[0]);
  symRegShift.dSigma[1] =psymParam->dGetValue(4);  
  printf("\n Si 1 %10.2f",symRegShift.dSigma[1]);
  symRegShift.dQxOneYr[0] =psymParam->dGetValue(2);  
  printf("\n Qx 0 %10.8f", symRegShift.dQxOneYr[0]);
  symRegShift.dQxOneYr[1] =psymParam->dGetValue(5);  
  printf("\n Qx 1 %10.8f", symRegShift.dQxOneYr[1]);
  symRegShift.dQxDT[0] =1. - pow(1.-symRegShift.dQxOneYr[0],dDeltaT);
  printf("\n QTilde 0 %10.8f", symRegShift.dQxDT[0]);
  symRegShift.dQxDT[1] =1. - pow(1.-symRegShift.dQxOneYr[1],dDeltaT);
  printf("\n QTilde 1%10.8f", symRegShift.dQxDT[1]);
  printf("\n DT %10.4f \n", dDeltaT);
  bNeedPrepare = false;
}

void    SIMLIB::vPreStepper()
{
  // ATTENTION - NEED TO DECIDE ON MODEL IF USED BY MORE THAN ONE MODEL
#ifdef TRACE
  printf("\n enter PreStepper");
  printf("\n %d  %d ",   symRegShift.iCurrentState, iStartState);
#endif
  if (iStartState >=0)
    {
      symRegShift.iCurrentState = iStartState;
    }
  else
    {
      double dTemp = dUniformRnd();
      if (dTemp < dEqP0)
	{
	  symRegShift.iCurrentState = 0;
	}
      else
	{
	  symRegShift.iCurrentState = 1;
	}
    }
}

void    SIMLIB::vPostStepper()
{
  // ATTENTION - NEED TO DECIDE ON MODEL IF USED BY MORE THAN ONE MODEL
  double dTemp = dUniformRnd();
 if (dTemp < symRegShift.dQxDT[symRegShift.iCurrentState])
    {
#ifdef TRACE
      printf("Regime shift %d P %10.6f  Rnd %10.6f \n", symRegShift.iCurrentState ,symRegShift.dQxDT[symRegShift.iCurrentState], dTemp); 
#endif
      symRegShift.iCurrentState = 1- symRegShift.iCurrentState;
    }
}

//         dV_t   = kappa (theta - V_t ) dt + xi sqrt(V_t) dW_t^0
//         dS_t^k = mu S_t^k  dt +  sqrt(V_t) S_t^k dW_t^k
//  kappa: par[0]
//  theta: par[1]
//  xi:    par[2]
//  mu_k(k=1,....n) : par[(k-1) + 3]

double  dA_Heston(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX)
{
  double dTemp;
  if (i != 0)
    {
      dTemp = psymParam->dGetValue(i+2) * dX[i];
    }
  else
    {
      dTemp = psymParam->dGetValue(0) * (psymParam->dGetValue(1) - dX[0]);
    }
  return(dTemp);
}

double  dB_Heston(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX)
{
  double dTemp = 0.;
  if (i != 0)
    {
      if (dX[0] > 0 && i== 1) dTemp = dX[i] * pow(dX[0],0.5);  // Hier koennen wir gloables level vola fuer versch assets untescheiden
      if (dX[0] > 0 && i== 2) dTemp = dX[i] * pow(psymParam->dGetValue(5) * dX[0],0.5);  // Hier koennen wir gloables level vola fuer versch assets untescheiden
    }
  else
    {
      if (dX[0] > 0) dTemp = psymParam->dGetValue(2) * pow(dX[0],0.5);
    }
  return(dTemp);
}

double  dBPrime_Heston(class SIMLIB * p, int i, int jPrime, double dTime, LV_VECTOR * psymParam, double * dX)
{
  double dTemp = 0.;
  if (dX[0] > 0 && i==1 && jPrime == 1) dTemp = pow(dX[0],0.5);
  if (dX[0] > 0 && i==1 && jPrime == 0) dTemp = 0.5*dX[1]/pow(dX[0],0.5);
  if (dX[0] > 0 && i==2 && jPrime == 2) dTemp = pow(psymParam->dGetValue(5) * dX[0],0.5);
  if (dX[0] > 0 && i==2 && jPrime == 0) dTemp = psymParam->dGetValue(5) * dX[0] /pow(dX[0],0.5);
  if (dX[0] > 0 && i==0 && jPrime == 0 ) dTemp = 0.5 * psymParam->dGetValue(2) / pow(dX[0],0.5);
  return(dTemp);
}

// >>>>>>>>> REGIME SHIFT TO BE DONE
//     >>>>> ALSO ADDL FUCT.

//         dV_t   = kappa (theta - V_t ) dt + xi sqrt(V_t) dW_t^0
//         dS_t^k = mu S_t^k  dt +  sqrt(V_t) S_t^k dW_t^k
//  kappa: par[0]
//  theta: par[1]
//  xi:    par[2]
//  mu_k(k=1,....n) : par[(k-1) + 3]

double  dA_Regime(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX)
{
  double dTemp;
  dTemp = p->symRegShift.dDrift[p->symRegShift.iCurrentState] * dX[i];
  return(dTemp);
}

double  dB_Regime(class SIMLIB * p, int i, double dTime, LV_VECTOR * psymParam, double * dX)
{
  double dTemp;
  dTemp = dX[i] * p->symRegShift.dSigma[p->symRegShift.iCurrentState];  // Hier k
  return(dTemp);
}

double  dBPrime_Regime(class SIMLIB * p, int i, int jPrime, double dTime, LV_VECTOR * psymParam, double * dX)
{
  double dTemp = 0.;
  dTemp = p->symRegShift.dSigma[p->symRegShift.iCurrentState];  
  return(dTemp);
}

