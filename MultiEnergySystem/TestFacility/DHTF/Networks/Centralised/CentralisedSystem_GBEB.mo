within MultiEnergySystem.TestFacility.DHTF.Networks.Centralised;
partial model CentralisedSystem_GBEB
  extends CentralisedSystem_GB;
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
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(redeclare model Medium = WaterHot, L = L_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype,
    n=np)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-318,-50})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(redeclare model Medium = WaterHot, L = L_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype,
    n=np)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-354,-50})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(redeclare model Medium = WaterHot, Kv = TestFacility.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin={-354,-16})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(redeclare model Medium = WaterHot, Kv = TestFacility.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-318,-16})));
  DHTF.Subsystems.HeatGeneration.ElectricBoiler S400(
    redeclare model Medium = WaterHot,
    n=np,
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
    q_m3h_S4=q_m3h_S4,
    Kv=Kv_FCV401,
    openingChar=openingChar_FCV401,
    nR=nR,
    Pmaxres=Pmaxres) annotation (Placement(transformation(extent={{-380,-170},{-292,-82}})));
equation
  connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
    Line(points={{-354,-40},{-354,-26}},      color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
    Line(points={{-318,-40},{-318,-26}},      color = {140, 56, 54}, thickness = 0.5));
  connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
    Line(points={{-354,-6},{-354,5.25},{-408.5,5.25}},        color = {140, 56, 54}, thickness = 0.5));
  connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
    Line(points={{-318,-6},{-318,45},{-338,45}},        color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S400_rCD_cold.outlet, S400.inlet) annotation (Line(
      points={{-354,-60},{-354,-67.7},{-353.16,-67.7},{-353.16,-75.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_rCD_hot.inlet, S400.outlet) annotation (Line(
      points={{-318,-60},{-318,-66.7},{-317.96,-66.7},{-317.96,-75.4}},
      color={140,56,54},
      thickness=0.5));
  connect(S400.inletPower, sourceVoltage.outlet) annotation (Line(
      points={{-384.4,-148},{-400,-148},{-400,-454}},
      color={56,93,138},
      thickness=1));
end CentralisedSystem_GBEB;
