within MultiEnergySystem.TestFacility.DHTF.Subsystems.Load;
model CoolingSingleLoadPowerControl "S900 - Load model including a thermal power control loop"
  extends CoolingSingleLoadBase;

  //-------------------------------
  // Controllers' parameters
  //-------------------------------
  parameter Real Kp_TT7X1 = -0.001 "proportional gain for temperature controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Ti_TT7X1 = 40 "integral time for temperature controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Kp_PtEX7X1 = 0.113 "proportional gain for thermal power controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Ti_PtEX7X1 = 0.268 "integral time for thermal power controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real Ki_PtEX7X1 = 1 "integral gain for thermal power controller" annotation(Dialog(tab = "Controllers", group="Controller Parameters"));
  parameter Real y_start_PI_TT(min = 0, max = 1) = 0.5 "Nominal output" annotation(Dialog(tab = "Controllers", group="Initialization"));
  parameter Real y_start_PI_Pt(min = 0, max = 1) = 0.5 "Nominal output" annotation(Dialog(tab = "Controllers", group="Initialization"));
  parameter Real y_start_I_m_flow(min = 0, max = 2) = 0.5 "Nominal output" annotation(Dialog(tab = "Controllers", group="Initialization"));
  parameter Modelica.Blocks.Types.Init initType_PI = Modelica.Blocks.Types.Init.InitialOutput "Initialization of PI integral" annotation(Evaluate=true, Dialog(tab = "Controllers", group="Initialization"));
  parameter Modelica.Blocks.Types.Init initType_I = Modelica.Blocks.Types.Init.InitialOutput "Initialization of PI integral" annotation(Evaluate=true, Dialog(tab = "Controllers", group="Initialization"));

  Modelica.Blocks.Interfaces.RealInput EX7X1Pt_SP "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{93.5,28.5},{83.5,38.5}}),
      iconTransformation(origin={-110,70}, extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Interfaces.RealInput TT7X1_SP "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{-70,-104},{-60,-94}}),
      iconTransformation(origin={-110,50},  extent={{-10,-10},{10,10}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT7X1(
    Kp=Kp_TT7X1,
    Ti=Ti_TT7X1,
    Umax=1,
    Umin=0,
    y_start=y_start_PI_TT, initType = initType_PI)
    annotation (Placement(transformation(extent={{-57,-113.5},{-37,-93.5}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_EX7X1Pt(
    Kp=Kp_PtEX7X1,
    Ti=Ti_PtEX7X1,
    Umax=1,
    Umin=0,
    y_start=y_start_PI_Pt, initType = initType_PI)
    annotation (Placement(transformation(extent={{55,47.5},{35,27.5}})));
  DistrictHeatingNetwork.Controllers.AWIContinuous I_EX7X1Pt(Ki=Ki_PtEX7X1, Umax=1.5, initType = initType_I, y_start = y_start_I_m_flow)
    annotation (Placement(transformation(extent={{81.5,48},{61.5,28}})));
  Modelica.Blocks.Sources.RealExpression measPower(y=EX7X1.Pt) annotation (Placement(transformation(extent={{61,48},{81,68}})));
equation

  connect(TT7X1_SP, PI_TT7X1.REF) annotation (Line(points={{-65,-99},{-60,-99},{-60,-99.5},
          {-55,-99.5}}, color={0,0,127}));
  connect(I_EX7X1Pt.REF, EX7X1Pt_SP)  annotation (Line(points={{79.5,34},{84,34},{84,33.5},{88.5,33.5}},
                                                     color={0,0,127}));
  connect(PI_TT7X1.controlAction, TCV7X1.opening) annotation (Line(points={{-36,-103.5},{-28,-103.5}}, color={0,0,127}));
  connect(PI_TT7X1.FeedBack, TT7X1_TT) annotation (Line(points={{-55,-107.5},{-98,-107.5},{-98,118},{31.5,118},{31.5,112.5},{92.5,112.5},{92.5,60},{110,60}}, color={0,0,127}));
  connect(PI_EX7X1Pt.controlAction, FCV7X1.opening) annotation (Line(points={{34,37.5},{28,37.5}}, color={0,0,127}));
  connect(I_EX7X1Pt.controlAction, PI_EX7X1Pt.REF) annotation (Line(points={{60.5,38},{58,38},{58,33.5},{53,33.5}}, color={0,0,127}));
  connect(measPower.y, I_EX7X1Pt.FeedBack) annotation (Line(points={{82,58},{85.5,58},{85.5,42},{79.5,42}}, color={0,0,127}));
  connect(PI_EX7X1Pt.FeedBack, FT7X1_FT) annotation (Line(points={{53,41.5},{58,41.5},{58,87},{33,87},{33,111},{91,111},{91,45},{110,45}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,120}}, grid={0.5,0.5})));
end CoolingSingleLoadPowerControl;
