within MultiEnergySystem.DistrictHeatingNetwork.Components.TurboMachines;
model ControlledPump
  extends TurboMachines.BaseClass.PumpBase;
  parameter Boolean control_m_flow = true "= false to control outlet pressure outlet.p instead of q_m3hr" annotation (
    Evaluate = true);
  parameter Boolean use_m_flow = true "= true to use input signal m_flow_set instead of m_flow_nominal" annotation (
    Dialog(group = "External inputs", enable = control_m_flow));
  parameter Boolean use_pout = false "= true to use input signal p_set instead of p_b_nominal" annotation (
    Dialog(group = "External inputs", enable = not control_m_flow));

  Modelica.Blocks.Interfaces.RealInput in_m_flow(start = m_flow_start, unit="kg/s") if use_m_flow
    "Prescribed mass flow rate"                                                                                    annotation (
    Placement(visible = true, transformation(origin = {-54, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput in_pout(start=pout_start, unit="Pa") if use_pout
    "Prescribed outlet pressure" annotation (Placement(
      visible=true,
      transformation(
        origin={-54,60},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={40,46},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
protected
  Modelica.Blocks.Interfaces.RealInput in_m_flow_int(unit="kg/s") "Internal connector for mass flow rate in kg/s";
  Modelica.Blocks.Interfaces.RealInput in_pout_int(unit="Pa") "Internal connector for outlet pressure";
equation

  W = homotopy((omega/omeganom)^3*(a[1] + q_m3h*(omeganom/omega)*(a[2] + a[3]*q_m3h*(omeganom/omega))),
               ((dpnom*qnom/etanom)*(omega/omeganom)*(q_m3h/qnom_inm3h)))  "Power Characteristic equation";
  head = homotopy((omega/omeganom)^2*(b[1]+ q_m3h*(omeganom/omega)*(b[2] + b[3]*q_m3h*(omeganom/omega))),
                  (headnom*(omega/omeganom)*(q_m3h/qnom_inm3h))) "Head Characteristic equation";

  // Ideal control
  if control_m_flow then
    m_flow = in_m_flow_int;
  else
    dp = in_pout_int - pin;
  end if;
  // Internal connector value when use_m_flow_set = false
  if not use_m_flow then
    in_m_flow_int = m_flow_nom;
  end if;
  if not use_pout then
    in_pout_int = pin_start + dpnom;
  end if;

  connect(in_m_flow, in_m_flow_int);
  connect(in_pout, in_pout_int);

end ControlledPump;
