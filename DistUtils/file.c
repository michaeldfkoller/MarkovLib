#include "omarkov.h"
#include <assert.h>
#ifndef __GNUC__
#include <process.h>
#endif
#include <malloc.h>
#include <string.h>
#include <stdlib.h>

#define NEWZINS

#define READD      1000
#define READPIJ    1001
#define READLIJV   1002
#define READLIJN   1003
#define DYIELDFILE 1004

//#define TRACE_PLUS

/* ----------------------------------------------------- */
void    vReadFile(FILE * psymFile, int iOpt, MARKOVLV * psymM, FILE * psymOut, REQUEST * psymR)       
{
  long i,j,lAge;
  float fWert;          
  long MAXTIMES2 = psymM->lGetMaxTime();
  long MAXSTATES = psymM->lGetNrStates();
  char strBuffer[1024];
  memset(strBuffer,0,1024*sizeof(char));  

  /*    if(iOpt == READD) */
  /*      {            */
  /*  #ifdef NEWZINS */
  /*        for(i=0;i<MAXSTATES; ++i) */
  /*  	{ */
  /*  	  for(j=0;j<MAXSTATES;++j) */
  /*  	    { */
  /*  	      pfDiscount[i][j] = NULL; */
  /*  	    } */
  /*  	} */
  /*  #else */
  /*        for(i=0; i<MAXTIMES; ++i) fDiscount[i]=(float) 1.; */
  /*  #endif */
  /*      } */
  /*    else */
  /*      {if(iOpt == READPIJ) */
  /*        {                               */
  /*  	for(i=0;i<MAXSTATES; ++i) */
  /*  	  { */
  /*  	    for(j=0;j<MAXSTATES;++j) */
  /*  	      { */
  /*  		pfPij[i][j] = NULL; */
  /*  	      } */
  /*  	  } */
  /*        } */
  /*      else */
  /*        { */
  /*  	if(iOpt == READLIJV) */
  /*  	  {                               */
  /*  	    for(i=0;i<MAXSTATES; ++i) */
  /*  	      { */
  /*  		for(j=0;j<MAXSTATES;++j) */
  /*  		  { */
  /*  		    pfLij_v[i][j]= NULL; */
  /*  		  } */
  /*  	      } */
  /*  	  }  */
  /*  	else */
  /*  	  {                               */
  /*  	    for(i=0;i<MAXSTATES; ++i) */
  /*  	      { */
  /*  		for(j=0;j<MAXSTATES;++j) */
  /*  		  { */
  /*  		    pfLij_n[i][j]=NULL; */
  /*  		  } */
  /*  	      } */
  /*  	  }  */
  /*        } */
  /*      }          */
  /* format immer alter i j  wert */
  if(iOpt == READD)
    {
#ifdef NEWZINS
      while(!feof(psymFile))
	{
	  int iStocZins = 0;
	  if(fgets(strBuffer,1024,psymFile))
	    {
	      if(strBuffer[0] != '*' && strBuffer[0] != '%' && strBuffer[0] != '!')
		{
		  if(iStocZins)
		    {
				
		      sscanf(strBuffer,"%ld %ld %ld %f",&lAge,&i,&j,&fWert);
		      if(lAge<MAXTIMES2 && i<MAXSTATES && j<MAXSTATES)
			{
			  psymM->dSetDisc(lAge, i, j, fWert);
#ifdef TRACE_PLUS
			  fprintf(psymOut,"\nD1 %ld %ld %ld %f",lAge,i,j,fWert);
#endif

			}
				
		    }
		  else
		    {
		      int iLocState;
		      sscanf(strBuffer,"%ld %f", &lAge, &fWert);
		      if(lAge<MAXTIMES2)	
			// fDiscount[lAge] = fWert;
			{
			  for(iLocState=0; iLocState < psymM->lGetNrStates() && (lAge < MAXTIMES2);++iLocState)
			    {
			      psymM->dSetDisc(lAge, iLocState, iLocState, fWert);
#ifdef TRACE_PLUS
			      fprintf(psymOut,"\nD2 %ld %ld %ld %f",lAge,iLocState,iLocState,fWert);
#endif

			    }
			}
		    }

		}
	      else    
		{
		  if(psymR->iFullOutput == FULL_OUTPUT || psymR->iFullOutput == DEFAULT_OUTPUT)
		    {fprintf(psymOut,"%c P..:%s",'%',strBuffer+1);
		    printf("%s \n",strBuffer);}
		  if(strBuffer[0] == '!')
		    {
		      // steuerzeichen
		      if (strstr(strBuffer,"SZP")) iStocZins = 1;
		      if (strstr(strBuffer,"szp")) iStocZins = 1;
                      if(psymR->iFullOutput == FULL_OUTPUT || psymR->iFullOutput == DEFAULT_OUTPUT)
			fprintf(psymOut,"\n%c  Stochstischer Zins On",'%');
		    }
		}
	    }
	} 

#else
      while(!feof(psymFile))
	{                            
	  if(fgets(strBuffer,1024,psymFile))
	    {
	      if(strBuffer[0] != '*' && strBuffer[0] != '%')
		{
		  sscanf(strBuffer,"%ld %f", &lAge, &fWert);
		  assert(lAge < MAXTIMES);
		  fDiscount[lAge] = fWert;
#ifdef TRACE_PLUS
		  {             
		    char * pcStatic = " File read : Diskont ";
		    char strMess[120], strTemp2[80];
		    strMess[0] ='\0'; strTemp2[0] ='\0';
		    strcat(strMess, pcStatic);     
		    sprintf(strTemp2," %ld : ", lAge);
		    strcat(strMess,strTemp2);
		    vPrintNr(strMess, (double)fDiscount[lAge] );
		  }
#endif
		}
	      else                        
		{
		  if(psymR->iFullOutput == FULL_OUTPUT || psymR->iFullOutput == DEFAULT_OUTPUT)
		    { 
		      fprintf(psymOut,"%c D..:%s",'%',strBuffer+1);  
		      printf("%s \n",strBuffer);
		    }
		}
	    }
	}
#endif
    }         
  else
    {
      if(iOpt == READPIJ)                           
	{
	  while(!feof(psymFile))
	    {
	      if(fgets(strBuffer,1024,psymFile))
		{
		  if(strBuffer[0] != '*' && strBuffer[0] != '%')
		    {
		      sscanf(strBuffer,"%ld %ld %ld %f",&lAge,&i,&j,&fWert);
		      if(lAge<MAXTIMES2 && i<MAXSTATES && j<MAXSTATES)
			{
			  psymM->dSetPij(lAge, i, j, fWert);
#ifdef TRACE_PLUS
			  fprintf(psymOut,"\nPIJ %ld %ld %ld %f",lAge,i,j,fWert);
#endif

			}
		    }
		  else    
		    {
		      if(psymR->iFullOutput == FULL_OUTPUT || psymR->iFullOutput == DEFAULT_OUTPUT)
			{
			  fprintf(psymOut,"%c P..:%s",'%',strBuffer+1);
			  printf("%s \n",strBuffer);  
			}
		    }
		}
	    } 
	} 
      else
	{ if(iOpt == READLIJV)                           
	  {
	    while(!feof(psymFile))
	      {        
		if(fgets(strBuffer,1024,psymFile))
		  {
		    if(strBuffer[0] != '*' && strBuffer[0] != '%')
		      {
			sscanf(strBuffer,"%ld %ld %ld %f",&lAge,&i,&j,&fWert);
			if(lAge<MAXTIMES2 && i<MAXSTATES && j<MAXSTATES)
			  {
                            psymM->dSetPre(lAge, i, j, fWert);
#ifdef TRACE_PLUS
			    fprintf(psymOut,"\nPre %ld %ld %ld %f",lAge,i,j,fWert);
#endif

			  }
		      }
		    else
		      {
			if(psymR->iFullOutput == FULL_OUTPUT || psymR->iFullOutput == DEFAULT_OUTPUT)
			  {
			    fprintf(psymOut,"%c LV.:%s",'%',strBuffer+1);
			    printf("%s \n",strBuffer);  
			  }
		      }
		  }
	      } 
	  }
	else                  
	{if(iOpt == READLIJN)
	  {
	    while(!feof(psymFile))
	      { 
		if(fgets(strBuffer,1024,psymFile))
		  {
		    if(strBuffer[0] != '*' && strBuffer[0] != '%')
		      {
			sscanf(strBuffer,"%ld %ld %ld %f",&lAge,&i,&j,&fWert);
			if(lAge<MAXTIMES2 && i<MAXSTATES && j<MAXSTATES)
			  {
                            psymM->dSetPost(lAge, i, j, fWert);
#ifdef TRACE_PLUS
			    fprintf(psymOut,"\nPost %ld %ld %ld %f",lAge,i,j,fWert);
#endif

			  }
		      }
		    else
		      {
			if(psymR->iFullOutput == FULL_OUTPUT || psymR->iFullOutput == DEFAULT_OUTPUT)
			  {
			    fprintf(psymOut,"%c LN.:%s",'%', strBuffer+1);
			    printf("%s \n",strBuffer);  
			  }
		      }
		  }
	      } 
	  } 
	}
    }     
  }
if(iOpt == DYIELDFILE)
    {

      while(!feof(psymFile))
	{
	  int iStocZins = 0;
	  if(fgets(strBuffer,1024,psymFile))
	    {
		  int iLocState;
              if(strBuffer[0] != '*' && strBuffer[0] != '%')
		      {
			sscanf(strBuffer,"%ld %f",&lAge,&fWert);
			lAge += psymM->lGetStopTime(); --lAge;
                        fWert = 1./(1. + fWert );
                        if(lAge<MAXTIMES2)
			  {
                            for(iLocState=0; iLocState < psymM->lGetNrStates() && (lAge < MAXTIMES2);++iLocState) psymM->dSetDisc(lAge, iLocState, iLocState, fWert);
                          }
                      }
            }
        }
    }
}

