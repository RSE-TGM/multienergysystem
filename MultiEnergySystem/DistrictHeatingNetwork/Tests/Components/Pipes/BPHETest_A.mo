within MultiEnergySystem.DistrictHeatingNetwork.Tests.Components.Pipes;
model BPHETest_A "Test with real data"
  extends BPHETest(sourceHot_E701(use_in_p0=true), sinkHot_E701(use_in_m_flow=true,
        use_in_T=true));

  parameter Real inhotp[:,:] = [0, 2.8289046; 100, 2.8289046];
  parameter String Temperatures = Modelica.Utilities.Files.loadResource("C:\Users\muro\OneDrive - RSE S.p.A\Modelli e Simulazione\Acquisizione dati - Test Facility\Temperatures.mat") "File name of matrix"
    annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String matrixTT701 = "TT701" "Matrix name in file";
  parameter String matrixTT702 = "TT702" "Matrix name in file";
  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT704 = "TT704" "Matrix name in file";
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT701) "Dimension of matrix";
  final parameter Real TT701[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]) "Matrix data";
  final parameter Real TT702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT702,dim[1],dim[2]) "Matrix data";
  final parameter Real TT703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT704,dim[1],dim[2]) "Matrix data";
  final parameter Real TT704[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT704,dim[1],dim[2]) "Matrix data";


  Sources.SinkMassFlow                                          sinkCold_E1(
    T0=BPHE.E701.Tout_start_cold,
    m_flow0=BPHE.E701.m_flow_start_cold,
    p0=BPHE.E701.pout_start_cold,
    pin_start=BPHE.E701.pout_start_cold)                                                                                                                                                                                    annotation (
    Placement(visible = true, transformation(origin={427,33},    extent = {{13, -13}, {-13, 13}}, rotation = 0)));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E1(
    Di_cold=BPHE.E701.Di_cold,
    Di_hot=BPHE.E701.Di_hot,
    L_cold=BPHE.E701.L_cold,
    L_hot=BPHE.E701.L_hot,
    MWall=BPHE.E701.MWall,
    Stot_cold=BPHE.E701.Stot_cold,
    Stot_hot=BPHE.E701.Stot_hot,
    Tin_start_cold=BPHE.E701.Tin_start_cold,
    Tin_start_hot=BPHE.E701.Tin_start_hot,
    Tout_start_cold=BPHE.E701.Tout_start_cold,
    Tout_start_hot=BPHE.E701.Tout_start_hot,
    cpm_cold=BPHE.E701.cpm_cold,
    cpm_hot=BPHE.E701.cpm_hot,
    t_cold=BPHE.E701.t_cold,
    t_hot=BPHE.E701.t_hot,
    gamma_nom_cold=BPHE.E701.gamma_nom_cold,
    gamma_nom_hot=BPHE.E701.gamma_nom_hot,
    h_cold=BPHE.E701.h_cold,
    h_hot=BPHE.E701.h_hot,
    hin_start_cold=BPHE.E701.hin_start_cold,
    hin_start_hot=BPHE.E701.hin_start_hot,
    k_cold=BPHE.E701.k_cold,
    k_hot=BPHE.E701.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E701.lambdam_cold,
    lambdam_hot=BPHE.E701.lambdam_hot,
    m_flow_start_cold=BPHE.E701.m_flow_start_cold,
    m_flow_start_hot=BPHE.E701.m_flow_start_hot,
    n=7,
    nPipes_cold=BPHE.E701.nPipes_cold,
    nPipes_hot=BPHE.E701.nPipes_hot,
    nPlates=BPHE.E701.nPlates,
    pin_start_cold=BPHE.E701.pin_start_cold,
    pin_start_hot=BPHE.E701.pin_start_hot,
    pout_start_cold=BPHE.E701.pout_start_cold,
    pout_start_hot=BPHE.E701.pout_start_hot,
    rho_nom_cold=(BPHE.E701.rhoin_nom_cold + BPHE.E701.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E701.rhoin_nom_hot + BPHE.E701.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E701.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E701.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E701.u_nom_cold,
    u_nom_hot=BPHE.E701.u_nom_hot)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={485,-2},    extent = {{-31, -50}, {31, 50}}, rotation = 0)));
  Sources.SourcePressure                                          sourceCold_E1(T0=BPHE.E701.Tin_start_cold,
      p0=BPHE.E701.pin_start_cold)                                                                                                              annotation (
    Placement(visible = true, transformation(origin={428,-36},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sources.SinkMassFlow                                          sinkHot_E1(
    use_in_T=true,
    T0=BPHE.E701.Tout_start_hot,
    m_flow0=BPHE.E701.m_flow_start_hot,
    p0=BPHE.E701.pout_start_hot,
    pin_start=BPHE.E701.pout_start_hot)                                                                                                                                                                                annotation (
    Placement(visible = true, transformation(origin={549,-37},    extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Sources.SourcePressure                                          sourceHot_E1(T0=BPHE.E701.Tin_start_hot,
      p0=BPHE.E701.pin_start_hot)                                                                                                            annotation (
    Placement(visible = true, transformation(origin={548,34},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable inhot_p
    annotation (Placement(transformation(extent={{392,50},{372,70}})));
  Modelica.Blocks.Sources.TimeTable inhot_T
    annotation (Placement(transformation(extent={{580,-20},{560,0}})));
equation
  connect(sinkCold_E1.inlet, E1.outcold) annotation (Line(points={{440,33},{448,
          33},{448,34},{455.5,34},{455.5,33},{469.5,33}}, color={168,168,168}));
  connect(sourceCold_E1.outlet, E1.incold) annotation (Line(points={{438,-36},{454,
          -36},{454,-37},{469.5,-37}}, color={168,168,168}));
  connect(E1.inhot, sourceHot_E1.outlet) annotation (Line(
      points={{500.5,33},{519.25,33},{519.25,34},{538,34}},
      color={140,56,54},
      thickness=0.5));
  connect(E1.outhot, sinkHot_E1.inlet) annotation (Line(
      points={{500.5,-37},{536,-37}},
      color={140,56,54},
      thickness=0.5));
  connect(inhot_p.y, sourceHot_E701.in_p0)
    annotation (Line(points={{371,60},{364,60},{364,42.4}}, color={0,0,127}));
  connect(inhot_T.y, sinkHot_E1.in_T) annotation (Line(points={{559,-10},{549,
          -10},{549,-30.5}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-600,-100},{600,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}})));
end BPHETest_A;
