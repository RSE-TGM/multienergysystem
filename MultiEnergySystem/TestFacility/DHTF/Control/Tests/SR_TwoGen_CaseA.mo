within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
model SR_TwoGen_CaseA "This test model considers the step response using as a base the generating plant with Gas Boiler & Electric Boiler as heat generators"
  extends DHTF.Control.Tests.SR_OneGen_CaseA(
    redeclare replaceable DHTF.Control.OpenLoopActuators.OLA_TwoGen_CaseA actuator(
      useRealExpression=false,
      dtheta_FCVC01=[0,-1; 1e6,-1],
      dtheta_FCVC02=[0,-1; 1e6,-1],
      domega_P901=[0,(f_P901 - 50)/50; 1e3,(f_P901 - 50)/50; 1e3,(f_P901 - 50 + f_P901_delta)/50; 1e6,(f_P901 - 50 + f_P901_delta)/50],
      dtheta_FCV901=[0,0; 1e6,0],
      dTout_GB101=[0,0; 1e6,0],
      domega_P101=[0,(f_P101 - 50)/50; 1e3,(f_P101 - 50)/50; 1e3,(f_P101 - 50 + f_P101_delta)/50; 1e6,(f_P101 - 50 + f_P101_delta)/50],
      dtheta_FCV101=[0,0; 1e6,0],
      dtheta_FCV701=[0,(theta_FCV701 - 1)/1; 1e3,(theta_FCV701 - 1)/1; 1e3,(theta_FCV701 - 1 + theta_FCV701_delta)/1; 1e6,(theta_FCV701 - 1 + theta_FCV701_delta)/1],
      dtheta_FCV711=[0,(theta_FCV711 - 1)/1; 1e3,(theta_FCV711 - 1)/1; 1e3,(theta_FCV711 - 1 + theta_FCV711_delta)/1; 1e6,(theta_FCV711 - 1 + theta_FCV711_delta)/1],
      dtheta_FCV721=[0,0; 1e6,0],
      dtheta_FCV731=[0,0; 1e6,0],
      dtheta_TCV701=[0,(theta_TCV701 - 1)/1; 1e3,(theta_TCV701 - 1)/1; 1e3,(theta_TCV701 - 1 + theta_TCV701_delta)/1; 1e6,(theta_TCV701 - 1 + theta_TCV701_delta)/1],
      dtheta_TCV711=[0,(theta_TCV711 - 1)/1; 1e3,(theta_TCV711 - 1)/1; 1e3,(theta_TCV711 - 1 + theta_TCV711_delta)/1; 1e6,(theta_TCV711 - 1 + theta_TCV711_delta)/1],
      dtheta_TCV721=[0,0; 1e6,0],
      dtheta_TCV731=[0,0; 1e6,0],
      dtheta_FCVR01=[0,0; 1e6,0],
      dTout_RR01=[0,(Tout_RR01 - 15)/(100 + 273.15); 1e6,(Tout_RR01 - 15)/(100 + 273.15)],
      domega_P401=[0,(f_P401 - 50)/50; 1e3,(f_P401 - 50)/50; 1e3,(f_P401 - 50 + f_P401_delta)/50; 1e6,(f_P401 - 50 + f_P401_delta)/50],
      dtheta_FCV401=[0,0; 1e6,0]),
    redeclare replaceable Export.Linearization.CentralisedSystemGBEB_InitForward plant(
      thetaFCVC01Offset(fixInput=false, fixOffset=true),
      thetaFCVC02Offset(fixInput=false, fixOffset=true),
      thetaFCV901Offset(fixInput=false, fixOffset=true),
      thetaFCV101Offset(fixInput=false, fixOffset=true),
      thetaTCV701Offset(fixInput=false, fixOffset=true),
      thetaTCV711Offset(fixInput=false, fixOffset=true),
      omegaP901Offset(fixInput=false, fixOffset=true),
      omegaP101Offset(fixInput=false, fixOffset=true),
      ToutRR01Offset(fixInput=false, fixOffset=true),
      TTR02_nom=100 + 273.15,
      thetaFCV401Offset(fixInput=false, fixOffset=true),
      omegaP401Offset(fixInput=false, fixOffset=true)),
    f_P101=30);
  parameter Real f_P401 = 30;
  parameter Real f_P401_delta = 0;
end SR_TwoGen_CaseA;
