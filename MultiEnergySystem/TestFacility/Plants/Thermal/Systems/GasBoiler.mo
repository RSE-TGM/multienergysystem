within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model GasBoiler "System 100"
  extends DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;

  constant Real pi = Modelica.Constants.pi;

  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1 = 65 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1 = 80 + 273.15;
  parameter DistrictHeatingNetwork.Types.Velocity u_nom = 5;

  final parameter DistrictHeatingNetwork.Types.Length Di_S1 = 51e-3;
  final parameter DistrictHeatingNetwork.Types.Length t_S1 = 1.5e-3;

  final parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
  final parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
  final parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
  final parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
  final parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
  final parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
  final parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
  final parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
  final parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold=12.25;
  final parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
  final parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot=10.85;
  final parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";

  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1 = q_m3h_S1*985/3600;
  parameter Real q_m3h_S1(unit = "m3/h") = 9;
  parameter Real P101omega[:,:] = [0, 2*pi*50; 100, 2*pi*50];
  parameter Real P101qm3h[:,:] = [0, 7.5; 100, 7.5];
  parameter Real FCV101theta[:,:] = [0, 1];
  parameter Real GB101_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

  parameter DistrictHeatingNetwork.Types.Power Pnom = 147.6e3;
  parameter DistrictHeatingNetwork.Types.Power Pmaxnom = 147.6e3*0.8;
  parameter DistrictHeatingNetwork.Types.Power Pminnom = 147.6e3*0.2;
  parameter DistrictHeatingNetwork.Types.Length h = 1.2*0.93;
  parameter DistrictHeatingNetwork.Types.Length D = 0.64;

  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (
    Placement(visible = true, transformation(origin={-20,110},extent={{-10,-10},{10,10}},
                                                                                     rotation = 0), iconTransformation(origin={-25,80},     extent={{-5,-5},
            {5,5}},                                                                                                                                                                       rotation = 0)));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin={20,110},  extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={25,80},     extent={{-5,-5},
            {5,5}},                                                                                                                                                                    rotation = 0)));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P101(
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start,
    Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start,
    a=DistrictHeatingNetwork.Data.PumpData.P101.a,
    b=DistrictHeatingNetwork.Data.PumpData.P101.b,
    m_flow_start=m_flow_S1,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P101.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P101.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P101.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P101.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P101.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P101.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start,
    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom,
    headnom=DistrictHeatingNetwork.Data.PumpData.P101.headnom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P101.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P101.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h,
    use_in_omega=true)                                                      annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={20,5})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
    rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom,
    q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h,
    Tin_start(displayUnit="K") = Tout_start_S1,
    pin_start=pout_start_S1,
    q_m3h_start=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,76})));
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB(
    h=h,
    D=D,
    Pmaxnom=Pmaxnom,
    Tin_start=Tin_start_S1,
    pin_start=pin_start_S1,
    pout_start=pout_start_S1,
    Tout_start=Tout_start_S1,
    Pnimnom=Pminnom,
    Pnom=Pnom,
    HH=55.5e6) annotation (Placement(visible=true, transformation(
        origin={0,-84},
        extent={{-36,-36},{36,36}},
        rotation=0)));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_GB101_P101(
    L=L_GB101_P101,
    h=h_GB101_P101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,-24})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_FT101_GB101(
    L=L_FT101_GB101,
    h=h_FT101_GB101,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,-24})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_TT101_FT101(
    L=L_TT101_FT101,
    h=h_TT101_FT101,
    t=t_S1,
    pin_start=pin_start_S1,
    Tin_start=Tin_start_S1,
    Tout_start=Tin_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,6})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV PL_S100_P101_FCV101(
    L=L_P101_FCV101,
    h=h_P101_FCV101,
    t=t_S1,
    pin_start=pout_start_S1,
    Tin_start=Tout_start_S1,
    Tout_start=Tout_start_S1,
    Di=Di_S1,
    q_m3h_start=q_m3h_S1,
    n=n,
    u_nom=u_nom,
    hctype=hctype) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={20,44})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTBoiler(T_start=Tin_start_S1, p_start=
        pin_start_S1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-16,44})));
equation
  connect(P101.inlet,PL_S100_GB101_P101. outlet) annotation (Line(
      points={{20,-4.6},{20,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_FT101_GB101.outlet, GB.inlet) annotation (Line(
      points={{-20,-34},{-20,-42},{-10.8,-42},{-10.8,-55.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_GB101_P101.inlet, GB.outlet) annotation (Line(
      points={{20,-34},{20,-42},{10.8,-42},{10.8,-55.2}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_P101_FCV101.inlet,P101. outlet) annotation (Line(
      points={{20,34},{20,14.6}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV101.inlet,PL_S100_P101_FCV101. outlet) annotation (Line(
      points={{20,66},{20,54}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_TT101_FT101.outlet, PL_S100_FT101_GB101.inlet)
    annotation (Line(
      points={{-20,-4},{-20,-14}},
      color={140,56,54},
      thickness=0.5));
  connect(Status, GB.heat_on) annotation (Line(points={{58,-30},{40,-30},{40,-130},{-48,-130},{-48,-105.6},
          {-28.8,-105.6}},                                                      color={255,0,255}));
  connect(FCV101.outlet, outlet)
    annotation (Line(
      points={{20,86},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S100_TT101_FT101.inlet, FTBoiler.outlet)
    annotation (Line(
      points={{-20,16},{-20,38}},
      color={140,56,54},
      thickness=0.5));
  connect(FTBoiler.inlet, inlet)
    annotation (Line(
      points={{-20,50},{-20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(FTBoiler.m_flow, m_flow)
    annotation (Line(points={{-10,37},{-10,28},{40,28},{40,30},{60,30}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(grid={1,1}),                graphics={Bitmap(
          extent={{-35,-29},{37,36}},
          imageSource=
              "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",

          fileName=
              "modelica://MultiEnergySystem/../../../Lavoro/6. Rapporti RdS/Figure/gasboilericon.png")}),
                                                                 Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}})));
end GasBoiler;
