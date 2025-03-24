within MultiEnergySystem.TestFacility.Networks.Thermal;
package Configurations
  extends Modelica.Icons.VariantsPackage;

  package BaseClass
    extends Modelica.Icons.BasesPackage;

    partial model CentralizedNetworkBase

      extends Plants.Thermal.Configurations.BaseClass.CentralPlantBase(redeclare model MediumCP = WaterHot);
      extends Loads.Thermal.Configurations.BaseClass.LoadPlantBase(redeclare model MediumLPHot = WaterHot, redeclare model MediumLPCold = WaterCold);
      replaceable model WaterHot = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      replaceable model WaterCold = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;

      inner DistrictHeatingNetwork.System system annotation (
        Placement(visible = true, transformation(origin = {889, 309}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
        Line(points = {{98, -48}, {98, 38}, {14, 38}, {14, 205}, {60, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet) annotation (
        Line(points = {{138, -48}, {138, 58}, {42, 58}, {42, 265}, {90, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL731_rackL6L7_TT732.inlet, rackL6L7_FCVC02_hot.inlet) annotation (
        Line(points = {{258, -50}, {256, -50}, {256, 60}, {618, 60}, {618, 205}, {640, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL731_FT731_rackL6L7.outlet, rackL6L7_FCVC02_cold.outlet) annotation (
        Line(points = {{298, -50}, {298, 38}, {636, 38}, {636, 265}, {650, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL711_rackL3L4_TT712.inlet, rackL3L4_FCVC01_hot.inlet) annotation (
        Line(points = {{398, -46}, {398, 80}, {152, 80}, {152, 205}, {180, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL711_FT711_rackL3L4.outlet, rackL2L3_rackL3L4_cold.inlet) annotation (
        Line(points = {{438, -46}, {438, 112}, {170, 112}, {170, 265}, {110, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL721_rackL4L5_TT722.inlet, rackL4L5_rackL5L6_hot.inlet) annotation (
        Line(points = {{558, -46}, {558, 132}, {330, 132}, {330, 205}, {400, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL721_FT721_rackL4L5.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
        Line(points = {{598, -46}, {598, 158}, {358, 158}, {358, 264}, {354, 264}, {354, 265}, {330, 265}}, color = {140, 56, 54}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CentralizedNetworkBase;

    partial model CentralisedNetworkBaseII
      extends Plants.Thermal.Configurations.BaseClass.CentralPlantBaseII(redeclare model MediumCP = WaterHot, cf = cfp, n = np);
      extends Loads.Thermal.Configurations.BaseClass.LoadPlantBaseII(redeclare model MediumLPHot = WaterHot, redeclare model MediumLPCold = WaterCold, cf = cfp, n = np);
      replaceable model WaterHot = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      replaceable model WaterCold = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      parameter DistrictHeatingNetwork.Types.PerUnit cfp = 5e-3;
      parameter Integer np = 3 "Number of volumes in each pipe";
      inner DistrictHeatingNetwork.System system annotation (
        Placement(visible = true, transformation(origin = {889, 309}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(rackL3L4.outletComp, PL711_rackL3L4_TT712.inlet) annotation (Line(
          points={{86.5,171.7},{86.5,100},{400,100},{400,-46}},
          color={140,56,54},
          thickness=0.5));
      connect(PL711_FT711_rackL3L4.outlet, rackL3L4.inletComp) annotation (Line(
          points={{440,-46},{440,112},{132,112},{132,160},{131.95,160},{131.95,172.15}},
          color={140,56,54},
          thickness=0.5));
      connect(PL701_rackL2L3_TT702.inlet, S900_rackL3L4_hot.outlet) annotation (Line(
          points={{80,-48},{80,72},{-24,72},{-24,205},{-40,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL701_FT701_rackL2L3.outlet, S900_rackL2L3_cold.inlet) annotation (Line(
          points={{120,-48},{120,82},{-4,82},{-4,241},{-60,241}},
          color={140,56,54},
          thickness=0.5));
      connect(rackL4L5.outletComp, PL721_rackL4L5_TT722.inlet) annotation (Line(
          points={{324.5,171.7},{324.5,134},{560,134},{560,-46}},
          color={140,56,54},
          thickness=0.5));
      connect(PL721_FT721_rackL4L5.outlet, rackL4L5.inletComp) annotation (Line(
          points={{600,-46},{600,156},{369.95,156},{369.95,172.15}},
          color={140,56,54},
          thickness=0.5));
      connect(PL731_rackL6L7_TT732.inlet, rackL6L7.outletComp) annotation (Line(
          points={{240,-50},{240,60},{528.5,60},{528.5,171.7}},
          color={140,56,54},
          thickness=0.5));
      connect(rackL6L7.inletComp, PL731_FT731_rackL6L7.outlet) annotation (Line(
          points={{573.95,172.15},{573.95,92},{574,92},{574,20},{280,20},{280,-50}},
          color={140,56,54},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false), graphics={
            Line(
              points={{840,-304},{840,-276}},
              color={28,108,200},
              arrow={Arrow.None,Arrow.Filled},
              thickness=1),
            Line(
              points={{686,-274},{686,-302}},
              color={28,108,200},
              arrow={Arrow.None,Arrow.Filled},
              thickness=1),
            Line(
              points={{802,-188},{802,-170},{734,-170},{734,-188}},
              color={28,108,200},
              thickness=1,
              arrow={Arrow.None,Arrow.Filled},
              smooth=Smooth.Bezier),
            Line(
              points={{0,-14},{0,14}},
              color={28,108,200},
              arrow={Arrow.None,Arrow.Filled},
              thickness=1,
              origin={584,-394},
              rotation=-90)}));
    end CentralisedNetworkBaseII;

    partial model CentralizedNetworkBaseLoadSimplified
      // Fluids
      replaceable model WaterHot = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      replaceable model WaterCold = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      extends Plants.Thermal.Configurations.BaseClass.CentralPlantBase(redeclare model MediumCP = WaterHot, rackL2L3_rackL3L4_hot(q_m3h_start = q_m3h_rackHot*3/4), rackL3L4_FCVC01_hot(q_m3h_start = q_m3h_rackHot/2), FCVC01_rackL4L5_hot(q_m3h_start = q_m3h_rackHot/2), rackL4L5_rackL5L6_hot(q_m3h_start = q_m3h_rackHot/4), rackL2L3_rackL3L4_cold(q_m3h_start = q_m3h_rackCold*3/4), rackL3L4_FCVC01_cold(q_m3h_start = q_m3h_rackCold/2), rackL5L6_rackL6L7_hot(q_m3h_start = q_m3h_rackHot/4), rackL4L5_rackL5L6_cold(q_m3h_start = q_m3h_rackCold/4), rackL5L6_rackL6L7_cold(q_m3h_start = q_m3h_rackCold/4), FCVC01_rackL4L5_cold(q_m3h_start = q_m3h_rackCold/2), rackL6L7_FCVC02_hot(q_m3h_start = q_m3h_rackHot/4), FCVC02(q_m3h_start = q_m3h_rackHot/4));
      extends Loads.Thermal.Configurations.BaseClass.LoadPlantBaseSimplified(redeclare model MediumLPHot = WaterHot, redeclare model MediumLPCold = WaterCold);
      inner DistrictHeatingNetwork.System system annotation (
        Placement(visible = true, transformation(origin = {889, 309}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
        Line(points = {{100, -40}, {100, 38}, {14, 38}, {14, 205}, {60, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet) annotation (
        Line(points = {{140, -40}, {140, 58}, {42, 58}, {42, 265}, {90, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL731_rackL6L7_TT732.inlet, rackL6L7_FCVC02_hot.inlet) annotation (
        Line(points = {{260, -40}, {256, -40}, {256, 60}, {618, 60}, {618, 205}, {640, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL731_FT731_rackL6L7.outlet, rackL6L7_FCVC02_cold.outlet) annotation (
        Line(points = {{300, -40}, {300, 38}, {636, 38}, {636, 265}, {650, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL711_rackL3L4_TT712.inlet, rackL3L4_FCVC01_hot.inlet) annotation (
        Line(points = {{420, -40}, {420, 80}, {152, 80}, {152, 205}, {180, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL711_FT711_rackL3L4.outlet, rackL2L3_rackL3L4_cold.inlet) annotation (
        Line(points = {{460, -40}, {460, 112}, {170, 112}, {170, 265}, {110, 265}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL721_rackL4L5_TT722.inlet, rackL4L5_rackL5L6_hot.inlet) annotation (
        Line(points = {{580, -40}, {580, 132}, {330, 132}, {330, 205}, {400, 205}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL721_FT721_rackL4L5.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
        Line(points = {{620, -40}, {620, 158}, {358, 158}, {358, 264}, {354, 264}, {354, 265}, {330, 265}}, color = {140, 56, 54}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CentralizedNetworkBaseLoadSimplified;

    partial model CentralisedNetworkBaseIII "New version of centralised configuration"
      extends DistrictHeatingNetwork.Icons.Water.ThermalPlant;
      extends Plants.Thermal.Configurations.BaseClass.CentralPlantBaseII(redeclare model MediumCP = WaterHot, cf = cfp, n = np);
      extends Loads.Thermal.Configurations.BaseClass.LoadPlantBaseIII(redeclare model MediumLPHot = WaterHot, redeclare model MediumLPCold = WaterCold, cf = cfp, n = np);
      replaceable model WaterHot = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      replaceable model WaterCold = DistrictHeatingNetwork.Media.WaterLiquid constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
      parameter DistrictHeatingNetwork.Types.PerUnit cfp = 5e-3;
      parameter Integer np = 3 "Number of volumes in each pipe";
      inner DistrictHeatingNetwork.System system annotation (
        Placement(visible = true, transformation(origin = {889, 309}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(rackL3L4.outletComp, PL711_rackL3L4_TT712.inlet) annotation (Line(
          points={{86.5,171.7},{86.5,100},{400,100},{400,-46}},
          color={140,56,54},
          thickness=0.5));
      connect(PL711_FT711_rackL3L4.outlet, rackL3L4.inletComp) annotation (Line(
          points={{440,-46},{440,112},{132,112},{132,160},{131.95,160},{131.95,172.15}},
          color={140,56,54},
          thickness=0.5));
      connect(PL701_rackL2L3_TT702.inlet, S900_rackL3L4_hot.outlet) annotation (Line(
          points={{80,-48},{80,72},{-24,72},{-24,205},{-40,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL701_FT701_rackL2L3.outlet, S900_rackL2L3_cold.inlet) annotation (Line(
          points={{120,-48},{120,82},{-4,82},{-4,241},{-60,241}},
          color={140,56,54},
          thickness=0.5));
      connect(rackL4L5.outletComp, PL721_rackL4L5_TT722.inlet) annotation (Line(
          points={{324.5,171.7},{324.5,134},{560,134},{560,-46}},
          color={140,56,54},
          thickness=0.5));
      connect(PL721_FT721_rackL4L5.outlet, rackL4L5.inletComp) annotation (Line(
          points={{600,-46},{600,156},{369.95,156},{369.95,172.15}},
          color={140,56,54},
          thickness=0.5));
      connect(PL731_rackL6L7_TT732.inlet, rackL6L7.outletComp) annotation (Line(
          points={{240,-50},{240,60},{528.5,60},{528.5,171.7}},
          color={140,56,54},
          thickness=0.5));
      connect(rackL6L7.inletComp, PL731_FT731_rackL6L7.outlet) annotation (Line(
          points={{573.95,172.15},{573.95,92},{574,92},{574,20},{280,20},{280,-50}},
          color={140,56,54},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-900,-600},{900,400}}),
                                                               graphics={
            Line(
              points={{840,-304},{840,-276}},
              color={28,108,200},
              arrow={Arrow.None,Arrow.Filled},
              thickness=1),
            Line(
              points={{686,-274},{686,-302}},
              color={28,108,200},
              arrow={Arrow.None,Arrow.Filled},
              thickness=1),
            Line(
              points={{802,-188},{802,-170},{734,-170},{734,-188}},
              color={28,108,200},
              thickness=1,
              arrow={Arrow.None,Arrow.Filled},
              smooth=Smooth.Bezier),
            Line(
              points={{0,-14},{0,14}},
              color={28,108,200},
              arrow={Arrow.None,Arrow.Filled},
              thickness=1,
              origin={584,-394},
              rotation=-90)}));
    end CentralisedNetworkBaseIII;
  end BaseClass;

  package Centralised
    extends DistrictHeatingNetwork.Icons.Generic.Centralised;

    partial model CentralizedSystemI "System with only Gas Boiler as source of heat"
      extends BaseClass.CentralizedNetworkBase(Tout_start_S9 = T_start_hot, Tin_start_S9 = T_start_cold);
      replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

      // Gas composition
      parameter Integer nX = 4 "Number of components in gas";
      parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9553316, 0.0341105, 0.0105579, 0} "Mass composition";

      // System S100
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 70 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S1 = 10;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL1 = 0.4;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL2 = 0.8;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL3 = 1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL4 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
      parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
      parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
      parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2 "to be analysed";
      //parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
      parameter Real q_m3h_S1 = 9;
      parameter Real P101omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
      parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
      parameter Real FCV101theta[:, :] = [0, 1];
      parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P101(redeclare model Medium = WaterHot, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P101.a, b = DistrictHeatingNetwork.Data.PumpData.P101.b, m_flow_start = m_flow_total, dpnom = DistrictHeatingNetwork.Data.PumpData.P101.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P101.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P101.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P101.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P101.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P101.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P101.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P101.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P101.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h, use_in_omega = true) annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-240, -175})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(redeclare model Medium = WaterHot,Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S1, pin_start = pout_start_S1, q_m3h_start = DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -140})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S101(redeclare model Medium = WaterHot,L = L_S1_PL3, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -230})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S101(redeclare model Medium = WaterHot,L = L_S1_PL2, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -232})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S101(redeclare model Medium = WaterHot,L = L_S1_PL3, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -106})));
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB101(Tin_start = Tin_start_S1, pin_start = pin_start_S1, pout_start = pout_start_S1, Tout_start = Tout_start_S1, HH = 55.5e6) annotation (
        Placement(visible = true, transformation(origin = {-257, -301}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(redeclare model Medium = WaterHot, T_start = Tout_start_S1, p_start = pout_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-238, -72})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102 "Pressure sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-238, -84})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101 "Pressure sensor at the inlet of gas boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-278, -130})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(redeclare model Medium = WaterHot, T_start = Tin_start_S1, p_start = pin_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-278, -94})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(redeclare model Medium = WaterHot, T_start = Tin_start_S1, p_start = pin_start_S1) annotation (
        Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-279, -195})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S101(redeclare model Medium = WaterHot,L = L_S1_PL1, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -160})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(redeclare model Medium = WaterHot,L = L_S1_rCD_hot, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -40})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(redeclare model Medium = WaterHot,L = L_S1_rCD_cold, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -40})));
      H2GasFacility.Sources.SourcePressure sourceGas(
        redeclare model Medium = Gas,
        X0=X_gas,
        R=1e-3,
        computeEnergyVariables=true) annotation (Placement(transformation(
            extent={{9,-9},{-9,9}},
            rotation=0,
            origin={-207,-301})));
    equation
      connect(P101.inlet, PL3_S101.outlet) annotation (
        Line(points = {{-240, -184.6}, {-240, -220}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV101.inlet, P101.outlet) annotation (
        Line(points = {{-240, -150}, {-240, -165.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT102.inlet, PT102.inlet) annotation (
        Line(points = {{-240.4, -72}, {-240.4, -84}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL4_S101.inlet, FCV101.outlet) annotation (
        Line(points = {{-240, -116}, {-240, -130}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT102.inlet, PL4_S101.outlet) annotation (
        Line(points = {{-240.4, -84}, {-240.4, -93}, {-240, -93}, {-240, -96}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT101.outlet, PL2_S101.inlet) annotation (
        Line(points = {{-276.2, -199.2}, {-276.2, -201.6}, {-276, -201.6}, {-276, -222}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S101.outlet, FT101.inlet) annotation (
        Line(points = {{-276, -170}, {-276, -177.4}, {-276.2, -177.4}, {-276.2, -190.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S101.inlet, PT101.inlet) annotation (
        Line(points = {{-276, -150}, {-276, -130}, {-275.6, -130}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT101.inlet, TT101.inlet) annotation (
        Line(points = {{-275.6, -130}, {-275.6, -94}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_hot.inlet, TT102.inlet) annotation (
        Line(points = {{-240, -50}, {-240, -72}, {-240.4, -72}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT101.inlet, PL_S100_rCD_cold.outlet) annotation (
        Line(points = {{-275.6, -94}, {-275.6, -89}, {-276, -89}, {-276, -50}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
        Line(points = {{-276, -30}, {-276, 5.25}, {-326.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S101.outlet, GB101.inlet) annotation (
        Line(points = {{-276, -242}, {-276, -254}, {-267.5, -254}, {-267.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL3_S101.inlet, GB101.outlet) annotation (
        Line(points = {{-240, -240}, {-240, -254}, {-246.5, -254}, {-246.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (
        Line(points = {{-240, -30}, {-242, -30}, {-242, 44.75}, {-257.5, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
      connect(sourceGas.outlet, GB101.inletfuel) annotation (Line(
          points={{-216,-301},{-236,-301}},
          color={182,109,49},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CentralizedSystemI;

    partial model CentralizedSystemI_B
      extends CentralizedSystemI;
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 72 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
      parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_cold = 0;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
      parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_hot = -0.5;
      parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
      parameter Real q_m3h_S4 = 5;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
      parameter Real P401omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
      parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
      parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      parameter Boolean FV401_state = true;
      parameter Boolean FV402_state = true;
      parameter Boolean FV401_startValue = true;
      parameter Boolean FV402_startValue = true;
      parameter Real FV401_s[:] = {5e6};
      parameter Real FV402_s[:] = {5e6};
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 5) annotation (
        Placement(visible = true, transformation(origin = {-337, -301}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
      DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P401(redeclare model Medium = WaterHot, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P401.a, b = DistrictHeatingNetwork.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = DistrictHeatingNetwork.Data.PumpData.P401.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P401.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P401.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P401.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P401.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P401.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P401.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P401.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h, use_in_omega = true) annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-318, -171})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -136})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(redeclare model Medium = WaterHot,L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -232})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(redeclare model Medium = WaterHot,L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -234})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(redeclare model Medium = WaterHot,L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -108})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(redeclare model Medium = WaterHot,T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-316, -70})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-316, -82})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-360, -114})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(redeclare model Medium = WaterHot,T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-360, -102})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(redeclare model Medium = WaterHot,T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
        Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-361, -191})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(redeclare model Medium = WaterHot,L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -162})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(redeclare model Medium = WaterHot,L = L_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -48})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(redeclare model Medium = WaterHot,L = L_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -50})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(redeclare model Medium = WaterHot,Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-358, -16})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(redeclare model Medium = WaterHot,Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -16})));
    equation
      connect(P401.inlet, PL3_S401.outlet) annotation (
        Line(points = {{-318, -180.6}, {-318, -222}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV401.inlet, P401.outlet) annotation (
        Line(points = {{-318, -146}, {-318, -161.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PT402.inlet) annotation (
        Line(points = {{-318.4, -70}, {-318.4, -82}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL4_S401.inlet, FCV401.outlet) annotation (
        Line(points = {{-318, -118}, {-318, -126}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT402.inlet, PL4_S401.outlet) annotation (
        Line(points = {{-318.4, -82}, {-318.4, -91}, {-318, -91}, {-318, -98}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT401.outlet, PL2_S401.inlet) annotation (
        Line(points = {{-358.2, -195.2}, {-358.2, -203.6}, {-358, -203.6}, {-358, -224}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.outlet, FT401.inlet) annotation (
        Line(points = {{-358, -172}, {-358, -179.4}, {-358.2, -179.4}, {-358.2, -186.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.inlet, PT401.inlet) annotation (
        Line(points = {{-358, -152}, {-358, -114}, {-357.6, -114}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT401.inlet, TT401.inlet) annotation (
        Line(points = {{-357.6, -114}, {-357.6, -102}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EB401.outlet, PL3_S401.inlet) annotation (
        Line(points = {{-326.5, -273}, {-326.5, -256}, {-318, -256}, {-318, -242}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
        Line(points = {{-318.4, -70}, {-318, -70}, {-318, -58}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
        Line(points = {{-357.6, -102}, {-358, -102}, {-358, -60}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
        Line(points = {{-358, -40}, {-358, -26}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
        Line(points = {{-318, -38}, {-318, -26}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
        Line(points = {{-358, -6}, {-358, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
        Line(points = {{-318, -6}, {-318, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S401.outlet, EB401.inlet) annotation (
        Line(points = {{-358, -244}, {-358, -258}, {-347.5, -258}, {-347.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
    end CentralizedSystemI_B;

    partial model CentralizedSystemII
      extends BaseClass.CentralizedNetworkBase;
      // System 400
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 17 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 16 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
      parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
      parameter Real q_m3h_S4 = 9;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
      parameter Real P401omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P401qm3h[:, :] = [0, 7.5; 100, 7.5];
      parameter Real FCV401theta[:, :] = [0, 1];
      parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      parameter Boolean FV401_state = true;
      parameter Boolean FV402_state = true;
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 0) annotation (
        Placement(visible = true, transformation(origin = {-342, -322}, extent = {{-34, -34}, {34, 34}}, rotation = 0)));
      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P401(Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P401.a, b = DistrictHeatingNetwork.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = DistrictHeatingNetwork.Data.PumpData.P401.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P401.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P401.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P401.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P401.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P401.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P401.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P401.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h) annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-322, -195})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -160})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -256})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -258})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -132})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-320, -94})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-320, -106})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -138})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-364, -126})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
        Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-365, -215})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -186})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(L = L_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -72})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(L = L_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-362, -74})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-362, -40})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-322, -40})));
    equation
      connect(P401.inlet, PL3_S401.outlet) annotation (
        Line(points = {{-322, -204.6}, {-322, -246}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV401.inlet, P401.outlet) annotation (
        Line(points = {{-322, -170}, {-322, -185.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PT402.inlet) annotation (
        Line(points = {{-322.4, -94}, {-322.4, -106}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL4_S401.inlet, FCV401.outlet) annotation (
        Line(points = {{-322, -142}, {-322, -150}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT402.inlet, PL4_S401.outlet) annotation (
        Line(points = {{-322.4, -106}, {-322.4, -115}, {-322, -115}, {-322, -122}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT401.outlet, PL2_S401.inlet) annotation (
        Line(points = {{-362.2, -219.2}, {-362.2, -227.6}, {-362, -227.6}, {-362, -248}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.outlet, FT401.inlet) annotation (
        Line(points = {{-362, -196}, {-362, -203.4}, {-362.2, -203.4}, {-362.2, -210.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.inlet, PT401.inlet) annotation (
        Line(points = {{-362, -176}, {-362, -138}, {-361.6, -138}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT401.inlet, TT401.inlet) annotation (
        Line(points = {{-361.6, -138}, {-361.6, -126}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S401.outlet, EB401.inlet) annotation (
        Line(points = {{-362, -268}, {-362, -278}, {-352.2, -278}, {-352.2, -294.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EB401.outlet, PL3_S401.inlet) annotation (
        Line(points = {{-331.8, -294.8}, {-331.8, -278}, {-322, -278}, {-322, -266}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
        Line(points = {{-322.4, -94}, {-322, -94}, {-322, -82}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
        Line(points = {{-361.6, -126}, {-362, -126}, {-362, -84}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
        Line(points = {{-362, -64}, {-362, -50}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
        Line(points = {{-322, -62}, {-322, -50}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
        Line(points = {{-362, -30}, {-362, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
        Line(points = {{-322, -30}, {-322, 46}, {-320, 46}, {-320, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
    end CentralizedSystemII;

    partial model CentralizedSystemIII
      extends BaseClass.CentralizedNetworkBase;
      // S200
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2 = 2.1e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2 = 2.5e5;
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump = 1.79e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump = 3e5;
      final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank = pout_start_S2_pump;
      final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank = pin_start_S2_tank - 9.81*4*990;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2 = 60 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2 = 60 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S2 = 10;
      parameter DistrictHeatingNetwork.Types.Length Di_S2 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S2 = 1.5e-3;
      parameter Real q_m3h_S2(unit = "m3/h") = 6;
      final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q = q_m3h_S2/3600;
      final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2 = q*985;
      parameter Real P201omega[:, :] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
      parameter Real P201qm3h[:, :] = [0, 2.8289046; 100, 2.8289046];
      parameter Real FCV201theta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];
      // Pipe length System S200
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL0 = 24.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL1 = 1.7;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL2 = 1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL3 = 2.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL4 = 1.0;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL5 = 2.8;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL6 = 2.8;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL7 = 2;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL8 = 3;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL9 = 21.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202 = 2.5;
      parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202 = 0;
      parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High = 2.5;
      parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High = -2.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201 = 1;
      parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201 = 0;
      parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201 = 2;
      parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201 = 0;
      DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(H = 4,
        n=4,                                                                         D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
        Placement(transformation(extent = {{-770, -474}, {-826, -362}})));
      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P201(pout_start(displayUnit = "Pa") = 3e5, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start, Tout_start = DistrictHeatingNetwork.Data.PumpData.P201.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P201.a, b = DistrictHeatingNetwork.Data.PumpData.P201.b, m_flow_start = m_flow_S2, dpnom = DistrictHeatingNetwork.Data.PumpData.P201.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P201.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P201.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P201.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P201.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P201.omeganom, pin_start(displayUnit = "Pa") = 1.8400803e5, headnom = DistrictHeatingNetwork.Data.PumpData.P201.headnom, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom, headmax = DistrictHeatingNetwork.Data.PumpData.P201.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P201.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h)                    annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = -90, origin = {-802, -206})));
      DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(H = 4,
        n=4,                                                                         D = 1.7, T_start(displayUnit = "K") = 60 + 273.15, pin_start = pin_start_S2_tank, m_flow_start = m_flow_S2/2) annotation (
        Placement(transformation(extent = {{-708, -474}, {-652, -362}})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start = Tin_start_S2, p_start = pin_start_S2) "Temperature sensor at the inlet of pump 201" annotation (
        Placement(transformation(extent = {{-4.75, -4.75}, {4.75, 4.75}}, rotation = 90, origin = {-803.75, -64.75})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201 "Pressure sensor at the inlet of pump 201" annotation (
        Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 90, origin = {-804, -84.5})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -106})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-862, -196})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(L = L_S2_PL3, t = L_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 270, origin = {-862, -166})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(L = L_S2_PL2, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -238})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(L = L_S2_PL4, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {-862, -226})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start = Tout_start_S2, p_start = pout_start_S2) "Temperature sensor at the outlet of System 200" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-760, -66})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202 "Pressure sensor at the outlet of system S200" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-760, -136})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(L = L_S2_PL9, t = t_S2, pin_start = pout_start_S2, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-762, -46})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-722, -410})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(L = L_S2_PL0, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -46})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(L = L_S2_Tanks_High, h = h_S2_Tanks_High, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 90, origin = {-756, -410})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2/2) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-738, -438})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(L = L_S2_S201_S202, h = h_S2_S201_S202, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-738, -454})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(L = L_S2_PL6, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-830, -488})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(L = L_S2_D201_FT201, h = h_S2_D201_FT201, t = t_S2, pin_start = pout_start_S2_pump, Tin_start = Tout_start_S2, Tout_start = Tout_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 0, origin = {-842, -438})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(L = L_S2_PL1, t = t_S2, pin_start = pin_start_S2, Tin_start = Tin_start_S2, Tout_start = Tin_start_S2, Di = Di_S2, q_m3h_start = q_m3h_S2, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-802, -168})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-832, -126})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
        Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-802, -146})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
        Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 180, origin = {-782, -184})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2) annotation (
        Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = -90, origin = {-802, -266})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2/4) annotation (
        Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 0, origin = {-782, -252})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(Kv = DistrictHeatingNetwork.Data.ValveData.FCV201.Kv, dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, Tin_start(displayUnit = "K") = Tout_start_S2, pin_start = pout_start_S2, q_m3h_start = q_m3h_S2) annotation (
        Placement(transformation(extent = {{-6, 6}, {6, -6}}, rotation = 90, origin = {-762, -216})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start = Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
        Placement(transformation(extent = {{-7, 7}, {7, -7}}, rotation = 90, origin = {-759, -277})));
    equation
      connect(PT201.inlet, TT201.inlet) annotation (
        Line(points = {{-802, -84.5}, {-802, -75.625}, {-801.85, -75.625}, {-801.85, -64.75}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_TT201_FV201.inlet, PT201.inlet) annotation (
        Line(points = {{-802, -96}, {-802, -84.5}}, color = {140, 56, 54}, thickness = 0.5));
      connect(P201.outlet, PL_S200_P201_FV209.inlet) annotation (
        Line(points = {{-802, -215.6}, {-802, -228}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT202.inlet, PT202.inlet) annotation (
        Line(points = {{-762.4, -66}, {-762.4, -136}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_rCD_hot.inlet, TT202.inlet) annotation (
        Line(points = {{-762, -56}, {-762, -66}, {-762.4, -66}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_rCD_cold.outlet, TT201.inlet) annotation (
        Line(points = {{-802, -56}, {-802, -67.375}, {-801.85, -67.375}, {-801.85, -64.75}}, color = {140, 56, 54}, thickness = 0.5));
      connect(D201.outlet, PL_S200_D201_High.inlet) annotation (
        Line(points = {{-770, -383}, {-756, -383}, {-756, -400}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_D201_D202_High.inlet, PL_S200_D202_High.outlet) annotation (
        Line(points = {{-728, -438}, {-722, -438}, {-722, -420}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_D201_D202_High.outlet, PL_S200_D201_High.outlet) annotation (
        Line(points = {{-748, -438}, {-756, -438}, {-756, -420}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_D202_High.inlet, D202.outlet) annotation (
        Line(points = {{-722, -400}, {-722, -383}, {-708, -383}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_D201_D202_Low.inlet, D201.inlet) annotation (
        Line(points = {{-748, -454}, {-764, -454}, {-764, -453}, {-770, -453}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_D201_D202_Low.outlet, D202.inlet) annotation (
        Line(points = {{-728, -454}, {-724, -454}, {-724, -453}, {-708, -453}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_FV209_D201.outlet, D201.inlet) annotation (
        Line(points = {{-820, -488}, {-756, -488}, {-756, -453}, {-770, -453}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_FV209_FCV201.outlet, FCV201.inlet) annotation (
        Line(points = {{-862, -216}, {-862, -206}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV201.outlet, PL_S200_FCV201_FV202.inlet) annotation (
        Line(points = {{-862, -186}, {-862, -176}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_FV201_P201.outlet, P201.inlet) annotation (
        Line(points = {{-802, -178}, {-802, -196.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_FCV201_FV202.outlet, FV202.inlet) annotation (
        Line(points = {{-862, -156}, {-862, -126}, {-838, -126}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_TT201_FV201.outlet, FV201.inlet) annotation (
        Line(points = {{-802, -116}, {-802, -140}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV201.outlet, PL_S200_FV201_P201.inlet) annotation (
        Line(points = {{-802, -152}, {-802, -158}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV202.outlet, FV201.inlet) annotation (
        Line(points = {{-826, -126}, {-802, -126}, {-802, -140}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV206.outlet, P201.inlet) annotation (
        Line(points = {{-788, -184}, {-802, -184}, {-802, -196.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_P201_FV209.outlet, FV209.inlet) annotation (
        Line(points = {{-802, -248}, {-802, -260}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV207.inlet, FV209.inlet) annotation (
        Line(points = {{-788, -252}, {-802, -252}, {-802, -260}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV207.outlet, FV203.inlet) annotation (
        Line(points = {{-776, -252}, {-762, -252}, {-762, -222}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV206.inlet, FV203.outlet) annotation (
        Line(points = {{-776, -184}, {-762, -184}, {-762, -210}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT202.inlet, FV203.outlet) annotation (
        Line(points = {{-762.4, -136}, {-762, -136}, {-762, -210}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT201.outlet, FV203.inlet) annotation (
        Line(points = {{-761.8, -272.8}, {-762, -252}, {-762, -222}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_FV209_FCV201.inlet, PL_S200_FV209_D201.inlet) annotation (
        Line(points = {{-862, -236}, {-862, -488}, {-840, -488}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (
        Line(points = {{-802, -36}, {-802, -18}, {-706, -18}, {-706, 5.25}, {-668, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (
        Line(points = {{-762, -36}, {-762, -30}, {-692, -30}, {-692, 44.75}, {-727, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_D201_FT201.inlet, FT201.inlet) annotation (
        Line(points = {{-852, -438}, {-856, -438}, {-856, -348}, {-761.8, -348}, {-761.8, -281.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S200_D201_FT201.outlet, PL_S200_D201_High.outlet) annotation (
        Line(points = {{-832, -438}, {-756, -438}, {-756, -420}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV209.outlet, PL_S200_FV209_D201.inlet) annotation (
        Line(points = {{-802, -272}, {-802, -328}, {-862, -328}, {-862, -488}, {-840, -488}}, color = {140, 56, 54}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CentralizedSystemIII;

    partial model CentralizedSystemLoadSimplifiedI "System with only Gas Boiler as source of heat"
      extends BaseClass.CentralizedNetworkBaseLoadSimplified;
      replaceable model Gas = H2GasFacility.Media.IdealGases.NG_4 constrainedby H2GasFacility.Media.BaseClasses.PartialMixture;

      // Gas composition
      parameter Integer nX = 4 "Number of components in gas";
      parameter DistrictHeatingNetwork.Types.MassFraction X_gas[nX] = {0.9553316, 0.0341105, 0.0105579, 0} "Mass composition";

      // System S100
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 70 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S1 = 10;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL1 = 0.4;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL2 = 0.8;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL3 = 1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL4 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
      parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
      parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
      parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2 "to be analysed";
      //parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
      parameter Real q_m3h_S1 = 9;
      parameter Real P101omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
      parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
      parameter Real FCV101theta[:, :] = [0, 1];
      parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P101(redeclare model Medium = WaterHot, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P101.a, b = DistrictHeatingNetwork.Data.PumpData.P101.b, m_flow_start = m_flow_total, dpnom = DistrictHeatingNetwork.Data.PumpData.P101.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P101.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P101.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P101.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P101.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P101.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P101.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P101.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P101.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h, use_in_omega = true) annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-240, -175})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        openingChar=DistrictHeatingNetwork.Data.ValveData.FCV101.openingChar,                                                    dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S1, pin_start = pout_start_S1, q_m3h_start = DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -110})));
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB101(redeclare model Medium = WaterHot, Tin_start = Tin_start_S1, pin_start = pin_start_S1, pout_start = pout_start_S1, Tout_start = Tout_start_S1, HH = 55.5e6) annotation (
        Placement(visible = true, transformation(origin = {-257, -301}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(redeclare model Medium = WaterHot, T_start = Tout_start_S1, p_start = pout_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-238, -72})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102 "Pressure sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-238, -84})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101 "Pressure sensor at the inlet of gas boiler" annotation (
        Placement(transformation(origin = {-278, -124}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(redeclare model Medium = WaterHot, T_start = Tin_start_S1, p_start = pin_start_S1) "Temperature sensor at the outlet of valve FCV101" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-278, -94})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(redeclare model Medium = WaterHot, T_start = Tin_start_S1, p_start = pin_start_S1) annotation (
        Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-279, -195})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(redeclare model Medium = WaterHot, L = L_S1_rCD_hot, h = h_S1_rCD_hot, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -40})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(redeclare model Medium = WaterHot, L = L_S1_rCD_cold, h = h_S1_rCD_cold, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -40})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_GB101_P101(redeclare model Medium = WaterHot, L = L_GB101_P101, h = h_GB101_P101, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -230})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_FT101_GB101(redeclare model Medium = WaterHot, L = L_FT101_GB101, h = h_FT101_GB101, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -230})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_TT101_FT101(redeclare model Medium = WaterHot, L = L_TT101_FT101, h = h_TT101_FT101, t = t_S1, pin_start = pin_start_S1, Tin_start = Tin_start_S1, Tout_start = Tin_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, hctype = hctype) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-276, -162})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_P101_FCV101(redeclare model Medium = WaterHot, L = L_P101_FCV101, h = h_P101_FCV101, t = t_S1, pin_start = pout_start_S1, Tin_start = Tout_start_S1, Tout_start = Tout_start_S1, Di = Di_S1, q_m3h_start = q_m3h_S1, n = n, hctype = hctype) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-240, -142})));
      H2GasFacility.Sources.SourcePressure sourceGas(
        redeclare model Medium = Gas,
        X0=X_gas,
        R=1e-3,
        computeEnergyVariables=true) annotation (Placement(transformation(
            extent={{9,-9},{-9,9}},
            rotation=0,
            origin={-205,-301})));
    equation
      connect(TT102.inlet, PT102.inlet) annotation (
        Line(points = {{-240.4, -72}, {-240.4, -84}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT101.inlet, TT101.inlet) annotation (
        Line(points={{-275.6,-124},{-275.6,-112},{-275.6,-112},{-275.6,-94}},      color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_hot.inlet, TT102.inlet) annotation (
        Line(points = {{-240, -50}, {-240, -72}, {-240.4, -72}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT101.inlet, PL_S100_rCD_cold.outlet) annotation (
        Line(points = {{-275.6, -94}, {-275.6, -89}, {-276, -89}, {-276, -50}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
        Line(points = {{-276, -30}, {-276, 5.25}, {-326.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (
        Line(points = {{-240, -30}, {-242, -30}, {-242, 44.75}, {-257.5, 44.75}}, color = {140, 56, 54}, thickness = 0.5));
      connect(P101.inlet, PL_S100_GB101_P101.outlet) annotation (
        Line(points = {{-240, -184.6}, {-240, -220}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT101.outlet, PL_S100_FT101_GB101.inlet) annotation (
        Line(points = {{-276.2, -199.2}, {-276.2, -220}, {-276, -220}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_FT101_GB101.outlet, GB101.inlet) annotation (
        Line(points = {{-276, -240}, {-276, -252}, {-267.5, -252}, {-267.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_GB101_P101.inlet, GB101.outlet) annotation (
        Line(points = {{-240, -240}, {-240, -252}, {-246.5, -252}, {-246.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV101.outlet, PT102.inlet) annotation (
        Line(points = {{-240, -100}, {-240, -92}, {-240.4, -92}, {-240.4, -84}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT101.inlet, PL_S100_TT101_FT101.outlet) annotation (
        Line(points = {{-276.2, -190.8}, {-276.2, -184}, {-276, -184}, {-276, -172}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_TT101_FT101.inlet, PT101.inlet) annotation (
        Line(points={{-276,-152},{-276,-138},{-276,-124},{-275.6,-124}},
                                                    color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S100_P101_FCV101.inlet, P101.outlet) annotation (
        Line(points = {{-240, -152}, {-240, -165.4}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCV101.inlet, PL_S100_P101_FCV101.outlet) annotation (
        Line(points = {{-240, -120}, {-240, -132}}, color = {140, 56, 54}, thickness = 0.5));
      connect(sourceGas.outlet, GB101.inletfuel) annotation (Line(
          points={{-214,-301},{-236,-301}},
          color={182,109,49},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CentralizedSystemLoadSimplifiedI;

    partial model CentralizedSystemLoadSimplifiedI_B
      extends CentralizedSystemLoadSimplifiedI;
      // System 400
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 72 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold = 5.5;
      parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_cold = 0;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot = 6;
      parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_hot = -0.5;
      parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
      parameter Real q_m3h_S4 = 5;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4 = q_m3h_S4*990/3600;
      parameter Real P401omega[:, :] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P401qm3h[:, :] = [0, 5; 100, 5];
      parameter Real FCV401theta[:, :] = [0, 1; 100, 1];
      parameter Real EB401_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      parameter Boolean FV401_state = true;
      parameter Boolean FV402_state = true;
      parameter Boolean FV401_startValue = true;
      parameter Boolean FV402_startValue = true;
      parameter Real FV401_s[:] = {5e6};
      parameter Real FV402_s[:] = {5e6};
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(redeclare model Medium = WaterHot, Tout_start = Tout_start_S4, D = 0.4, Pmaxnom = 50e3, Pnimnom = 10e3, Pnom = 50e3, Tin_start = Tin_start_S4, etanom = 0.98, h = 1.25, m_flow_nom = m_flow_S4, pin_start = pin_start_S4, pout_start = 160000, nR = 5) annotation (
        Placement(visible = true, transformation(origin = {-337, -301}, extent = {{-35, -35}, {35, 35}}, rotation = 0)));
      DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P401(redeclare model Medium = WaterHot, Tin_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start, Tout_start(displayUnit = "K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start, a = DistrictHeatingNetwork.Data.PumpData.P401.a, b = DistrictHeatingNetwork.Data.PumpData.P401.b, m_flow_start = m_flow_S4, dpnom = DistrictHeatingNetwork.Data.PumpData.P401.dpnom, etaelec = DistrictHeatingNetwork.Data.PumpData.P401.etaelec, etamech = DistrictHeatingNetwork.Data.PumpData.P401.etamech, etanom = DistrictHeatingNetwork.Data.PumpData.P401.etanom, hin_start = DistrictHeatingNetwork.Data.PumpData.P401.hin_start, m_flow_nom = DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom, omeganom = DistrictHeatingNetwork.Data.PumpData.P401.omeganom, pin_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start, pout_start(displayUnit = "Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start, qnom_inm3h = DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h, rhonom(displayUnit = "kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom, headnom = DistrictHeatingNetwork.Data.PumpData.P401.headnom, headmax = DistrictHeatingNetwork.Data.PumpData.P401.headnommax, headmin = DistrictHeatingNetwork.Data.PumpData.P401.headnommin, qnom_inm3h_min = DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h, qnom_inm3h_max = DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h, use_in_omega = true) annotation (
        Placement(transformation(extent = {{-12, 12}, {12, -12}}, rotation = 90, origin = {-318, -171})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        openingChar=DistrictHeatingNetwork.Data.ValveData.FCV401.openingChar,                                                    dp_nom(displayUnit = "Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom, rho_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom, q_m3h_nom = DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h, Tin_start(displayUnit = "K") = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(origin = {-318, -110}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(redeclare model Medium = WaterHot, L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -232})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(redeclare model Medium = WaterHot, L = L_S4_PL2, t = t_S4, m_flow_start = m_flow_S4, pin_start = pin_start_S4, pout_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -234})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(redeclare model Medium = WaterHot, L = L_S4_PL3, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(origin = {-318, -142}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(redeclare model Medium = WaterHot, T_start = Tout_start_S4, p_start = pout_start_S4) "Temperature sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = -90, origin = {-316, -70})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402 "Pressure sensor at the outlet of valve FCV401" annotation (
        Placement(transformation(extent = {{6, 6}, {-6, -6}}, rotation = 90, origin = {-316, -82})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401 "Pressure sensor at the inlet of gas boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-360, -114})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(redeclare model Medium = WaterHot, T_start = Tin_start_S4, p_start = pin_start_S4) "Temperature sensor at the inlet of electrib boiler" annotation (
        Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {-360, -102})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(redeclare model Medium = WaterHot, T_start = Tin_start_S4, p_start = pin_start_S4) annotation (
        Placement(transformation(extent = {{7, -7}, {-7, 7}}, rotation = 90, origin = {-361, -191})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(redeclare model Medium = WaterHot, L = L_S4_PL1, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -162})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(redeclare model Medium = WaterHot, L = L_S4_rCD_hot, t = t_S4, pin_start = pout_start_S4, Tin_start = Tout_start_S4, Tout_start = Tout_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -48})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(redeclare model Medium = WaterHot, L = L_S4_rCD_cold, t = t_S4, pin_start = pin_start_S4, Tin_start = Tin_start_S4, Tout_start = Tin_start_S4, Di = Di_S4, q_m3h_start = q_m3h_S4, hctype = hctype, n = n) annotation (
        Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 90, origin = {-358, -50})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin = {-358, -16})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin = {-318, -16})));
    equation
      connect(P401.inlet, PL3_S401.outlet) annotation (
        Line(points = {{-318, -180.6}, {-318, -222}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PT402.inlet) annotation (
        Line(points = {{-318.4, -70}, {-318.4, -82}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FT401.outlet, PL2_S401.inlet) annotation (
        Line(points = {{-358.2, -195.2}, {-358.2, -203.6}, {-358, -203.6}, {-358, -224}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.outlet, FT401.inlet) annotation (
        Line(points = {{-358, -172}, {-358, -179.4}, {-358.2, -179.4}, {-358.2, -186.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL1_S401.inlet, PT401.inlet) annotation (
        Line(points = {{-358, -152}, {-358, -114}, {-357.6, -114}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PT401.inlet, TT401.inlet) annotation (
        Line(points = {{-357.6, -114}, {-357.6, -102}}, color = {140, 56, 54}, thickness = 0.5));
      connect(EB401.outlet, PL3_S401.inlet) annotation (
        Line(points = {{-326.5, -273}, {-326.5, -256}, {-318, -256}, {-318, -242}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT402.inlet, PL_S400_rCD_hot.inlet) annotation (
        Line(points = {{-318.4, -70}, {-318, -70}, {-318, -58}}, color = {140, 56, 54}, thickness = 0.5));
      connect(TT401.inlet, PL_S400_rCD_cold.outlet) annotation (
        Line(points = {{-357.6, -102}, {-358, -102}, {-358, -60}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_cold.inlet, FV401.outlet) annotation (
        Line(points = {{-358, -40}, {-358, -26}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL_S400_rCD_hot.outlet, FV402.inlet) annotation (
        Line(points = {{-318, -38}, {-318, -26}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (
        Line(points = {{-358, -6}, {-358, 5.25}, {-408.5, 5.25}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (
        Line(points = {{-318, -6}, {-318, 45}, {-338, 45}}, color = {140, 56, 54}, thickness = 0.5));
      connect(PL2_S401.outlet, EB401.inlet) annotation (
        Line(points = {{-358, -244}, {-358, -258}, {-347.5, -258}, {-347.5, -273}}, color = {140, 56, 54}, thickness = 0.5));
      connect(
          P401.outlet, PL4_S401.inlet) annotation (
        Line(points={{-318,-161.4},{-318,-152}},    color = {140, 56, 54}));
      connect(
          PL4_S401.outlet, FCV401.inlet) annotation (
        Line(points = {{-318, -132}, {-318, -120}}, color = {140, 56, 54}));
      connect(
          FCV401.outlet, PT402.inlet)
        annotation (
        Line(points={{-318,-100},{-318,-92},{-318,-82},{-318.4,-82}},
                                                   color = {140, 56, 54}));
    end CentralizedSystemLoadSimplifiedI_B;

    partial model CentralizedSystemSimplifiedLoadSimplifiedI "System with only Gas Boiler as source of heat"
      // System S100
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 30 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 30 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S1 = 10;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL1 = 0.4;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL2 = 0.8;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL3 = 1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL4 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;
      parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
      parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
      parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold = 12.25;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66 - 0.54 + 1.3 + 1 - 0.5 - 0.3 "0.3";
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot = 10.85;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = m_flow_total;
      parameter Real q_m3h_S1 = 9;
      parameter Real P101omega[:, :] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
      parameter Real P101qm3h[:, :] = [0, 7.5; 100, 7.5];
      parameter Real FCV101theta[:, :] = [0, 1];
      parameter Real GB101_ToutSP[:, :] = [0, 80 + 273.15; 100, 80 + 273.15];
      Plants.Thermal.Systems.GasBoiler S100 annotation (
        Placement(transformation(extent = {{-95, -68}, {-59, -32}})));
      Plants.Thermal.Systems.CirculationPump S900 annotation (
        Placement(transformation(extent = {{-18, -18}, {18, 18}}, rotation = -90, origin = {-105, 63})));
      Loads.Thermal.Systems.CoolingSingleLoad EX701 annotation (
        Placement(transformation(extent={{-36,-68},{0,-32}})));
      Plants.Thermal.Systems.ElectricBoiler S400 annotation (
        Placement(transformation(extent = {{-149, -67}, {-113, -31}})));
      Loads.Thermal.Systems.CoolingSingleLoad EX711 annotation (
        Placement(transformation(extent={{21,-68},{57,-32}})));
      Loads.Thermal.Systems.CoolingSingleLoad EX721 annotation (
        Placement(transformation(extent={{83,-68},{119,-32}})));
      Loads.Thermal.Systems.CoolingSingleLoad EX731 annotation (
        Placement(transformation(extent={{138,-68},{174,-32}})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV933(Kv = 33, dp_nom = 50000, Tin_start = T_start, pin_start = pin_start) annotation (
        Placement(visible = true, transformation(origin = {-48, 10}, extent = {{-4, 4}, {4, -4}}, rotation = 90)));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC02(q_m3h_start = q_m3h_rackHot/4, Kv = DistrictHeatingNetwork.Data.ValveData.FCVC02.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = T_start_hot, pin_start = 200000) annotation (
        Placement(transformation(extent = {{4, -4}, {-4, 4}}, rotation = -90, origin = {190, 63})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCVC01(Kv = DistrictHeatingNetwork.Data.ValveData.FCVC01.Kv, dp_nom(displayUnit = "Pa") = dp_nom_UsersValve, Tin_start(displayUnit = "K") = 60 + 273.15, pin_start = 200000) annotation (
        Placement(transformation(extent = {{4, -4}, {-4, 4}}, rotation = -90, origin = {70, 63})));
      Plants.Thermal.Systems.ConnectorTypeI connectorTypeI annotation (
        Placement(transformation(extent = {{-36, 45}, {0, 81}})));
      Plants.Thermal.Systems.ConnectorTypeI connectorTypeI1 annotation (
        Placement(transformation(extent = {{21, 45}, {57, 81}})));
      Plants.Thermal.Systems.ConnectorTypeI connectorTypeI2 annotation (
        Placement(transformation(extent = {{84, 45}, {120, 81}})));
      Plants.Thermal.Systems.ConnectorTypeI connectorTypeI3 annotation (
        Placement(transformation(extent = {{138, 45}, {174, 81}})));
      Plants.Thermal.Systems.ConnectorTypeI connectorTypeI4 annotation (
        Placement(transformation(extent = {{-149, -8}, {-113, 28}})));
      Plants.Thermal.Systems.ConnectorTypeI connectorTypeI5 annotation (
        Placement(transformation(extent = {{-95, -8}, {-59, 28}})));
    equation
      connect(EX701.inhot, connectorTypeI.outletComp) annotation (
        Line(points={{-26.64,-29.3},{-26.64,9},{-27,9},{-27,42.48}},          color = {140, 56, 54}, thickness = 0.5));
      connect(EX701.outhot, connectorTypeI.inletComp) annotation (
        Line(points={{-8.82,-29.3},{-8.82,42.66}},      color = {140, 56, 54}, thickness = 0.5));
      connect(S900.inletcold, connectorTypeI.outletCold) annotation (
        Line(points = {{-84.3, 70.02}, {-61.41, 70.02}, {-61.41, 70.2}, {-38.52, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI.inletCold, connectorTypeI1.outletCold) annotation (
        Line(points = {{2.52, 70.2}, {18.48, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI.outletHot, connectorTypeI1.inletHot) annotation (
        Line(points = {{2.52, 55.8}, {9.41, 55.8}, {9.41, 55.8}, {18.48, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(S900.outlethot, connectorTypeI.inletHot) annotation (
        Line(points = {{-84.3, 55.98}, {-65, 55.98}, {-65, 55.8}, {-38.52, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI1.inletComp, EX711.outhot) annotation (
        Line(points={{48.18,42.66},{48.18,-29.3}},      color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI1.outletComp, EX711.inhot) annotation (
        Line(points={{30,42.48},{31,42.48},{31,-29.3},{30.36,-29.3}},          color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI1.outletHot, connectorTypeI2.inletHot) annotation (
        Line(points = {{59.52, 55.8}, {81.48, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI1.inletCold, connectorTypeI2.outletCold) annotation (
        Line(points = {{59.52, 70.2}, {81.48, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.inlet, connectorTypeI2.inletHot) annotation (
        Line(points = {{70, 59}, {70, 55.8}, {81.48, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FCVC01.outlet, connectorTypeI2.outletCold) annotation (
        Line(points = {{70, 67}, {70, 70.2}, {81.48, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI3.outletCold, connectorTypeI2.inletCold) annotation (
        Line(points = {{135.48, 70.2}, {122.52, 70.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI3.inletHot, connectorTypeI2.outletHot) annotation (
        Line(points = {{135.48, 55.8}, {122.52, 55.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI3.outletHot, FCVC02.inlet) annotation (
        Line(points = {{176.52, 55.8}, {190, 55.8}, {190, 59}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI3.inletCold, FCVC02.outlet) annotation (
        Line(points = {{176.52, 70.2}, {190, 70.2}, {190, 67}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI2.outletComp, EX721.inhot) annotation (
        Line(points={{93,42.48},{92,42.48},{92,-14},{92.36,-14},{92.36,-29.3}},            color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI2.inletComp, EX721.outhot) annotation (
        Line(points={{111.18,42.66},{110.18,42.66},{110.18,-29.3}},        color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI3.outletComp, EX731.inhot) annotation (
        Line(points={{147,42.48},{147,11.09},{147.36,11.09},{147.36,-29.3}},          color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI3.inletComp, EX731.outhot) annotation (
        Line(points={{165.18,42.66},{165.18,-29.3}},      color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI5.outletCold, connectorTypeI4.inletCold) annotation (
        Line(points = {{-97.52, 17.2}, {-110.48, 17.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI5.inletComp, S100.outlet) annotation (
        Line(points = {{-67.82, -10.34}, {-67.82, -20}, {-69.62, -20}, {-69.62, -29.3}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI4.inletComp, S400.outlet) annotation (
        Line(points = {{-121.82, -10.34}, {-121.82, -20}, {-123.62, -20}, {-123.62, -28.3}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI4.outletComp, S400.inlet) annotation (
        Line(points = {{-140, -10.52}, {-140, -20.41}, {-138.02, -20.41}, {-138.02, -28.3}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI4.outletHot, connectorTypeI5.inletHot) annotation (
        Line(points = {{-110.48, 2.8}, {-97.52, 2.8}}, color = {140, 56, 54}, thickness = 0.5));
      connect(FV933.outlet, connectorTypeI5.inletCold) annotation (
        Line(points = {{-48, 14}, {-48, 17.2}, {-56.48, 17.2}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI5.outletHot, FV933.inlet) annotation (
        Line(points = {{-56.48, 2.8}, {-48, 2.8}, {-48, 6}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI5.outletComp, S100.inlet) annotation (
        Line(points = {{-86, -10.52}, {-86, -20}, {-84.02, -20}, {-84.02, -29.3}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI4.outletCold, S900.inlethot) annotation (
        Line(points = {{-151.52, 17.2}, {-159, 17.2}, {-159, 55.98}, {-125.7, 55.98}}, color = {140, 56, 54}, thickness = 0.5));
      connect(connectorTypeI4.inletHot, S900.outletcold) annotation (
        Line(points = {{-151.52, 2.8}, {-167, 2.8}, {-167, 70.02}, {-125.7, 70.02}}, color = {140, 56, 54}, thickness = 0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -200}, {200, 200}}, grid = {1, 1})));
    end CentralizedSystemSimplifiedLoadSimplifiedI;

    partial model CentralisedSystem_GB "System with only Gas Boiler Systemm as source of heat"
      extends BaseClass.CentralisedNetworkBaseII(Tout_start_S9 = T_start_hot, Tin_start_S9 = T_start_cold);
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
      H2GasFacility.Sources.SourcePressure sourceGas(
        redeclare model Medium = Gas,
        X0=X_gas,
        R=1e-3,
        computeEnergyVariables=true) annotation (Placement(transformation(
            extent={{14,-14},{-14,14}},
            rotation=-90,
            origin={-250,-376})));
      Plants.Thermal.Systems.GasBoiler S100(
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
      ElectricNetwork.Sources.SourceVoltage sourceVoltage annotation (Placement(transformation(extent={{-16,-16},{16,16}},
            rotation=90,
            origin={-400,-470})));
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
      connect(S100.inletFuel, sourceGas.outlet) annotation (Line(
          points={{-250,-335.04},{-250,-362}},
          color={182,109,49},
          thickness=0.5));
      connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (Line(
          points={{-232,-196},{-232,45},{-235.75,45},{-235.75,44.75},{-257.5,44.75}},
          color={140,56,54},
          thickness=0.5));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CentralisedSystem_GB;

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
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin={-354,-16})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-318,-16})));
      Plants.Thermal.Systems.ElectricBoiler S400(
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

    partial model CentralisedSystem_GBEBCHP
      extends CentralisedSystem_GBEB;
      parameter DistrictHeatingNetwork.Types.Length Di_S5 = 39e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3;
      final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5 = q_m3h_S5_Source*990/3600;
      parameter Real q_m3h_S5_Source = 4;
      final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*990/3600;
      parameter Real q_m3h_S5_User = 4;
      parameter Real P501omega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
      parameter Real P501qm3h[:, :] = [0, 8; 100, 8];
      parameter Real Pchpomega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
      parameter Real Pchpqm3h[:, :] = [0, 3.94; 100, 3.94];
      parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5 = 2e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5 = 1.9e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5 = 80 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5 = 69 + 273.15;
      parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5 = 1.69e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5 = 2.5e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5 = 70 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5 = 75 + 273.15;
      parameter DistrictHeatingNetwork.Types.Power PeCHP[:, :] = [0, 30e3; 100, 30e3];
      parameter Real FCVchptheta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

      Plants.Thermal.Systems.CHP S500(
        n=n,
        Tin_low_start=Tin_Source_start_S5,
        Tout_low_start=Tout_Source_start_S5,
        Tin_high_start=Tin_User_start_S5,
        Tout_high_start=Tout_User_start_S5,
        Pel_SP=PeCHP) annotation (Placement(transformation(extent={{-568,-330},{-482,-244}})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_hot(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.04e5,
        Tin_start=Tout_User_start_S5,
        Tout_start=Tout_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_User,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-506,-213})));
      DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange2(D_i=51e-3, D_o=Di_S5)    annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-506,-182})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_cold(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.02e5,
        Tin_start=Tin_User_start_S5,
        Tout_start=Tin_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_User,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-542,-213})));
      DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange3(D_i=51e-3, D_o=Di_S5)     annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-542,-182})));
    equation
      connect(PL_S500_rCD_hot.outlet,suddenAreaChange2. outlet) annotation (Line(
          points={{-506,-203},{-506,-192}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange3.outlet,PL_S500_rCD_cold. inlet) annotation (Line(
          points={{-542,-192},{-542,-203}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S500_rCD_cold.outlet,S500. inlet) annotation (Line(
          points={{-542,-223},{-542,-230.275},{-541.77,-230.275},{-541.77,-237.55}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S500_rCD_hot.inlet,S500. outlet) annotation (Line(
          points={{-506,-223},{-506,-230.275},{-507.37,-230.275},{-507.37,-237.55}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange3.inlet, rackCD_Cold_S300_S300.inlet) annotation (Line(
          points={{-542,-172},{-542,-26},{-502,-26},{-502,5.25},{-470,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange2.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
          points={{-506,-172},{-508,-172},{-508,-46},{-488,-46},{-488,45},{-500,45}},
          color={140,56,54},
          thickness=0.5));
      connect(S500.inletFuel, sourceGas.outlet) annotation (Line(
          points={{-525,-336.88},{-525,-352},{-250,-352},{-250,-362}},
          color={182,109,49},
          thickness=0.5));
    end CentralisedSystem_GBEBCHP;

    partial model CentralisedSystem_GB_III "System with only Gas Boiler Systemm as source of heat"
      extends BaseClass.CentralisedNetworkBaseIII(Tout_start_S9 = T_start_hot, Tin_start_S9 = T_start_cold);
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
      Plants.Thermal.Systems.GasBoiler S100(
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
      FMUExport.Interfaces.ControlSignalBus controlSignalBus annotation (Placement(transformation(extent={{-408,330},{-270,468}}),
                                                                                                                               iconTransformation(extent={{-22,80},{18,120}})));
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

    model CentralisedSystem_GBEB_III
      extends CentralisedSystem_GB_III;
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
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tin_start_S4, pin_start = pin_start_S4, q_m3h_start = q_m3h_S4) "On-Off valve connecting inlet S400 & S900 " annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = -90, origin={-354,-16})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(redeclare model Medium = WaterHot, Kv = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv, Tin_start = Tout_start_S4, pin_start = pout_start_S4, q_m3h_start = q_m3h_S4) annotation (
        Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 90, origin={-318,-16})));
      Plants.Thermal.Systems.ElectricBoiler S400(
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
      Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true) annotation (Placement(transformation(extent={{-386,-26},{-366,-6}})));
      Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=true) annotation (Placement(transformation(extent={{-282,-26},{-302,-6}})));
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
      connect(S400.inletPower, electricPortInlet) annotation (Line(
          points={{-384.4,-148},{-432,-148},{-432,-490}},
          color={56,93,138},
          thickness=1));
      connect(controlSignalBus.omegaP401, S400.omega) annotation (Line(
          points={{-339,399},{-339,300},{-400,300},{-400,-95.2},{-384.4,-95.2}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.thetaFCV401, S400.theta) annotation (Line(
          points={{-339,399},{-339,306},{-404,306},{-404,-104},{-384.4,-104}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.ToutEB401, S400.Toutset) annotation (Line(
          points={{-339,399},{-339,312},{-408,312},{-408,-112.8},{-384.4,-112.8}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.statusEB401, S400.status) annotation (Line(
          points={{-339,399},{-339,320},{-412,320},{-412,-121.6},{-384.4,-121.6}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(booleanExpression.y, FV401.u) annotation (Line(points={{-365,-16},{-357.2,-16}}, color={255,0,255}));
      connect(booleanExpression1.y, FV402.u) annotation (Line(points={{-303,-16},{-314.8,-16}}, color={255,0,255}));
    end CentralisedSystem_GBEB_III;

    model CentralisedSystem_GBEBCHP_III
      extends CentralisedSystem_GBEB_III;
      parameter DistrictHeatingNetwork.Types.Length Di_S5 = 39e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S5 = 1.5e-3;
      final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5 = q_m3h_S5_Source*990/3600;
      parameter Real q_m3h_S5_Source = 4;
      final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5 = q_m3h_S5_User*990/3600;
      parameter Real q_m3h_S5_User = 4;
      parameter Real P501omega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
      parameter Real P501qm3h[:, :] = [0, 8; 100, 8];
      parameter Real Pchpomega[:, :] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
      parameter Real Pchpqm3h[:, :] = [0, 3.94; 100, 3.94];
      parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5 = 2e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5 = 1.9e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5 = 80 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5 = 69 + 273.15;
      parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5 = 1.69e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5 = 2.5e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5 = 70 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5 = 75 + 273.15;
      parameter DistrictHeatingNetwork.Types.Power PeCHP[:, :] = [0, 30e3; 100, 30e3];
      parameter Real FCVchptheta[:, :] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

      Plants.Thermal.Systems.CHP S500(
        n=n,
        Tin_low_start=Tin_Source_start_S5,
        Tout_low_start=Tout_Source_start_S5,
        Tin_high_start=Tin_User_start_S5,
        Tout_high_start=Tout_User_start_S5,
        Pel_SP=PeCHP) annotation (Placement(transformation(extent={{-568,-330},{-482,-244}})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_hot(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.04e5,
        Tin_start=Tout_User_start_S5,
        Tout_start=Tout_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_User,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-506,-213})));
      DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange2(D_i=51e-3, D_o=Di_S5)    annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-506,-182})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S500_rCD_cold(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.02e5,
        Tin_start=Tin_User_start_S5,
        Tout_start=Tin_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_User,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-542,-213})));
      DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange3(D_i=51e-3, D_o=Di_S5)     annotation (
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = -90, origin={-542,-182})));
      Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(extent={{-656,-276},{-636,-256}})));
    equation
      connect(PL_S500_rCD_hot.outlet,suddenAreaChange2. outlet) annotation (Line(
          points={{-506,-203},{-506,-192}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange3.outlet,PL_S500_rCD_cold. inlet) annotation (Line(
          points={{-542,-192},{-542,-203}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S500_rCD_cold.outlet,S500. inlet) annotation (Line(
          points={{-542,-223},{-542,-230.275},{-541.77,-230.275},{-541.77,-237.55}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S500_rCD_hot.inlet,S500. outlet) annotation (Line(
          points={{-506,-223},{-506,-230.275},{-507.37,-230.275},{-507.37,-237.55}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange3.inlet, rackCD_Cold_S300_S300.inlet) annotation (Line(
          points={{-542,-172},{-542,-26},{-502,-26},{-502,5.25},{-470,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange2.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
          points={{-506,-172},{-508,-172},{-508,-46},{-488,-46},{-488,45},{-500,45}},
          color={140,56,54},
          thickness=0.5));
      connect(S500.inletFuel, inletGas) annotation (Line(
          points={{-525,-336.88},{-525,-350},{-250,-350},{-250,-366}},
          color={182,109,49},
          thickness=0.5));
      connect(controlSignalBus.omegaP501, S500.omega) annotation (Line(
          points={{-339,399},{-339,346},{-586,346},{-586,-256.9},{-572.3,-256.9}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.ToutCHP501, S500.Toutset) annotation (Line(
          points={{-339,399},{-339,346},{-598,346},{-598,-274.1},{-572.3,-274.1}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(const.y, S500.theta) annotation (Line(points={{-635,-266},{-603.65,-266},{-603.65,-265.5},{-572.3,-265.5}}, color={0,0,127}));
      connect(controlSignalBus.statusCHP501, S500.status) annotation (Line(
          points={{-339,399},{-339,354},{-602,354},{-602,-282.7},{-572.3,-282.7}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.PtCHP501, S500.Pelset) annotation (Line(
          points={{-339,399},{-339,358},{-606,358},{-606,-291.3},{-572.3,-291.3}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.omegaP501, S500.m_flow_CHP) annotation (Line(
          points={{-339,399},{-339,358},{-610,358},{-610,-299.9},{-572.3,-299.9}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(S500.outletPower, electricPortInlet) annotation (Line(
          points={{-572.3,-311.94},{-594,-311.94},{-594,-440},{-432,-440},{-432,-490}},
          color={56,93,138},
          thickness=1));
    end CentralisedSystem_GBEBCHP_III;

    model CentralisedSystem_GBEBCHPTES_III
      extends CentralisedSystem_GBEBCHP_III;

      Plants.Thermal.Systems.TES S200 annotation (Placement(transformation(extent={{-842,-162},{-756,-76}})));
    equation
      connect(S200.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
          points={{-781.37,-69.55},{-781.37,-20},{-692,-20},{-692,44},{-690,44},{-690,44.75},{-727,44.75}},
          color={140,56,54},
          thickness=0.5));
      connect(S200.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
          points={{-815.77,-69.55},{-815.77,-12},{-704,-12},{-704,4.75},{-692,4.75},{-692,5.25},{-668,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(controlSignalBus.thetaFCV201, S200.theta)
        annotation (Line(
          points={{-339,399},{-892,399},{-892,-97.5},{-846.3,-97.5}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.statusS200, S200.status)
        annotation (Line(
          points={{-339,399},{-898,399},{-898,-114.7},{-846.3,-114.7}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
      connect(controlSignalBus.omegaP201, S200.omega)
        annotation (Line(
          points={{-339,399},{-888,399},{-888,-88.9},{-846.3,-88.9}},
          color={255,204,51},
          thickness=0.5), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}},
          horizontalAlignment=TextAlignment.Right));
    end CentralisedSystem_GBEBCHPTES_III;
  end Centralised;
end Configurations;
