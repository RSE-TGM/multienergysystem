within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RG2i_controllers;
model RG2i_PI_controller
  extends Rete_Gas_2i_pipes_users(raccordo2(pin_start=Data.PipelineData_2i.sds8.pout_start, pout_start=Data.PipelineData_2i.sds8.pout_start));
  MultiEnergySystem.H2GasFacility.Components.Users.IdealUser GRM_6(
    redeclare model Medium = Medium,
    p0=461900,
    m_flow0=0.019358,
    X0=X_start)                                                                                     "Via Marx"
    annotation (Placement(transformation(extent={{88,200},{122,234}})));
  Modelica.Blocks.Sources.Ramp p_ref(
    offset=4.93*10^5,
    height=0*0.2*10^5,
    duration=0,
    startTime=1000) annotation (Placement(visible=true, transformation(
        origin={-155,-8},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Controllers.AWPIDContinuous aWPIDContinuous(
    Kp=1e-3,
    Kd=0,
    Ki=1,
    Ti=1e6,
    Td=1,
    y_start=0.5)
    annotation (Placement(transformation(extent={{-128,-26},{-108,-6}})));
equation
  connect(GRM_6.inlet, sds14.outlet) annotation (Line(
      points={{105,217},{104,216},{80,216}},
      color={182,109,49},
      thickness=0.5));
  connect(p_ref.y, aWPIDContinuous.REF) annotation (Line(points={{-144,-8},{
          -144,-12},{-126,-12}}, color={0,0,127}));
  connect(idealPressureSensor.p_meas, aWPIDContinuous.FeedBack) annotation (
      Line(points={{-135.8,18.6},{-178,18.6},{-178,-38},{-126,-38},{-126,-20}},
        color={0,0,127}));
  connect(aWPIDContinuous.controlAction, valveLinearOpening.opening)
    annotation (Line(points={{-107,-16},{-102,-16},{-102,18}}, color={0,0,127}));
  annotation (experiment(StopTime=6000, __Dymola_Algorithm="Dassl"),
                                   Documentation(info="<html>
<p>The pipes model is extended and users and REMI station are included in the model. </p>
</html>"));
end RG2i_PI_controller;
