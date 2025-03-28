within MultiEnergySystem.TestFacility.DHTF.Control.Tests;
partial model PlantControlBaseIII
  extends Modelica.Icons.Example;
  replaceable DHTF.Control.Controllers.ControllerBaseIII controller(useRealExpression = false, dtheta_FCVC01 = [0, -1; 1e6, -1], dtheta_FCVC02 = [0, -1; 1e6, -1], domega_P901 = [0, (f_P901 - 50)/50; 1e3, (f_P901 - 50)/50; 1e3, (f_P901 - 50 + f_P901_delta)/50; 1e6, (f_P901 - 50 + f_P901_delta)/50], dtheta_FCV901 = [0, 0; 1e6, 0], dTout_GB101 = [0, 0; 1e6, 0], domega_P101 = [0, (f_P101 - 50)/50; 1e3, (f_P101 - 50)/50; 1e3, (f_P101 - 50 + f_P101_delta)/50; 1e6, (f_P101 - 50 + f_P101_delta)/50], dtheta_FCV101 = [0, 0; 1e6, 0], dtheta_FCV701 = [0, (theta_FCV701 - 1)/1; 1e3, (theta_FCV701 - 1)/1; 1e3, (theta_FCV701 - 1 + theta_FCV701_delta)/1; 1e6, (theta_FCV701 - 1 + theta_FCV701_delta)/1], dtheta_FCV711 = [0, (theta_FCV711 - 1)/1; 1e3, (theta_FCV711 - 1)/1; 1e3, (theta_FCV711 - 1 + theta_FCV711_delta)/1; 1e6, (theta_FCV711 - 1 + theta_FCV711_delta)/1], dtheta_FCV721 = [0, (theta_FCV721 - 1)/1; 1e3, (theta_FCV721 - 1)/1; 1e3, (theta_FCV721 - 1 + theta_FCV721_delta)/1; 1e6, (theta_FCV721 - 1 + theta_FCV721_delta)/1], dtheta_FCV731 = [0, (theta_FCV731 - 1)/1; 1e3, (theta_FCV731 - 1)/1; 1e3, (theta_FCV731 - 1 + theta_FCV731_delta)/1; 1e6, (theta_FCV731 - 1 + theta_FCV731_delta)/1], dtheta_TCV701 = [0, (theta_TCV701 - 1)/1; 1e3, (theta_TCV701 - 1)/1; 1e3, (theta_TCV701 - 1 + theta_TCV701_delta)/1; 1e6, (theta_TCV701 - 1 + theta_TCV701_delta)/1], dtheta_TCV711 = [0, (theta_TCV711 - 1)/1; 1e3, (theta_TCV711 - 1)/1; 1e3, (theta_TCV711 - 1 + theta_TCV711_delta)/1; 1e6, (theta_TCV711 - 1 + theta_TCV711_delta)/1], dtheta_TCV721 = [0, (theta_TCV721 - 1)/1; 1e3, (theta_TCV721 - 1)/1; 1e3, (theta_TCV721 - 1 + theta_TCV721_delta)/1; 1e6, (theta_TCV721 - 1 + theta_TCV721_delta)/1], dtheta_TCV731 = [0, (theta_TCV731 - 1)/1; 1e3, (theta_TCV731 - 1)/1; 1e3, (theta_TCV731 - 1 + theta_TCV731_delta)/1; 1e6, (theta_TCV731 - 1 + theta_TCV731_delta)/1], dtheta_FCVR01 = [0, 0; 1e6, 0], dTout_RR01 = [0, (Tout_RR01 - 15)/(100 + 273.15); 1e6, (Tout_RR01 - 15)/(100 + 273.15)], domega_P401 = [0, (f_P401 - 50)/50; 1e3, (f_P401 - 50)/50; 1e3, (f_P401 - 50 + f_P401_delta)/50; 1e6, (f_P401 - 50 + f_P401_delta)/50], dtheta_FCV401 = [0, 0; 1e6, 0], domega_P501 = [0, (f_P501 - 50)/50; 1e3, (f_P501 - 50)/50; 1e3, (f_P501 - 50 + f_P501_delta)/50; 1e6, (f_P501 - 50 + f_P501_delta)/50]) annotation (
    Placement(transformation(origin = {5, 0}, extent = {{-55, -38}, {-11, 38}})));
  replaceable Export.Linearization.CentralisedSystemGBEBCHP_InitForward plant(TT701Offset(fixOffset = true, y_Offset_fixed = 100 + 273.15, y_norm = 100 + 273.15), TT711Offset(fixOffset = true, y_Offset_fixed = 100 + 273.15, y_norm = 100 + 273.15), TT721Offset(fixOffset = true, y_Offset_fixed = 100 + 273.15, y_norm = 100 + 273.15), TT731Offset(fixOffset = true, y_Offset_fixed = 100 + 273.15, y_norm = 100 + 273.15), EX701PtOffset(fixOffset = true, y_Offset_fixed = 100e3, y_norm = 100e3), EX711PtOffset(fixOffset = true, y_Offset_fixed = 100e3, y_norm = 100e3), EX721PtOffset(fixOffset = true, y_Offset_fixed = 100e3, y_norm = 100e3), EX731PtOffset(fixOffset = true, y_Offset_fixed = 100e3, y_norm = 100e3), thetaFCV701Offset(fixInput = false, fixOffset = true), thetaFCV711Offset(fixInput = false, fixOffset = true), thetaFCV721Offset(fixInput = false, fixOffset = true), thetaFCVC01Offset(fixInput = false, fixOffset = true), thetaFCVC02Offset(fixInput = false, fixOffset = true), thetaFCV901Offset(fixInput = false, fixOffset = true), thetaFCV101Offset(fixInput = false, fixOffset = true), thetaTCV701Offset(fixInput = false, fixOffset = true), thetaTCV711Offset(fixInput = false, fixOffset = true), thetaTCV721Offset(fixInput = false, fixOffset = true), thetaTCV731Offset(fixInput = false, fixOffset = true), omegaP901Offset(fixInput = false, fixOffset = true), omegaP101Offset(fixInput = false, fixOffset = true), ToutRR01Offset(fixInput = false, fixOffset = true), TTR02_nom = 373.15, thetaFCV401Offset(fixInput = false, fixOffset = true), omegaP401Offset(fixInput = false, fixOffset = true), omegaP501Offset(fixInput = false, fixOffset = true), S500(PL_S500_P501_PT501(h = 2.05)), S900(h_FCV901_PT902 = 2.5), PL_S500_rCD_hot(h = 3), PL_S400_rCD_hot(h = 1.2)) annotation (
    Placement(transformation(origin = {-1, 0}, extent = {{11, -38}, {55, 38}})));
  //thetaTCV701Offset(fixInput=false, fixOffset=true),
  //thetaTCV701Offset(fixInput=false, fixOffset=true),
  //
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT501_nom = TestFacility.Data.PumpData.P501.qnommax_inm3h*980/3600;
  parameter Real f_P101 = 30;
  parameter Real f_P101_delta = 0;
  parameter Real f_P401 = 30;
  parameter Real f_P401_delta = 0;
  parameter Real f_P501 = 39;
  parameter Real f_P501_delta = 0;
  parameter Real f_P901 = 30;
  parameter Real f_P901_delta = 0;
  parameter Real Tout_RR01 = 30;
  parameter Real theta_FCV701 = 1;
  parameter Real theta_FCV701_delta = 0;
  parameter Real theta_FCV711 = 1;
  parameter Real theta_FCV711_delta = 0;
  parameter Real theta_FCV721 = 1;
  parameter Real theta_FCV721_delta = 0;
  parameter Real theta_FCV731 = 1;
  parameter Real theta_FCV731_delta = 0;
  parameter Real theta_TCV701 = 1;
  parameter Real theta_TCV701_delta = 0;
  parameter Real theta_TCV711 = 1;
  parameter Real theta_TCV711_delta = 0;
  parameter Real theta_TCV721 = 1;
  parameter Real theta_TCV721_delta = 0;
  parameter Real theta_TCV731 = 1;
  parameter Real theta_TCV731_delta = 0;
equation
  connect(controller.controlSignalBus, plant.controlSignalBus) annotation (
    Line(points = {{-7.32, 0}, {2, 0}, {2, -0.38}, {12.86, -0.38}}, color = {255, 204, 51}, thickness = 0.5));
  connect(plant.processVariableBus, controller.processVariableBus) annotation (
    Line(points = {{51.36, 0}, {70, 0}, {70, -52}, {-70, -52}, {-70, -0.38}, {-48.02, -0.38}}, color = {255, 204, 51}, thickness = 0.5));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false)),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    experiment(StopTime = 1500, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"));
end PlantControlBaseIII;
