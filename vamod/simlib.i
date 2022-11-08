/* File: example.i */
%module simlib
%{
#define SWIG_FILE_WITH_INIT
#include "simlib.h"
%}

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
};


