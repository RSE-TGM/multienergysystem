within MultiEnergySystem.TestFacility.DHTF.Systems.HeatGeneration;
model CentralizedTwoGenGBEB
  extends CentralizedOneGenGB;
  // System 400
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 72 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
  parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_cold = 0;
  parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
  parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_hot = -0.5;
  parameter DistrictHeatingNetwork.Types.Length L_PT401_EB401 = 0.5+0.4+0.2;
  parameter DistrictHeatingNetwork.Types.Length h_PT401_EB401 = -0.1*0;
  parameter DistrictHeatingNetwork.Types.Length L_EB401_P401 = 0.3+1+1+0.4;
  parameter DistrictHeatingNetwork.Types.Length h_EB401_P401 = -0.8;
  parameter DistrictHeatingNetwork.Types.Length L_P401_FCV401 = 0.2+0.4+0.6;
  parameter DistrictHeatingNetwork.Types.Length h_P401_FCV401 = 0.2*0;

  parameter Real nR = 5 "Total number of resistors";
  parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3 "Electric power of each resistor";
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar_FCV401 = DistrictHeatingNetwork.Components.Types.valveOpeningChar.Linear "opening characteristic";
  parameter Real q_m3h_S4 = 5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
  parameter Real P401omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
  parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
  parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
  parameter Real Kv_FCV401(unit = "m3/h") = 33 "Metri Flow Coefficient";
  parameter Boolean FV401_state = true;
  parameter Boolean FV402_state = true;
  parameter Boolean FV401_startValue = true;
  parameter Boolean FV402_startValue = true;
  parameter Real FV401_s[:] = {5e6};
  parameter Real FV402_s[:] = {5e6};


  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
    redeclare model Medium = WaterHot,
    L=L_S4_rCD_hot,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-18,74})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
    redeclare model Medium = WaterHot,
    L=L_S4_rCD_cold,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    hctype=hctype,
    n=n,
    cf=cf)                                                                                                                                                                                                        annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-54,74})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
    redeclare model Medium = WaterHot,
    Kv=TestFacility.Data.ValveData.FCV401.Kv,
    Tin_start=Tin_start_S4,
    pin_start=pin_start_S4,
    q_m3h_start=q_m3h_S4)                                                                                                                                                                                                         "On-Off valve connecting inlet S400 & S900 " annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin={-54,108})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
    redeclare model Medium = WaterHot,
    Kv=TestFacility.Data.ValveData.FCV401.Kv,
    Tin_start=Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-18,108})));
  Subsystems.HeatGeneration.ElectricBoiler      S400(
    redeclare model Medium = WaterHot,
    n=n,
    hctype=hctype,
    pin_start_S4=pin_start_S4,
    pout_start_S4=pout_start_S4,
    Tin_start_S4=Tin_start_S4,
    Tout_start_S4=Tout_start_S4,
    Di_S4=Di_S4,
    t_S4=t_S4,
    L_PT401_EB401=L_PT401_EB401,
    h_PT401_EB401=h_PT401_EB401,
    L_EB401_P401=L_EB401_P401,
    h_EB401_P401=h_EB401_P401,
    L_P401_FCV401=L_P401_FCV401,
    h_P401_FCV401=h_P401_FCV401,
    cf=cf,
    q_m3h_S4=q_m3h_S4,
    Kv=Kv_FCV401,
    openingChar=openingChar_FCV401,
    nR=nR,
    Pmaxres=Pmaxres) annotation (Placement(transformation(extent={{-82,-50},{8,40}})));
  Modelica.Blocks.Sources.BooleanExpression FV401_Status(y=true) annotation (Placement(transformation(extent={{-92,98},{-72,118}})));
  Modelica.Blocks.Sources.BooleanExpression FV402_Status(y=true) annotation (Placement(transformation(extent={{14,98},{-6,118}})));
  ElectricNetwork.Interfaces.ElectricPortInlet electricPortInlet annotation (
    Placement(transformation(extent={{20,-290},{40,-270}}),   iconTransformation(origin={-46,150},extent={{-64,-160},{-44,-140}})));
equation
  connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (
    Line(points={{-54,84},{-54,98}},          color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (
    Line(points={{-18,84},{-18,98}},          color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_cold.outlet,S400. inlet) annotation (Line(
      points={{-54,64},{-54,56.3},{-54.55,56.3},{-54.55,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_hot.inlet,S400. outlet) annotation (Line(
      points={{-18,64},{-18,57.3},{-18.55,57.3},{-18.55,46.75}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401.inlet, returncold) annotation (Line(
      points={{-54,118},{-54,228},{-16,228},{-16,282}},
      color={140,56,54},
      thickness=0.5));
  connect(FV402.outlet, senthot) annotation (Line(
      points={{-18,118},{-18,220},{36,220},{36,282}},
      color={140,56,54},
      thickness=0.5));
  connect(FV401_Status.y, FV401.u) annotation (Line(points={{-71,108},{-57.2,108}}, color={255,0,255}));
  connect(FV402_Status.y, FV402.u) annotation (Line(points={{-7,108},{-14.8,108}}, color={255,0,255}));
  connect(electricPortInlet, S400.inletPower) annotation (Line(
      points={{30,-280},{32,-280},{32,-264},{-94,-264},{-94,-27.5},{-86.5,-27.5}},
      color={56,93,138},
      thickness=1));
  connect(controlSignalBus.statusEB401, S400.status) annotation (Line(
      points={{-290,-2},{-290,-80},{-100,-80},{-100,-0.5},{-86.5,-0.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.ToutEB401, S400.Toutset) annotation (Line(
      points={{-290,-2},{-288,-2},{-288,-78},{-102,-78},{-102,8.5},{-86.5,8.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.thetaFCV401, S400.theta) annotation (Line(
      points={{-290,-2},{-286,-2},{-286,-76},{-104,-76},{-104,17.5},{-86.5,17.5}},
      color={255,204,51},
      thickness=0.5));
  connect(controlSignalBus.omegaP401, S400.omega) annotation (Line(
      points={{-290,-2},{-290,-74},{-106,-74},{-106,26.5},{-86.5,26.5}},
      color={255,204,51},
      thickness=0.5));
end CentralizedTwoGenGBEB;
