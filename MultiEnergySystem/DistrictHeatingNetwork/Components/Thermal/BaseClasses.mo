within MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal;
package BaseClasses
  partial model HeatExchangerTopologyData
    "Base class for heat exchanger topology data"
    parameter Integer Nw "Number of volumes on both sides";
    parameter Integer correspondingVolumes[Nw] "Indeces of corresponding volumes";
  end HeatExchangerTopologyData;

  partial model BaseConvectiveHeatTransfer
    parameter Boolean computeTransport = true
      "=true to compute Reynolds, Prandtl & Nusselt";
    parameter Boolean useAverageTemperature = true
      "= true to use average temperature for heat transfer";
    parameter Integer n(min = 1)=1
      "Number of finite volumes";
    parameter Real nPipes
      "Number of parallel pipes";
    parameter Modelica.Units.SI.Length Lc
      "Characteristic Lenght for the heat transfer";
    parameter Modelica.Units.SI.Area A
      "Total passage section available for the mass flow";
    parameter Modelica.Units.SI.Area S
      "Total surface involved in the heat exchange";
    parameter Modelica.Units.SI.PerUnit kc = 1
      "Corrective factor for heat tranfer";
    parameter Modelica.Units.SI.MassFlowRate m_flow_nom
     "Nominal value of the mass flow rate involved in the thermal exchange";
    parameter Modelica.Units.SI.Pressure p_nom = 1e5
     "Nominal value of pressure involved in the thermal exchange";
    parameter Modelica.Units.SI.PerUnit epsilon = 0.01
     "Ratio";

    parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_nom = 1200
      "Nominal value of the heat transfert coefficient";
    parameter Modelica.Units.SI.PerUnit alpha = 0.8
      "Exponent in the flow-dependency law";
    parameter Modelica.Units.SI.PerUnit beta = 0.1
      "Fraction of nominal flow rate below which the heat transfer is not reduced";
    parameter Modelica.Units.SI.MassFlowRate m_flow_nom_ht = m_flow_nom
      "Nominal flow rate for heat transfer correlation (single tube)";
    parameter Modelica.Units.SI.CoefficientOfHeatTransfer gamma_approx = gamma_nom
      "Approximated value of gamma for homotopy-based initialization";


    //Basic variables input
    input Modelica.Units.SI.Temperature Twall[n]
      "Temperature of the wall for each finite volume";
    input Modelica.Units.SI.Temperature Tmean[n]
      "Mean temperature of the fluid in each finite volume";
    input Modelica.Units.SI.MassFlowRate m_flow[n]
      "Mass flow exiting the finite volume";
    input Modelica.Units.SI.Pressure p
      "Pressure exiting the finite volume";

    //Transport variables input
    input Modelica.Units.SI.DynamicViscosity mu[n]
      "Dynamic viscosity of the fluid" annotation (
      HideResult = not ComputeTransport);
    input Modelica.Units.SI.ThermalConductivity k[n]
      "Themal conductivity of the fluid" annotation (
      HideResult = not ComputeTransport);
    input Modelica.Units.SI.SpecificHeatCapacityAtConstantPressure cp[n]
      "Specific heat capacity at constant pressure of the fluid" annotation (
      HideResult = not ComputeTransport);

    //Dimensionless Numbers
    Modelica.Units.SI.PerUnit Re[n]
      "Reynolds Number" annotation (
      HideResult = not ComputeTransport);
    Modelica.Units.SI.PerUnit Pr[n]
      "Prandtl Number" annotation (
      HideResult = not ComputeTransport);
    Modelica.Units.SI.PerUnit Nu[n]
      "Nusselt Number" annotation (
      HideResult = not ComputeTransport);

    // Main variables to be compute
    Modelica.Units.SI.HeatFlowRate Q_flow[n]
      "Heat flow entering through the wall of the finite volume";
    Modelica.Units.SI.CoefficientOfHeatTransfer gamma[n]
      "Coefficient of convective heat exchange (start = fill(gamma_approx, n))";
    Modelica.Units.SI.PerUnit mflow_over_mflownom(start = 1)
      "Ratio between actual and nominal flow rate";
    Modelica.Units.SI.PerUnit mflow_mflownom_reg
      "Regularized ratio between actual and nominal flow rate";

  equation

  //   for i in 1:n loop
  //     if computeTransport then
  //       Re[i] = sqrt(m_flow[i]^2 + (epsilon*m_flow_nom)^2)*Lc/mu[i]/A "All referred to a single tube (in fact we get a (m_flow*nPipes)/(A*nPipes)";
  //       Pr[i] = mu[i] * cp[i] / k[i];
  //       Nu[i] = gamma[i] * Lc / k[i];
  //     else
  //       Re[i] = 0;
  //       Pr[i] = 0;
  //       Nu[i] = 0;
  //     end if;
  //   end for;

    mflow_over_mflownom = abs(m_flow[1])/m_flow_nom_ht;
    mflow_mflownom_reg = DistrictHeatingNetwork.Utilities.smoothSat(mflow_over_mflownom, beta, 1e9, beta/2);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end BaseConvectiveHeatTransfer;

  partial model BaseSingleMultiPortWall
    "Base model considering only one wall (multiport)"
    parameter Integer n = 3;
    parameter Modelica.Units.SI.Temperature Twall = 500;
    DistrictHeatingNetwork.Interfaces.MultiHeatPort MultiPort(n=n) annotation (
          Placement(
          visible=true,
          transformation(
            origin={2.22045e-15,-2.22045e-15},
            extent={{-40,-40},{40,40}},
            rotation=0),
          iconTransformation(
            origin={0,0},
            extent={{-10,-10},{10,10}},
            rotation=0)));
    Modelica.Units.SI.HeatFlowRate Qtot;
  equation
    Qtot = sum(MultiPort.Q_flow);
    annotation (
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})),
      Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics={  Rectangle(origin = {-48, 10}, lineColor = {255, 0, 0}, fillColor = {255, 0, 0},
              fillPattern =                                                                                                                                                                                                        FillPattern.Backward, extent = {{-12, -10}, {108, 10}})}));
  end BaseSingleMultiPortWall;
end BaseClasses;
