# Modeling-Ae-aegypti-larvae-mass-discrete
Code for Modeling the effects of Aedes aegypti's larval environment on adult body mass at emergence


%%%% MODELS %%%%

discreteL1.m 
Model formulation for original variation (used for C1).

discreteL2.m
Model formulation including a second pupae compartment (used for C2).

discreteL3.m
Model formulation including a second pupae compartment and a second L4 compartment (used for C3, D1,D2,D3,E).

%%%% OUTPUT FOR VARIATIONS %%%%

VarC1.m
Computes output for variation C1. Requires km, kf, a, b, q, d.

VarC2.m
Computes output for variation C2. Requires km, kf, a, b, q, d.

VarC3.m
Computes output for variation C3. Requires km, kf, a, b, q, d.

VarD1.m
Computes output for variation D1. Requires km, kf, a, b, q, d. growth = 0 to exclude growth

VarD2.m
Computes output for variation D2. Requires km, kf, a, b, q, d. growth = 0 to exclude growth

VarD3.m
Computes output for variation D3. Requires km, kf, a, b, q, d, hill, hcon. growth = 0 to exclude growth

VarE.m
Computes output for variation E. Requires km, kf, a, b, q,d,  hill, hcon, sl, g. growth = 1 to include growth



%%%% FITTING FUNCTIONS %%%%

fitDTnH.m
Fitting function for high density data for variations C1 and C2. Requires km, kf, a, b, q, d.

fitDTnL.m
Fitting function for low density data for variations C1 and C2. Requires km, kf, a, b, q, d.

fitDH.m
Fitting function for high density data for variation C3. Requires km, kf, a, b, q, d.

fitDL.m
Fitting function for low density data for variation C3. Requires km, kf, a, b, q, d.

fitDeath.m
Fitting function for variations D1, D2, D3. Requires km, kf, a, b, q, d, hill (D3 only), hcon (D3 only).

fitStar.m
Fitting function for variation E. Requires km, kf, a, b, q, d, hill, hcon, sl, g.

%%%% AIC COMPUTATION FOR C VARIATIONS %%%%

AIC_C13.m
Computes AIC values for variations C1,C2,C3. Load ‘BestCData.mat’ to run AIC on optimal parameters.


%%%% DATA %%%%

HighDensityData.m
Daily counts by stage for high density condition.

LowDensityData.m
Daily counts by stage for low density condition.

LoadVarEData.m
Loads mass data and produces histogram of mass by density condition. Requires VarE.csv

ProportionData.m
Counts of females emerging by weight.

SurvivalData.m
Counts of males and females that survive by density condition. IC for low density is 13. IC for high density is 39.

BestCData.mat
Best parameters for fitting C variations under standard parameters.

BestDData.mat
Best parameters for fitting D variations under standard parameters.

BestEData.mat
Best parameters for fitting E variations under standard parameters.

VaryQ.mat
Best parameters for fitting changes in q.

VaryAB.mat
Best parameters for fitting changes in a and b.

VaryHill.mat
Best parameters for fitting changes in hill exponent.

VaryCon.mat
Best parameters for fitting changes in c1 and c2.

%%%% PLOTTING %%%%

PlotDataByStage.m
Plots larvae and pupae stages through time. Used in Figure 3.

PlotDataMaleFemale.m
Plots male and female emergence through time. Used in Figure 3.

PlotFigure1.m
Plots current Figure 1c. Requires SurvivalData.m.

PlotFigure3.m
Plots current Figure 3. Requires PlotDataByStage.m, PlotDataMaleFemale.m.

PlotFigure4.m
Plots current Figure 4. 

PlotFigure5.m
Plots current Figure 5. Requires ProportionData.m.

PlotFigure6.m
Plots current Figure 6. Requires ProportionData.m

PlotFigureS1.m
Plots current Figure S1. Requires ProportionData.m, VaryCon.mat.

PlotFigureS2.m
Plots current Figure S2. 

PlotFigureS3.m
Plots current Figure S3. Requires VaryHill.mat.

PlotFigureS4.m
Plots current Figure S4. Requires PlotDataMaleFemale.m, VaryAB.mat.

%%%% CODE TO RUN FITS %%%

RunDiscreteFit.m
Runs standard parameters for fitting C1,C2,C3,D1,D2,D3,E.

RunQFit.m
Runs fit for varying q. 

RunConFit.m
Runs fit for varying c1 and c2. 

RunABFit.m
Runs fit for varying a and b. 

RunHillFit.m
Runs fit for varying hill exponent. 


