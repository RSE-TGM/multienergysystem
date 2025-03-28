within MultiEnergySystem.TestFacility.DHTF.Control.OpenLoopActuators;
model OLA_OneGen_CaseA_III "Step Actuator for test facility plant considering only one generator which in this case is the gas boiler"
  extends OpenLoopActuatorBase_III;
equation
  // S900
  theta_FCV901_var = theta_FCV901SP;
  omega_P901_var = omega_P901SP;
  // S100
  theta_FCV101_var = theta_FCV101SP;
  omega_P101_var = omega_P101SP;
  Tout_GB101_var = Tout_GB101SP;
  // S700
  theta_FCV701_var = theta_FCV701SP;
  theta_FCV711_var = theta_FCV711SP;
  theta_FCV721_var = theta_FCV721SP;
  theta_FCV731_var = theta_FCV731SP;
  // Rack
  theta_FCVC01_var = theta_FCVC01SP;
  theta_FCVC02_var = theta_FCVC02SP;
  // RR00
  theta_TCV701_var = theta_TCV701SP;
  theta_TCV711_var = theta_TCV711SP;
  theta_TCV721_var = theta_TCV721SP;
  theta_TCV731_var = theta_TCV731SP;
  theta_FCVR01_var = theta_FCVR01SP;
  Tout_RR01_var = Tout_RR01SP;
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
end OLA_OneGen_CaseA_III;
