within MultiEnergySystem.DistrictHeatingNetwork.Tests.Systems.Sequences;
model Sequence6
  extends Sequence5(
    redeclare MultiEnergySystem.DistrictHeatingNetwork.Components.ThermalMachines.ControlledChillerNoDynamicsSP RR01,
    T_start_hot = 80+273.15,
    T_start_cold = 60+273.15,
    EX701_Tin_hot = T_start_hot,
    EX701_Tin_cold = T_start_cold,
    EX711_Tin_hot = T_start_hot,
    EX711_Tin_cold = T_start_cold,
    EX721_Tin_hot = T_start_hot,
    EX721_Tin_cold = T_start_cold,
    EX731_Tin_hot = T_start_hot,
    EX731_Tin_cold = T_start_cold,
    Tin_start_S1 = T_start_cold,
    Tout_start_S1 = T_start_hot,
    Tin_start_S4 = T_start_cold,
    Tout_start_S4 = T_start_hot,
    P901omega = [0, 2*3.141592654*35;  60, 2*3.141592654*35],
    P101omega = [0, 2*3.141592654*35; 120, 2*3.141592654*35],
    P401omega = [0, 2*3.141592654*35; 180, 2*3.141592654*35],
    FCV901theta = [0, 1; 360, 1],
    FCV101theta = [0, 1; 420, 1],
    FCV401theta = [0, 1; 480, 1],
    P401(Tin_start=Tout_start_S4, Tout_start=Tout_start_S4));

  parameter Real ToutcoolSP[:,:] = [0, 7; 50, 7; 60, 17; 100, 17];

  Modelica.Blocks.Sources.TimeTable Tout_cool_SP(table=ToutcoolSP)
    "Temperature in Celsius degrees"
    annotation (Placement(transformation(extent={{708,30},{728,50}})));
equation
  connect(Tout_cool_SP.y, RR01.Tout_SP) annotation (Line(points={{729,40},{769.5,
          40},{769.5,-17.2}}, color={0,0,127}));
  annotation (experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
end Sequence6;
