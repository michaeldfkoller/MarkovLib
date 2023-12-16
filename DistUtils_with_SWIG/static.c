// STATIC DATA Used for simulations within GLM and ANN

int iGlobalAudit =0;

#define TEST_TEX
/* static.c */
#include <stdio.h>
/*#include <conio.h>
  #include <process.h>
  #ifndef __WATCOMC__
  #include <windows.h> 
  #include "G__ci.h" // CINT
  #endif*/
#define STRLEN  255
#define MAXGLMSIMS  25000
#define NRLVERL 250
#define MAXTIME  30  // fuer summen
#define F_OK                       0
#define W_TOKEN_NOT_FOUND         -1
#define F_PIJ_NOTDEFN              100     
#define F_LIJV_NOTDEFN             101
#define F_LIJN_NOTDEFN             102
#define F_DISC_NOTDEFN             103
#define F_OUTP_NOTDEFN             104
#define F_STATES_NOTDEFN           105
#define F_START_NOTDEFN            106
#define F_STOP_NOTDEFN             107
#define F_OUTP_OPENFAILED          200
#define F_PIJ_OPENFAILED           201
#define F_LIJV_OPENFAILED          202
#define F_LIJN_OPENFAILED          203
#define F_DISC_OPENFAILED          204
#define F_GLMOD_OPENFAILED         250
#define F_OVERFLOW_BENEF           300

#define DEFAULT_OUTPUT             1
#define FULL_OUTPUT                2
#define RESTRICTED_OUTPUT          4
#define CF_OUTPUT                  8
#define SEMICOLON                 16
#define RISC_PREM_OUTP            32
#define SAVINGS_PREM_OUTP         64
#define REG_PREM_OUTP            128
#define RAND_DK_OUTPUT           256
#define RAND_TRAJ_DK_OUTPUT      512

#define LINEAR                     1
#define EXP                        2

#define QXTYPE                      0
#define FXTYPE                      1
#define YIELDTYPE                   2
#define SXTYPE                      3


//static double TotCF[MAXGLMSIMS][100];

typedef struct LVERLAUF
{
  int  iTyp;
  long lStateVon;
  long lStateNach;
  long lTimeVon;
  long lTimeNach;
  double dStartwert;
  double dParameter;
}LVERLAUF;

typedef struct REQUEST
{
  char strLibFile[STRLEN];                      int iLibFileSet;
  char strPIJFile[STRLEN];                      int iPIJFileSet;
  char strLIJVFile[STRLEN];                     int iLIJVFileSet;
  char strLIJNFile[STRLEN];                     int iLIJNFileSet;
  char strDFile[STRLEN];                        int iDFileSet;
  char strOutFile[STRLEN];                      int iOutFileSet;
  char strLogFile[STRLEN];                      int iLogOn;
  char strLogTeXFile[STRLEN];                   int iLogTeXOn;
  // ================================================================
  LVERLAUF psymPreVerl[NRLVERL];                int lPreVerlSet;
  LVERLAUF psymPostVerl[NRLVERL];               int lPostVerlSet;
  LVERLAUF psymDiscVerl[NRLVERL];               int lDiscVerlSet;
  // ================================================================
  int  iAppend;
  int  iFullOutput;
  int  iKeepVerl;
  char strID[STRLEN];                           int iIDSet;
  long lNrStates;                               int iNrStatesSet;
  long lStart;                                  int iStartSet;
  long lStop;                                   int iStopSet;
  long lNrMoments;                              int iMomentsSet;           
  long lNrSim;
  long lSeed;
  //  For C-int;
  bool bCintActive;
  char strTempCName[STRLEN];
  FILE * psymCSourceFile;
  // iCatter: Chatter
  int iCatter;
  // Summierte DK's und CF
  double dSumDK[MAXTIME];
  double dSumCF[MAXTIME];
  long   lActState;
  bool   bGlobal;
}REQUEST;

#include "file.c"

typedef struct TOKENTABLE
{
  char  * pcToken;
  char  * pcBla;
  int  (* iTask)(struct REQUEST * psymR, char * pcCmdLine); 
  char  strCallingSequence[STRLEN];
} TOKENTABLE;

typedef struct ERRCODES  // Static Table with is ended with iNrError = 0
{
  char * psymText;
  int    iNrError;
} ERRCODES;

int iSetLibPath(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strLibFile);
  psymR->iLibFileSet= 1;
  return(F_OK);
}

int iSetPreFile(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strLIJVFile);
  psymR->iLIJVFileSet= 1;
  psymR->lPreVerlSet = 0;
  return(F_OK);
}

int iSetPostFile(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strLIJNFile);
  psymR->iLIJNFileSet= 1;
  psymR->lPostVerlSet= 0;
  return(F_OK);
}

int iSetDiscFile(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strDFile);
  psymR->iDFileSet   = READD;
  psymR->lDiscVerlSet= 0;
  return(F_OK);
}

int iSetYieldFile(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strDFile);
  psymR->iDFileSet   = DYIELDFILE;
  psymR->lDiscVerlSet= 0;
  return(F_OK);
}


int iSetPijFile(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strPIJFile);
  psymR->iPIJFileSet= 1;
  return(F_OK);
}

int iSetOutFile(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strOutFile);
  psymR->iOutFileSet= 1;
  return(F_OK);
}

int iSetModel(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%ld %ld %ld", &psymR->lNrStates, &psymR->lStart, &psymR->lStop);
  psymR->iNrStatesSet= 1;
  psymR->iStartSet= 1;
  psymR->iStopSet= 1;
  return(F_OK);
}

int iSetAppendMode(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp[256];
  int  iStat = W_TOKEN_NOT_FOUND;
  sscanf(pcCmdLine,"%s",strTemp);
  if(*strTemp == 'y' || *strTemp == 'Y') {iStat = F_OK; psymR->iAppend = 1;}
  if(*strTemp == 'n' || *strTemp == 'N') {iStat = F_OK; psymR->iAppend = 0;}
  return(iStat);
}

int iSetMoments(struct REQUEST * psymR, char * pcCmdLine)
{
  long lNrMoments;
  sscanf(pcCmdLine,"%ld",&lNrMoments); 
  psymR->iMomentsSet = 1; 
  if(lNrMoments < 1) lNrMoments = 1l;
  psymR->lNrMoments = lNrMoments;         
  return(F_OK);
}

int iSetOutputMode(struct REQUEST * psymR, char * pcCmdLine)
{
  psymR->iFullOutput = 0;
  if(strstr(pcCmdLine,"normal"))       psymR->iFullOutput |= DEFAULT_OUTPUT;
  if(strstr(pcCmdLine,"full"))         psymR->iFullOutput |= FULL_OUTPUT;
  if(strstr(pcCmdLine,"restricted"))   psymR->iFullOutput |= RESTRICTED_OUTPUT;
  if(strstr(pcCmdLine,"cf"))           psymR->iFullOutput |= CF_OUTPUT;
  if(strstr(pcCmdLine,";"))            psymR->iFullOutput |= SEMICOLON;
  if(strstr(pcCmdLine,"rp"))           psymR->iFullOutput |= RISC_PREM_OUTP;
  if(strstr(pcCmdLine,"sp"))           psymR->iFullOutput |= SAVINGS_PREM_OUTP;
  if(strstr(pcCmdLine,"regp"))         psymR->iFullOutput |= REG_PREM_OUTP;
  if(strstr(pcCmdLine,"rand"))         psymR->iFullOutput |= RAND_DK_OUTPUT;
  if(strstr(pcCmdLine,"traj"))         psymR->iFullOutput |= RAND_TRAJ_DK_OUTPUT;


  return(F_OK);
}

int iSetId(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strID);
  return(F_OK);
}

int iSetTrace(struct REQUEST * psymR, char * pcCmdLine)
{
  // Not implemented yet
  return(F_OK);
}

