within MultiEnergySystem.TestFacility.DHTF.Systems.Load;
model LoadPlantFourHXControlled
  extends LoadPlantFourHXBase;
equation
  connect(controlSignalBus.PtEX701, S701.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,290},{-380,290},{-380,30},{-366,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX701, S701.TT7X1_SP) annotation (Line(
      points={{0,300},{-6,300},{-6,296},{-384,296},{-384,22},{-366,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.PtEX711, S711.EX7X1Pt_SP)
    annotation (Line(
      points={{0,300},{0,252},{-54,252},{-54,30},{-46,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX711, S711.TT7X1_SP)
    annotation (Line(
      points={{0,300},{-2,300},{-2,256},{-60,256},{-60,22},{-46,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.PtEX721, S721.EX7X1Pt_SP)
    annotation (Line(
      points={{0,300},{0,278},{106,278},{106,30},{114,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX721, S721.TT7X1_SP) annotation (Line(
      points={{0,300},{4,300},{4,266},{24,266},{24,274},{102,274},{102,22},{114,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.PtEX731, S731.EX7X1Pt_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,274},{-206,274},{-206,276},{-216,276},{-216,30},{-206,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(controlSignalBus.ToutEX731, S731.TT7X1_SP) annotation (Line(
      points={{0,300},{-4,300},{-4,278},{-226,278},{-226,22},{-206,22}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
   annotation (                                                   Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-500,-300},{500,300}}), graphics={
        Line(
          points={{-292,108},{-292,136}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1),
        Line(
          points={{-32,96},{-32,68}},
          color={162,29,33},
          arrow={Arrow.None,Arrow.Filled},
          thickness=1)}));
end LoadPlantFourHXControlled;
