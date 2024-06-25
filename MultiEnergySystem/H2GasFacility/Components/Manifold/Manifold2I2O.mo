within MultiEnergySystem.H2GasFacility.Components.Manifold;
model Manifold2I2O
  replaceable model Medium = H2GasFacility.Media.IdealGases.CH4H2 constrainedby
    H2GasFacility.Media.BaseClasses.PartialMixture;

  // Parameters
  parameter Boolean computeTransport = false "Used to decide if it is necessary to calculate the transport properties";
  parameter Boolean computeEntropy = false "Used to decide if it is necessary to calculate the entropy of the fluid";
  parameter Boolean noInitialPressure = false "Remove initial equation on pressure" annotation(choices(checkBox=true));
  parameter Types.Volume V = 0.1 "Volume of the manifold";
  parameter Types.Pressure p_start = 1e4 "Start pressure value of the manifold";
  parameter Types.Temperature T_start = 15 + 273.15 "Start temperature value for inlet 1 fluid";
  parameter Types.MassFraction X_start[fluid.nX] = {1, 0} "Start mass composition for inlet 1 fluid";


  Medium fluid(T_start=T_start, p_start=p_start, X_start=X_start, computeEntropy=computeEntropy, computeTransport=computeTransport);


  Interfaces.FluidPortInlet inlet(nXi=fluid.nXi)     annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-100,0},    extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.FluidPortOutlet outlet(nXi=fluid.nXi)   annotation (
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={0,98},     extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.FluidPortOutlet outlet1(nXi=fluid.nXi)  annotation (
    Placement(visible = true, transformation(origin={0,-100},   extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={100,0},    extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.FluidPortOutlet outlet2(nXi=fluid.nXi)  annotation (
    Placement(visible = true, transformation(origin={0,100},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={0,-100},   extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  fluid.p = inlet.p;
  fluid.h = inStream(inlet.h_out);
  fluid.Xi = inStream(inlet.Xi);

  connect(inlet, outlet) annotation (Line(
      points={{-100,0},{-52,0},{-52,-2},{100,-2},{100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(outlet1, outlet) annotation (Line(
      points={{0,-100},{-4,-100},{-4,-2},{100,-2},{100,0}},
      color={182,109,49},
      thickness=0.5));
  connect(outlet2, outlet) annotation (Line(
      points={{0,100},{0,-2},{100,-2},{100,0}},
      color={182,109,49},
      thickness=0.5));
  annotation (Icon(                                             graphics={Polygon(
          points={{-100,40},{-100,-40},{-40,-40},{-40,-100},{40,-100},{40,-40},{100,-40},{100,40},{40,40},{40,100},{-40,100},{-40,40},{-100,40}},
          lineColor={28,108,200},
          fillColor={247,150,60},
          fillPattern=FillPattern.Solid)}));
end Manifold2I2O;
