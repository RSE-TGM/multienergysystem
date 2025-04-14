within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
model LoadPlantFourHX
  extends LoadPlantFourHXBase;


equation
  connect(controlSignalBus.thetaFCV701, S701.theta_FCV7X1)
    annotation (Line(
      points={{0,300},{0,280},{-378,280},{-378,30},{-366,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV701, S701.theta_TCV7X1) annotation (Line(
      points={{0,300},{-4,300},{-4,290},{-382,290},{-382,22},{-366,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV731, S731.theta_FCV7X1)
    annotation (Line(
      points={{0,300},{0,272},{-218,272},{-218,30},{-206,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV731, S731.theta_TCV7X1) annotation (Line(
      points={{0,300},{-2,300},{-2,280},{-224,280},{-224,22},{-206,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV711, S711.theta_FCV7X1)
    annotation (Line(
      points={{0,300},{2,300},{2,262},{-54,262},{-54,30},{-46,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV711, S711.theta_TCV7X1)
    annotation (Line(
      points={{0,300},{0,268},{-60,268},{-60,22},{-46,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaFCV721, S721.theta_FCV7X1)
    annotation (Line(
      points={{0,300},{2,300},{2,256},{102,256},{102,30},{114,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.thetaTCV721, S721.theta_TCV7X1)
    annotation (Line(
      points={{0,300},{0,244},{96,244},{96,22},{114,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (                                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-500,-300},{500,300}})));
end LoadPlantFourHX;