int iGo(struct REQUEST * psymR, char * pcCmdLine)
{
  MARKOVLV * psymM;
  FILE     * psymIn1, * psymIn2, * psymIn3, * psymIn4, * psymOut;
  int iMsg;
  long lAge, lLocState;
  char cTrenner;
  extern int iGlobalAudit;
  extern FILE * psymGA;
  //psymM->lSeed = psymR->lNrSim;
  if(!psymR->iPIJFileSet)        return(F_PIJ_NOTDEFN);
  if(!psymR->iLIJVFileSet && !psymR->lPreVerlSet)        return(F_LIJV_NOTDEFN);
  if(!psymR->iLIJNFileSet && !psymR->lPostVerlSet)       return(F_LIJN_NOTDEFN);
  if(!psymR->iDFileSet    && !psymR->lDiscVerlSet)       return(F_DISC_NOTDEFN);
  if(!psymR->iOutFileSet)        return(F_OUTP_NOTDEFN);
  if(!psymR->iNrStatesSet)       return(F_STATES_NOTDEFN);
  if(!psymR->iStartSet)          return(F_START_NOTDEFN);
  if(!psymR->iStopSet)           return(F_STOP_NOTDEFN);
  if(psymR->iMomentsSet<1) psymR->lNrMoments=1;
  psymM = new MARKOVLV(psymR->lStart+1, psymR->lNrStates, psymR->lNrMoments);
  // psymM->lSeed = psymR->lSeed;
  if(psymR->iAppend)
    psymOut = fopen(psymR->strOutFile,"a");
  else
    psymOut = fopen(psymR->strOutFile,"w");
  if(!psymOut)                   return(F_OUTP_OPENFAILED);
  psymIn1 = fopen(psymR->strPIJFile,"r");
  if(!psymIn1)                   
    {
      iMsg = fclose(psymOut); 
      delete(psymM);
      return(F_PIJ_OPENFAILED);
    }
  if(psymR->iLIJVFileSet) psymIn2 = fopen(psymR->strLIJVFile,"r");
  if(!psymIn2)                   
    {
      iMsg = fclose(psymOut); 
      iMsg = fclose(psymIn1); 
      delete(psymM);
      return(F_LIJV_OPENFAILED);
    }
  if(psymR->iLIJNFileSet) psymIn3 = fopen(psymR->strLIJNFile,"r");
  if(!psymIn3)                   
    {
      iMsg = fclose(psymOut); 
      iMsg = fclose(psymIn1); 
      if(psymR->iLIJVFileSet) iMsg = fclose(psymIn2); 
      delete(psymM);
      return(F_LIJN_OPENFAILED);
    }
  if(psymR->iDFileSet) psymIn4 = fopen(psymR->strDFile,"r");
  if(!psymIn4)                   
    {
      iMsg = fclose(psymOut); 
      iMsg = fclose(psymIn1); 
      if(psymR->iLIJVFileSet) iMsg = fclose(psymIn2); 
      if(psymR->iLIJNFileSet) iMsg = fclose(psymIn3); 
      delete(psymM);
      return(F_DISC_OPENFAILED);
    }
  psymM->vSetStartTime(psymR->lStart);
  psymM->vSetStopTime(psymR->lStop);
  psymM->vSetNrStates(psymR->lNrStates);
  vReadFile(psymIn1, READPIJ , psymM, psymOut, psymR);
  if(psymR->iLIJVFileSet) vReadFile(psymIn2, READLIJV, psymM, psymOut, psymR);
  else   vDefLeist(READLIJV, psymM, psymOut, psymR);
  if(psymR->iLIJNFileSet) vReadFile(psymIn3, READLIJN, psymM, psymOut, psymR);
  else   vDefLeist(READLIJN, psymM, psymOut, psymR);
  if(psymR->iDFileSet)    vReadFile(psymIn4, psymR->iDFileSet, psymM, psymOut, psymR);
  else   vDefLeist(READD, psymM, psymOut, psymR);

  if(psymR->iFullOutput & SEMICOLON) cTrenner=';';
  else                               cTrenner=' '; 

  if(psymR->iFullOutput == 0 || (psymR->iFullOutput & DEFAULT_OUTPUT))
    {
      for(lAge = psymR->lStop; lAge < psymR->lStart; ++lAge)
        {
          fprintf(psymOut,"D %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, 1l);
          for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
            {
              double dTemp;
              dTemp = psymM->dGetDK(lAge, lLocState, 1l);
              fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
            }
          fprintf(psymOut,"\n");
        }
    }
  if(psymR->iFullOutput & FULL_OUTPUT)
    {
      long lLocMoment;
      for(lAge = psymR->lStop; lAge < psymR->lStart; ++lAge)
        {
	  for(lLocMoment = 1; lLocMoment <= psymR->lNrMoments; ++ lLocMoment)
	    {
	      fprintf(psymOut,"F %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, lLocMoment);
	      for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
		{
		  double dTemp;
		  dTemp = psymM->dGetDK(lAge, lLocState, lLocMoment);
		  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
		}
	      fprintf(psymOut,"\n");
	    }
        }
    }
  
  if(psymR->iFullOutput & RESTRICTED_OUTPUT)
    {
      lAge = psymR->lStop;
      fprintf(psymOut,"R %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, 1l);
      for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
        {
          fprintf(psymOut,"%c %10.6f",cTrenner, psymM->dGetDK(lAge, lLocState, 1l));
        }
      fprintf(psymOut,"\n");
    }
  if(psymR->iFullOutput & CF_OUTPUT)
    {   
      long lInitState;
      for(lInitState=0; lInitState< psymR->lNrStates; ++ lInitState)
        {
          for(lAge = psymR->lStop; lAge < psymR->lStart; ++lAge)
            {
              fprintf(psymOut,"C %c %10s %c %ld %c %ld ",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, lInitState);
              for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
                {
                  double dTemp;
                  dTemp = psymM->dGetCF(lAge, lInitState, lLocState);
                  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
                }
              fprintf(psymOut,"\n");
            }
        }
    }
  if(psymR->iFullOutput & RISC_PREM_OUTP)
    {
      for(lAge = psymR->lStop; lAge < psymR->lStart; ++lAge)
        {
          fprintf(psymOut,"RP %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, 1l);
          for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
            {
              double dTemp;
              dTemp = psymM->dGetRP(lAge, lLocState);
              fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
            }
          fprintf(psymOut,"\n");
        }
    }

  if(psymR->iFullOutput & SAVINGS_PREM_OUTP)
    {
      for(lAge = psymR->lStop; lAge < psymR->lStart; ++lAge)
        {
          fprintf(psymOut,"SP %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, 1l);
          for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
            {
              double dTemp;
              dTemp = psymM->dGetSP(lAge, lLocState);
              fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
            }
          fprintf(psymOut,"\n");
        }
    }
 
  if(psymR->iFullOutput & REG_PREM_OUTP)
    {
      for(lAge = psymR->lStop; lAge < psymR->lStart; ++lAge)
        {
          fprintf(psymOut,"F %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, 1l);
          for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
            {
              double dTemp;
              dTemp = psymM->dGetRegP(lAge, lLocState);
              fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
            }
          fprintf(psymOut,"\n");
        }
    }

  if(psymR->iFullOutput & RAND_DK_OUTPUT)
    {
      lAge = psymR->lStop;
      {
        fprintf(psymOut,"RNDDK %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, 1l);
        lLocState=0;
        for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
	  {
	    double dTemp;
	    // psymM->vSetInitState(lLocState);
	    // psymM->vResetMeanResults();
	    // dTemp = psymM->dGetMeanDK(lAge,lLocState,psymR->lNrSim);
	    fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
	  }
        fprintf(psymOut,"\n");
      }
    }

  if(psymR->iFullOutput & RAND_TRAJ_DK_OUTPUT)
    {
      long lActNrSim;
      lAge = psymR->lStop;
      for(lActNrSim = 0l; lActNrSim < psymR->lNrSim; ++lActNrSim)
	{
	  if (psymR->iCatter && (lActNrSim % 10000 == 0)) printf("\n ActNr Sim = %10ld  (eg. %6.4f%%)",lActNrSim,lActNrSim/(0.01* psymR->lNrSim));
	  fprintf(psymOut,"TRAJ %c %10s %c %ld %c %ld",cTrenner, psymR->strID, cTrenner, lAge, cTrenner, lActNrSim);
	  for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
	    {
	      double dTemp;
	      //psymM->vSetInitState(lLocState);
	      //psymM->vGenerateTrajectory();
	      //dTemp = psymM->dGetRandDK(lAge, 1l);
	      fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
	    }
	  fprintf(psymOut,"\n");
	}
    }

  if(psymR->bGlobal)
    {
      int iC;
      int iLocActState = psymR->lActState;
      if(iLocActState >= psymR->lNrStates) iLocActState=psymR->lNrStates-1;
      if(iLocActState <0) iLocActState =0;
      //
      for (iC = 0; iC < MAXTIME; ++iC)
	{
	  int iActAge = psymR->lStop + iC;
	  if(iC >= psymR->lStart) break;
                  
	  psymR->dSumDK[iC] += psymM->dGetDK(iActAge, iLocActState, 1l);
	  // todo           psymR->dSumCF[iC] += psymM->dGetDK(lActAge, lLocActState, 1l);
	}     
    }
  
  if(psymR->iLogOn)
    {
      long lAge, lLocState, lLocState2=0;
      double dTemp = 0.;
      int iMsg;
      FILE * psymLogFile = fopen(psymR->strLogFile,"w");
      psymR->iLogOn = 0;
      if(psymLogFile)
        {
          psymM->vSetGetData(true);
          for(lAge = psymR->lStop; lAge <= psymR->lStart; ++lAge)
            {
              for(lLocState=0; lLocState < psymR->lNrStates; ++ lLocState)
                {
                  fprintf(psymLogFile,"\n LijV t= %3ld i = %3ld Wert = %lf", lAge, lLocState, 
                          psymM->dSetPre(lAge, lLocState, lLocState2, dTemp));          
                  for(lLocState2=0; lLocState2 < psymR->lNrStates; ++ lLocState2)
                    {
                      fprintf(psymLogFile,"\n Pij  t= %3ld i = %3ld j = %3ld Wert = %lf", lAge, lLocState, 
                              lLocState2, psymM->dSetPij(lAge, lLocState, lLocState2, dTemp));          
                      fprintf(psymLogFile,"\n LijN t= %3ld i = %3ld j = %3ld Wert = %lf", lAge, lLocState, 
                              lLocState2, psymM->dSetPost(lAge, lLocState, lLocState2, dTemp));         
                      fprintf(psymLogFile,"\n Disc t= %3ld i = %3ld j = %3ld Wert = %lf", lAge, lLocState, 
                              lLocState2, psymM->dSetDisc(lAge, lLocState, lLocState2, dTemp));         
                    }
                }
            }
          iMsg = fclose(psymLogFile);
        }
    }
  if(iGlobalAudit == 2)
    {
      fprintf(psymGA,"\\end{verbatim}\n");
      //      psymM->vPrintTeX(psymGA,false,psymR->strID, false);
      iGlobalAudit = 3;
    }
  if(iGlobalAudit == 1)
    {
      //      psymM->vPrintTeX(psymGA,false,psymR->strID, false);
    }

#ifdef TEST_TEX
  if(psymR->iLogTeXOn){
#pragma message ("Test TeX ON")
    FILE *      psymTex = fopen(psymR->strLogTeXFile,"w");
    if(psymTex) 
      {
	//        psymM->vPrintTeX(psymTex,true,psymR->strID, false);
        fclose(psymTex);
      }
    else
      {
        printf("\n Error Opening TexAuditFile %s",psymR->strLogTeXFile);
      }
  }
#endif
  //psymR->lSeed= psymM->lSeed;
  delete(psymM);
  iMsg= fclose(psymOut);
  iMsg= fclose(psymIn1);
  if(psymR->iLIJVFileSet) iMsg= fclose(psymIn2);
  if(psymR->iLIJNFileSet) iMsg= fclose(psymIn3);
  if(psymR->iDFileSet)    iMsg= fclose(psymIn4);
  return(F_OK);
}

int iProcessNotFoundToken(struct REQUEST * psymR, char * pcCmdLine)
{
  if(psymR->bCintActive == false)
    printf("\n ERROR: TOKEN NOT FOUND: %s", pcCmdLine);
  return(F_OK);
}

int iSetDPre(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTok2[20];
  LVERLAUF * psymTemp;
  psymR->iLIJVFileSet =0;
  if(psymR->lPreVerlSet < 0)
    {
      if(psymR->iKeepVerl) psymR->lPreVerlSet = -psymR->lPreVerlSet;
      else                 psymR->lPreVerlSet = 0; 
    }
  if(psymR->lPreVerlSet >= NRLVERL) return(F_OVERFLOW_BENEF);
  psymTemp = &(psymR->psymPreVerl[psymR->lPreVerlSet]);
  sscanf(pcCmdLine,"%s %ld %ld %ld %ld %lf %lf",strTok2, &psymTemp->lStateVon, &psymTemp->lStateNach,
         &psymTemp->lTimeVon, &psymTemp->lTimeNach, &psymTemp->dStartwert, 
         &psymTemp->dParameter);
  if(strstr(strTok2,"lin")) 
    {
      psymTemp-> iTyp = LINEAR;
      ++psymR->lPreVerlSet;
      return(F_OK);
    }
  if(strstr(strTok2,"exp")) 
    {
      psymTemp-> iTyp = EXP;
      ++psymR->lPreVerlSet;
      return(F_OK);
    }
  return(W_TOKEN_NOT_FOUND);
}

int iSetDPost(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTok2[20];
  LVERLAUF * psymTemp;
  psymR->iLIJNFileSet = 0;
  if(psymR->lPostVerlSet < 0)
    {
      if(psymR->iKeepVerl) psymR->lPostVerlSet = -psymR->lPostVerlSet;
      else                 psymR->lPostVerlSet = 0; 
    }
  if(psymR->lPostVerlSet >= NRLVERL) return(F_OVERFLOW_BENEF);
  psymTemp = &(psymR->psymPostVerl[psymR->lPostVerlSet]);
  sscanf(pcCmdLine,"%s %ld %ld %ld %ld %lf %lf",strTok2, &psymTemp->lStateVon, &psymTemp->lStateNach,
         &psymTemp->lTimeVon, &psymTemp->lTimeNach, &psymTemp->dStartwert, 
         &psymTemp->dParameter);
  if(strstr(strTok2,"lin")) 
    {
      psymTemp-> iTyp = LINEAR;
      ++psymR->lPostVerlSet;
      return(F_OK);
    }
  if(strstr(strTok2,"exp")) 
    {
      psymTemp-> iTyp = EXP;
      ++psymR->lPostVerlSet;
      return(F_OK);
    }
  return(W_TOKEN_NOT_FOUND);
}

int iSetDDisc(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTok2[20];
  LVERLAUF * psymTemp;
  psymR->iDFileSet = 0;
  if(psymR->lDiscVerlSet < 0)
    {
      if(psymR->iKeepVerl) psymR->lDiscVerlSet = -psymR->lDiscVerlSet;
      else                 psymR->lDiscVerlSet = 0; 
    }
  if(psymR->lDiscVerlSet >= NRLVERL) return(F_OVERFLOW_BENEF);
  psymTemp = &(psymR->psymDiscVerl[psymR->lDiscVerlSet]);
  sscanf(pcCmdLine,"%s %ld %ld %ld %ld %lf %lf",strTok2, &psymTemp->lStateVon, &psymTemp->lStateNach,
         &psymTemp->lTimeVon, &psymTemp->lTimeNach, &psymTemp->dStartwert, 
         &psymTemp->dParameter);
  if(strstr(strTok2,"lin")) 
    {
      psymTemp-> iTyp = LINEAR;
      ++psymR->lDiscVerlSet;
      return(F_OK);
    }
  if(strstr(strTok2,"exp")) 
    {
      psymTemp-> iTyp = EXP;
      ++psymR->lDiscVerlSet;
      return(F_OK);
    }
  return(W_TOKEN_NOT_FOUND);
}
int iSetLog(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strLogFile);
  psymR->iLogOn= 1;
  return(F_OK);
}

int iSetAudiTex(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%s", psymR->strLogTeXFile);
  psymR->iLogTeXOn= 1;
  return(F_OK);
}
int iSetNrSim(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%ld",&psymR->lNrSim);
  if (psymR->lNrSim < 0)
    psymR->lNrSim = 1l;
  return(F_OK);
}
int iSetSeed(struct REQUEST * psymR, char * pcCmdLine)
{
  
  sscanf(pcCmdLine,"%ld",&psymR->lSeed);
  if (psymR->lSeed < 0)
    psymR->lSeed = 123456l;
  return(F_OK);
}

int iSetStartCint(struct REQUEST * psymR, char * pcCmdLine)
{
  // todo if(psymR->bCintActive == true) 
  *psymR->strTempCName ='\0';
  strcat(psymR->strTempCName,"tempcfile.cxx");
  psymR->psymCSourceFile=fopen(psymR->strTempCName,"w");
  psymR->bCintActive= true;  
  // do initialisation of temp c-file 
  // put name + ptr in request structure
  return(F_OK);
}

int iSetEndCint(struct REQUEST * psymR, char * pcCmdLine)
{
  // to be done
  int iMsg;
  char strTemp[1024];
  psymR->bCintActive= false;
  iMsg=fclose(psymR->psymCSourceFile);
  sprintf(strTemp,"cint -l c:\\cint\\omarkov.dll %s",psymR->strTempCName);
#ifdef USECINT
  G__init_cint(strTemp);
  G__scratch_all();
#endif
  return(F_OK);
}

int iSetExecCintFile(struct REQUEST * psymR, char * pcCmdLine)
{
  // to be done
#ifdef USECINT
  G__init_cint(pcCmdLine);
  G__scratch_all();
#endif
  return(F_OK);
}

int iSetExecProgramViaShell(struct REQUEST * psymR, char * pcCmdLine)
{
  /*#ifndef __WATCOMC__
    int iMsg;
    char strTemp[2056], * pcChar, * pcChar2;
    *strTemp ='\0';
    strncat(strTemp, pcCmdLine, 2000);
    for(pcChar=strTemp;*pcChar;++pcChar)
    {
    if(*pcChar != ' ') break;
    }
    pcChar2 = pcChar;
    for(;*pcChar;++pcChar)
    {
    if((int)*pcChar == 10) *pcChar =' ';
    }
    iMsg= (int)WinExec(pcChar2,SW_SHOW);
    printf("\n Execute: '%s' Msg %d", pcChar2, iMsg);
    #endif */        
  return(F_OK);
}

int iPrint(struct REQUEST * psymR, char * pcCmdLine)
{
  FILE * psymOut;
  if(psymR->iAppend)
    psymOut = fopen(psymR->strOutFile,"a");
  else
    psymOut = fopen(psymR->strOutFile,"w");
  if(!psymOut)                   return(F_OUTP_OPENFAILED);
  fprintf(psymOut,"%s \n",pcCmdLine);
  fclose(psymOut);
  return(F_OK);
}

int iProcessGlobal(struct REQUEST * psymR, char * pcCmdLine)
{
  if(strstr(pcCmdLine,"start")) 
    {
      psymR->bGlobal= true;
    }
  if(strstr(pcCmdLine,"stop" ))
    {
      psymR->bGlobal= false;
    }
  if(strstr(pcCmdLine,"print"))
    {
      int iC;
      printf("\n Total DK and CF (Sum):");
      printf("\n ----------------------");
      for (iC = 0; iC < MAXTIME; ++iC)
	{
	  printf("\n t=%3d  DK = %15.5f   CF = %15.5 f",iC, psymR->dSumDK[iC],psymR->dSumCF[iC]);
	}
    }
  if(strstr(pcCmdLine,"reset"))           
    {
      int iC;
      for (iC = 0; iC < MAXTIME; ++iC)
	{
	  psymR->dSumDK[iC] =0.f;
	  psymR->dSumCF[iC] =0.f;
	}
    }
        
  return(F_OK);
}

int iProcessActState(struct REQUEST * psymR, char * pcCmdLine)
{
  long lActState;
  sscanf(pcCmdLine,"%ld",&lActState); 
  if(lActState < 0) lActState = 0l;
  psymR->lActState = lActState;      
  return(F_OK);
}


/* hier inline readfile definiert */
int iReadFile(const char * strName, int iTyp, int iSex, int iTaf, int iOrder)
{
  // assumes psymGLMOD beeing life !!

  FILE * psymFile;
  char strBuffer[1024];
  char * pcChar;

  psymFile = fopen(strName,"r");
  if (psymFile == NULL)
    {
      return(F_GLMOD_OPENFAILED);
    }
  while(!feof(psymFile))
    {
      if(fgets(strBuffer,1024,psymFile))
	{
	  int iAge;
	  double dValue;
	  double dTemp;
	  pcChar = strBuffer;
	  while(pcChar)
	    {
	      if(*pcChar != ' ') break;
	      ++pcChar;
	    }
	  sscanf(pcChar,"%d %lf",&iAge, &dValue);
	  if(iAge >= 0 && iAge < 250  && iTyp < 4)
	    {
	      if (iTyp == QXTYPE) dTemp = psymGLMOD->dSetQx(iTaf, iOrder, iSex, iAge, dValue); 
	      if (iTyp == FXTYPE) dTemp = psymGLMOD->dSetFx(iTaf, iOrder, iSex, iAge, dValue); 
	      if (iTyp == SXTYPE) dTemp = psymGLMOD->dSetSx(iTaf, iOrder, iSex, iAge, dValue);
	      if (iTyp == YIELDTYPE) 
                {
		  dValue += 1.;
		  if(dValue != 0) dValue = 1./dValue;
		  else dValue = 0.;
		  dTemp = psymGLMOD->dSetDisc(iAge-1, dValue);
		  //printf("\nXX t=%d Wert = %10.8f",iAge-1, dValue); 
                }
	    }
              
	}
    }
	
  return(0);
}


int iNewGLMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  psymGLMOD =new GLMOD;
  if(psymGLMOD != NULL)   return(F_OK);
  printf("\n Something has gone definively wrong: no more memory");
  return(F_OVERFLOW_BENEF);
}

int iSetGLMODQx(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  char strTemp2[256];
  int iMsg=0, iGL, iTaf, iSex;

  sscanf(pcCmdLine,"%s %s",strTemp1, strTemp2);
  if(psymGLMOD == NULL) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  if(strstr(strTemp1,"1"))  iGL=0;  else iGL=1;
  if(strstr(strTemp1,"K"))  iTaf=0; else iTaf=1;
  if(strstr(strTemp1,"M"))  iSex=0; else iSex=1;

  iMsg = iReadFile(strTemp2, QXTYPE, iSex, iTaf, iGL);

  return(iMsg);
}

int iSetGLMODFx(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  char strTemp2[256];
  int iMsg=0, iGL, iTaf, iSex;

  sscanf(pcCmdLine,"%s %s",strTemp1, strTemp2);
  if(psymGLMOD == NULL) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  if(strstr(strTemp1,"1"))  iGL=0;  else iGL=1;
  if(strstr(strTemp1,"K"))  iTaf=0; else iTaf=1;
  if(strstr(strTemp1,"M"))  iSex=0; else iSex=1;

  iMsg = iReadFile(strTemp2, FXTYPE, iSex, iTaf, iGL);

  return(iMsg);
}

int iSetGLMODSx(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  int iMsg=0;

  sscanf(pcCmdLine,"%s",strTemp1);
  if(psymGLMOD == NULL) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  iMsg = iReadFile(strTemp1, SXTYPE, 0, 0, 0);


  return(iMsg);

}

int iSetGLMODTo(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  int iMsg=0, iGL, iTaf, iSex;
  long lBJ;
  double dTemp;

  sscanf(pcCmdLine,"%s %ld",strTemp1, &lBJ);
  if(psymGLMOD == NULL) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  if(strstr(strTemp1,"1"))  iGL=0;  else iGL=1;
  if(strstr(strTemp1,"K"))  iTaf=0; else iTaf=1;
  if(strstr(strTemp1,"M"))  iSex=0; else iSex=1;
  dTemp = psymGLMOD->dSetBaseYear(iTaf, iGL, iSex, lBJ);
  return(F_OK);
}

int iSetGLMODActTime(struct REQUEST * psymR, char * pcCmdLine)
{
  int iMsg=0;
  double dTemp;
  if(psymGLMOD == NULL) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  dTemp =     psymGLMOD->dSetActualYear(atol(pcCmdLine));
  return(F_OK);
}

int iSetGLMODYield(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  int iMsg = 0;

  sscanf(pcCmdLine," %s",strTemp1);
  if(psymGLMOD== NULL) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  iMsg = iReadFile(strTemp1, 2, 0, 0, 0);

  return(iMsg);
}

int iSetGLMODReadInforce(struct REQUEST * psymR, char * pcCmdLine)
{
  // Set Inforce File [File]
  int iMsg = 0;
  FILE * psymFile;
  char strBuffer[1024];
  char * pcChar;
  long lNrLines = 0;

  sscanf(pcCmdLine,"%s",strBuffer);
  psymFile = fopen(strBuffer,"r");
  if (psymFile == NULL)
    {
      return(F_GLMOD_OPENFAILED);
    }
  if(psymGLMOD == NULL) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);

  while(!feof(psymFile))
    {
      if(fgets(strBuffer,1024,psymFile))
	{
	  // STRUKTUR        Tarif (A/G)  Geschlecht(1/2) Alter Schlussalter  Leistung Prämie Technischer Zins
	  //   void          vAddAnnuity(long lSex, long lX, long lS, long lNTimes, double dLeist, double dPraem, double dITechn); 
	  //   void          vAddEndowment(long lSex, long lX, long lS, double dLeist, double dPraem, double dITechn);
	  int iAge, iSex, iSA;
	  char strTar[50];  
	  double dL, dP, dTi;
	  pcChar = strBuffer;
	  while(pcChar)
	    {
	      if(*pcChar != ' ') break;
	      ++pcChar;
	    }
	  sscanf(pcChar,"%s %d %d %d %lf %lf %lf", strTar, &iSex, &iAge, &iSA,  &dL, &dP, &dTi);
#ifdef TRACE_GLMOD
	  printf("\n Step 1: %s %d %d %d %lf %lf %lf", strTar, iSex, iAge, iSA,  dL, dP, dTi);
#else
	  if(!(lNrLines % 100)) printf("\n Read %4d Lines",lNrLines);
#endif
	  --iSex; if(iSex >=0 || iSex <=1)
		    {
		      if(strstr(strTar,"G")) psymGLMOD->vAddEndowment(iSex, iAge, iSA, dL, dP, dTi);
		      if(strstr(strTar,"A")) psymGLMOD->vAddAnnuity(iSex, iAge, iSA, 4, dL, dP, dTi);
		      if(strstr(strTar,"W")) psymGLMOD->vAddWiddow(iSex, iAge, iSA, 4, dL, dP, dTi);
		    }
	  ++lNrLines;
	}
    }
  iMsg= fclose(psymFile);
  return(F_OK);
  printf("\n Done: read of inforce %5d", lNrLines);
}
    

int  iSetGLMODStress(struct REQUEST * psymR, char * pcCmdLine)
{
  // Set Stress [reset/qx/fx/sx/yield][amount]
  char strTemp1[256];
  int iMsg=0;
  double dValue;
  sscanf(pcCmdLine,"%s %lf", strTemp1, &dValue);

  if(!psymGLMOD) iMsg= iNewGLMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
    
  if(strstr(strTemp1,"reset")) psymGLMOD->vStress(0, 0.);  
  if(strstr(strTemp1,"qx"))    psymGLMOD->vStress(1, dValue);  
  if(strstr(strTemp1,"fx"))    psymGLMOD->vStress(2, dValue);  
  if(strstr(strTemp1,"sx"))    psymGLMOD->vStress(3, dValue);  
  if(strstr(strTemp1,"yield")) psymGLMOD->vStress(4, dValue);  

  return(F_OK);
}

int  iExecGLMOD(struct REQUEST * psymR, char * pcCmdLine)
{

  FILE * psymOut;
  int iMsg;
  long lAge;
  char cTrenner;
  double dTemp;
  extern int iGlobalAudit;
  extern FILE * psymGA;
  if(!psymR->iOutFileSet)        return(F_OUTP_NOTDEFN);
  if(psymR->iAppend)
    psymOut = fopen(psymR->strOutFile,"a");
  else
    psymOut = fopen(psymR->strOutFile,"w");
  if(!psymOut)                   return(F_OUTP_OPENFAILED);

  if(psymR->iFullOutput & SEMICOLON) cTrenner=';';
  else                               cTrenner=' '; 

     
  for(lAge = 0; lAge < 120; ++lAge)
    {
      fprintf(psymOut,"DGLM %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
      dTemp = psymGLMOD->dGetDK(lAge);
      fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
      fprintf(psymOut,"\n");
    }
  lAge = 0;
  fprintf(psymOut,"STATDKGLM %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
  dTemp = psymGLMOD->dGetStatDK();
  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
  fprintf(psymOut,"\n");

  fprintf(psymOut,"FVDKGLM %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
  dTemp = psymGLMOD->dGetFVDK();
  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
  fprintf(psymOut,"\n");

  if(psymR->iFullOutput & CF_OUTPUT)
    {   
      for(lAge = 0; lAge < 120; ++lAge)
	{
	  fprintf(psymOut,"CGLM %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
	  dTemp = psymGLMOD->dGetCF(lAge);
	  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
	  fprintf(psymOut,"\n");
	}
    }

  
  if(iGlobalAudit == 2)
    {
      fprintf(psymGA,"\\end{verbatim}\n");
      //      psymGLMOD->vPrintTeX(psymGA,false,psymR->strID, false);
      iGlobalAudit = 3;
    }
  if(iGlobalAudit == 1)
    {
      //      psymGLMOD->vPrintTeX(psymGA,false,psymR->strID, false);
    }

#ifdef TEST_TEX
  if(psymR->iLogTeXOn){
#pragma message ("Test TeX ON")
    FILE *      psymTex = fopen(psymR->strLogTeXFile,"w");
    if(psymTex) 
      {
	//        psymGLMOD->vPrintTeX(psymTex,true,psymR->strID, false);
        fclose(psymTex);
      }
    else
      {
        printf("\n Error Opening TexAuditFile %s",psymR->strLogTeXFile);
      }
  }
#endif
  iMsg= fclose(psymOut);
  return(F_OK);

}

int iResetGLMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  if(psymGLMOD) delete (psymGLMOD);
  psymGLMOD = NULL;
  return(F_OK);
}

//  "GLMOD(SetModel) "   , "SModel GLMOD k Type", iSModelGLMOD ,"iSModelGLMOD"
int iSModelGLMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  // not implemented yet
  return(F_OK);
}  
//  "GLMOD(SetParameters) "   , "SParameters GLMOD Par_1 ... Par_6", iSParamGLMOD ,"iSParamGLMOD",  
int iSParamGLMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%lf  %lf", &dSimParam[0],&dSimParam[1]);
  printf("\n Parameters mu %10.8lf  sigma %10.8lf \n", dSimParam[0],dSimParam[1]);
  return(F_OK);
}    
// We inline here random generator
float ran2(long *idum);

float fRandNorm(long *idum) 
{
  float x1, x2, w; 
 
  do
    {            
      x1 = 2. * ran2(idum) - 1.;
      x2 = 2. * ran2(idum) - 1.;
      w = x1 * x1 + x2 * x2;
    }
  while(w >= 1.);

  w = pow((-2. * log(w)) / w, 0.5);
  return(x1 * w);
}


//  "GLMOD(Simulate) "   , "Simulate GLMOD nn Simuations ", iSimulateGLMOD ,"iSimulateGLMOD",
int iSimulateGLMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  FILE * psymOut;
  char cTrenner;
  long lActSim, lNrSims;
  int  iMsg; 
  long iTime;
  double dMu, dSigma;
  static double TotCF[MAXGLMSIMS][100];
  long idum = 334568876l;
  double dPast, dTemp;

  if(psymR->lSeed != 0) idum = psymR->lSeed;

  if(!psymR->iOutFileSet)        return(F_OUTP_NOTDEFN);
  if(psymR->iAppend)
    psymOut = fopen(psymR->strOutFile,"a");
  else
    psymOut = fopen(psymR->strOutFile,"w");
  if(!psymOut)                   return(F_OUTP_OPENFAILED);
  if(psymR->iFullOutput & SEMICOLON) cTrenner=';';
  else                               cTrenner=' '; 
  

  dMu = dSimParam[0];
  dSigma = dSimParam[1];
  sscanf(pcCmdLine,"%ld", &lNrSims);
  if( lNrSims > MAXGLMSIMS) lNrSims = MAXGLMSIMS;

  printf("\n Nr Sims Total %10ld \n",lNrSims);

  for (lActSim = 0l; lActSim < lNrSims; ++lActSim)
    {
    
      dPast = 1;
      for(iTime = 0; iTime < 100; ++ iTime)
	{
	  dTemp = exp(dMu + dSigma * fRandNorm(&idum));
	  dPast = dPast * dTemp;
	  //printf("\n %6d  %10.6f %10.6f", iTime, dTemp, dPast);
	  dTemp = psymGLMOD->dSetRelativeQxForTime(iTime,dPast);
	}
      //iMsg = iExecGLMOD(psymR, pcCmdLine);
      for(iTime = 0; iTime < 100; ++ iTime)
	{
	  TotCF[lActSim][iTime] = psymGLMOD->dGetCF(iTime);
	}
      printf("\n ActNr Sim = %10ld  (eg. %6.4f%%) DK(Traj) %12.1f%% ",lActSim,lActSim/(0.01* lNrSims),psymGLMOD->dGetDK(0));
    }
  printf("\n Write Simulation results on File \n");
 
  
  for(lActSim = 0; lActSim < lNrSims; ++lActSim)    
    {
      sprintf(psymR->strID,"%8ld",lActSim); 
      for(iTime = 0; iTime < 100; ++iTime)
	{
	  fprintf(psymOut,"GLMS %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, iTime);
	  dTemp = TotCF[lActSim][iTime];
	  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
	  fprintf(psymOut,"\n");
	}
    }
  iMsg= fclose(psymOut);
  return(iMsg);
}  

// ============================================================================================
//
//  ANN MOD
//
#ifdef INCL_ANNMOD
/* hier inline readfile definiert */
int iReadFileAnn(const char * strName, int iTyp, int iSex, int iTaf, int iOrder)
{
  // assumes psymANNMOD beeing life !!

  FILE * psymFile;
  char strBuffer[1024];
  char * pcChar;

  psymFile = fopen(strName,"r");
  if (psymFile == NULL)
    {
      return(F_GLMOD_OPENFAILED);
    }
  while(!feof(psymFile))
    {
      if(fgets(strBuffer,1024,psymFile))
	{
	  int iAge;
	  double dValue;
	  double dTemp;
	  pcChar = strBuffer;
	  while(pcChar)
	    {
	      if(*pcChar != ' ') break;
	      ++pcChar;
	    }
	  sscanf(pcChar,"%d %lf",&iAge, &dValue);
	  if(iAge >= 0 && iAge < 250  && iTyp < 4)
	    {
	      if (iTyp == QXTYPE) dTemp = psymANNMOD->dSetQx(iTaf, iOrder, iSex, iAge, dValue); 
	      if (iTyp == FXTYPE) dTemp = psymANNMOD->dSetFx(iTaf, iOrder, iSex, iAge, dValue); 
	      if (iTyp == SXTYPE) dTemp = psymANNMOD->dSetSx(iTaf, iOrder, iSex, iAge, dValue);
	      if (iTyp == YIELDTYPE) 
                {
		  dValue += 1.;
		  if(dValue != 0) dValue = 1./dValue;
		  else dValue = 0.;
		  dTemp = psymANNMOD->dSetDisc(iAge-1, dValue);
		  //printf("\nXX t=%d Wert = %10.8f",iAge-1, dValue); 
                }
	    }
              
	}
    }
	
  return(0);
}

int iNewANNMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  psymANNMOD =new ANNMOD;
  if(psymANNMOD != NULL)   return(F_OK);
  printf("\n Something has gone definively wrong: no more memory");
  return(F_OVERFLOW_BENEF);
}

int iSetANNMODQx(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  char strTemp2[256];
  int iMsg=0, iGL, iTaf, iSex;

  sscanf(pcCmdLine,"%s %s",strTemp1, strTemp2);
  if(psymANNMOD == NULL) iMsg= iNewANNMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  if(strstr(strTemp1,"1"))  iGL=0;  else iGL=1;
  if(strstr(strTemp1,"K"))  iTaf=0; else iTaf=1;
  if(strstr(strTemp1,"M"))  iSex=0; else iSex=1;

  iMsg = iReadFileAnn(strTemp2, QXTYPE, iSex, iTaf, iGL);

  return(iMsg);
}

int iSetANNMODFx(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  char strTemp2[256];
  int iMsg=0, iGL, iTaf, iSex;

  sscanf(pcCmdLine,"%s %s",strTemp1, strTemp2);
  if(psymANNMOD == NULL) iMsg= iNewANNMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  if(strstr(strTemp1,"1"))  iGL=0;  else iGL=1;
  if(strstr(strTemp1,"K"))  iTaf=0; else iTaf=1;
  if(strstr(strTemp1,"M"))  iSex=0; else iSex=1;

  iMsg = iReadFileAnn(strTemp2, FXTYPE, iSex, iTaf, iGL);

  return(iMsg);
}

int iSetANNMODSx(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  int iMsg=0;

  sscanf(pcCmdLine,"%s",strTemp1);
  if(psymANNMOD == NULL) iMsg= iNewANNMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  iMsg = iReadFileAnn(strTemp1, SXTYPE, 0, 0, 0);


  return(iMsg);

}

int iSetANNMODTo(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  int iMsg=0, iGL, iTaf, iSex;
  long lBJ;
  double dTemp;

  sscanf(pcCmdLine,"%s %ld",strTemp1, &lBJ);
  if(psymANNMOD == NULL) iMsg= iNewANNMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  if(strstr(strTemp1,"1"))  iGL=0;  else iGL=1;
  if(strstr(strTemp1,"K"))  iTaf=0; else iTaf=1;
  if(strstr(strTemp1,"M"))  iSex=0; else iSex=1;
  dTemp = psymANNMOD->dSetBaseYear(iTaf, iGL, iSex, lBJ);
  return(F_OK);
}

int iSetANNMODActTime(struct REQUEST * psymR, char * pcCmdLine)
{
  int iMsg=0;
  double dTemp;
  if(psymANNMOD == NULL) iMsg= iNewANNMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  dTemp =     psymANNMOD->dSetActualYear(atol(pcCmdLine));
  return(F_OK);
}

int iSetANNMODYield(struct REQUEST * psymR, char * pcCmdLine)
{
  char strTemp1[256];
  int iMsg = 0;

  sscanf(pcCmdLine," %s",strTemp1);
  if(psymANNMOD== NULL) iMsg= iNewANNMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);
  iMsg = iReadFileAnn(strTemp1, 2, 0, 0, 0);

  return(iMsg);
}

int iSetANNMODReadInforce(struct REQUEST * psymR, char * pcCmdLine)
{
  // Set Inforce File [File]
  int iMsg = 0;
  FILE * psymFile;
  char strBuffer[1024];
  char * pcChar;
  long lNrLines = 0;

  sscanf(pcCmdLine,"%s",strBuffer);
  psymFile = fopen(strBuffer,"r");
  if (psymFile == NULL)
    {
      return(F_GLMOD_OPENFAILED);
    }
  if(psymANNMOD == NULL) iMsg= iNewANNMOD(psymR, pcCmdLine);
  if(iMsg) return(iMsg);

  while(!feof(psymFile))
    {
      if(fgets(strBuffer,1024,psymFile))
	{
	  // STRUKTUR      Tarif   iSex1 iSex2 iX iY iS  L P (m) TechZins alpha (erhoehungsfakt)
	  // Tarife        ax.   Ein Leben
	  //               axy   Zwei Leben auf Verbundened Leben
	  //               ag    Zinsrente
	  //               ax|y  Witwenrente x--> y


	  int iAge1, iAge2, iSex1, iSex2, iSA, iM;
	  double dValue;
	  char strTar[50];  
	  double dTemp, dL, dP, dTi, dUnter, dAlpha;
	  pcChar = strBuffer;
	  while(pcChar)
	    {
	      if(*pcChar != ' ') break;
	      ++pcChar;
	    }
	  //              &iSex1, &iSex2, &iAge1, &iAge2, &iSA,  &dL, &dP, &iM, &dTi, &dAlpha
	  sscanf(pcChar,"%s %d %d %d %d %d %lf %lf %d %lf %lf", strTar, &iSex1, &iSex2, &iAge1, &iAge2, &iSA,  &dL, &dP, &iM, &dTi, &dAlpha);

#ifdef TRACE_ANNMOD
	  printf("\n Step1: %s %d %d %d %d %d %lf %lf %d %lf %lf", strTar, iSex1, iSex2, iAge1, iAge2, iSA,  dL, dP, iM, dTi, dAlpha);
#else
	  if(!(lNrLines % 100)) printf("\n Read %4d Lines",lNrLines);
#endif
	  if(strstr(strTar,"ag"))  psymANNMOD->vAddAnnuity0(iAge1,iSA,iM,dL,dP,dTi,dAlpha); 
                                                  
	  --iSex1; if(iSex1 >=0 || iSex1 <=1)
		     {
		       // Tarife        ax.   Ein Leben
		       //               axy   Zwei Leben auf Verbundened Leben
		       //               ag    Zinsrente
		       //               ax|y  Witwenrente x--> y
		       if(strstr(strTar,"ax.")) psymANNMOD->vAddAnnuity1(  iSex1,iAge1,iSA,iM,dL,dP,dTi,dAlpha); 
		       --iSex2; if(iSex2 >=0 || iSex2 <=1)
				  {
				    if(strstr(strTar,"axy")) psymANNMOD->vAddAnnuity2xy(iSex1,iSex2,iAge1,iAge2,iSA,iM,dL,dP,dTi,dAlpha); 
				    if(strstr(strTar,"ax|y"))psymANNMOD->vAddAnnuity2xToy(iSex1,iSex2,iAge1,iAge2,iSA,iM,dL,dP,dTi,dAlpha); 
				  }
		     }
	  ++lNrLines;
	}
    }
  iMsg= fclose(psymFile);
  return(F_OK);
  printf("\n Done: read of inforce %5d", lNrLines);
}
    

int  iExecANNMOD(struct REQUEST * psymR, char * pcCmdLine)
{

  FILE * psymOut;
  int iMsg;
  long lAge;
  char cTrenner;
  double dTemp;
  extern int iGlobalAudit;
  extern FILE * psymGA;
  if(!psymR->iOutFileSet)        return(F_OUTP_NOTDEFN);
  if(psymR->iAppend)
    psymOut = fopen(psymR->strOutFile,"a");
  else
    psymOut = fopen(psymR->strOutFile,"w");
  if(!psymOut)                   return(F_OUTP_OPENFAILED);

  if(psymR->iFullOutput & SEMICOLON) cTrenner=';';
  else                               cTrenner=' '; 

     
  for(lAge = 0; lAge < 120; ++lAge)
    {
      fprintf(psymOut,"DANN %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
      dTemp = psymANNMOD->dGetDK(lAge);
      fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
      fprintf(psymOut,"\n");
    }
  lAge = 0;
  fprintf(psymOut,"STATDKANN %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
  dTemp = psymANNMOD->dGetStatDK();
  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
  fprintf(psymOut,"\n");

  fprintf(psymOut,"FVDKANN %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
  dTemp = psymANNMOD->dGetFVDK();
  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
  fprintf(psymOut,"\n");

  if(psymR->iFullOutput & CF_OUTPUT)
    {   
      for(lAge = 0; lAge < 120; ++lAge)
	{
	  fprintf(psymOut,"CANN %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, lAge);
	  dTemp = psymANNMOD->dGetCF(lAge);
	  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
	  fprintf(psymOut,"\n");
	}
    }

  
  if(iGlobalAudit == 2)
    {
      fprintf(psymGA,"\\end{verbatim}\n");
      //      psymANNMOD->vPrintTeX(psymGA,false,psymR->strID, false);
      iGlobalAudit = 3;
    }
  if(iGlobalAudit == 1)
    {
      //      psymANNMOD->vPrintTeX(psymGA,false,psymR->strID, false);
    }

#ifdef TEST_TEX
  if(psymR->iLogTeXOn){
#pragma message ("Test TeX ON")
    FILE *      psymTex = fopen(psymR->strLogTeXFile,"w");
    if(psymTex) 
      {
	//        psymANNMOD->vPrintTeX(psymTex,true,psymR->strID, false);
        fclose(psymTex);
      }
    else
      {
        printf("\n Error Opening TexAuditFile %s",psymR->strLogTeXFile);
      }
  }
#endif
  iMsg= fclose(psymOut);
  return(F_OK);

}

int iResetANNMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  if(psymANNMOD) delete (psymANNMOD);
  psymANNMOD = NULL;
  return(F_OK);
}

//  "ANNMOD(SetModel) "   , "SModel ANNMOD k Type", iSModelANNMOD ,"iSModelANNMOD"
int iSModelANNMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  // not implemented yet
  return(F_OK);
}  
//  "ANNMOD(SetParameters) "   , "SParameters ANNMOD Par_1 ... Par_6", iSParamANNMOD ,"iSParamANNMOD",  
int iSParamANNMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  sscanf(pcCmdLine,"%lf  %lf", &dSimParam[0],&dSimParam[1]);
  printf("\n Parameters mu %10.8lf  sigma %10.8lf \n", dSimParam[0],dSimParam[1]);
  return(F_OK);
}    

//  "ANNMOD(Simulate) "   , "Simulate ANNMOD nn Simuations ", iSimulateANNMOD ,"iSimulateANNMOD",
int iSimulateANNMOD(struct REQUEST * psymR, char * pcCmdLine)
{
  FILE * psymOut;
  char cTrenner;
  long lActSim, lNrSims;
  int  iMsg; 
  long iTime;
  double dMu, dSigma;
  //static double TotCF[MAXGLMSIMS][100];
  long idum = 334568876l;
  double dPast, dTemp;

  if(psymR->lSeed != 0) idum = psymR->lSeed;

  if(!psymR->iOutFileSet)        return(F_OUTP_NOTDEFN);
  if(psymR->iAppend)
    psymOut = fopen(psymR->strOutFile,"a");
  else
    psymOut = fopen(psymR->strOutFile,"w");
  if(!psymOut)                   return(F_OUTP_OPENFAILED);
  if(psymR->iFullOutput & SEMICOLON) cTrenner=';';
  else                               cTrenner=' '; 
  

  dMu = dSimParam[0];
  dSigma = dSimParam[1];
  sscanf(pcCmdLine,"%ld", &lNrSims);
  if( lNrSims > MAXGLMSIMS) lNrSims = MAXGLMSIMS;

  printf("\n Nr Sims Total %10ld \n",lNrSims);

  for (lActSim = 0l; lActSim < lNrSims; ++lActSim)
    {
    
      dPast = 1;
      for(iTime = 0; iTime < 100; ++ iTime)
	{
	  dTemp = exp(dMu + dSigma * fRandNorm(&idum));
	  dPast = dPast * dTemp;
	  //printf("\n %6d  %10.6f %10.6f", iTime, dTemp, dPast);
	  dTemp = psymANNMOD->dSetRelativeQxForTime(iTime,dPast);
	}
      //iMsg = iExecANNMOD(psymR, pcCmdLine);
      for(iTime = 0; iTime < 100; ++ iTime)
	{
	  //TotCF[lActSim][iTime] = psymANNMOD->dGetCF(iTime);
	}
      printf("\n ActNr Sim = %10ld  (eg. %6.4f%%) DK(Traj) %12.1f% ",lActSim,lActSim/(0.01* lNrSims),psymANNMOD->dGetDK(0));
    }
  printf("\n Write Simulation results on File \n");
 
  
  for(lActSim = 0; lActSim < lNrSims; ++lActSim)    
    {
      sprintf(psymR->strID,"%8ld",lActSim); 
      for(iTime = 0; iTime < 100; ++iTime)
	{
	  fprintf(psymOut,"GLMS %c %10s %c %ld ",cTrenner, psymR->strID, cTrenner, iTime);
	  //dTemp = TotCF[lActSim][iTime];
	  fprintf(psymOut,"%c %10.6f",cTrenner, dTemp);
	  fprintf(psymOut,"\n");
	}
    }
  iMsg= fclose(psymOut);
  return(iMsg);
}  

#endif
// ============================================================================================


int iNOP(struct REQUEST * psymR, char * pcCmdLine)
{
  return(F_OK);
}

TOKENTABLE * symTokens;
TOKENTABLE symIntTokens[]=
  {
    "LibPath"         , "Library Path [File]"              , iSetLibPath  ,  "iSetLibPath",
    "FPre"            , "Pre File [File]"                  , iSetPreFile  ,  "iSetPreFile",
    "FPost"           , "Post File [File]"                 , iSetPostFile ,  "iSetPostFile",
    "FDisc"           , "Discount File [File]"             , iSetDiscFile ,  "iSetDiscFile",
    "FYield"          , "Forewardrates File [File]"        , iSetYieldFile,  "iSetYieldFile",
    "FPij"            , "Pij File [File]"                  , iSetPijFile  ,  "iSetPijFile",
    "FOut"            , "Out File [File]"                  , iSetOutFile  ,  "iSetOutFile",
    "Model"           , "Model [States] [Start] [Stop]"    , iSetModel    ,  "iSetModel",
    "Append"          , "Append Mode [y/n]"                , iSetAppendMode, "iSetAppendMode",
    "Moments"         , "Moments [Number]"                 , iSetMoments,    "iSetMoments",
    "OutputMode"      , "OutputMode [full/normal/restricted/cf/rp/sp/regp/rand/traj]"     , iSetOutputMode, "iSetOutputMode",
    "Id"              , "Id [String]"                      , iSetId       ,  "iSetId", 
    "TRACE"           , "TRACE [File]"                     , iSetTrace    ,  "iSetTrace",
    "Go"              , "Rechne"                           , iGo          ,  "iGo",
    "DPre"            , "Defn. Pre [lin/exp] von nach zeitvon zeitbis wert, par", iSetDPre,   "iSetDPre",
    "DPost"           , "Defn. Post [lin/exp] von nach zeitvon zeitbis wert, par", iSetDPost, "iSetDPost",
    "DDisc"           , "Defn. Disc [lin/exp] von nach zeitvon zeitbis wert, par", iSetDDisc, "iSetDDisc",
    "LOG"             , "Loggin on [File]"                 , iSetLog      ,  "iSetLog",
    "AUDITEX"         , "Tex Auditing [File]"              , iSetAudiTex  ,  "iSetAudiTex",
    "SETSEED"         , "Set seed for simulation"          , iSetSeed     ,  "iSetSeed",   
    "SETNRSIM"        , "Set number of simulations"        , iSetNrSim    ,  "iSetNrSim",
    "//STARTCINT"     , "Start of a section of interpreted C", iSetStartCint,"iNOP",
    "//ENDCINT"       , "Stop of a section of interpreted C", iSetEndCint,   "iNOP",
    "//CINTEXEC"      , "Execute c file"                    , iSetExecCintFile, "iSetExecCintFile", 
    "!!"              , "Execute a program via shell"      , iSetExecProgramViaShell, "iSetExecProgramViaShell", 
    "Print"           , "Print a string on output File"    , iPrint       ,  "iPrint",  
    "Gobal"           , "Global aggregation [start/stop/reset/print]"       , iProcessGlobal, "iProcessGlobal",
    "ActState"        , "Set actual state"                 , iProcessActState, "iProcessActState",
#ifdef INCL_ANNMOD
    "NEWANNMOD"        , "Create ann-mod object "            , iNewANNMOD    ,    "iNewANNMOD",
    "ANNMOD(SetQx)"    , "Set Qx Files [(1/2)(R/K)(M/F)] [File]"   , iSetANNMODQx  ,    "iSetANNMODQx",
    "ANNMOD(SetFx)"    , "Set Fx Files [(1/2)(R/K)(M/F)] [File]"   , iSetANNMODFx  ,    "iSetANNMODFx",
    "ANNMOD(SetSx)"    , "Set Sx Files                   [File]"   , iSetANNMODSx  ,    "iSetANNMODSx",
    "ANNMOD(SetTo)"    , "Set To Files [(1/2)(R/K)(M/F)] [Time]"   , iSetANNMODTo  ,    "iSetANNMODTo",
    "ANNMOD(ActTime)"  , "Set ActualTime  [Time]               "   , iSetANNMODActTime ,"iSetANNMODActTime",
    "ANNMOD(SetYield)" , "Set Yield  [File]                    "   , iSetANNMODYield    ,"iSetANNMODYield",
    "ANNMOD(SetInForce)","Set Inforce File [File]             "    , iSetANNMODReadInforce ,"iSetANNMODReadInforce",
    "ANNMOD(Execute)" , "Execute ANNMOD"                             , iExecANNMOD          ,"iExecANNMOD",
    "ANNMOD(Reset)"   , "Reset ANNMOD", iResetANNMOD ,"iResetANNMOD",
    "ANNMOD(SetModel)"   , "SModel ANNMOD k Type", iSModelANNMOD ,"iSModelANNMOD",  
    "ANNMOD(SetParameters)"   , "SParameters ANNMOD Par_1 ... Par_6", iSParamANNMOD ,"iSParamANNMOD",  
    "ANNMOD(Simulate)"   , "Simulate ANNMOD nn Simuations ", iSimulateANNMOD ,"iSimulateANNMOD",
#endif
    "NEWGLMOD"        , "Create gl-mod object "            , iNewGLMOD    ,    "iNewGLMOD",
    "GLMOD(SetQx)"    , "Set Qx Files [(1/2)(R/K)(M/F)] [File]"   , iSetGLMODQx  ,    "iSetGLMODQx",
    "GLMOD(SetFx)"    , "Set Fx Files [(1/2)(R/K)(M/F)] [File]"   , iSetGLMODFx  ,    "iSetGLMODFx",
    "GLMOD(SetSx)"    , "Set Sx Files                   [File]"   , iSetGLMODSx  ,    "iSetGLMODSx",
    "GLMOD(SetTo)"    , "Set To Files [(1/2)(R/K)(M/F)] [Time]"   , iSetGLMODTo  ,    "iSetGLMODTo",
    "GLMOD(ActTime)"  , "Set ActualTime  [Time]               "   , iSetGLMODActTime ,"iSetGLMODActTime",
    "GLMOD(SetYield)" , "Set Yield  [File]                    "   , iSetGLMODYield    ,"iSetGLMODYield",
    "GLMOD(SetInForce)","Set Inforce File [File]             "   , iSetGLMODReadInforce ,"iSetGLMODReadInforce",
    "GLMOD(SetStress)", "Set Stress [reset/qx/fx/sx/yield][amount]", iSetGLMODStress ,"iSetGLMODStress",
    "GLMOD(Execute)" , "Execute GLMod"                           , iExecGLMOD          ,"iExecGLMOD",
    "GLMOD(Reset)"   , "Reset GLMOD", iResetGLMOD ,"iResetGLMOD",
    "GLMOD(SetModel)"   , "SModel GLMOD k Type", iSModelGLMOD ,"iSModelGLMOD",  
    "GLMOD(SetParameters)"   , "SParameters GLMOD Par_1 ... Par_6", iSParamGLMOD ,"iSParamGLMOD",  
    "GLMOD(Simulate)"   , "Simulate GLMOD nn Simuations ", iSimulateGLMOD ,"iSimulateGLMOD",
    ""                , "--- Error: Token not Found"       , iProcessNotFoundToken, "iProcessNotFoundToken"
    //
  };

// further tokens to be implemented: require a redesign of structures
// -------------------
// NrModels
// DefModel "Variablename"
// EndDef 
// Needs [Model]
// Keep (Was wird bei Reset zurückgesetzt)
// Relative [What parameters]
// Prepare 
// DefInput
// DefOutput
// AddBenefits
// CopyModel

#pragma message("static.c processed")


ERRCODES symErrCodes[]={
  " W_TOKEN_NOT_FOUND: Token Name unknown"        ,           -1,
  " F_PIJ_NOTDEFN    : Pij File not defined"      ,          100,
  " F_LIJV_NOTDEFN   : Lij pre File not defined"  ,          101,
  " F_LIJN_NOTDEFN   : Lij post File not defined" ,          102,
  " F_DISC_NOTDEFN   : Discount File not defined" ,          103,
  " F_OUTP_NOTDEFN   : Outputfile File not defined",         104,
  " F_STATES_NOTDEFN : Nr States unknown"         ,          105,
  " F_START_NOTDEFN  : Starttime unknown"         ,          106,
  " F_STOP_NOTDEFN   : Stoptime unknown"          ,          107,
  " F_OUTP_OPENFAILED: Output File could not be opened",     200,
  " F_PIJ_OPENFAILED : Pij File could not be opened",        201,
  " F_LIJV_OPENFAILED: Lij pre File could not be opened",    202,
  " F_LIJN_OPENFAILED: Lij post File could not be opened",   203,
  " F_DISC_OPENFAILED: Disc File could not be opened",       204,
  " F_GLMOD_OPENFAILED: GLMOD File could not be opened",     250,
  " F_OVERFLOW_BENEF : Overflow in Benefit Vector ",         300,
  " Unknown Error "                               ,            0
};
