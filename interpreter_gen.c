
void vTokenInterpreter(VAMOD * pVAM, VAINFORCE * pInf, VAPERSON * p, char * pcToken)
{
  printf("   --> Token Interpreter: >%s< \n", pcToken);

    if (!strncmp(pcToken,"lId",3))
       {
          p->lId=atol(pcToken+3);
          printf("   --> Token >%s<, Value %ld\n", "lId", p->lId );
       }
    

    if (!strncmp(pcToken,"x",1))
       {
          p->lAge=atol(pcToken+1);
          printf("   --> Token >%s<, Value %ld\n", "x", p->lAge );
       }
    

    if (!strncmp(pcToken,"g",1))
       {
          p->lGender=atol(pcToken+1);
          printf("   --> Token >%s<, Value %ld\n", "g", p->lGender );
       }
    

    if (!strncmp(pcToken,"BirthYear",9))
       {
          p->lBirthYear=atol(pcToken+9);
          printf("   --> Token >%s<, Value %ld\n", "BirthYear", p->lBirthYear );
       }
    

    if (!strncmp(pcToken,"dStartValueGuarantee",20))
       {
          p->symB.dStartValueGuarantee=atof(pcToken+20);
          printf("   --> Token >%s<, Value %f \n", "dStartValueGuarantee", p->symB.dStartValueGuarantee );
       }
    

    if (!strncmp(pcToken,"dIncreasePA",11))
       {
          p->symB.dIncreasePA=atof(pcToken+11);
          printf("   --> Token >%s<, Value %f \n", "dIncreasePA", p->symB.dIncreasePA );
       }
    

    if (!strncmp(pcToken,"lStartGuaranteeAge",18))
       {
          p->symB.lStartGuaranteeAge=atol(pcToken+18);
          printf("   --> Token >%s<, Value %ld\n", "lStartGuaranteeAge", p->symB.lStartGuaranteeAge );
       }
    

    if (!strncmp(pcToken,"lEndGuaranteeAge",16))
       {
          p->symB.lEndGuaranteeAge=atol(pcToken+16);
          printf("   --> Token >%s<, Value %ld\n", "lEndGuaranteeAge", p->symB.lEndGuaranteeAge );
       }
    

    if (!strncmp(pcToken,"bLinear",7))
       {
    
              long lTemp;
              lTemp = atol(pcToken+7);
              if(lTemp == 1)
                  {
                     p->symB.bLinear= true;
                  }
               else
                  {
                     p->symB.bLinear= false;
                  }
         
       }
    

    if (!strncmp(pcToken,"bExponential",12))
       {
    
              long lTemp;
              lTemp = atol(pcToken+12);
              if(lTemp == 1)
                  {
                     p->symB.bExponential= true;
                  }
               else
                  {
                     p->symB.bExponential= false;
                  }
         
       }
    

    if (!strncmp(pcToken,"bMaxWithFunds",13))
       {
    
              long lTemp;
              lTemp = atol(pcToken+13);
              if(lTemp == 1)
                  {
                     p->symB.bMaxWithFunds= true;
                  }
               else
                  {
                     p->symB.bMaxWithFunds= false;
                  }
         
       }
    

    if (!strncmp(pcToken,"lRatchet",8))
       {
          p->symB.lRatchet=atol(pcToken+8);
          printf("   --> Token >%s<, Value %ld\n", "lRatchet", p->symB.lRatchet );
       }
    

    if (!strncmp(pcToken,"lEndowmentAge",13))
       {
          p->symB.lEndowmentAge=atol(pcToken+13);
          printf("   --> Token >%s<, Value %ld\n", "lEndowmentAge", p->symB.lEndowmentAge );
       }
    

    if (!strncmp(pcToken,"lSTerm",6))
       {
          p->symB.lSTerm=atol(pcToken+6);
          printf("   --> Token >%s<, Value %ld\n", "lSTerm", p->symB.lSTerm );
       }
    

    if (!strncmp(pcToken,"lSAnnuity",9))
       {
          p->symB.lSAnnuity=atol(pcToken+9);
          printf("   --> Token >%s<, Value %ld\n", "lSAnnuity", p->symB.lSAnnuity );
       }
    

    if (!strncmp(pcToken,"lSLastAnnuity",13))
       {
          p->symB.lSLastAnnuity=atol(pcToken+13);
          printf("   --> Token >%s<, Value %ld\n", "lSLastAnnuity", p->symB.lSLastAnnuity );
       }
    

    if (!strncmp(pcToken,"dPctEndowment",13))
       {
          p->symB.dPctEndowment=atof(pcToken+13);
          printf("   --> Token >%s<, Value %f \n", "dPctEndowment", p->symB.dPctEndowment );
       }
    

    if (!strncmp(pcToken,"dPctTerm",8))
       {
          p->symB.dPctTerm=atof(pcToken+8);
          printf("   --> Token >%s<, Value %f \n", "dPctTerm", p->symB.dPctTerm );
       }
    

    if (!strncmp(pcToken,"dPctAnnuity",11))
       {
          p->symB.dPctAnnuity=atof(pcToken+11);
          printf("   --> Token >%s<, Value %f \n", "dPctAnnuity", p->symB.dPctAnnuity );
       }
    

    if (!strncmp(pcToken,"dPctPremium",11))
       {
          p->symB.dPctPremium=atof(pcToken+11);
          printf("   --> Token >%s<, Value %f \n", "dPctPremium", p->symB.dPctPremium );
       }
    

    if (!strncmp(pcToken,"dEE",3))
       {
          p->symI.dEE=atof(pcToken+3);
          printf("   --> Token >%s<, Value %f \n", "dEE", p->symI.dEE );
       }
    

    if (!strncmp(pcToken,"dSAA1",5))
       {
          p->symI.dSAA[0]=atof(pcToken+5);
          printf("   --> Token >%s<, Value %f \n", "dSAA1", p->symI.dSAA[0] );
       }
    

    if (!strncmp(pcToken,"dSAA2",5))
       {
          p->symI.dSAA[1]=atof(pcToken+5);
          printf("   --> Token >%s<, Value %f \n", "dSAA2", p->symI.dSAA[1] );
       }
    

    if (!strncmp(pcToken,"dSAA3",5))
       {
          p->symI.dSAA[2]=atof(pcToken+5);
          printf("   --> Token >%s<, Value %f \n", "dSAA3", p->symI.dSAA[2] );
       }
    

    if (!strncmp(pcToken,"dSAA4",5))
       {
          p->symI.dSAA[3]=atof(pcToken+5);
          printf("   --> Token >%s<, Value %f \n", "dSAA4", p->symI.dSAA[3] );
       }
    

    if (!strncmp(pcToken,"dSAA5",5))
       {
          p->symI.dSAA[4]=atof(pcToken+5);
          printf("   --> Token >%s<, Value %f \n", "dSAA5", p->symI.dSAA[4] );
       }
    

    if (!strncmp(pcToken,"lAgeRiskFree",12))
       {
          p->symI.lAgeRiskFree=atol(pcToken+12);
          printf("   --> Token >%s<, Value %ld\n", "lAgeRiskFree", p->symI.lAgeRiskFree );
       }
    

    if (!strncmp(pcToken,"NewPerson",9))
       {
          pInf->vNewPerson();
          printf("Call New Person");
       }
    

    if (!strncmp(pcToken,"dSigBond",8))
       {
          pVAM->symPara.dSigBond=atof(pcToken+8);
          printf("   --> Token >%s<, Value %f \n", "dSigBond", pVAM->symPara.dSigBond );
       }
    

    if (!strncmp(pcToken,"dSigEquity",10))
       {
          pVAM->symPara.dSigEquityShort=atof(pcToken+10);
          printf("   --> Token >%s<, Value %f \n", "dSigEquity", pVAM->symPara.dSigEquityShort );
       }
    

    if (!strncmp(pcToken,"dSigLong",8))
       {
          pVAM->symPara.dSigEquityLong=atof(pcToken+8);
          printf("   --> Token >%s<, Value %f \n", "dSigLong", pVAM->symPara.dSigEquityLong );
       }
    

    if (!strncmp(pcToken,"dFundStartLevel",15))
       {
          pVAM->symPara.dFundStartLevel=atof(pcToken+15);
          printf("   --> Token >%s<, Value %f \n", "dFundStartLevel", pVAM->symPara.dFundStartLevel );
       }
    

    if (!strncmp(pcToken,"dRiskFree",9))
       {
          pVAM->symPara.dRiskFree=atof(pcToken+9);
          printf("   --> Token >%s<, Value %f \n", "dRiskFree", pVAM->symPara.dRiskFree );
       }
    

    if (!strncmp(pcToken,"lSeed",5))
       {
          pVAM->symPara.lSeed=atof(pcToken+5);
          printf("   --> Token >%s<, Value %f \n", "lSeed", pVAM->symPara.lSeed );
       }
    

};
