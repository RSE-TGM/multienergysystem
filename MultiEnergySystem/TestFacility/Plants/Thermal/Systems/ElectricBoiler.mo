within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model ElectricBoiler "System 400"
  extends DistrictHeatingNetwork.Icons.ThermalMachines.Boiler;

  constant Real pi = Modelica.Constants.pi;

  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;

  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL1 = 0.82;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL2 = 0.47;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL3 = 1.3;
  final parameter DistrictHeatingNetwork.Types.Length L_S4_PL4 = 1.3;
  final parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  final parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Velocity u_nom = 5;
  parameter Real q_m3h_S4 = 5;
  parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;

  parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
  parameter Real P401qm3h[:,:] = [0, 7.5; 100, 7.5];
  parameter Real FCV401theta[:,:] = [0, 1];
  parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

  DistrictHeatingNetwork.Interfaces.FluidPortOutlet outlet annotation (
    Placement(visible = true, transformation(origin={20,110},  extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={25,80},     extent={{-5,-5},
            {5,5}},                                                                                                                                                                    rotation = 0)));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FTBoiler(T_start=Tin_start_S4, p_start=
        pin_start_S4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-16,64})));
  DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler
    EB401(
    D=0.4,
    Pmaxnom=50e3,
    Pnimnom=10e3,
    Pnom=50e3,
    Tin_start=333.15,
    etanom=0.98,
    h=1.25,
    m_flow_nom=1,
    pin_start=300000,
    pout_start=290000,
    nR=3.5)            annotation (Placement(visible=true, transformation(
        origin={-2,-102},
        extent={{-44,-44},{44,44}},
        rotation=0)));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P401(
    Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tin_start,
    Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P401.Tout_start,
    a=DistrictHeatingNetwork.Data.PumpData.P401.a,
    b=DistrictHeatingNetwork.Data.PumpData.P401.b,
    m_flow_start=m_flow_S4,
    dpnom=DistrictHeatingNetwork.Data.PumpData.P401.dpnom,
    etaelec=DistrictHeatingNetwork.Data.PumpData.P401.etaelec,
    etamech=DistrictHeatingNetwork.Data.PumpData.P401.etamech,
    etanom=DistrictHeatingNetwork.Data.PumpData.P401.etanom,
    hin_start=DistrictHeatingNetwork.Data.PumpData.P401.hin_start,
    m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P401.m_flow_nom,
    omeganom=DistrictHeatingNetwork.Data.PumpData.P401.omeganom,
    pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pin_start,
    pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P401.pout_start,
    headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
    qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
    rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
    headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
    headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
    qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
    qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={18,3})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV401(
    Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4)    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,66})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL_S400_EB401_P401(
    L=L_S4_PL3,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,-26})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL2_S401(
    L=L_S4_PL2,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-22,-26})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL4_S401(
    L=L_S4_PL3,
    h=0.8,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={18,32})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipeFV                   PL1_S401(
    L=L_S4_PL1,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    u_nom=u_nom,
    hctype=hctype)
              annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-22,10})));
  DistrictHeatingNetwork.Interfaces.FluidPortInlet inlet annotation (Placement(transformation(
          extent={{-30,75},{-20,85}}), iconTransformation(extent={{-30,75},{-20,85}})));
