within MultiEnergySystem.TestFacility.DHTF.Networks.Centralized;
partial model CentralisedSystem_GB_III "System with only Gas Boiler Systemm as source of heat"
  extends DHTF.Networks.BaseClass.CentralisedNetworkBaseIII(Tout_start_S9 = T_start_hot, Tin_start_S9 = T_start_cold);
  replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

  // Gas composition
  parameter Integer nX = 4 "Number of components in gas";
  parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9553316, 0.0341105, 0.0105579, 0} "Mass composition";

  // System S100
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
  parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
  parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
  //parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
  parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
  parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2 "to be analysed";
  //parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";

  parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0; //0.7 + 0.95;
  parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 2;
  parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 2*0;

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
  parameter Real q_m3h_S1 = 9;
  parameter Real P101omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
  parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
  parameter Real FCV101theta[:, :] = [0, 1];
  parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
  parameter Real Kv_FCV101(unit = "m3/h") = 33 "Metri Flow Coefficient";
  parameter DistrictHeatingNetwork.Types.PerUnit eta_combustion = 0.84;
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar_FCV101 = DistrictHeatingNetwork.Components.Types.valveOpeningChar.EqualPercentage "opening characteristic";

  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(redeclare model Medium = WaterHot,L = L_S1_rCD_hot, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype,
    n=np)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-232,-206})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(redeclare model Medium = WaterHot,L = L_S1_rCD_cold, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype,
    n=np)                                                                                                                                                                                                         annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin={-266,-206})));
  DHTF.Subsystems.HeatGeneration.GasBoiler S100(
    redeclare model Medium = WaterHot,
    hctype=hctype,
    n=np,
    pin_start_S1=pin_start_S1,
    pout_start_S1=pout_start_S1,
    Tin_start_S1=Tin_start_S1,
    Tout_start_S1=Tout_start_S1,
    cf=cfp,
    eta_combustion=eta_combustion,
    h_FT101_GB101=h_FT101_GB101,
    h_GB101_P101=h_GB101_P101,
    L_P101_FCV101=L_P101_FCV101,
    h_P101_FCV101=h_P101_FCV101,
    q_m3h_S1=q_m3h_S1,
    Kv=Kv_FCV101,
    openingChar=openingChar_FCV101,
    Pmaxnom=147.6e3*0.92) annotation (Placement(transformation(extent={{-294,-328},{-206,-240}})));
  H2GasFacility.Interfaces.FluidPortInlet inletGas(nXi=nX)
                                                   annotation (
    Placement(visible = true, transformation(extent={{-260,-376},{-240,-356}}),
              iconTransformation(origin={360,366}, extent={{-260,-376},{-240,-356}})));
  ElectricNetwork.Interfaces.ElectricPortInlet electricPortInlet annotation (
    Placement(transformation(extent={{-442,-500},{-422,-480}}),
                                                              iconTransformation(origin={-56,190},extent={{-64,-160},{-44,-140}})));
  Export.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-408,330},{-270,468}}),iconTransformation(extent={{-22,80},{18,120}})));
  Modelica.Blocks.Sources.BooleanConstant FV933_OnOff(k=false) annotation (Placement(transformation(extent={{-171,67},{-191,87}})));
equation
  connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
    Line(points={{-266,-196},{-266,5.25},{-326.5,5.25}},       color = {140, 56, 54}, thickness = 0.5));
  connect(PL_S100_rCD_cold.outlet, S100.inlet) annotation (Line(
      points={{-266,-216},{-266,-225.775},{-267.16,-225.775},{-267.16,-233.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.inlet, S100.outlet) annotation (Line(
      points={{-232,-216},{-232,-225.775},{-231.96,-225.775},{-231.96,-233.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (Line(
      points={{-232,-196},{-232,45},{-235.75,45},{-235.75,44.75},{-257.5,44.75}},
      color={140,56,54},
      thickness=0.5));
  connect(inletGas, S100.inletFuel) annotation (Line(
      points={{-250,-366},{-250,-335.04}},
      color={182,109,49},
      thickness=0.5));
  connect(controlSignalBus.omegaP901, S900.omega) annotation (Line(
      points={{-339,399},{-339,362},{-876,362},{-876,158.7},{-845.1,158.7}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV901, S900.theta) annotation (Line(
      points={{-339,399},{-339,368},{-882,368},{-882,148.5},{-845.1,148.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCVC01, FCVC01.opening) annotation (Line(
      points={{-339,399},{-339,352},{238,352},{238,223},{245,223}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCVC02, FCVC02.opening) annotation (Line(
      points={{-339,399},{-339,360},{672,360},{672,221},{682,221}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.omegaP101, S100.omega) annotation (Line(
      points={{-339,399},{-339,340},{-308,340},{-308,-253.2},{-298.4,-253.2}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV101, S100.theta) annotation (Line(
      points={{-339,399},{-339,332},{-312,332},{-312,-262},{-298.4,-262}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutGB101, S100.Toutset) annotation (Line(
      points={{-339,399},{-339,324},{-316,324},{-316,-270.8},{-298.4,-270.8}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.statusGB101, S100.status) annotation (Line(
      points={{-339,399},{-339,318},{-320,318},{-320,-279.6},{-298.4,-279.6}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV701, S701.theta_FCV7X1) annotation (Line(
      points={{-339,399},{-339,346},{36,346},{36,-178},{56,-178}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV701, S701.theta_TCV7X1) annotation (Line(
      points={{-339,399},{-346,399},{-346,338},{30,338},{30,-186},{56,-186}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV731, S731.theta_FCV7X1) annotation (Line(
      points={{-339,399},{-339,346},{206,346},{206,-178},{216,-178}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV731, S731.theta_TCV7X1) annotation (Line(
      points={{-339,399},{-339,340},{202,340},{202,-186},{216,-186}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV711, S711.theta_FCV7X1) annotation (Line(
      points={{-339,399},{-339,328},{290,328},{290,82},{364,82},{364,-178},{376,-178}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV711, S711.theta_TCV7X1) annotation (Line(
      points={{-339,399},{-339,322},{288,322},{288,76},{360,76},{360,-186},{376,-186}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV721, S721.theta_FCV7X1) annotation (Line(
      points={{-339,399},{-339,344},{490,344},{490,-178},{536,-178}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV721, S721.theta_TCV7X1) annotation (Line(
      points={{-339,399},{-339,332},{488,332},{488,-186},{536,-186}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.statusRR01, RR01.cold_on) annotation (Line(
      points={{-339,399},{-339,366},{764,366},{764,42},{722,42},{722,-118.5},{728.45,-118.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.omegaPR01, PR01.in_omega) annotation (Line(
      points={{-339,399},{-339,360},{762,360},{762,48},{720,48},{720,-207.8},{710.5,-207.8}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.ToutRR01, RR01.in_Tout_cold_set)
    annotation (Line(
      points={{-339,399},{-339,356},{767.5,356},{767.5,-93.65}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCVR01, FCVR01.opening) annotation (Line(
      points={{-339,399},{-339,350},{776,350},{776,38},{852,38},{852,-322},{766,-322},{766,-352}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(FV933_OnOff.y, FV933.u) annotation (Line(points={{-192,77},{-218,77},{-218,46.6}}, color={255,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false)));
end CentralisedSystem_GB_III;
