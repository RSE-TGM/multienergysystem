within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence9
  extends Sequence8;
  MultiEnergySystem.DistrictHeatingNetwork.Components.Machines.CombinedHeatPower
    CHP annotation (Placement(transformation(extent={{-614,-314},{-554,-254}})));
  MultiEnergySystem.DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(
    Di_cold=BPHE.E501.Di_cold,
    Di_hot=BPHE.E501.Di_hot,
    L_cold=BPHE.E501.L_cold,
    L_hot=BPHE.E501.L_hot,
    MWall=BPHE.E501.MWall,
    Stot_cold=BPHE.E501.Stot_cold,
    Stot_hot=BPHE.E501.Stot_hot,
    Tin_start_cold=BPHE.E501.Tin_start_cold,
    Tin_start_hot=BPHE.E501.Tin_start_hot,
    Tout_start_cold=BPHE.E501.Tout_start_cold,
    Tout_start_hot=BPHE.E501.Tout_start_hot,
    cpm_cold=BPHE.E501.cpm_cold,
    cpm_hot=BPHE.E501.cpm_hot,
    t_cold=BPHE.E501.t_cold,
    t_hot=BPHE.E501.t_hot,
    gamma_nom_cold=BPHE.E501.gamma_nom_cold,
    gamma_nom_hot=BPHE.E501.gamma_nom_hot,
    h_cold=BPHE.E501.h_cold,
    h_hot=BPHE.E501.h_hot,
    hctype_cold=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Downstream,

    hctype_hot=MultiEnergySystem.DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,

    hin_start_cold=BPHE.E501.hin_start_cold,
    hin_start_hot=BPHE.E501.hin_start_hot,
    k_cold=BPHE.E501.k_cold,
    k_hot=BPHE.E501.k_hot,
    kc_cold=1,
    kc_hot=1,
    lambdam_cold=BPHE.E501.lambdam_cold,
    lambdam_hot=BPHE.E501.lambdam_hot,
    m_flow_start_cold=BPHE.E501.m_flow_start_cold,
    m_flow_start_hot=BPHE.E501.m_flow_start_hot,
    n=7,
    nPipes_cold=BPHE.E501.nPipes_cold,
    nPipes_hot=BPHE.E501.nPipes_hot,
    nPlates=BPHE.E501.nPlates,
    pin_start_cold=BPHE.E501.pin_start_cold,
    pin_start_hot=BPHE.E501.pin_start_hot,
    pout_start_cold=BPHE.E501.pout_start_cold,
    pout_start_hot=BPHE.E501.pout_start_hot,
    rho_nom_cold=(BPHE.E501.rhoin_nom_cold + BPHE.E501.rhoout_nom_cold)/2,
    rho_nom_hot=(BPHE.E501.rhoin_nom_hot + BPHE.E501.rhoout_nom_hot)/2,
    rhom_cold(displayUnit="kg/m3") = BPHE.E501.rhom_cold,
    rhom_hot(displayUnit="g/cm3") = BPHE.E501.rhom_hot,
    thermalInertia=false,
    u_nom_cold=BPHE.E501.u_nom_cold,
    u_nom_hot=BPHE.E501.u_nom_hot)                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-582,-161},  extent={{-17,
            -28.0002},{17,28.0001}},                                                               rotation=-90)));
equation
  connect(CHP.outlet, E501.inhot) annotation (Line(
      points={{-554,-284},{-528,-284},{-528,-169.5},{-562.4,-169.5}},
      color={140,56,54},
      thickness=0.5));
  connect(CHP.inlet, E501.outhot) annotation (Line(
      points={{-614,-284},{-632,-284},{-632,-169.5},{-601.6,-169.5}},
      color={140,56,54},
      thickness=0.5));
end Sequence9;
