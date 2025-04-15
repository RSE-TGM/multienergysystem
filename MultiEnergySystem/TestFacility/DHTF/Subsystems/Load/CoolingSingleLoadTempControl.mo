within MultiEnergySystem.TestFacility.DHTF.Subsystems.Load;
model CoolingSingleLoadTempControl "S900 - Load model including temp control only"
  extends CoolingSingleLoadBase;

  //-------------------------------
  // Controllers' parameters
  //-------------------------------
  parameter Real Kp_TT7X1 = -0.0013715/10;
  parameter Real Ti_TT7X1 = 1.17885;
  parameter Real Kp_PtEX7X1 = 0.1128;
  parameter Real Ti_PtEX7X1 = 0.26795;
  parameter Real Ki_PtEX7X1 = 0.08;

  Modelica.Blocks.Interfaces.RealInput TT7X1_SP "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{-70,-104},{-60,-94}}),
      iconTransformation(origin={-110,-60}, extent={{-10,-10},{10,10}})));
  DistrictHeatingNetwork.Controllers.AWPIContinuous PI_TT7X1(
    Kp=Kp_TT7X1,
    Ti=Ti_TT7X1,
    Umax=1,
    Umin=0)
    annotation (Placement(transformation(extent={{-57,-113.5},{-37,-93.5}})));
  Modelica.Blocks.Interfaces.RealInput theta_FCV7X1 "Opening valve" annotation (Placement(
      visible=true,
      transformation(extent={{50,30},{35,45}}),
      iconTransformation(origin={-110,60}, extent={{-10,-10},{10,10}})));
equation

  connect(TT7X1_SP, PI_TT7X1.REF) annotation (Line(points={{-65,-99},{-60,-99},{-60,-99.5},
          {-55,-99.5}}, color={0,0,127}));
  connect(PI_TT7X1.controlAction, TCV7X1.opening) annotation (Line(points={{-36,-103.5},{-28,-103.5}}, color={0,0,127}));
  connect(TT7X1.T, PI_TT7X1.FeedBack) annotation (Line(points={{28.5,95},{31,95},{31,119.5},{-99,119.5},{-99,-107.5},{-55,-107.5}}, color={0,0,127}));
  connect(theta_FCV7X1, FCV7X1.opening) annotation (Line(points={{42.5,37.5},{28,37.5}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-120},{100,120}}, grid={0.5,0.5})));
end CoolingSingleLoadTempControl;
