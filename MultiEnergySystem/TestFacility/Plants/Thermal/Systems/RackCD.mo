within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model RackCD
  extends DistrictHeatingNetwork.Icons.Water.Pipe;
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV                   rackCD_Hot_S100_S400(
    L=L_rCD_H1,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the outlet of gas boiler and the outlet of electric boiler"
    annotation (Placement(transformation(
        extent={{-10.25,10.25},{10.25,-10.25}},
        rotation=180,
        origin={18.25,28.75})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV                   rackCD_Hot_S400_S300(
    L=L_rCD_H2,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD,
    pout_start=pout_start_rCD,
    Tin_start=T_start_hot,
    Tout_start=T_start_hot,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype)
    "Pipe connecting the outlet of the electric boiler and the outlet of heat pump HP301"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-62,29})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV                   rackCD_Cold_S400_S100(
    L=L_rCD_C7,
    h=0,
    t=t_rCD,
    m_flow_start=m_flow_start,
    pin_start=pin_start_rCD_cold,
    Tin_start=T_start_cold,
    Tout_start=T_start_cold,
    Di=Di,
    nPipes=1,
    n=n,
    hctype=hctype) "Pipe connecting the system S400 and S100 cold side"
    annotation (Placement(transformation(
        extent={{10.75,10.25},{-10.75,-10.25}},
        rotation=180,
        origin={-51.25,-10.75})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletPump annotation (Placement(transformation(
          extent={{-105,-15},{-95,-5}}),   iconTransformation(extent={{-105,-15},{-95,-5}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletPump annotation (Placement(transformation(
          extent={{-105,5},{-95,15}}),  iconTransformation(extent={{-105,5},{-95,15}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletGasBoiler annotation (Placement(
        transformation(extent={{10,-60},{30,-40}}), iconTransformation(extent={{65,-35},{75,-25}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletGasBoiler annotation (Placement(
        transformation(extent={{50,-60},{70,-40}}),iconTransformation(extent={{35,-35},{45,-25}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletElectricBoiler annotation (Placement(
        transformation(extent={{-90,-60},{-70,-40}}), iconTransformation(extent={{-45,-35},{-35,-25}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletElectricBoiler annotation (Placement(
        transformation(extent={{-40,-60},{-20,-40}}), iconTransformation(extent={{-75,-35},{-65,-25}})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inletHot annotation (Placement(transformation(
          extent={{95,23},{105,33}}), iconTransformation(extent={{95,5},{105,15}})));
  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outletCold annotation (Placement(transformation(
          extent={{95,-15},{105,-5}}), iconTransformation(extent={{95,-15},{105,-5}})));
equation
  connect(rackCD_Hot_S100_S400.outlet,rackCD_Hot_S400_S300. inlet) annotation (
      Line(
      points={{8,28.75},{-22,28.75},{-22,29},{-52,29}},
      color={140,56,54},
      thickness=0.5));
  connect(outletElectricBoiler, rackCD_Hot_S400_S300.inlet) annotation (Line(
      points={{-30,-50},{-30,29},{-52,29}},
      color={140,56,54},
      thickness=0.5));
  connect(outletElectricBoiler, outletElectricBoiler)
    annotation (Line(
      points={{-30,-50},{-30,-50}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S400_S100.inlet, inletPump) annotation (Line(
      points={{-62,-10.75},{-81,-10.75},{-81,-10},{-100,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(inletElectricBoiler, inletPump) annotation (Line(
      points={{-80,-50},{-80,-10.75},{-81,-10.75},{-81,-10},{-100,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(outletPump, rackCD_Hot_S400_S300.outlet) annotation (Line(
      points={{-100,10},{-86,10},{-86,29},{-72,29}},
      color={140,56,54},
      thickness=0.5));
  connect(rackCD_Cold_S400_S100.outlet, outletCold) annotation (Line(
      points={{-40.5,-10.75},{29.75,-10.75},{29.75,-10},{100,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(inletHot, rackCD_Hot_S100_S400.inlet) annotation (Line(
      points={{100,28},{64.25,28},{64.25,28.75},{28.5,28.75}},
      color={140,56,54},
      thickness=0.5));
  connect(inletGasBoiler, outletCold) annotation (Line(
      points={{20,-50},{22,-50},{22,-10.75},{29.75,-10.75},{29.75,-10},{100,-10}},
      color={140,56,54},
      thickness=0.5));
  connect(outletGasBoiler, rackCD_Hot_S100_S400.inlet) annotation (Line(
      points={{60,-50},{60,28.75},{28.5,28.75}},
      color={140,56,54},
      thickness=0.5));
  annotation (Icon(coordinateSystem(grid={1,1}), graphics={                                                                                               Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent={{-20,21},
              {20,-19}}), Bitmap(
          extent={{-14,-16},{14,18}},
          imageSource=
              "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",

          fileName=
              "modelica://MultiEnergySystem/../../../Lavoro/6. Rapporti RdS/Figure/pipelineicon.png")}),
                                 Diagram(coordinateSystem(
        preserveAspectRatio=false)));
end RackCD;
