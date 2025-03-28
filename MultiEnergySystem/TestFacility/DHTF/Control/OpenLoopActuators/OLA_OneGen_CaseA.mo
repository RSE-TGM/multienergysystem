within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_OneGen_CaseA "Step Actuator for test facility plant considering only one generator which in this case is the gas boiler"
  extends OpenLoopActuatorBase;
equation
  // S900
  dtheta_FCV901_var = (theta_FCV901SP - theta_nom)/theta_nom;
  domega_P901_var = (omega_P901SP - omega_nom)/omega_nom;
  // S100
  dtheta_FCV101_var = (theta_FCV101SP - theta_nom)/theta_nom;
  domega_P101_var = (omega_P101SP - omega_nom)/omega_nom;
  dTout_GB101_var = (Tout_GB101SP - Tout_gen_nom)/Tout_gen_nom;
  // S700
  dtheta_FCV701_var = (theta_FCV701SP - theta_nom)/theta_nom;
  dtheta_FCV711_var = (theta_FCV711SP - theta_nom)/theta_nom;
  dtheta_FCV721_var = (theta_FCV721SP - theta_nom)/theta_nom;
  dtheta_FCV731_var = (theta_FCV731SP - theta_nom)/theta_nom;
  // Rack
  dtheta_FCVC01_var = (theta_FCVC01SP - theta_nom)/theta_nom;
  dtheta_FCVC02_var = (theta_FCVC02SP - theta_nom)/theta_nom;
  // RR00
  dtheta_TCV701_var = (theta_TCV701SP - theta_nom)/theta_nom;
  dtheta_TCV711_var = (theta_TCV711SP - theta_nom)/theta_nom;
  dtheta_TCV721_var = (theta_TCV721SP - theta_nom)/theta_nom;
  dtheta_TCV731_var = (theta_TCV731SP - theta_nom)/theta_nom;
  dtheta_FCVR01_var = (theta_FCVR01SP - theta_nom)/theta_nom;
  dTout_RR01_var = (Tout_RR01SP - Tout_gen_nom)/Tout_gen_nom;
  theta_FCV101SP = 1;
  omega_P101SP = 2*pi*50;
  Tout_GB101SP = 80 + 273.15;
  theta_FCV701SP = 1;
  theta_FCV711SP = 1;
  theta_FCV721SP = 1;
  theta_FCV731SP = 1;
  theta_FCV901SP = 1;
  omega_P901SP = 2*pi*35;
  theta_FCVC01SP = 1;
  theta_FCVC02SP = 1;
  theta_TCV701SP = 1;
  theta_TCV711SP = 1;
  theta_TCV721SP = 1;
  theta_TCV731SP = 1;
  theta_FCVR01SP = 1;
  Tout_RR01SP = 40 + 273.15;
  if useRealExpression then
    // S100
    booldthetaFCV101 = true;
    booldomegaP101 = true;
    booldToutGB101 = true;
    // S700
    booldthetaFCV701 = true;
    booldthetaFCV711 = true;
    booldthetaFCV721 = true;
    booldthetaFCV731 = true;
    // S900
    booldthetaFCV901 = true;
    booldomegaP901 = true;
    // Rack CD
    booldthetaFCVC01 = true;
    booldthetaFCVC02 = true;
    // RR00
    booldthetaTCV701 = true;
    booldthetaTCV711 = true;
    booldthetaTCV721 = true;
    booldthetaTCV731 = true;
    booldthetaFCVR01 = true;
    booldToutRR01 = true;
  else
    // S100
    booldthetaFCV101 = false;
    booldomegaP101 = false;
    booldToutGB101 = false;
    // S700
    booldthetaFCV701 = false;
    booldthetaFCV711 = false;
    booldthetaFCV721 = false;
    booldthetaFCV731 = false;
    // S900
    booldthetaFCV901 = false;
    booldomegaP901 = false;
    // Rack CD
    booldthetaFCVC01 = false;
    booldthetaFCVC02 = false;
    // RR00
    booldthetaTCV701 = false;
    booldthetaTCV711 = false;
    booldthetaTCV721 = false;
    booldthetaTCV731 = false;
    booldthetaFCVR01 = false;
    booldToutRR01 = false;
  end if;
end OLA_OneGen_CaseA;