/* ------------------------------------------------------------------ */
void    vDefLeist(int iOpt, MARKOVLV * psymM, FILE * psymOut, REQUEST * psymR)       
{
  LVERLAUF * psymLV;
  long       lAct,lNrLV;
  long MAXSTATES = psymM->lGetNrStates();
  double   dTemp;

  switch(iOpt)
    {
    case READLIJV:
      psymLV = psymR->psymPreVerl;
      lNrLV  = psymR->lPreVerlSet;
      if(psymR->lPreVerlSet >0) psymR->lPreVerlSet = -psymR->lPreVerlSet;
      break;               
    case READLIJN:
      psymLV = psymR->psymPostVerl;
      lNrLV  = psymR->lPostVerlSet;
      if(psymR->lPostVerlSet >0) psymR->lPostVerlSet = -psymR->lPostVerlSet;
      break;               

    case READD:
      psymLV = psymR->psymDiscVerl;
      lNrLV  = psymR->lDiscVerlSet;
      if(psymR->lDiscVerlSet >0) psymR->lDiscVerlSet = -psymR->lDiscVerlSet;
      break;               
    }
  if(lNrLV<0) lNrLV = -lNrLV;
  for(lAct=0;lAct<lNrLV;++lAct)
    { // over requests
      long lActTime, lStartTime, lStopTime;
      long lIState, lJState;
      double dWert, dParam, dWertAkt;
      int    iTyp = psymLV[lAct].iTyp;
      lIState = psymLV[lAct].lStateVon;
	  if(lIState >= MAXSTATES) return;
      lJState = psymLV[lAct].lStateNach;
	  if(lJState >= MAXSTATES) return;
      dWert  = psymLV[lAct].dStartwert;
      dParam = psymLV[lAct].dParameter;
      lStartTime = psymLV[lAct].lTimeVon;
      if(lStartTime<psymR->lStop) lStartTime= psymR->lStop;
      lStopTime = psymLV[lAct].lTimeNach;
      if(lStartTime>=psymR->lStart) lStartTime= psymR->lStart-1;

      for(lActTime= lStartTime; lActTime <= lStopTime; ++ lActTime)
	{ 
	  long lDeltaT= lActTime - psymLV[lAct].lTimeVon;
	  if(iTyp == LINEAR)
	    {
	      dWertAkt = dWert + dParam * lDeltaT; 
	    }
	  else
	    {
	      dWertAkt = dWert * pow(dParam,lDeltaT);
	    }
	  switch(iOpt)
	    {
	    case READLIJV:
	      dTemp = psymM->dSetPre(lActTime, lIState, lJState, dWertAkt);
	      break;               
	    case READLIJN:
	      dTemp= psymM->dSetPost(lActTime, lIState, lJState, dWertAkt);
	      break;               
	    case READD:
	      dTemp = psymM->dSetDisc(lActTime, lIState, lJState, dWertAkt);
	      break;               
	    }	
	}
    }
}

