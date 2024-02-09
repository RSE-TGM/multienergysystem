within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model E700Test "HX70X test with real data"
  extends Modelica.Icons.Example;
  replaceable model Medium =
      DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity;

  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_HX2 = 11534.5;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_E301avg = 5841.12;
  parameter Integer n_E301 = 5;
  parameter SI.CoefficientOfHeatTransfer gamma_cold_E301 = 11682.24;
  parameter SI.CoefficientOfHeatTransfer gamma_hot_E301 = gamma_cold_E301*gammahotovercold_factor;
  parameter SI.CoefficientOfHeatTransfer U_E301 = BPHE.E301.Unom;
  parameter Integer gammahotovercold_factor = 1;
  parameter SI.CoefficientOfHeatTransfer U_E501 = BPHE.E501.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E601 = BPHE.E601.Unom;
  parameter SI.CoefficientOfHeatTransfer U_E701 = BPHE.E701.Unom;
  parameter Real CorrectFactorHot = 1;
  parameter Real CorrectFactorCold = 1;

  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Temperatures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Pressures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Pressures.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Flows = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Flow.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Actuators = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Actuators.mat") "File name of matrix"  annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));

  parameter String matrixTT701 = "TT701" "Matrix name in file";
  parameter String matrixTT702 = "TT702" "Matrix name in file";
  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT704 = "TT704" "Matrix name in file";
  parameter String matrixFT701 = "FT701" "Matrix name in file";
  parameter String matrixFT771 = "FT771" "Matrix name in file";
  parameter String matrixPT701 = "PT701" "Matrix name in file";
  parameter String matrixthetaFCV701 = "theta_FCV701" "Matrix name in file";
  parameter String timenoscale = "time" "Matrix name in file";

  parameter Real EX701_q_m3h_hot = 2.5;

  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT701) "Dimension of matrix";
  final parameter Real t[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,timenoscale,dim[1],dim[2]) "Matrix data";
  final parameter Real TT701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT702,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT703,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real TT704[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT704,dim[1],dim[2]) + 273.15*ones(dim[1],dim[2]) "Matrix data";
  final parameter Real FT701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT701,dim[1],dim[2])*1000/3600 "Matrix data";
  final parameter Real PT701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Pressures,matrixPT701,dim[1],dim[2])*1e5 "Matrix data";
  final parameter Real thetaFCV701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Actuators,matrixthetaFCV701,dim[1],dim[2]) "Matrix data";
  //final parameter Real FT771[:,:] = (4188/4178)*(abs(TT701 - TT702).*FT701./(abs(TT703 - TT704)+1e-2*ones(dim[1],dim[2])));
  final parameter Real FT771[:,:] = Modelica.Utilities.Streams.readRealMatrix(Flows,matrixFT771,dim[1],dim[2])*1000/3600 "Matrix data";

  inner System system annotation (
    Placement(visible = true, transformation(origin={-90,90},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E701(redeclare
      model Medium =                                                                                               Medium, Di_cold = BPHE.E701.Di_cold, Di_hot = BPHE.E701.Di_hot, L_cold = BPHE.E701.L_cold, L_hot = BPHE.E701.L_hot, MWall = BPHE.E701.MWall, Stot_cold = BPHE.E701.Stot_cold, Stot_hot = BPHE.E701.Stot_hot, Tin_start_cold = BPHE.E701.Tin_start_cold, Tin_start_hot = BPHE.E701.Tin_start_hot, Tout_start_cold = BPHE.E701.Tout_start_cold, Tout_start_hot = BPHE.E701.Tout_start_hot, cpm_cold = BPHE.E701.cpm_cold, cpm_hot = BPHE.E701.cpm_hot, t_cold = BPHE.E701.t_cold, t_hot = BPHE.E701.t_hot, gamma_nom_cold = BPHE.E701.gamma_nom_cold, gamma_nom_hot = BPHE.E701.gamma_nom_hot, h_cold = BPHE.E701.h_cold, h_hot = BPHE.E701.h_hot, hin_start_cold = BPHE.E701.hin_start_cold, hin_start_hot = BPHE.E701.hin_start_hot, k_cold = BPHE.E701.k_cold, k_hot = BPHE.E701.k_hot, kc_cold = 1, kc_hot = 1, lambdam_cold = BPHE.E701.lambdam_cold, lambdam_hot = BPHE.E701.lambdam_hot, m_flow_start_cold = BPHE.E701.m_flow_start_cold, m_flow_start_hot = BPHE.E701.m_flow_start_hot,
    n=9,                                                                                                                                                                                                        nPipes_cold = BPHE.E701.nPipes_cold, nPipes_hot = BPHE.E701.nPipes_hot, nPlates = BPHE.E701.nPlates, pin_start_cold = BPHE.E701.pin_start_cold, pin_start_hot = BPHE.E701.pin_start_hot, pout_start_cold = BPHE.E701.pout_start_cold, pout_start_hot = BPHE.E701.pout_start_hot, rho_nom_cold = (BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2, rho_nom_hot = (BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2, rhom_cold(displayUnit = "kg/m3") = BPHE.E701.rhom_cold, rhom_hot(displayUnit = "g/cm3") = BPHE.E701.rhom_hot, thermalInertia = false, u_nom_cold = BPHE.E701.u_nom_cold, u_nom_hot = BPHE.E701.u_nom_hot) annotation (
    Placement(visible = true, transformation(origin={-1,-6},     extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  Sources.SourceMassFlow sourceHot_mflow(
    use_in_m_flow=true,
    use_in_T=true,
    p0=BPHE.E701.pin_start_hot,
    T0=BPHE.E701.Tin_start_hot,
    m_flow0=BPHE.E701.m_flow_start_hot)
    annotation (Placement(transformation(extent={{70,18},{50,38}})));
  Sources.SourceMassFlow sourceCold_mflow(
    use_in_m_flow=true,
    use_in_T=true,
    p0=BPHE.E701.pin_start_cold,
    T0=BPHE.E701.Tin_start_cold,
    m_flow0=0.32)
    annotation (Placement(transformation(extent={{-70,-52},{-50,-32}})));
  Sources.SinkPressure sinkHot_p(
    use_in_p0=true,              p0=BPHE.E701.pout_start_hot, T0=BPHE.E701.Tout_start_hot)
    annotation (Placement(transformation(extent={{68,-50},{88,-30}})));
  Sources.SinkPressure sinkCold_p(
    use_in_p0=false,              p0=BPHE.E701.pout_start_cold, T0=BPHE.E701.Tout_start_cold)
    annotation (Placement(transformation(extent={{-50,18},{-70,38}})));
  Modelica.Blocks.Sources.TimeTable inhot_T(table=[t,TT702])
    annotation (Placement(transformation(extent={{100,70},{80,90}})));
  Modelica.Blocks.Sources.TimeTable incold_T(table=[t,TT703])
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV701(
    allowFlowReversal=system.allowFlowReversal,
    Kv=Valve.FCV701.Kv,
    dp_nom(displayUnit="Pa") = Valve.FCV701.dp_nom,
    Tin_start(displayUnit="K") = BPHE.E701.Tout_start_hot,
    pin_start=BPHE.E701.pout_start_hot,
    q_m3h_start=EX701_q_m3h_hot)
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={50,-40})));
  Modelica.Blocks.Sources.TimeTable outhot_p(table=[t,PT701])
    annotation (Placement(transformation(extent={{100,-30},{80,-10}})));
  Modelica.Blocks.Sources.TimeTable thetavalve(table=[t,thetaFCV701])
    annotation (Placement(transformation(extent={{74,-10},{54,10}})));
  Modelica.Blocks.Sources.TimeTable hot_m_flow(table=[t,FT701])
    annotation (Placement(transformation(extent={{100,40},{80,60}})));
  Modelica.Blocks.Sources.TimeTable cold_m_flow(table=[t,FT771])
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
equation

  connect(sourceCold_mflow.outlet, E701.incold) annotation (Line(
      points={{-50,-42},{-34,-42},{-34,-41},{-16.5,-41}},
      color={140,56,54},
      thickness=0.5));
  connect(sourceHot_mflow.outlet, E701.inhot) annotation (Line(
      points={{50,28},{34,28},{34,29},{14.5,29}},
      color={140,56,54},
      thickness=0.5));
  connect(inhot_T.y, sourceHot_mflow.in_T)
    annotation (Line(points={{79,80},{60,80},{60,33}},   color={0,0,127}));
  connect(E701.outhot, FCV701.inlet) annotation (Line(
      points={{14.5,-41},{27.25,-41},{27.25,-40},{40,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV701.outlet, sinkHot_p.inlet) annotation (Line(
      points={{60,-40},{68,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(E701.outcold, sinkCold_p.inlet) annotation (Line(
      points={{-16.5,29},{-36.25,29},{-36.25,28},{-50,28}},
      color={140,56,54},
      thickness=0.5));
  connect(outhot_p.y, sinkHot_p.in_p0)
    annotation (Line(points={{79,-20},{74,-20},{74,-31.6}}, color={0,0,127}));
  connect(thetavalve.y, FCV701.opening)
    annotation (Line(points={{53,0},{50,0},{50,-32}},   color={0,0,127}));
  connect(hot_m_flow.y, sourceHot_mflow.in_m_flow)
    annotation (Line(points={{79,50},{66,50},{66,33}}, color={0,0,127}));
  connect(cold_m_flow.y, sourceCold_mflow.in_m_flow) annotation (Line(points={{-79,-20},
          {-66,-20},{-66,-37}},                          color={0,0,127}));
  connect(incold_T.y, sourceCold_mflow.in_T)
    annotation (Line(points={{-79,10},{-60,10},{-60,-37}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = true, extent={{-100,-100},{100,
            100}})),
    Documentation(info = "<html><head></head><body>The present test model consider the 04 types of heat exchangers which are located in the heating network of RSE.&nbsp;<div><br></div><div>The tests have been done considering design conditions only and a constant heat transfer coefficient model for all heat exchangers. This may change in case of other future tests.</div><div><br></div><div>The nominal data considered for these heat exchangers can be found in the package DisctricHeatingNetwork/Data/BPHEData</div></body></html>"),
  experiment(
      StopTime=17000,
      Interval=0.002,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end E700Test;
