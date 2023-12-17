#include <stdio.h>
#include "omarkov.h"
#include "glmod.h"
GLMOD * psymGLMOD;
#ifdef INCL_ANNMOD
#include "annmod.h"
#pragma message("--------------> ANNMOD Included <----------------------------")
ANNMOD * psymANNMOD;
#endif
double dSimParam[6];

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

#include "static.c"
#include "omarkov.cpp"
#include "glmod.cpp"
#ifdef INCL_ANNMOD
#include "annmod.cpp"
#endif
#include <time.h>

// #define GENERATE_CFILE

FILE * psymGA = NULL; 
static char  * strVer="2.50-red";

int main(int iNrArgs, char ** pcArg)
{
  FILE * psymTasks;
#ifdef GENERATE_CFILE
  FILE * psymCFileOut;
#endif

  REQUEST symR;
  char strInputFile[1024];
  int iC, iMsg;
  int iCatter = 0;
  int iCopyright = 1;
  long lNrLines = 0l;
  int iExtended = 0;
  symR.bCintActive= false;
  clock_t   symT0, symStart, symFinish;
  symT0 = symStart = clock(); 
  memset(&symR,0,sizeof(REQUEST));
  psymGLMOD = NULL;

  for(iC=0; iC < iNrArgs; ++ iC)
    {
      /* Command line parcing */
      if(!strcmp(pcArg[iC],"-chatter")) iCatter = 1;
      if(!strcmp(pcArg[iC],"-Chatter")) iCatter = 1;
      if(!strcmp(pcArg[iC],"-CHATTER")) iCatter = 1;
      if(!strcmp(pcArg[iC],"-NoCopyright")) iCopyright = 0;
          if(!strcmp(pcArg[iC],"-mixed"))    iExtended =1;
          if(!strcmp(pcArg[iC],"-MIXED"))    iExtended =1;
    }
  symTokens = symIntTokens;
  symR.iCatter = iCatter;
  if(iCopyright) 
    {
      printf("\n MARKOV Cash Flow Calculator (c) M. Koller, Herrliberg 1999~2010 \n Ver. %s                              Built:   %s",strVer, __DATE__);
      {
        time_t lTime;
        struct tm * psymTime;
        time(&lTime);
        psymTime = localtime(&lTime);
        printf("\n Started at %53s", asctime(psymTime));
      }
      printf("\n =============================================================== \n\n");
      /*    __sleep(500); */
    }
  if(iNrArgs <= 1)
    {
      printf("\n Interactive Mode for task file. Task File =? \n");
      scanf("%s", strInputFile);
      psymTasks = fopen(strInputFile,"r");
    }
  else                               
    {
      if(strstr(pcArg[1],"-?"))
        {
          printf("\n Help Screen\n");
          printf("\n __________________________________________________________ \n");
          printf("\n %-20s : %s", "TOKENS","");
          printf("\n __________________________________________________________ \n");
          
          for(iC=0;*symTokens[iC].pcToken;++iC) 
            {
              printf("\n %-20s : %s", symTokens[iC].pcToken, symTokens[iC].pcBla);
            }
          printf("\n __________________________________________________________ \n");
          printf("\n %-20s : %s", "Command-Line Opt.","");
          printf("\n __________________________________________________________ \n");
          printf("\n %-20s : %s", "-chatter","Shows Working progress");
          printf("\n __________________________________________________________ \n");
          printf("\n GLMOD Bestandesstruktur für Inputfile                      ");
          printf("\n Tarif (A/G)  Geschlecht(1/2) Alter  Schlussalter  Leistung Prämie Technischer Zins");

          return(0);
        }
      printf("Prg %s --> Opening File %s",pcArg[0], pcArg[1]);
      psymTasks = fopen(pcArg[1],"r");
      *strInputFile ='\0';
      strcat(strInputFile,pcArg[1]);
    }  
#ifdef GENERATE_CFILE
  { 
    char strTemp[2024];
    *strTemp ='\0';
    strcat(strTemp,strInputFile);
    strcat(strTemp,".cpp");
    psymCFileOut = fopen(strTemp,"w");
    fprintf(psymCFileOut,"\n // MARKOV Cash Flow Calculator (c) M. Koller, Herrliberg 1999~2003 \n // Ver. %s                                  Built:   %s",strVer, __DATE__);
    {
      time_t lTime;
      struct tm * psymTime;
      time(&lTime);
      psymTime = localtime(&lTime);
      fprintf(psymCFileOut,"\n // Started at %53s", asctime(psymTime));
      fprintf(psymCFileOut,"\n #include %cpromain1.cppt%c",'"','"');      
    }
  }
#endif

  if(!psymTasks)
    {
      printf("\n Taskfile wurde nicht geoeffnet --> abbruch");
      return(0);
    }
  while(!feof(psymTasks))
    {                      
      char strBuffer[1024];
      char * pcTemp;
      int lenght;
      if(!fgets(strBuffer,1024,psymTasks)) break;
      lenght = strlen(strBuffer);
      if(lenght < 1) continue;
          
      if(strBuffer[1] == '%') 
        {
          printf("\n%s", strBuffer);
          continue;
        }
          
      for(iC=0;*symTokens[iC].pcToken;++iC) 
        {
          pcTemp = strstr(strBuffer,symTokens[iC].pcToken);
          if(pcTemp) break;
        }
#ifdef GENERATE_CFILE
      fprintf(psymCFileOut,"\n /* Statement # %5ld */",lNrLines);
#endif
      if(*symTokens[iC].pcToken)
        {
          if(strlen(pcTemp) > strlen(symTokens[iC].pcToken))
            {
#ifndef GENERATE_CFILE
              iMsg = symTokens[iC].iTask(&symR, pcTemp + strlen(symTokens[iC].pcToken));
#else
                  if(symTokens[iC].iTask == iSetStartCint){symR.bCintActive = true;}
                  if(symTokens[iC].iTask == iSetEndCint){symR.bCintActive= false;}
                  iMsg = F_OK;
                  {
                         if(!symR.bCintActive){
                char strTemp[5056], * pcChar, * pcChar2;
                memset(strTemp, 0, 5056 * sizeof(char));
                //            strncat(strTemp, pcTemp + strlen(symTokens[iC].pcToken), 2000);
                pcChar = pcTemp + strlen(symTokens[iC].pcToken);
                pcChar2= strTemp;
                for(;*pcChar;++pcChar,++pcChar2)
                  {
                    *pcChar2 = *pcChar;
                    if(*pcChar == '\\')
                      {
                        ++pcChar2;
                        *pcChar2 = *pcChar;
                      }
                  }
                for(pcChar=strTemp;*pcChar;++pcChar)
                  {
                    if(*pcChar != ' ') break;
                  }
                pcChar2 = pcChar;
                for(;*pcChar;++pcChar)
                  {
                    if((int)*pcChar == 10) *pcChar =' ';
                  }
if(iExtended==1)
        {
        if(strstr(pcChar2,"strTemp"))
                {
                        fprintf(psymCFileOut,"\n iMsg = %s(&symR, strTemp);",symTokens[iC].strCallingSequence);
                         }
                else
                {
                        fprintf(psymCFileOut,"\n iMsg = %s(&symR, %c%s%c);",symTokens[iC].strCallingSequence,'"',pcChar2,'"');
                         }
        }
else
        {
        fprintf(psymCFileOut,"\n iMsg = %s(&symR, %c%s%c);",symTokens[iC].strCallingSequence,'"',pcChar2,'"');
        }
                         }
              fprintf(psymCFileOut,"\n if(iMsg ) ");

              fprintf(psymCFileOut,"\n {");
              fprintf(psymCFileOut,"\n    int iPosError;");
              fprintf(psymCFileOut,"\n    for (iPosError=0; symMyErrCodes[iPosError].iNrError != 0; ++ iPosError)");
              fprintf(psymCFileOut,"\n     {");
              fprintf(psymCFileOut,"\n      if (symMyErrCodes[iPosError].iNrError == iMsg) break;");
              fprintf(psymCFileOut,"\n     } ");
              fprintf(psymCFileOut,"\n    printf(%c\\n Processed: %%s, RESULT: %%d Error Text %%-30s%c, strBuffer, iMsg, symMyErrCodes[iPosError].psymText);",'"','"');
              fprintf(psymCFileOut,"\n }");
                  }
#endif
            }
          else
            {
#ifndef GENERATE_CFILE
              iMsg = symTokens[iC].iTask(&symR, "");
#else
                  iMsg = F_OK;
          if(symTokens[iC].iTask == iSetStartCint){symR.bCintActive= true;}
                  if(symTokens[iC].iTask == iSetEndCint){symR.bCintActive= false;}
                  if(!symR.bCintActive){
                  fprintf(psymCFileOut,"\niMsg = %s(&symR, %c%c);",symTokens[iC].strCallingSequence,'"','"');
              fprintf(psymCFileOut,"\n  if(iMsg ) ");
              fprintf(psymCFileOut,"\n   {");
              fprintf(psymCFileOut,"\n    int iPosError;");
              fprintf(psymCFileOut,"\n    for (iPosError=0; symMyErrCodes[iPosError].iNrError != 0; ++ iPosError)");
              fprintf(psymCFileOut,"\n     {");
              fprintf(psymCFileOut,"\n      if (symMyErrCodes[iPosError].iNrError == iMsg) break;");
              fprintf(psymCFileOut,"\n     } ");
              fprintf(psymCFileOut,"\n    printf(%c\\n Processed: %%s, RESULT: %%d Error Text %%-30s%c, strBuffer, iMsg, symMyErrCodes[iPosError].psymText);",'"','"');
                  fprintf(psymCFileOut,"\n}");}
#endif
            }
        }
      else
          {
        iMsg = symTokens[iC].iTask(&symR, strBuffer);
#ifdef GENERATE_CFILE
if(iExtended==1)    fprintf(psymCFileOut,"%s",strBuffer);

#endif
          }
#ifndef GENERATE_CFILE
      if (symR.bCintActive== true && symR.psymCSourceFile != NULL)
#else
          if (symR.bCintActive== true)
#endif
         {
#ifndef GENERATE_CFILE
          fprintf(symR.psymCSourceFile,"%s",strBuffer);
#else
          if(strstr(strBuffer,"main") || strstr(strBuffer,"#include")) 
          {
                  fprintf(psymCFileOut,"\n // [Deleted by prg]: %s",strBuffer);
          }
          else
          {
          fprintf(psymCFileOut,"%s",strBuffer);
          }
#endif
        }
      if(iMsg && symR.bCintActive == false) 
        {
          int iPosError;
          for (iPosError=0; symErrCodes[iPosError].iNrError != 0; ++ iPosError)
            {
              if (symErrCodes[iPosError].iNrError == iMsg) break;
            }
          printf("\n Processed: %s, RESULT: %d Error Text %-30s", strBuffer, iMsg, symErrCodes[iPosError].psymText);
        }
      ++lNrLines;
      if(!(lNrLines%100) && iCatter) {
        printf("\n Lines %5ld ",lNrLines);
        symFinish = clock();   
        if(iCatter) printf(" %-12s %10.4f Sec. (Sec. per Line %10.6f)", "Total Time: ",
                           (double)(symFinish - symStart) / CLOCKS_PER_SEC,(double)(symFinish - symStart) / CLOCKS_PER_SEC/lNrLines);}
    }
  if(iCatter) {printf("\n Lines %5ld ",lNrLines);
  symFinish = clock();   
  if(iCatter) printf(" %-12s %10.4f Sec. (Sec. per Line %10.6f)", "Total Time: ",
                     (double)(symFinish - symStart) / CLOCKS_PER_SEC,(double)(symFinish - symStart) / CLOCKS_PER_SEC/lNrLines);}
#ifdef GENERATE_CFILE
  fprintf(psymCFileOut,"\n #include %cpromain2.cppt%c",'"','"');
  fclose(psymCFileOut);
#endif
  if (psymGLMOD) delete(psymGLMOD);
return(1);
}
