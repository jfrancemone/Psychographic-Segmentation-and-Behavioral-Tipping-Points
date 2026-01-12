* Encoding: UTF-8.

COMPUTE MFQ.Harm=MEAN(harm1,harm2,harm3,harm4,harm5,harm6).
COMPUTE MFQ.Fair=MEAN(fair1,fair2,fair3,fair4, fair5, fair6).
COMPUTE MFQ.Loyal=MEAN(loyal1,loyal2,loyal3,loyal4,loyal5,loyal6).
COMPUTE MFQ.Authority=MEAN(authority1,authority2,authority3,authority4,authority5,authority6).
COMPUTE MFQ.Purity=MEAN(purity1,purity2,purity3,purity4,purity5,purity6).
EXECUTE.

DESCRIPTIVES VARIABLES=MFQ.Harm MFQ.Fair MFQ.Loyal MFQ.Authority MFQ.Purity
  /STATISTICS=MEAN STDDEV MIN MAX.

RELIABILITY
  /VARIABLES=harm1 harm2 harm3 harm4 harm5 harm6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=fair1 fair2 fair3 fair4 fair5 fair6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=loyal1 loyal2 loyal3 loyal4 loyal5 loyal6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=authority1 authority2 authority3 authority4 authority5 authority6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

RELIABILITY
  /VARIABLES=purity1 purity2 purity3 purity4 purity5 purity6
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

***OMEGA Values Using Hayes Macro***

OMEGA items=harm1 harm2 harm3 harm4 harm5 harm6.
OMEGA items=fair1 fair2 fair3 fair4 fair5 fair6.   
OMEGA items=loyal1 loyal2 loyal3 loyal4 loyal5 loyal6.   
OMEGA items=authority1 authority2 authority3 authority4 authority5 authority6.   
OMEGA items=purity1 purity2 purity3 purity4 purity5 purity6.   

IF (MFQ.Harm>= 5.33211) MFQ.Harm.Split=3.
IF (3.74509<MFQ.Harm AND MFQ.Harm<5.33211) MFQ.Harm.Split=2.
IF (MFQ.Harm<= 3.74509) MFQ.Harm.Split=1.

IF (MFQ.Fair>=5.19125) MFQ.Fair.Split=3.
IF (3.67835<MFQ.Fair AND MFQ.Fair<5.19125) MFQ.Fair.Split=2.
IF (MFQ.Fair<=3.67835) MFQ.Fair.Split=1.

IF (MFQ.Loyal>=4.29472) MFQ.Loyal.Split=3.
IF (2.29208<MFQ.Loyal AND MFQ.Loyal<4.29472) MFQ.Loyal.Split=2.
IF (MFQ.Loyal<=2.29208) MFQ.Loyal.Split=1.

IF (MFQ.Authority>=4.5733) MFQ.Authority.Split=3.
IF (2.5561<MFQ.Authority AND MFQ.Authority<4.5733) MFQ.Authority.Split=2.
IF (MFQ.Authority<=2.5561) MFQ.Authority.Split=1.

IF (MFQ.Purity>=4.55828) MFQ.Purity.Split=3.
IF (2.02472< MFQ.Purity AND MFQ.Purity<4.55828) MFQ.Purity.Split=2.
IF (MFQ.Purity<=2.02472) MFQ.Purity.Split=1.
EXECUTE.

STRING Harm_Salience (A8).
RECODE MFQ.Harm.Split (3='High') (2='Moderate') (1='Low') INTO Harm_Salience.
STRING Fairness_Salience (A8).
RECODE MFQ.Fair.Split (3='High') (2='Moderate') (1='Low') INTO Fairness_Salience.
STRING Loyalty_Salience (A8).
RECODE MFQ.Loyal.Split (3='High') (2='Moderate') (1='Low') INTO Loyalty_Salience.
STRING Authority_Salience (A8).
RECODE MFQ.Authority.Split (3='High') (2='Moderate') (1='Low') INTO Authority_Salience.
STRING Purity_Salience (A8).
RECODE MFQ.Purity.Split (3='High') (2='Moderate') (1='Low') INTO Purity_Salience.
EXECUTE.

VARSTOCASES
  /ID=ID
  /MAKE Judgment FROM threatens.answer shoves.answer slaps.answer pepper.answer hose.answer 
    hurts.answer baton.answer taser.answer knocks.answer beatup.answer gas.answer rubber.answer 
    finger.answer chokes.answer prod.answer burns.answer legs.answer stabs.answer shoots.answer 
    torture.answer blinds.answer paralyze.answer kills.answer torkill.answer
  /INDEX=Behavior(24) 
  /KEEP=MFQ.Harm MFQ.Fair MFQ.Loyal MFQ.Authority MFQ.Purity MFQ.Harm.Split MFQ.Fair.Split 
    MFQ.Loyal.Split MFQ.Authority.Split MFQ.Purity.Split Harm_Salience Fairness_Salience Loyalty_Salience
    Authority_Salience Purity_Salience
  /NULL=KEEP.

COMPUTE Behavior_RE = Behavior-1.
EXECUTE.

***MULTILEVEL MODELS***
    
MIXED Judgment
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED= | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM= INTERCEPT | SUBJECT(ID) COVTYPE(ID)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).

MIXED Judgment WITH Behavior_RE
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=Behavior_RE | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM= INTERCEPT Behavior_RE| SUBJECT(ID) COVTYPE(UN)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).

***MORAL FOUNDATIONS***

MIXED Judgment WITH MFQ.Harm Behavior_RE
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=MFQ.Harm Behavior_RE MFQ.Harm*Behavior_RE | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=INTERCEPT Behavior_RE | SUBJECT(ID) COVTYPE(UN)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).

MIXED Judgment WITH MFQ.Fair Behavior_RE
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=MFQ.Fair Behavior_RE MFQ.Fair*Behavior_RE | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=INTERCEPT Behavior_RE | SUBJECT(ID) COVTYPE(UN)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).

MIXED Judgment WITH MFQ.Loyal Behavior_RE
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=MFQ.Loyal Behavior_RE MFQ.Loyal*Behavior_RE | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=INTERCEPT Behavior_RE | SUBJECT(ID) COVTYPE(UN)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).

MIXED Judgment WITH MFQ.Authority Behavior_RE
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=MFQ.Authority Behavior_RE MFQ.Authority*Behavior_RE | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=INTERCEPT Behavior_RE | SUBJECT(ID) COVTYPE(UN)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).

MIXED Judgment WITH MFQ.Purity Behavior_RE
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=MFQ.Purity Behavior_RE MFQ.Purity*Behavior_RE | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=INTERCEPT Behavior_RE | SUBJECT(ID) COVTYPE(UN)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).

MIXED Judgment WITH MFQ.Harm MFQ.Fair MFQ.Loyal MFQ.Authority MFQ.Purity Behavior_RE
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(10000) MXSTEP(10000) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=Behavior_RE MFQ.Harm MFQ.Fair MFQ.Loyal MFQ.Authority MFQ.Purity MFQ.Harm*Behavior_RE MFQ.Fair*Behavior_RE MFQ.Loyal*Behavior_RE MFQ.Authority*Behavior_RE MFQ.Purity*Behavior_RE | SSTYPE(3)
  /METHOD=ML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=INTERCEPT Behavior_RE | SUBJECT(ID) COVTYPE(UN)
  /REPEATED=Behavior_RE | SUBJECT(ID) COVTYPE(ID).


