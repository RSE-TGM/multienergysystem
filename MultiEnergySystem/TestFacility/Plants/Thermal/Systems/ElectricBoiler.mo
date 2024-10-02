within MultiEnergySystem.TestFacility.Plants.Thermal.Systems;
model ElectricBoiler "System 400"
  extends TestFacility.Interfaces.SystemInterfaceBaseI(MultiPort(n=n));
  extends DistrictHeatingNetwork.Icons.Water.ThermalModel;

  replaceable model Medium = DistrictHeatingNetwork.Media.WaterLiquidVaryingDensity constrainedby DistrictHeatingNetwork.Media.BaseClasses.PartialSubstance;
  replaceable model HeatTransferModel = DistrictHeatingNetwork.Components.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
      constrainedby DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer;

  constant Real pi = Modelica.Constants.pi;
  parameter Integer n = 3 "Number of volumes in each pipe";
  parameter DistrictHeatingNetwork.Choices.Pipe.HCtypes hctype=
      DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle "Location of pressure state";
  parameter Real pumpcorrectionfactor = 1;

  parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4 = 1.695e5;
  parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4 = 1.6e5;
  parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4 = 70 + 273.15;
  parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4 = 80 + 273.15;

  parameter DistrictHeatingNetwork.Types.Length Di_S4 = 51e-3;
  parameter DistrictHeatingNetwork.Types.Length t_S4 = 1.5e-3;
  parameter DistrictHeatingNetwork.Types.Length L_PT401_EB401 = 0.5+0.4+0.2;
  parameter DistrictHeatingNetwork.Types.Length h_PT401_EB401 = -0.1*0;
  parameter DistrictHeatingNetwork.Types.Length L_EB401_P401 = 0.3+1+1+0.4;
  parameter DistrictHeatingNetwork.Types.Length h_EB401_P401 = -1*0;
  parameter DistrictHeatingNetwork.Types.Length L_P401_FCV401 = 0.2+0.4+0.6;
  parameter DistrictHeatingNetwork.Types.Length h_P401_FCV401 = 0.2*0;

  parameter Real q_m3h_S4 = 5;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;
  final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_nom = 2.4;

  parameter Real Kv(unit = "m3/h") = DistrictHeatingNetwork.Data.ValveData.FCV401.Kv "Metric Flow Coefficient";
  parameter DistrictHeatingNetwork.Components.Types.valveOpeningChar openingChar = DistrictHeatingNetwork.Data.ValveData.FCV401.openingChar "opening characteristic";

  parameter Real nR = 5 "Number of resistors";
  parameter DistrictHeatingNetwork.Types.Power Pmaxres = 10e3;
  parameter DistrictHeatingNetwork.Types.Power Pmaxnom = 50e3;
  parameter DistrictHeatingNetwork.Types.Power Pminnom = 0;
  parameter DistrictHeatingNetwork.Types.Length h = 1.25;
  parameter DistrictHeatingNetwork.Types.Length D = 0.4;


  DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB(
    redeclare model Medium = Medium,
    Tout_start=Tout_start_S4,
    D=D,
    Pmaxnom=Pmaxnom,
    Pnimnom=Pminnom,
    Pnom=Pmaxnom,
    Tin_start=Tin_start_S4,
    etanom=0.98,
    h=h,
    m_flow_nom=m_flow_nom,
    pin_start=pin_start_S4,
    pout_start=pout_start_S4,
    nR=nR,
    Pmaxres=Pmaxres)   annotation (Placement(visible=true, transformation(
        origin={0,-94},
        extent={{-22,-22},{22,22}},
        rotation=0)));
  DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump
    P401(
    redeclare model Medium = Medium,
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
    correctionfactor=pumpcorrectionfactor,
    use_in_omega=true)                      annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={20,-19})));
  DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
    FCV401(
    redeclare model Medium = Medium,
    Kv=Kv,
    openingChar=openingChar,
    dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
    Tin_start(displayUnit="K") = Tout_start_S4,
    pin_start=pout_start_S4,
    q_m3h_start=q_m3h_S4)    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={20,40})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_EB401_P401(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_EB401_P401,
    h=h_EB401_P401,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    hctype=hctype)        "Pipe connecting outlet of electric boiler and pump P401"
              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-50})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_PT401_EB401(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_PT401_EB401,
    h=h_PT401_EB401,
    t=t_S4,
    pin_start=pin_start_S4,
    Tin_start=Tin_start_S4,
    Tout_start=Tin_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    hctype=hctype)        "Pipe connecting pressure sensor PT401 and inlet of electric boiler"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,-50})));
  DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_P401_FCV401(
    redeclare model Medium = Medium,
    redeclare model HeatTransferModel = HeatTransferModel,
    L=L_P401_FCV401,
    h=h_P401_FCV401,
    t=t_S4,
    pin_start=pout_start_S4,
    Tin_start=Tout_start_S4,
    Tout_start=Tout_start_S4,
    Di=Di_S4,
    q_m3h_start=q_m3h_S4,
    n=n,
    hctype=hctype)        annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,10})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT402(redeclare model Medium = Medium,T_start=Tout_start_S4, p_start=pout_start_S4)
    "Temperature sensor at the outlet of valve FCV401"       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={22,76})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT402 "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=90,
        origin={22,62})));
  DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor
    PT401 "Pressure sensor at the inlet of gas boiler" annotation (Placement(
        transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-18,12})));
  DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor
    TT401(redeclare model Medium = Medium,T_start=Tin_start_S4, p_start=pin_start_S4)
    "Temperature sensor at the inlet of electrib boiler"     annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=90,
        origin={-18,26})));
  DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT(
    redeclare model Medium = Medium,
    T_start=Tin_start_S4,
    p_start=pin_start_S4) annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=90,
        origin={-23,-11})));
  Modelica.Blocks.Interfaces.RealOutput Pe annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
