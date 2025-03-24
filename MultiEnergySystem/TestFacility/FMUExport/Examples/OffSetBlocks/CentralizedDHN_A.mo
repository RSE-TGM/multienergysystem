within MultiEnergySystem.TestFacility.FMUExport.Examples.OffSetBlocks;
model CentralizedDHN_A
  parameter Boolean ForwardInit = false "True if forward, False if backward";
  //Input
  parameter Boolean fixomegaP401 = ForwardInit "True if forward, False if backward";
  // Output
  final parameter Boolean fixFT401 = not fixomegaP401;

  parameter DistrictHeatingNetwork.Types.MassFlowRate FT401_nom= TestFacility.Data.PumpData.P401.qnommax_inm3h*980/3600;
  parameter DistrictHeatingNetwork.Types.MassFlowRate FT401_des= 3.1  "Desired electric boiler mass flowrate" annotation (
    Dialog(tab = "Nominal and Desired values", group = "Mass Flow Rate"));
  parameter DistrictHeatingNetwork.Types.AngularVelocity omegaP401_nom = 2*Modelica.Constants.pi*50 "Nominal CO2 m.f.r. going through pump P5" annotation (
     Dialog(tab = "Nominal and Desired values", group = "Rotational speed"));


  Plants.Thermal.Systems.ElectricBoiler electricBoiler annotation (Placement(transformation(extent={{-36,-40},{-16,-20}})));
  Plants.Thermal.Systems.CirculationPump circulationPump annotation (Placement(transformation(extent={{-36,20},{-16,40}})));
  Loads.Thermal.Systems.CoolingSingleLoad coolingSingleLoad annotation (Placement(transformation(extent={{84,20},{104,40}})));
  DistrictHeatingNetwork.Sources.SourceMassFlow sourceMassFlow(
    p0=200000,
    T0=288.15,
    m_flow0=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-8})));
  DistrictHeatingNetwork.Sources.SinkPressure sinkPressure(T0=280.15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={78,-8})));
  inner System system annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.BooleanConstant EB401Status annotation (Placement(transformation(extent={{-66,-100},{-46,-80}})));
  MultiEnergySystem.TestFacility.FMUExport.OffSetBlocks.OutputOffset
                            FT401Offset(
    fixOutput=fixFT401,
    y_fixed=FT401_des,
    y_norm=FT401_nom) annotation (Placement(visible=true, transformation(
        origin={4,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  MultiEnergySystem.TestFacility.FMUExport.OffSetBlocks.InputOffset
                           omegaP401Offset(
    fixInput=fixomegaP401,
    u_norm=omegaP401_nom,
    u_start=omegaP401_nom) annotation (Placement(visible=true, transformation(
        origin={-56,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Step omegaP901(height=0, offset=2*3.14159*50) annotation (Placement(transformation(extent={{-76,40},{-56,60}})));
  Modelica.Blocks.Sources.Step thetaFCV901(height=0, offset=1) annotation (Placement(transformation(extent={{-76,10},{-56,30}})));
  Modelica.Blocks.Sources.Step thetaFCV401(height=0, offset=1) annotation (Placement(transformation(extent={{-92,-40},{-72,-20}})));
  Modelica.Blocks.Sources.Step ToutEB401(height=0, offset=80 + 273.15) annotation (Placement(transformation(extent={{-92,-68},{-72,-48}})));
  Modelica.Blocks.Sources.Step thetaFCV701(height=0, offset=1) annotation (Placement(transformation(extent={{44,20},{64,40}})));
  Interfaces.ControlSignalBus
                   controlSignalBus annotation (
    Placement(visible = true, transformation(origin={-159,-3},    extent = {{51, 41}, {-51, -41}}, rotation = -90), iconTransformation(origin = {-87, -1}, extent = {{31, 33}, {-31, -33}}, rotation = -90)));
  Interfaces.ControlSignalBus
                   processVariableBus annotation (
    Placement(visible = true, transformation(origin={152,-3},    extent = {{-51, -42}, {51, 42}}, rotation = -90), iconTransformation(origin = {88, 0}, extent = {{-30, -30}, {30, 30}}, rotation = -90)));
equation
  connect(electricBoiler.inlet, circulationPump.outletcold) annotation (Line(
      points={{-29.9,-18.5},{-29.9,18.5}},
      color={140,56,54},
      thickness=0.5));
  connect(electricBoiler.outlet, circulationPump.inlethot) annotation (Line(
      points={{-21.9,-18.5},{-21.9,13},{-22.1,13},{-22.1,18.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceMassFlow.outlet, coolingSingleLoad.incold) annotation (Line(
      points={{110,2},{98.9,2},{98.9,18.5}},
      color={140,56,54},
      thickness=0.5));
  connect(sinkPressure.inlet, coolingSingleLoad.outcold) annotation (Line(
      points={{78,2},{89.1,2},{89.1,18.5}},
      color={140,56,54},
      thickness=0.5));
  connect(circulationPump.outlethot, coolingSingleLoad.inhot) annotation (Line(
      points={{-22.1,41.5},{-22.1,48},{89.2,48},{89.2,41.5}},
      color={140,56,54},
      thickness=0.5));
  connect(circulationPump.inletcold, coolingSingleLoad.outhot) annotation (Line(
      points={{-29.9,41.5},{-29.9,52},{99.1,52},{99.1,41.5}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401Status.y, electricBoiler.status) annotation (Line(points={{-45,-90},{-42,-90},{-42,-29},{-37,-29}}, color={255,0,255}));
  connect(electricBoiler.m_flow_, FT401Offset.y) annotation (Line(points={{-15,-23},{-10,-23},{-10,-10},{-4,-10}},  color={0,0,127}));
  connect(omegaP401Offset.u, electricBoiler.omega) annotation (Line(points={{-47,-10},{-42,-10},{-42,-23},{-37,-23}}, color={0,0,127}));
  connect(omegaP901.y, circulationPump.omega) annotation (Line(points={{-55,50},{-44,50},{-44,37},{-37,37}}, color={0,0,127}));
  connect(thetaFCV901.y, circulationPump.theta) annotation (Line(points={{-55,20},{-42,20},{-42,35},{-37,35}}, color={0,0,127}));
  connect(thetaFCV401.y, electricBoiler.theta) annotation (Line(points={{-71,-30},{-56,-30},{-56,-25},{-37,-25}},  color={0,0,127}));
  connect(ToutEB401.y, electricBoiler.Toutset) annotation (Line(points={{-71,-58},{-46,-58},{-46,-27},{-37,-27}},  color={0,0,127}));
  connect(thetaFCV701.y, coolingSingleLoad.theta) annotation (Line(points={{65,30},{74,30},{74,37},{83,37}}, color={0,0,127}));
  connect(FT401Offset.deltaYnorm, processVariableBus.dout1)
    annotation (Line(points={{13,-10},{40,-10},{40,-42},{132,-42},{132,-12},{152,-12},{152,-3}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(controlSignalBus.din1, omegaP401Offset.deltaUnorm)
    annotation (Line(
      points={{-159,-3},{-72,-3},{-72,-10},{-64,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (                                                   Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,140}})), experiment(
      StopTime=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end CentralizedDHN_A;