equation
  connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
      points={{-22,-36},{-22,-48.7},{-15.2,-48.7},{-15.2,-66.8}},
      color={140,56,54},
      thickness=0.5));
  connect(EB401.outlet,PL_S400_EB401_P401. inlet) annotation (Line(
      points={{11.2,-66.8},{12,-66.8},{12,-48},{18,-48},{18,-36}},
      color={140,56,54},
      thickness=0.5));
  connect(PL2_S401.inlet, PL1_S401.outlet)
    annotation (Line(
      points={{-22,-16},{-22,0}},
      color={140,56,54},
      thickness=0.5));
  connect(PL1_S401.inlet, FTBoiler.outlet) annotation (Line(
      points={{-22,20},{-22,50},{-20,50},{-20,58}},
      color={140,56,54},
      thickness=0.5));
  connect(FTBoiler.inlet, inlet)
    annotation (Line(
      points={{-20,70},{-20,82},{-20,80},{-25,80}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.outlet, outlet) annotation (Line(
      points={{18,76},{18,96},{20,96},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL4_S401.outlet, FCV401.inlet)
    annotation (Line(
      points={{18,42},{18,56}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_EB401_P401.outlet, P401.inlet)
    annotation (Line(
      points={{18,-16},{18,-6.6}},
      color={140,56,54},
      thickness=0.5));
  connect(P401.outlet, PL4_S401.inlet)
    annotation (Line(
      points={{18,12.6},{18,22}},
      color={140,56,54},
      thickness=0.5));
  annotation (                                                   Diagram(coordinateSystem(
                                     extent={{-100,-140},{100,140}})), Icon(coordinateSystem(grid={
            1,1}),                                                          graphics={Bitmap(
          extent={{-28,-32},{27,31}},
          imageSource=
              "iVBORw0KGgoAAAANSUhEUgAAAEEAAABFCAYAAAAVZotTAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxMAAAsTAQCanBgAAAVISURBVHhe7ZtfSCxVHMfXu1e9lFdBLqklFyxLCQMxMcjyQSVCQY2s9D5EBNmTRNBDEfYghEVkPdQleijEQPoHSkoPBmJCJuqDCrorVJaaaRf/5bq4u2q/n3ng1/RNd2bO7M7lzoEPst/zPbPn92V39pyZMeX4+Nh3q7cLp39v6eaFQM0LgZoXAjUvBGpeCNTcGkLu1NTU9ZaWlp/r6+uXx8bGPiHt6j9dDjReJ7iJo6Oj4pqamt95apLy8vIb1Hc/GmMXKCYLDqC6unrNGICis7PzRzTOLlBMBigAft3R0TElNfLdjcbbAYqJBgVQV1e3TPo9sVjsEanT64fQMewAxURyVgDcPz8//47Ss7KyIqRlyfE6gGKiOC8AIqWhoeE31dfX1/eNHK8LKCYCKrTonAB80Wj0Udm/t7d3TR5DF1B0mngCYCYnJ6+r/vz8/BBpt8t+XUDRSVAA/JE3BkBcrKio+FN5hoaGPjf0awOKTmEiAN/BwcHj0hcOh5uMHl1A0QnMBMCMjIz0KF9xcfE2aelGjy6gqBuzARCXCgsLd5V3dHT0U+DRBhR1wgEY9wLnBODb399/UvojkchjyKcLKOrijADOXPoODAx8pfyVlZXrpPmNHp1AUQdWAyAyc3JywmoMbak/BB6tQNEuNgLw7e7uPivH8d4B+XQCRTvYCYDp6en5Vo4j7eTeiJNA0SpU6H12AiCuZGRkRNVY3jwBj3agaAUUQGNj468mAvBtbW29IMcfHh6WIZ9uoGgWHQEwc3Nz76rxVVVVfyCPE0DRDLoCYNbX11+Wx+H9ghMXUYxAMV50BnBKHu8W5fGYrq6uH2gB9RT1O7JegGKcZHLBcrI2AzghFAo9w1eQ5HEVTU1NS2tra6+QT+vVJSjGw8bGxktygjoCUNAJsbS/v//rtLS0Q/keioKCgr+Wl5dfJ6+Wn08oxoPc5fEKT1cAEjpmwezs7HtyMyVZXFx8E40zCxTjgScnJzQzM/M+6XcafZrI5JNmc3PzL/I9Ty+83mHwmgaK8RCNRqvkhNSkhoeHP6OP84NojAb8fJ1RLqhOT5jIGzdQjBf5lTDS3d39fTgcfoJ8F4zj7MALqOzs7AP1PjouvkLRBP7V1dVXebsrA5C0trb+tLOz8xwYaxoOoLS0dFMdm0+cpF81+swCRQukb29vP9/e3j4nA5AEAoG3wLi4MQbA8AoTec0CRTtEIpHa3t7eIb/ffyQnzFg9V6AA+KtIfVq+alDUAf28FfNJUk48GAx2Ie9ZOB0AA0VdUBAPyMlPTEx8hHz/RyICYKCoi6WlpTdkAZubmy8iHyJRATBQ1EVbW9uCKoB/20m7YvQgEhkAA0UdUCGlsgi+bIZ8RhIdAANFHSwsLLwtC+ELqMgnSUYADBQ1kCK32bzBIu2ywfMvkhUAA0W7xGKxSlkM30xBPkUyA2CgaJfp6ekPZEF8Ww35mGQHwEDRJn65lygqKtoh7ZLBc4IbAmCgaAe+eQqK+o/PLQEwULQD30aXhfHDFkaPmwJgoGiDdH6gQhXGj9uQdlF63BYAA0Wr8EUUWRw/eCX73RgAA0WrDA4OfiEL5EfwVJ9bA2CgaJHLeXl5+6pAeUfZzQEwULRCKBR6Whap7ii7PQAGilZYWVl5TRbKvwo3QwAMFK1An4QWWSwvmIz3Fd0YAANFi9xWW1u7KouWuDUABopWoY3TwyUlJVvGAMbHxz+mflcGwDjxv9J3BYPB9kAgcG9ubu6NsrKyL1NTU7877XNlcyKEm655/xdJzQuBmhcCNS8Eal4I1LwQqHkh+Hy+vwG4aaMC1QsJdwAAAABJRU5ErkJggg==",
          fileName=
              "modelica://MultiEnergySystem/../../../Lavoro/6. Rapporti RdS/Figure/electricboilericon2.png")}));
end ElectricBoiler;