equation
  Pe = P401.W;
  connect(P401.inlet,PL_S400_EB401_P401. outlet) annotation (Line(
      points={{20,-28.6},{20,-40}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet,PT402. inlet) annotation (Line(
      points={{19.6,76},{20,76},{20,70},{19.6,70},{19.6,62}},
      color={140,56,54},
      thickness=0.5));
  connect(PT401.inlet,TT401. inlet) annotation (Line(
      points={{-20.4,12},{-20.4,26}},
      color={140,56,54},
      thickness=0.5));
  connect(FCV401.inlet,PL_S400_P401_FCV401. outlet) annotation (Line(
      points={{20,32},{20,20}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_P401_FCV401.inlet,P401. outlet) annotation (Line(
      points={{20,0},{20,-9.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_PT401_EB401.inlet, FT.outlet) annotation (Line(
      points={{-20,-40},{-20,-28.6},{-20.2,-28.6},{-20.2,-15.2}},
      color={140,56,54},
      thickness=0.5));
  connect(FT.inlet, PT401.inlet) annotation (Line(
      points={{-20.2,-6.8},{-20.2,2.6},{-20.4,2.6},{-20.4,12}},
      color={140,56,54},
      thickness=0.5));
  connect(PT402.inlet,FCV401. outlet) annotation (Line(
      points={{19.6,62},{20,62},{20,48}},
      color={140,56,54},
      thickness=0.5));
  connect(TT402.inlet, outlet) annotation (Line(
      points={{19.6,76},{20,76},{20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(TT401.inlet, inlet) annotation (Line(
      points={{-20.4,26},{-20.4,110},{-20,110}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_PT401_EB401.outlet, EB.inlet) annotation (Line(
      points={{-20,-60},{-20,-68},{-6.6,-68},{-6.6,-76.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_EB401_P401.inlet, EB.outlet) annotation (Line(
      points={{20,-60},{20,-68},{6.6,-68},{6.6,-76.4}},
      color={140,56,54},
      thickness=0.5));
  connect(PL_S400_PT401_EB401.wall, MultiPort) annotation (Line(points={{-24.1,-50},{-46,-50},{-46,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S400_EB401_P401.wall, MultiPort) annotation (Line(points={{15.9,-50},{4,-50},{4,-64},{-36,-64},{-36,-70},{-110,-70}}, color={255,238,44}));
  connect(PL_S400_P401_FCV401.wall, MultiPort) annotation (Line(points={{15.9,10},{4,10},{4,-64},{-36,-64},{-36,-70},{-110,-70}}, color={255,238,44}));
  connect(omega, P401.in_omega) annotation (Line(points={{-110,70},{-82,70},{-82,-23.8},{14,-23.8}}, color={0,0,127}));
  connect(theta, FCV401.opening) annotation (Line(points={{-110,50},{-62,50},{-62,40},{13.6,40}}, color={0,0,127}));
  connect(Toutset, EB.Tout_ref) annotation (Line(points={{-110,30},{-60,30},{-60,-94},{-15.4,-94}}, color={0,0,127}));
  connect(status, EB.heat_on) annotation (Line(points={{-110,10},{-90,10},{-90,-105},{-15.4,-105}}, color={255,0,255}));
  connect(TT402.T, TTout) annotation (Line(points={{29.8,76},{44,76},{44,30},{110,30}}, color={0,0,127}));
  connect(TT401.T, TTin) annotation (Line(points={{-10.2,26},{78,26},{78,50},{110,50}}, color={0,0,127}));
  connect(PT402.p, PTout) annotation (Line(points={{29.8,62},{36,62},{36,-10},{110,-10}}, color={0,0,127}));
  connect(PT401.p, PTin) annotation (Line(points={{-10.2,12},{6,12},{6,-2},{98,-2},{98,10},{110,10}}, color={0,0,127}));
  connect(FT.m_flow, m_flow_) annotation (Line(points={{-27.2,-15.9},{-27.2,-36},{64,-36},{64,70},{110,70}}, color={0,0,127}));
  annotation (                                                   Diagram(coordinateSystem(
                                     extent={{-100,-120},{100,120}})), Icon(coordinateSystem(grid={
            1,1}),                                                          graphics={Bitmap(
          extent={{-42,-50},{45,52}},
          imageSource="iVBORw0KGgoAAAANSUhEUgAAAJ4AAAE/CAMAAACAbIq2AAABAlBMVEX/////7AD/zAD/zgD/ywD/yAD/7gD/0AD/xwD/xAD/1AD/0gD/wgD/wAD//vT/1gD/vAD/3AD/4AD/ugD/4QD/113/5QD/tgD/sgD///v/+tD//vj/7jz/rwD//OH/8Wv/84X/+9r/8Fr/9qf//e///Oj/70r/9Zz/97L/9JD/+Lz/+cX/8bP/+Lv/8GP/8nX/7S7/9In/9qD/6S//6Vf/8nv/+9P/63r/4Sn/7Zf/4FP/2ij/43X/9qz/7jb/5ZP/1k3/6rH/56L/7sL/3oH/2W//ySj/0mH/4Zv/zEr/24r/6bv/1nn/7sz/xjb/z2z/yVj/3qb/wUP/79X/uSz/yncQEM68AAAKi0lEQVR4nM2da1cbRxKGNQgkBGgkkIwGaUWIw4RkV+wmMSzmkgVFwcZgbGOc//9XIjEzPX2parw+Ur/1fvInn+e81dRFU9NTqcxRO9/P83+bu37fRRN4FQ3QBD71IzSBVy9F46XRj2gEn46j79AIHg2iaA/N4NFBFB2gGTyKougnNAOvwynev9AQvH6Z4smtaf0pXbSPpmD1cnuKt4Om4JTO6OQWjeMZ3i9oCk6DJ/PE1rSDJzyxNW37Ce9XNAajwwzvNzQHo1cZntCa1t/O8ITWtJcZndCalubmCa1pxwWeyJo22C7w0CSkDgo6mTVNmfcSTULpUOH9B41C6VVBF/2MRiHUV+ZFP6BZCB2VeIdoFlezlFzg9dEwro5Lukjej3sDzTyBNe1Ax0PDuNLp5OEd6nj/Q9M4eqXjiatp/a6OJ66mHRlHT1pNSw3zxNW0k20D759oHlMDk05aTTu18ITVtIxuu1bgxWggQ6Ou5R4ayFSWkruRTLw8JZex/QeayNCRHVtRNS3tdq3YHqORdJ10M5V4kmpavJXRlUcv+h3NpOk0N688eqJqWteJbfRfNFOpkRvbKEVDlXrtxlZQTevn5m1pdIKKxlGO161JxEsLOv3oyalpJ1u59KP3bzRVoUFBZxw9MTXttKAzjp6YJYwtKrZiatqIjK2YB1avydhKqWn9MrYGnpCadkTHVshiYbrJ4KHBMp0wsZWBNyjNM9KKkCWMUy62MpYwtkqZsd1Dk800UuZtWkdPRE1TKXlr04ytiCWM/iYXWxE17YyNrYQljHSzlJlWRNS0Ew3PohOwhBFrdPbRE1A0Tj2xFbCEsemJLb6mjXyxxde013psbTz4YmHfF1v8YuGZjmebB69pekre7Dp46Jqmp2QnrcBrmp6SiaOHXsLQU7KbVuBFwzDPSStovNEzsQXXtNcGnmse9oFVv+VPK+AlDCMlE2kFW9PS1jOxxdY0IyVTaQW6WBib5hFpBbqEcWrgtVw47BLGpinCPGRNG5nmEWkFWjTODe/I2ALxzJRMxxa4WHjWMkSlFWBN2zXpWkTJQNa0CwuPPHqwJYzYoiOPHm6x8NSOLYkHq2kWHR1bWE0bfVVsYTXt3MIj0wpsCaO/9jVpBVY0rJTcatHmgfBS2zwmtqAlDDslM2kFVNNi2zwmrYCWME5tPCatgGqa7R3diUagJYzR18YWs1h47uAx5kGWMPrrFtwak1YwNe3MNm+NSSuQmpba5rXWODpE0bhwTh6XVhB48fqaLTa2gJp26eCtc94hFgsd79bYtAKoaSM3tmxaASxhnDt060wnGgFq2sQ1j49t+AdWZy4en1aC17S0TsSWxwu9hHHhmsenleCLhbFrnu/ohS4abkpeW+c6UQDeOiFPbH/ciRcn90frUd2l47uVBcv95fCcMM+TVhYrh25CmFf3pJWFys34Z9TRA9G5yzu7VUGxddfaLgTF1h1QY8q8OgSOanMvCfPWfSVjgSIGQOrvos53oosUsfc0rtZdVflOdIGifpU7J+jqmLRCPIOdUObVIWmFmhCuKLoqIq1Qy567pHmQtEJ14BckHSKtUIsn8RIZW18nuiCRj68vydhWg8MxPxjSJw/QiZI/pZMpuV7dqs1ffjp6245MyYvQc5mK3EOdLFdtZf9Z8Y+56ZkqtEead+XQfaOeNe+ZVEDS7brmLUp+OvoXm+tgdP72jN45icOZ5/WO+cnhMhiev/9hfitcCkW35PWOee1jHMq8JX+DwbwQVQ3l3rLXPObRJpGSFyO/edxD/6vlJVZzxVv21jPm0WG6wtN9q2jzvO0P98bMtce8ucprHvcuWbwA82jVfeZx27uXwczzNQPsDmAouiVfM8A+dR2vLM9PXvN8zQD77Ob6xRy15AP00AV6qrnkcdbTDARafN5d5elWeO9CrZr84TnHnnoWagnrxTeZF+w9rW8zL9QbjPf80Vvh69leILrKJeveime4DUVXueLxePOC7WQP2Niu8PUs3NsKEx6PbwaC0VX+XF1htMzSBdwyecPRrbLNQMALA/YbHN4Ka17AqzTGbGzZZiDkUuw1i8d5F3RdnD15bD0LuXS6yx29Vc68oHct/MHEdpUbbsPeQvKCwWtw9Szse5+cedxwG/btsXvm6K0y5gXe171prJLimoHAW39XNF2DaQYC78MOGPOYZiD0K7MTGq/BNAOhX1L4k3GPpgv++s4bEq9BNwPBb/jY36BjS//VBr/7ZkybRzcDe6HpKtc0Hm1ecLoKHVq6GQj/Nm+60SC0IeU99zGJRzcD4ekqb2nzKDzEhVqkeWQ9Q1w1d0/hbZDNAOISxhsKj6xnkNcp31HmUfUM8qLxTpM6epR5kFfwJ0RsSfMwt/TdUkePoAPdX/mGMI9qBjA3BsVtAo84eKB7R+7cv4wN4pdu1Cck3rtHr0k0A6hLe4nQEs0A6jrr1I1t020GYBcIjpsbtohmAHYN2VuHruk2A7gvSrnmuc0A7m7Ix7ZjnvvLAO7W1BvHPbee7cHoKu9svKbbDODodpzYbjh0wLsN7228ptMMIG/9vHVi66Q85B3vHyy8ptMMIK9ijttNU23bO+gl5Xc2nvNLN/STNO8tvLbdDGC/xL5hmWc3A9irhFPbPLsZwH5Bb2zh2c0A+H73tyZe22oG0F8+sOjsega+P/2xY+JZzQD6U9g31tEz6eAfH3xn4LWtZgD9uZedTrtUs23VM/iHkO51vHbbbAbwn1O5Neg6pnn4r4h/MPDMZgD/LeLYiG3HaAbwoa3cGXjmGpeAb0i91/E6RjOwh2abqqmbZw63aLSp9nu6eUYzgLwVv9BYj63RDGC/F5Hro4bXMZoB/NfBpjKSnk6H/ojPkx61o9fRmwH8561metBjq5sn42Omn0q8jt4MYCdHJd08zTvs5Kh0Xx69jt4MCPn2+m2vU6inNQPoL4MV+qDoOlozgJ4cC8W0eeDJUWlS4mnNAHpyVHqv8HplMwCfHJXayjxtuEVPjkr7pXllMwCfHJXuFF7ZDAgYLwp9LPB6ZTOAnxyVyqSn6PCTo9JjUphXNgNoJk0PKrbqr1bA5Kj0KcfrqWYA85kDRso8Vc/QRLruk14m1QxImByVbnK6pDBPxOSo9DnHa0gMbWWQxzYpmgERk6PSJMcr6hngnnmfbvPYFs2AjMlR6UtGV9QzIZNjof0stkneDAiZHJXu8qNXEzU5Kn3M6PJmAPLZGZ/yPwxZk6NSmsU2bwakTI5KD4lWz8RMjkqfZnhJ9thbzuSopJsnZnJUekzKZkDO5Kh0k6hmQNDkqPR5ipdkzYCk8SLXznBm3lMzAP2cNKNZH590pIa2cpsUzQDiM2DP6kvSS56aAVGTY6F4mCTJUzOAJiF1N8MTNzkq/TWlmzUDsiZHpV6SDGfmiXjm6Cidxnb2y4CsyVHpYWretBkQNjkqfUqS2WNvYZOj0jAZdmvSJkelx+GsGZA2OSrdDIfTZkDa5Kj0eVbPxE2OhXaGw1ZN3OSodD9MavImR6Xb4XqN+nSDEH0Z1kJfo/J/KB5Wa/ImR6W7ocTJUemvhsjxotBwW9AzR0dpW+LkqPSwhSbw6p3M8aLQBRrAq11QD/o3G6lkrUFvFrcAAAAASUVORK5CYII=",
          fileName="modelica://MultiEnergySystem/../../../../../Users/muro/Downloads/light2.png")}));
end ElectricBoiler;
