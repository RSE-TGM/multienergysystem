within MultiEnergySystem.H2GasFacility.Sources;
model REMI_station
  "Stazione di REgolazione e MIsura (Regulation and Measurements station). Also called Gas Pressure Regulation Station (GPRS)"
  replaceable model Medium =
      MultiEnergySystem.H2GasFacility.Media.IdealGases.CH4;
  parameter Integer nX = 1 "Number of components in the gas fluid";
  parameter Types.MassFraction X_start[nX] = {1};

  parameter Types.Density rho_nom = 0.657;
  parameter Types.Density rho_in_nom=40.17625;

  // parameter Types.Pressure p_nom = 1.5e5;
  parameter Types.Pressure pin_start = 60e5;
  parameter Types.Pressure dp_nom = 60e5-4.93e5;

  parameter Types.Temperature Tin_start = 288.15;
  parameter Types.Temperature Tout_start = 288.15;

  parameter Boolean PressureDropLinear=false;

  Components.Valves.ValveLinearOpening
    valveLinearOpening(
    redeclare model Medium = Medium,
    pin_start=pin_start,
    Tin_start=Tin_start,
    Tout_start=Tout_start,
    X_start=X_start,
    rho_in_nom=rho_in_nom,
    PressureDropLinear=PressureDropLinear)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-8,0})));
  SourcePressure                                         sourcePressure(
    redeclare model Medium = Medium,
    p0=pin_start,
    T0=Tin_start,
    X0=X_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={26,0})));
  Interfaces.FluidPortOutlet fluidPortOutlet(nXi=nX)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput in_opening "valve opening"
    annotation (Placement(transformation(
        origin={0,106},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={56,84})));
equation
  connect(sourcePressure.outlet,valveLinearOpening. inlet) annotation (Line(
      points={{16,0},{2,0}},
      color={182,109,49},
      thickness=0.5));
  connect(valveLinearOpening.outlet, fluidPortOutlet) annotation (Line(
      points={{-18,0},{-100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(valveLinearOpening.opening, in_opening) annotation (Line(points={{-8,-8},
          {-8,-46},{42,-46},{42,76},{22,76},{22,106},{0,106}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(
          extent={{100,100},{-100,-100}},
          lineColor={0,0,0},
          fillColor={247,150,70},
          fillPattern=FillPattern.Solid), Text(
          extent={{-72,48},{86,-52}},
          textColor={255,255,255},
          textString="REMI")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end REMI_station;
