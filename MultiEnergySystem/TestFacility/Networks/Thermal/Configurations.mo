within MultiEnergySystem.TestFacility.Networks.Thermal;
package Configurations
  package BaseClass

    partial model CentralizedNetworkBase
       extends Plants.Thermal.Configurations.BaseClass.CentralPlantBase;
       extends Loads.Thermal.Configurations.BaseClass.LoadPlantBase;
      inner DistrictHeatingNetwork.System system annotation (Placement(visible=true,
            transformation(
            origin={889,309},
            extent={{-10,-10},{10,10}},
            rotation=0)));
    equation
      connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
          Line(
          points={{98,-48},{98,38},{14,38},{14,205},{60,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet)
        annotation (Line(
          points={{138,-48},{138,58},{42,58},{42,265},{90,265}},
          color={140,56,54},
          thickness=0.5));
      connect(PL731_rackL6L7_TT732.inlet, rackL6L7_FCVC02_hot.inlet) annotation (
          Line(
          points={{258,-50},{256,-50},{256,60},{618,60},{618,205},{640,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL731_FT731_rackL6L7.outlet, rackL6L7_FCVC02_cold.outlet) annotation (
         Line(
          points={{298,-50},{298,38},{636,38},{636,265},{650,265}},
          color={140,56,54},
          thickness=0.5));
      connect(PL711_rackL3L4_TT712.inlet, rackL3L4_FCVC01_hot.inlet) annotation (
          Line(
          points={{398,-46},{398,80},{152,80},{152,205},{180,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL711_FT711_rackL3L4.outlet, rackL2L3_rackL3L4_cold.inlet)
        annotation (Line(
          points={{438,-46},{438,112},{170,112},{170,265},{110,265}},
          color={140,56,54},
          thickness=0.5));
      connect(PL721_rackL4L5_TT722.inlet, rackL4L5_rackL5L6_hot.inlet) annotation (
          Line(
          points={{558,-46},{558,132},{330,132},{330,205},{400,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL721_FT721_rackL4L5.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
          Line(
          points={{598,-46},{598,158},{358,158},{358,264},{354,264},{354,265},{330,
              265}},
          color={140,56,54},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end CentralizedNetworkBase;

    partial model CentralizedNetworkBaseLoadSimplified
       extends Plants.Thermal.Configurations.BaseClass.CentralPlantBase(
        rackL2L3_rackL3L4_hot(q_m3h_start=q_m3h_rackHot*3/4),
        rackL3L4_FCVC01_hot(q_m3h_start=q_m3h_rackHot/2),
        FCVC01_rackL4L5_hot(q_m3h_start=q_m3h_rackHot/2),
        rackL4L5_rackL5L6_hot(q_m3h_start=q_m3h_rackHot/4),
        rackL2L3_rackL3L4_cold(q_m3h_start=q_m3h_rackCold*3/4),
        rackL3L4_FCVC01_cold(q_m3h_start=q_m3h_rackCold/2),
        rackL5L6_rackL6L7_hot(q_m3h_start=q_m3h_rackHot/4),
        rackL4L5_rackL5L6_cold(q_m3h_start=q_m3h_rackCold/4),
        rackL5L6_rackL6L7_cold(q_m3h_start=q_m3h_rackCold/4),
        FCVC01_rackL4L5_cold(q_m3h_start=q_m3h_rackCold/2),
        rackL6L7_FCVC02_hot(q_m3h_start=q_m3h_rackHot/4),
        FCVC02(q_m3h_start=q_m3h_rackHot/4));
       extends Loads.Thermal.Configurations.BaseClass.LoadPlantBaseSimplified;
      inner DistrictHeatingNetwork.System system annotation (Placement(visible=true,
            transformation(
            origin={889,309},
            extent={{-10,-10},{10,10}},
            rotation=0)));
    equation
      connect(PL701_rackL2L3_TT702.inlet, rackL2L3_rackL3L4_hot.inlet) annotation (
          Line(
          points={{100,-40},{100,38},{14,38},{14,205},{60,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL701_FT701_rackL2L3.outlet, rackL2L3_rackL3L4_cold.outlet)
        annotation (Line(
          points={{140,-40},{140,58},{42,58},{42,265},{90,265}},
          color={140,56,54},
          thickness=0.5));
      connect(PL731_rackL6L7_TT732.inlet, rackL6L7_FCVC02_hot.inlet) annotation (
          Line(
          points={{260,-40},{256,-40},{256,60},{618,60},{618,205},{640,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL731_FT731_rackL6L7.outlet, rackL6L7_FCVC02_cold.outlet) annotation (
         Line(
          points={{300,-40},{300,38},{636,38},{636,265},{650,265}},
          color={140,56,54},
          thickness=0.5));
      connect(PL711_rackL3L4_TT712.inlet, rackL3L4_FCVC01_hot.inlet) annotation (
          Line(
          points={{420,-40},{420,80},{152,80},{152,205},{180,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL711_FT711_rackL3L4.outlet, rackL2L3_rackL3L4_cold.inlet)
        annotation (Line(
          points={{460,-40},{460,112},{170,112},{170,265},{110,265}},
          color={140,56,54},
          thickness=0.5));
      connect(PL721_rackL4L5_TT722.inlet, rackL4L5_rackL5L6_hot.inlet) annotation (
          Line(
          points={{580,-40},{580,132},{330,132},{330,205},{400,205}},
          color={140,56,54},
          thickness=0.5));
      connect(PL721_FT721_rackL4L5.outlet, FCVC01_rackL4L5_cold.inlet) annotation (
          Line(
          points={{620,-40},{620,158},{358,158},{358,264},{354,264},{354,265},{330,265}},
          color={140,56,54},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end CentralizedNetworkBaseLoadSimplified;

  end BaseClass;

  package Centralised

    partial model CentralizedSystemI
      "System with only Gas Boiler as source of heat"
      extends BaseClass.CentralizedNetworkBase;
      // System S100

      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1=1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1=1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1=30 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1=30 + 273.15;

      parameter DistrictHeatingNetwork.Types.Length L_S1=10;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL1=0.4;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL2=0.8;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL3=1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL4=0.7;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold=3.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot=3.5;
      parameter DistrictHeatingNetwork.Types.Length Di_S1=51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S1=1.5e-3;

      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1=m_flow_total;
      parameter Real q_m3h_S1 = 9;

      parameter Real P101omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P101qm3h[:,:] = [0, 7.5; 100, 7.5];

      parameter Real FCV101theta[:,:] = [0, 1];
      parameter Real GB101_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P101(
        Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start,
        Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start,
        a=DistrictHeatingNetwork.Data.PumpData.P101.a,
        b=DistrictHeatingNetwork.Data.PumpData.P101.b,
        m_flow_start=m_flow_total,
        dpnom=DistrictHeatingNetwork.Data.PumpData.P101.dpnom,
        etaelec=DistrictHeatingNetwork.Data.PumpData.P101.etaelec,
        etamech=DistrictHeatingNetwork.Data.PumpData.P101.etamech,
        etanom=DistrictHeatingNetwork.Data.PumpData.P101.etanom,
        hin_start=DistrictHeatingNetwork.Data.PumpData.P101.hin_start,
        m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom,
        omeganom=DistrictHeatingNetwork.Data.PumpData.P101.omeganom,
        pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start,
        pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start,
        qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h,
        rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom,
        headnom=DistrictHeatingNetwork.Data.PumpData.P101.headnom,
        headmax=DistrictHeatingNetwork.Data.PumpData.P101.headnommax,
        headmin=DistrictHeatingNetwork.Data.PumpData.P101.headnommin,
        qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h,
        qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h)
                         annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=90,
            origin={-240,-175})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom,
        q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h,
        Tin_start(displayUnit="K") = Tout_start_S1,
        pin_start=pout_start_S1,
        q_m3h_start=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h)
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-140})));

      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S101(
        L=L_S1_PL3,
        t=t_S1,
        pin_start=pout_start_S1,
        Tin_start=Tout_start_S1,
        Tout_start=Tout_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-230})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S101(
        L=L_S1_PL2,
        t=t_S1,
        pin_start=pin_start_S1,
        Tin_start=Tin_start_S1,
        Tout_start=Tin_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-276,-232})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S101(
        L=L_S1_PL3,
        t=t_S1,
        pin_start=pout_start_S1,
        Tin_start=Tout_start_S1,
        Tout_start=Tout_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-106})));
      DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB101(
        Tin_start=Tin_start_S1,
        pin_start=pin_start_S1,
        pout_start=pout_start_S1,
        Tout_start=Tout_start_S1,
        HH=55.5e6) annotation (Placement(visible=true, transformation(
            origin={-257,-301},
            extent={{-35,-35},{35,35}},
            rotation=0)));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(T_start=
            Tout_start_S1, p_start=pout_start_S1)
        "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=-90,
            origin={-238,-72})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102
        "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
            transformation(
            extent={{6,6},{-6,-6}},
            rotation=90,
            origin={-238,-84})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101
        "Pressure sensor at the inlet of gas boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-278,-130})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(T_start=
            Tin_start_S1, p_start=pin_start_S1)
        "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-278,-94})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start=Tin_start_S1,
          p_start=pin_start_S1) annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=90,
            origin={-279,-195})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S101(
        L=L_S1_PL1,
        t=t_S1,
        pin_start=pin_start_S1,
        Tin_start=Tin_start_S1,
        Tout_start=Tin_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-276,-160})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(
        L=L_S1_rCD_hot,
        t=t_S1,
        pin_start=pout_start_S1,
        Tin_start=Tout_start_S1,
        Tout_start=Tout_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-40})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(
        L=L_S1_rCD_cold,
        t=t_S1,
        pin_start=pin_start_S1,
        Tin_start=Tin_start_S1,
        Tout_start=Tin_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-276,-40})));
    equation
      connect(P101.inlet,PL3_S101. outlet) annotation (Line(
          points={{-240,-184.6},{-240,-220}},
          color={140,56,54},
          thickness=0.5));
      connect(FCV101.inlet,P101. outlet) annotation (Line(
          points={{-240,-150},{-240,-165.4}},
          color={140,56,54},
          thickness=0.5));
      connect(TT102.inlet,PT102. inlet) annotation (Line(
          points={{-240.4,-72},{-240.4,-84}},
          color={140,56,54},
          thickness=0.5));
      connect(PL4_S101.inlet,FCV101. outlet) annotation (Line(
          points={{-240,-116},{-240,-130}},
          color={140,56,54},
          thickness=0.5));
      connect(PT102.inlet,PL4_S101. outlet) annotation (Line(
          points={{-240.4,-84},{-240.4,-93},{-240,-93},{-240,-96}},
          color={140,56,54},
          thickness=0.5));
      connect(FT101.outlet,PL2_S101. inlet) annotation (Line(
          points={{-276.2,-199.2},{-276.2,-201.6},{-276,-201.6},{-276,-222}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S101.outlet,FT101. inlet) annotation (Line(
          points={{-276,-170},{-276,-177.4},{-276.2,-177.4},{-276.2,-190.8}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S101.inlet,PT101. inlet) annotation (Line(
          points={{-276,-150},{-276,-130},{-275.6,-130}},
          color={140,56,54},
          thickness=0.5));
      connect(PT101.inlet,TT101. inlet) annotation (Line(
          points={{-275.6,-130},{-275.6,-94}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_rCD_hot.inlet,TT102. inlet) annotation (Line(
          points={{-240,-50},{-240,-72},{-240.4,-72}},
          color={140,56,54},
          thickness=0.5));
      connect(TT101.inlet,PL_S100_rCD_cold. outlet) annotation (Line(
          points={{-275.6,-94},{-275.6,-89},{-276,-89},{-276,-50}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
          Line(
          points={{-276,-30},{-276,5.25},{-326.5,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(PL2_S101.outlet,GB101. inlet) annotation (Line(
          points={{-276,-242},{-276,-254},{-267.5,-254},{-267.5,-273}},
          color={140,56,54},
          thickness=0.5));
      connect(PL3_S101.inlet,GB101. outlet) annotation (Line(
          points={{-240,-240},{-240,-254},{-246.5,-254},{-246.5,-273}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (Line(
          points={{-240,-30},{-242,-30},{-242,44.75},{-257.5,44.75}},
          color={140,56,54},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end CentralizedSystemI;

    partial model CentralizedSystemI_B
      extends CentralizedSystemI;

      // System 400
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4=1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4=1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4=70 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4=80 + 273.15;

      parameter DistrictHeatingNetwork.Types.Length L_S4_PL1=0.82;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL2=0.47;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL3=1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL4=1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold=5.5;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot=6;

      parameter DistrictHeatingNetwork.Types.Length Di_S4=51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S4=1.5e-3;

      parameter Real q_m3h_S4 = 5;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;

      parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P401qm3h[:,:] = [0, 5; 100, 5];
      parameter Real FCV401theta[:,:] = [0, 1; 100, 1];
      parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
      parameter Boolean FV401_state = true;
      parameter Boolean FV402_state = true;

      DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(
        Tout_start=Tout_start_S4,
        D=0.4,
        Pmaxnom=50e3,
        Pnimnom=10e3,
        Pnom=50e3,
        Tin_start=Tin_start_S4,
        etanom=0.98,
        h=1.25,
        m_flow_nom=m_flow_S4,
        pin_start=pin_start_S4,
        pout_start=160000,
        nR=5) annotation (Placement(visible=true, transformation(
            origin={-337,-301},
            extent={{-35,-35},{35,35}},
            rotation=0)));
      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P401(
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
        qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
        rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
        headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
        headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
        headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
        qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
        qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h)
                         annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=90,
            origin={-318,-171})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
        rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
        q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
        Tin_start(displayUnit="K") = Tout_start_S4,
        pin_start=pout_start_S4,
        q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-136})));

      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
        L=L_S4_PL3,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-232})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
        L=L_S4_PL2,
        t=t_S4,
        m_flow_start=m_flow_S4,
        pin_start=pin_start_S4,
        pout_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-358,-234})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
        L=L_S4_PL3,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-108})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start=
            Tout_start_S4, p_start=pout_start_S4)
        "Temperature sensor at the outlet of valve FCV401" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=-90,
            origin={-316,-70})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402
        "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
            transformation(
            extent={{6,6},{-6,-6}},
            rotation=90,
            origin={-316,-82})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401
        "Pressure sensor at the inlet of gas boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-360,-114})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start=
            Tin_start_S4, p_start=pin_start_S4)
        "Temperature sensor at the inlet of electrib boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-360,-102})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start=Tin_start_S4,
          p_start=pin_start_S4) annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=90,
            origin={-361,-191})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
        L=L_S4_PL1,
        t=t_S4,
        pin_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-358,-162})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
        L=L_S4_rCD_hot,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-48})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
        L=L_S4_rCD_cold,
        t=t_S4,
        pin_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-358,-50})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        Tin_start=Tin_start_S4,
        pin_start=pin_start_S4,
        q_m3h_start=q_m3h_S4) "On-Off valve connecting inlet S400 & S900 "
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={-358,-16})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        Tin_start=Tout_start_S4,
        pin_start=pout_start_S4,
        q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-16})));
    equation
      connect(P401.inlet,PL3_S401. outlet) annotation (Line(
          points={{-318,-180.6},{-318,-222}},
          color={140,56,54},
          thickness=0.5));
      connect(FCV401.inlet,P401. outlet) annotation (Line(
          points={{-318,-146},{-318,-161.4}},
          color={140,56,54},
          thickness=0.5));
      connect(TT402.inlet,PT402. inlet) annotation (Line(
          points={{-318.4,-70},{-318.4,-82}},
          color={140,56,54},
          thickness=0.5));
      connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
          points={{-318,-118},{-318,-126}},
          color={140,56,54},
          thickness=0.5));
      connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
          points={{-318.4,-82},{-318.4,-91},{-318,-91},{-318,-98}},
          color={140,56,54},
          thickness=0.5));
      connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
          points={{-358.2,-195.2},{-358.2,-203.6},{-358,-203.6},{-358,-224}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
          points={{-358,-172},{-358,-179.4},{-358.2,-179.4},{-358.2,-186.8}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
          points={{-358,-152},{-358,-114},{-357.6,-114}},
          color={140,56,54},
          thickness=0.5));
      connect(PT401.inlet,TT401. inlet) annotation (Line(
          points={{-357.6,-114},{-357.6,-102}},
          color={140,56,54},
          thickness=0.5));
      connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
          points={{-326.5,-273},{-326.5,-256},{-318,-256},{-318,-242}},
          color={140,56,54},
          thickness=0.5));
      connect(TT402.inlet,PL_S400_rCD_hot. inlet) annotation (Line(
          points={{-318.4,-70},{-318,-70},{-318,-58}},
          color={140,56,54},
          thickness=0.5));
      connect(TT401.inlet,PL_S400_rCD_cold. outlet) annotation (Line(
          points={{-357.6,-102},{-358,-102},{-358,-60}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (Line(
          points={{-358,-40},{-358,-26}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (Line(
          points={{-318,-38},{-318,-26}},
          color={140,56,54},
          thickness=0.5));
      connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
          points={{-358,-6},{-358,5.25},{-408.5,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
          points={{-318,-6},{-318,45},{-338,45}},
          color={140,56,54},
          thickness=0.5));
      connect(PL2_S401.outlet, EB401.inlet) annotation (Line(
          points={{-358,-244},{-358,-258},{-347.5,-258},{-347.5,-273}},
          color={140,56,54},
          thickness=0.5));
    end CentralizedSystemI_B;

    partial model CentralizedSystemII
      extends BaseClass.CentralizedNetworkBase;

      // System 400
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4=1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4=1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4=17 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4=16 + 273.15;

      parameter DistrictHeatingNetwork.Types.Length L_S4_PL1=0.82;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL2=0.47;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL3=1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL4=1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold=5.5;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot=6;

      parameter DistrictHeatingNetwork.Types.Length Di_S4=51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S4=1.5e-3;

      parameter Real q_m3h_S4 = 9;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/
          3600;

      parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P401qm3h[:,:] = [0, 7.5; 100, 7.5];
      parameter Real FCV401theta[:,:] = [0, 1];
      parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
      parameter Boolean FV401_state = true;
      parameter Boolean FV402_state = true;

      DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(
        Tout_start=Tout_start_S4,
        D=0.4,
        Pmaxnom=50e3,
        Pnimnom=10e3,
        Pnom=50e3,
        Tin_start=Tin_start_S4,
        etanom=0.98,
        h=1.25,
        m_flow_nom=m_flow_S4,
        pin_start=pin_start_S4,
        pout_start=160000,
        nR=0) annotation (Placement(visible=true, transformation(
            origin={-342,-322},
            extent={{-34,-34},{34,34}},
            rotation=0)));
      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P401(
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
        qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
        rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
        headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
        headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
        headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
        qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
        qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h)
        annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=90,
            origin={-322,-195})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
        rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
        q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
        Tin_start(displayUnit="K") = Tout_start_S4,
        pin_start=pout_start_S4,
        q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-322,-160})));

      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
        L=L_S4_PL3,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-322,-256})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
        L=L_S4_PL2,
        t=t_S4,
        m_flow_start=m_flow_S4,
        pin_start=pin_start_S4,
        pout_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-362,-258})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
        L=L_S4_PL3,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-322,-132})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start=
            Tout_start_S4, p_start=pout_start_S4)
        "Temperature sensor at the outlet of valve FCV401" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=-90,
            origin={-320,-94})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402
        "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
            transformation(
            extent={{6,6},{-6,-6}},
            rotation=90,
            origin={-320,-106})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401
        "Pressure sensor at the inlet of gas boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-364,-138})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start=
            Tin_start_S4, p_start=pin_start_S4)
        "Temperature sensor at the inlet of electrib boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-364,-126})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start=Tin_start_S4,
          p_start=pin_start_S4) annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=90,
            origin={-365,-215})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
        L=L_S4_PL1,
        t=t_S4,
        pin_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-362,-186})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
        L=L_S4_rCD_hot,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-322,-72})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
        L=L_S4_rCD_cold,
        t=t_S4,
        pin_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-362,-74})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        Tin_start=Tin_start_S4,
        pin_start=pin_start_S4,
        q_m3h_start=q_m3h_S4) "On-Off valve connecting inlet S400 & S900 "
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={-362,-40})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        Tin_start=Tout_start_S4,
        pin_start=pout_start_S4,
        q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-322,-40})));
    equation
      connect(P401.inlet,PL3_S401. outlet) annotation (Line(
          points={{-322,-204.6},{-322,-246}},
          color={140,56,54},
          thickness=0.5));
      connect(FCV401.inlet,P401. outlet) annotation (Line(
          points={{-322,-170},{-322,-185.4}},
          color={140,56,54},
          thickness=0.5));
      connect(TT402.inlet,PT402. inlet) annotation (Line(
          points={{-322.4,-94},{-322.4,-106}},
          color={140,56,54},
          thickness=0.5));
      connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
          points={{-322,-142},{-322,-150}},
          color={140,56,54},
          thickness=0.5));
      connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
          points={{-322.4,-106},{-322.4,-115},{-322,-115},{-322,-122}},
          color={140,56,54},
          thickness=0.5));
      connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
          points={{-362.2,-219.2},{-362.2,-227.6},{-362,-227.6},{-362,-248}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
          points={{-362,-196},{-362,-203.4},{-362.2,-203.4},{-362.2,-210.8}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
          points={{-362,-176},{-362,-138},{-361.6,-138}},
          color={140,56,54},
          thickness=0.5));
      connect(PT401.inlet,TT401. inlet) annotation (Line(
          points={{-361.6,-138},{-361.6,-126}},
          color={140,56,54},
          thickness=0.5));
      connect(PL2_S401.outlet,EB401. inlet) annotation (Line(
          points={{-362,-268},{-362,-278},{-352.2,-278},{-352.2,-294.8}},
          color={140,56,54},
          thickness=0.5));
      connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
          points={{-331.8,-294.8},{-331.8,-278},{-322,-278},{-322,-266}},
          color={140,56,54},
          thickness=0.5));
      connect(TT402.inlet,PL_S400_rCD_hot. inlet) annotation (Line(
          points={{-322.4,-94},{-322,-94},{-322,-82}},
          color={140,56,54},
          thickness=0.5));
      connect(TT401.inlet,PL_S400_rCD_cold. outlet) annotation (Line(
          points={{-361.6,-126},{-362,-126},{-362,-84}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (Line(
          points={{-362,-64},{-362,-50}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (Line(
          points={{-322,-62},{-322,-50}},
          color={140,56,54},
          thickness=0.5));
      connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
          points={{-362,-30},{-362,5.25},{-408.5,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
          points={{-322,-30},{-322,46},{-320,46},{-320,45},{-338,45}},
          color={140,56,54},
          thickness=0.5));
    end CentralizedSystemII;

    partial model CentralizedSystemIII
      extends BaseClass.CentralizedNetworkBase;

     // S200

      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2=2.1e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2=2.5e5;
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_pump=1.79e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_pump=3e5;
      final parameter DistrictHeatingNetwork.Types.Pressure pin_start_S2_tank=
          pout_start_S2_pump;
      final parameter DistrictHeatingNetwork.Types.Pressure pout_start_S2_tank=
          pin_start_S2_tank - 9.81*4*990;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S2=60 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S2=60 + 273.15;
      parameter DistrictHeatingNetwork.Types.Length L_S2=10;
      parameter DistrictHeatingNetwork.Types.Length Di_S2=51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S2=1.5e-3;
      parameter Real q_m3h_S2(unit = "m3/h") = 6;
      final parameter DistrictHeatingNetwork.Types.VolumeFlowRate q=q_m3h_S2/3600;
      final parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S2=q*985;
      parameter Real P201omega[:,:] = [0, 2*3.141592654*40; 100, 2*3.141592654*40];
      parameter Real P201qm3h[:,:] = [0, 2.8289046; 100, 2.8289046];

      parameter Real FCV201theta[:,:] = [0, 0.5; 100, 0.5; 105, 0.5; 200, 0.5];

      // Pipe length System S200
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL0=24.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL1=1.7;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL2=1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL3=2.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL4=1.0;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL5=2.8;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL6=2.8;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL7=2;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL8=3;
      parameter DistrictHeatingNetwork.Types.Length L_S2_PL9=21.5;

      parameter DistrictHeatingNetwork.Types.Length L_S2_S201_S202=2.5;
      parameter DistrictHeatingNetwork.Types.Length h_S2_S201_S202=0;
      parameter DistrictHeatingNetwork.Types.Length L_S2_Tanks_High=2.5;
      parameter DistrictHeatingNetwork.Types.Length h_S2_Tanks_High=-2.5;
      parameter DistrictHeatingNetwork.Types.Length L_S2_S201_FT201=1;
      parameter DistrictHeatingNetwork.Types.Length h_S2_S201_FT201=0;
      parameter DistrictHeatingNetwork.Types.Length L_S2_D201_FT201=2;
      parameter DistrictHeatingNetwork.Types.Length h_S2_D201_FT201=0;
                  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D201(
        H=4,
        n=3,
        D=1.7,
        T_start(displayUnit="K") = 60 + 273.15,
        pin_start=pin_start_S2_tank,
        m_flow_start=m_flow_S2/2)
        annotation (Placement(transformation(extent={{-770,-474},{-826,-362}})));
      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P201(
        pout_start(displayUnit="Pa") = 3e5,
        Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P201.Tin_start,
        Tout_start=DistrictHeatingNetwork.Data.PumpData.P201.Tout_start,
        a=DistrictHeatingNetwork.Data.PumpData.P201.a,
        b=DistrictHeatingNetwork.Data.PumpData.P201.b,
        m_flow_start=m_flow_S2,
        dpnom=DistrictHeatingNetwork.Data.PumpData.P201.dpnom,
        etaelec=DistrictHeatingNetwork.Data.PumpData.P201.etaelec,
        etamech=DistrictHeatingNetwork.Data.PumpData.P201.etamech,
        etanom=DistrictHeatingNetwork.Data.PumpData.P201.etanom,
        hin_start=DistrictHeatingNetwork.Data.PumpData.P201.hin_start,
        m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P201.m_flow_nom,
        omeganom=DistrictHeatingNetwork.Data.PumpData.P201.omeganom,
        pin_start(displayUnit="Pa") = 1.8400803e5,
        headnom=DistrictHeatingNetwork.Data.PumpData.P201.headnom,
        qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P201.qnom_inm3h,
        rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P201.rhonom,
        headmax=DistrictHeatingNetwork.Data.PumpData.P201.headnommax,
        headmin=DistrictHeatingNetwork.Data.PumpData.P201.headnommin,
        qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P201.qnommin_inm3h,
        qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P201.qnommax_inm3h,
        use_q_m3hr=true) annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=-90,
            origin={-802,-206})));

                  DistrictHeatingNetwork.Components.Storage.StratifiedStorage D202(
        H=4,
        n=3,
        D=1.7,
        T_start(displayUnit="K") = 60 + 273.15,
        pin_start=pin_start_S2_tank,
        m_flow_start=m_flow_S2/2)
        annotation (Placement(transformation(extent={{-708,-474},{-652,-362}})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT201(T_start=
            Tin_start_S2, p_start=pin_start_S2)
        "Temperature sensor at the inlet of pump 201" annotation (Placement(
            transformation(
            extent={{-4.75,-4.75},{4.75,4.75}},
            rotation=90,
            origin={-803.75,-64.75})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT201
        "Pressure sensor at the inlet of pump 201" annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=90,
            origin={-804,-84.5})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_TT201_FV201(
        L=L_S2_PL1,
        t=t_S2,
        pin_start=pin_start_S2,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-802,-106})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV201(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        Tin_start(displayUnit="K") = Tout_start_S2,
        pin_start=pout_start_S2) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-862,-196})));

      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FCV201_FV202(
        L=L_S2_PL3,
        t=L_S2,
        pin_start=pin_start_S2,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=270,
            origin={-862,-166})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_P201_FV209(
        L=L_S2_PL2,
        t=t_S2,
        pin_start=pout_start_S2_pump,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-802,-238})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_FCV201(
        L=L_S2_PL4,
        t=t_S2,
        pin_start=pin_start_S2,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-862,-226})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT202(T_start=
            Tout_start_S2, p_start=pout_start_S2)
        "Temperature sensor at the outlet of System 200" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=-90,
            origin={-760,-66})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT202
        "Pressure sensor at the outlet of system S200" annotation (Placement(
            transformation(
            extent={{6,6},{-6,-6}},
            rotation=90,
            origin={-760,-136})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_hot(
        L=L_S2_PL9,
        t=t_S2,
        pin_start=pout_start_S2,
        Tin_start=Tout_start_S2,
        Tout_start=Tout_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-762,-46})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D202_High(
        L=L_S2_Tanks_High,
        h=h_S2_Tanks_High,
        t=t_S2,
        pin_start=pout_start_S2_pump,
        Tin_start=Tout_start_S2,
        Tout_start=Tout_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2/2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-722,-410})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_rCD_cold(
        L=L_S2_PL0,
        t=t_S2,
        pin_start=pin_start_S2,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-802,-46})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_High(
        L=L_S2_Tanks_High,
        h=h_S2_Tanks_High,
        t=t_S2,
        pin_start=pout_start_S2_pump,
        Tin_start=Tout_start_S2,
        Tout_start=Tout_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2/2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=90,
            origin={-756,-410})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_High(
        L=L_S2_S201_S202,
        h=h_S2_S201_S202,
        t=t_S2,
        pin_start=pout_start_S2_pump,
        Tin_start=Tout_start_S2,
        Tout_start=Tout_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2/2) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=0,
            origin={-738,-438})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_D202_Low(
        L=L_S2_S201_S202,
        h=h_S2_S201_S202,
        t=t_S2,
        pin_start=pout_start_S2_pump,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={-738,-454})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV209_D201(
        L=L_S2_PL6,
        t=t_S2,
        pin_start=pout_start_S2_pump,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={-830,-488})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_D201_FT201(
        L=L_S2_D201_FT201,
        h=h_S2_D201_FT201,
        t=t_S2,
        pin_start=pout_start_S2_pump,
        Tin_start=Tout_start_S2,
        Tout_start=Tout_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=0,
            origin={-842,-438})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S200_FV201_P201(
        L=L_S2_PL1,
        t=t_S2,
        pin_start=pin_start_S2,
        Tin_start=Tin_start_S2,
        Tout_start=Tin_start_S2,
        Di=Di_S2,
        q_m3h_start=q_m3h_S2,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-802,-168})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV202(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        Tin_start(displayUnit="K") = Tout_start_S2,
        pin_start=pout_start_S2) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=0,
            origin={-832,-126})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV201(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        Tin_start(displayUnit="K") = Tout_start_S2,
        pin_start=pout_start_S2) annotation (Placement(transformation(
            extent={{-6,6},{6,-6}},
            rotation=-90,
            origin={-802,-146})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV206(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        Tin_start(displayUnit="K") = Tout_start_S2,
        pin_start=pout_start_S2,
        q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
            extent={{-6,6},{6,-6}},
            rotation=180,
            origin={-782,-184})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV209(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        Tin_start(displayUnit="K") = Tout_start_S2,
        pin_start=pout_start_S2) annotation (Placement(transformation(
            extent={{-6,6},{6,-6}},
            rotation=-90,
            origin={-802,-266})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV207(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        Tin_start(displayUnit="K") = Tout_start_S2,
        pin_start=pout_start_S2,
        q_m3h_start=q_m3h_S2/4) annotation (Placement(transformation(
            extent={{-6,6},{6,-6}},
            rotation=0,
            origin={-782,-252})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV203(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV201.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        Tin_start(displayUnit="K") = Tout_start_S2,
        pin_start=pout_start_S2,
        q_m3h_start=q_m3h_S2) annotation (Placement(transformation(
            extent={{-6,6},{6,-6}},
            rotation=90,
            origin={-762,-216})));

      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT201(T_start=
            Tout_start_S2) "Flow sensor at the outlet of system S200" annotation (
          Placement(transformation(
            extent={{-7,7},{7,-7}},
            rotation=90,
            origin={-759,-277})));
    equation
      connect(PT201.inlet,TT201. inlet) annotation (Line(
          points={{-802,-84.5},{-802,-75.625},{-801.85,-75.625},{-801.85,-64.75}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_TT201_FV201.inlet,PT201. inlet) annotation (Line(
          points={{-802,-96},{-802,-84.5}},
          color={140,56,54},
          thickness=0.5));
      connect(P201.outlet,PL_S200_P201_FV209. inlet) annotation (Line(
          points={{-802,-215.6},{-802,-228}},
          color={140,56,54},
          thickness=0.5));
      connect(TT202.inlet,PT202. inlet) annotation (Line(
          points={{-762.4,-66},{-762.4,-136}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_rCD_hot.inlet,TT202. inlet) annotation (Line(
          points={{-762,-56},{-762,-66},{-762.4,-66}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_rCD_cold.outlet,TT201. inlet) annotation (Line(
          points={{-802,-56},{-802,-67.375},{-801.85,-67.375},{-801.85,-64.75}},
          color={140,56,54},
          thickness=0.5));
      connect(D201.outlet,PL_S200_D201_High. inlet) annotation (Line(
          points={{-770,-383},{-756,-383},{-756,-400}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_D201_D202_High.inlet,PL_S200_D202_High. outlet) annotation (
          Line(
          points={{-728,-438},{-722,-438},{-722,-420}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_D201_D202_High.outlet,PL_S200_D201_High. outlet) annotation (
          Line(
          points={{-748,-438},{-756,-438},{-756,-420}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_D202_High.inlet,D202. outlet) annotation (Line(
          points={{-722,-400},{-722,-383},{-708,-383}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_D201_D202_Low.inlet,D201. inlet) annotation (Line(
          points={{-748,-454},{-764,-454},{-764,-453},{-770,-453}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_D201_D202_Low.outlet,D202. inlet) annotation (Line(
          points={{-728,-454},{-724,-454},{-724,-453},{-708,-453}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_FV209_D201.outlet,D201. inlet) annotation (Line(
          points={{-820,-488},{-756,-488},{-756,-453},{-770,-453}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_FV209_FCV201.outlet,FCV201. inlet) annotation (Line(
          points={{-862,-216},{-862,-206}},
          color={140,56,54},
          thickness=0.5));
      connect(FCV201.outlet,PL_S200_FCV201_FV202. inlet) annotation (Line(
          points={{-862,-186},{-862,-176}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_FV201_P201.outlet,P201. inlet) annotation (Line(
          points={{-802,-178},{-802,-196.4}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_FCV201_FV202.outlet,FV202. inlet) annotation (Line(
          points={{-862,-156},{-862,-126},{-838,-126}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_TT201_FV201.outlet,FV201. inlet) annotation (Line(
          points={{-802,-116},{-802,-140}},
          color={140,56,54},
          thickness=0.5));
      connect(FV201.outlet,PL_S200_FV201_P201. inlet) annotation (Line(
          points={{-802,-152},{-802,-158}},
          color={140,56,54},
          thickness=0.5));
      connect(FV202.outlet,FV201. inlet) annotation (Line(
          points={{-826,-126},{-802,-126},{-802,-140}},
          color={140,56,54},
          thickness=0.5));
      connect(FV206.outlet,P201. inlet) annotation (Line(
          points={{-788,-184},{-802,-184},{-802,-196.4}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_P201_FV209.outlet,FV209. inlet) annotation (Line(
          points={{-802,-248},{-802,-260}},
          color={140,56,54},
          thickness=0.5));
      connect(FV207.inlet,FV209. inlet) annotation (Line(
          points={{-788,-252},{-802,-252},{-802,-260}},
          color={140,56,54},
          thickness=0.5));
      connect(FV207.outlet,FV203. inlet) annotation (Line(
          points={{-776,-252},{-762,-252},{-762,-222}},
          color={140,56,54},
          thickness=0.5));
      connect(FV206.inlet,FV203. outlet) annotation (Line(
          points={{-776,-184},{-762,-184},{-762,-210}},
          color={140,56,54},
          thickness=0.5));
      connect(PT202.inlet,FV203. outlet) annotation (Line(
          points={{-762.4,-136},{-762,-136},{-762,-210}},
          color={140,56,54},
          thickness=0.5));
      connect(FT201.outlet,FV203. inlet) annotation (Line(
          points={{-761.8,-272.8},{-762,-252},{-762,-222}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_FV209_FCV201.inlet,PL_S200_FV209_D201. inlet) annotation (
          Line(
          points={{-862,-236},{-862,-488},{-840,-488}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_rCD_cold.inlet, rackCD_Cold_S200_S500.inlet) annotation (Line(
          points={{-802,-36},{-802,-18},{-706,-18},{-706,5.25},{-668,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_rCD_hot.outlet, rackCD_Hot_S200_S900.inlet) annotation (Line(
          points={{-762,-36},{-762,-30},{-692,-30},{-692,44.75},{-727,44.75}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_D201_FT201.inlet,FT201. inlet) annotation (Line(
          points={{-852,-438},{-856,-438},{-856,-348},{-761.8,-348},{-761.8,-281.2}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S200_D201_FT201.outlet,PL_S200_D201_High. outlet) annotation (Line(
          points={{-832,-438},{-756,-438},{-756,-420}},
          color={140,56,54},
          thickness=0.5));
      connect(FV209.outlet,PL_S200_FV209_D201. inlet) annotation (Line(
          points={{-802,-272},{-802,-328},{-862,-328},{-862,-488},{-840,-488}},
          color={140,56,54},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end CentralizedSystemIII;

    partial model CentralizedSystemIV
      extends BaseClass.CentralizedNetworkBase;

      // S500

      // General Pipeline Data
      parameter DistrictHeatingNetwork.Types.Length Di_S5=39e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S5=1.5e-3;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_Source_S5=
          q_m3h_S5_Source*990/3600;
      parameter Real q_m3h_S5_Source = 4;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_User_S5=
          q_m3h_S5_User*990/3600;
      parameter Real q_m3h_S5_User = 6;

      parameter Real P501omega[:,:] = [0, 2*3.141592654*35; 100, 2*3.141592654*35];
      parameter Real P501qm3h[:,:] = [0, 6.033898; 100, 6.033898];

      parameter DistrictHeatingNetwork.Types.Pressure pin_Source_start_S5=2e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_Source_start_S5=1.9e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_Source_start_S5=80 +
          273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_Source_start_S5=70 +
          273.15;

      parameter DistrictHeatingNetwork.Types.Pressure pin_User_start_S5=1.69e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_User_start_S5=2.5e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_User_start_S5=70 +
          273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_User_start_S5=75 +
          273.15;

      DistrictHeatingNetwork.Components.Pipes.BrazedPlateHeatExchanger E501(
        Di_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Di_cold,
        Di_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Di_hot,
        L_cold=DistrictHeatingNetwork.Data.BPHEData.E501.L_cold,
        L_hot=DistrictHeatingNetwork.Data.BPHEData.E501.L_hot,
        MWall=DistrictHeatingNetwork.Data.BPHEData.E501.MWall,
        Stot_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_cold,
        Stot_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Stot_hot,
        Tin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_cold,
        Tin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tin_start_hot,
        Tout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_cold,
        Tout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.Tout_start_hot,
        cpm_cold=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_cold,
        cpm_hot=DistrictHeatingNetwork.Data.BPHEData.E501.cpm_hot,
        t_cold=DistrictHeatingNetwork.Data.BPHEData.E501.t_cold,
        t_hot=DistrictHeatingNetwork.Data.BPHEData.E501.t_hot,
        gamma_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_cold,
        gamma_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.gamma_nom_hot,
        h_cold=DistrictHeatingNetwork.Data.BPHEData.E501.h_cold,
        h_hot=DistrictHeatingNetwork.Data.BPHEData.E501.h_hot,
        hctype_cold=hctype,
        hctype_hot=hctype,
        hin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_cold,
        hin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.hin_start_hot,
        k_cold=DistrictHeatingNetwork.Data.BPHEData.E501.k_cold,
        k_hot=DistrictHeatingNetwork.Data.BPHEData.E501.k_hot,
        kc_cold=1,
        kc_hot=1,
        lambdam_cold=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_cold,
        lambdam_hot=DistrictHeatingNetwork.Data.BPHEData.E501.lambdam_hot,
        m_flow_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_cold,
        m_flow_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.m_flow_start_hot,
        n=5,
        nPipes_cold=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_cold,
        nPipes_hot=DistrictHeatingNetwork.Data.BPHEData.E501.nPipes_hot,
        nPlates=DistrictHeatingNetwork.Data.BPHEData.E501.nPlates,
        pin_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_cold,
        pin_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pin_start_hot,
        pout_start_cold=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_cold,
        pout_start_hot=DistrictHeatingNetwork.Data.BPHEData.E501.pout_start_hot,
        rho_nom_cold=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_cold +
            DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_cold)/2,
        rho_nom_hot=(DistrictHeatingNetwork.Data.BPHEData.E501.rhoin_nom_hot +
            DistrictHeatingNetwork.Data.BPHEData.E501.rhoout_nom_hot)/2,
        rhom_cold(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_cold,
        rhom_hot(displayUnit="g/cm3") = DistrictHeatingNetwork.Data.BPHEData.E501.rhom_hot,
        thermalInertia=false,
        u_nom_cold=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_cold,
        u_nom_hot=DistrictHeatingNetwork.Data.BPHEData.E501.u_nom_hot) annotation (
          Placement(visible=true, transformation(
            origin={-608,-197},
            extent={{-17,-28.0002},{17,28.0001}},
            rotation=-90)));

      DistrictHeatingNetwork.Components.TurboMachines.ControlledPump P501(
        Tin_start(displayUnit="K") = Tout_User_start_S5,
        Tout_start(displayUnit="K") = Tout_User_start_S5,
        a=DistrictHeatingNetwork.Data.PumpData.P501.a,
        b=DistrictHeatingNetwork.Data.PumpData.P501.b,
        m_flow_start=m_flow_User_S5,
        dpnom=DistrictHeatingNetwork.Data.PumpData.P501.dpnom,
        etaelec=DistrictHeatingNetwork.Data.PumpData.P501.etaelec,
        etamech=DistrictHeatingNetwork.Data.PumpData.P501.etamech,
        etanom=DistrictHeatingNetwork.Data.PumpData.P501.etanom,
        hin_start=DistrictHeatingNetwork.Data.PumpData.P501.hin_start,
        m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P501.m_flow_nom,
        omeganom=DistrictHeatingNetwork.Data.PumpData.P501.omeganom,
        pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pin_start,
        pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P501.pout_start,
        qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P501.qnom_inm3h,
        rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P501.rhonom,
        headnom=DistrictHeatingNetwork.Data.PumpData.P501.headnom,
        headmax=DistrictHeatingNetwork.Data.PumpData.P501.headnommax,
        headmin=DistrictHeatingNetwork.Data.PumpData.P501.headnommin,
        qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P501.qnommin_inm3h,
        qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P501.qnommax_inm3h,
        use_q_m3hr=true) annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=90,
            origin={-588,-153})));

      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.02e5,
        Tin_start=Tin_User_start_S5,
        Tout_start=Tin_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_Source,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-628,-251})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.04e5,
        Tin_start=Tout_User_start_S5,
        Tout_start=Tout_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_Source,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-588,-251})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT503(T_start=
            Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
            transformation(
            extent={{-7.5,-7.5},{7.5,7.5}},
            rotation=90,
            origin={-630.5,-227.5})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT504(T_start=
            Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
            transformation(
            extent={{-7,-7},{7,7}},
            rotation=-90,
            origin={-585,-227})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_hot1(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.04e5,
        Tin_start=Tout_User_start_S5,
        Tout_start=Tout_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_User,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-588,-69})));
      DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange(D_i=51e-3,
          D_o=Di_S5) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-588,-38})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold1(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.02e5,
        Tin_start=Tin_User_start_S5,
        Tout_start=Tin_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_User,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-628,-69})));
      DistrictHeatingNetwork.Components.Fittings.SuddenAreaChange suddenAreaChange1(D_i=51e-3,
          D_o=Di_S5) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-628,-38})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT502 annotation (
          Placement(transformation(
            extent={{-5.5,5.5},{5.5,-5.5}},
            rotation=90,
            origin={-585.5,-87.5})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT502(T_start=
            Tout_User_start_S5) annotation (Placement(transformation(
            extent={{-5.5,5.5},{5.5,-5.5}},
            rotation=90,
            origin={-585.5,-118.5})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT501(T_start=
            Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
            transformation(
            extent={{7,-7},{-7,7}},
            rotation=90,
            origin={-631,-157})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT501 annotation (
          Placement(transformation(
            extent={{-5.5,-5.5},{5.5,5.5}},
            rotation=90,
            origin={-630.5,-88.5})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT501(T_start=
            Tin_User_start_S5, p_start=pin_User_start_S5) annotation (Placement(
            transformation(
            extent={{-5.5,-5.5},{5.5,5.5}},
            rotation=90,
            origin={-630.5,-107.5})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV S5_PL_CHP_EX501_cold2(
        L=5,
        t=t_S5,
        pin_start=pin_User_start_S5 - 0.02e5,
        Tin_start=Tin_User_start_S5,
        Tout_start=Tin_User_start_S5,
        Di=Di_S5,
        q_m3h_start=q_m3h_S5_User,
        n=n,
        hctype=hctype) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-628,-129})));
      DistrictHeatingNetwork.Components.Machines.CombinedHeatPower CHP
        annotation (Placement(transformation(extent={{-628,-336},{-586,-294}})));
    equation
      connect(S5_PL_CHP_EX501_cold.inlet,E501. outhot) annotation (Line(
          points={{-628,-241},{-628,-205.5},{-627.6,-205.5}},
          color={140,56,54},
          thickness=0.5));
      connect(S5_PL_CHP_EX501_cold.inlet,TT503. inlet) annotation (Line(
          points={{-628,-241},{-628,-233.25},{-627.5,-233.25},{-627.5,-227.5}},
          color={140,56,54},
          thickness=0.5));
      connect(S5_PL_CHP_EX501_hot.outlet,TT504. inlet) annotation (Line(
          points={{-588,-241},{-588,-233.25},{-587.8,-233.25},{-587.8,-227}},
          color={140,56,54},
          thickness=0.5));
      connect(TT504.inlet,E501. inhot) annotation (Line(
          points={{-587.8,-227},{-587.8,-226.25},{-588.4,-226.25},{-588.4,-205.5}},
          color={140,56,54},
          thickness=0.5));
      connect(S5_PL_CHP_EX501_hot1.outlet,suddenAreaChange. outlet) annotation (
          Line(
          points={{-588,-59},{-588,-48}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange1.outlet,S5_PL_CHP_EX501_cold1. inlet) annotation (
          Line(
          points={{-628,-48},{-628,-59}},
          color={140,56,54},
          thickness=0.5));
      connect(S5_PL_CHP_EX501_hot1.inlet,PT502. inlet) annotation (Line(
          points={{-588,-79},{-588,-84.25},{-587.7,-84.25},{-587.7,-87.5}},
          color={140,56,54},
          thickness=0.5));
      connect(PT502.inlet,TT502. inlet) annotation (Line(
          points={{-587.7,-87.5},{-587.7,-118.5}},
          color={140,56,54},
          thickness=0.5));
      connect(TT502.inlet,P501. outlet) annotation (Line(
          points={{-587.7,-118.5},{-587.7,-102.95},{-588,-102.95},{-588,-143.4}},
          color={140,56,54},
          thickness=0.5));
      connect(FT501.outlet,E501. incold) annotation (Line(
          points={{-628.2,-161.2},{-628.2,-174.85},{-627.6,-174.85},{-627.6,-188.5}},
          color={140,56,54},
          thickness=0.5));
      connect(S5_PL_CHP_EX501_cold1.outlet,PT501. inlet) annotation (Line(
          points={{-628,-79},{-628,-83.75},{-628.3,-83.75},{-628.3,-88.5}},
          color={140,56,54},
          thickness=0.5));
      connect(PT501.inlet,TT501. inlet) annotation (Line(
          points={{-628.3,-88.5},{-628.3,-107.5}},
          color={140,56,54},
          thickness=0.5));
      connect(FT501.inlet,S5_PL_CHP_EX501_cold2. outlet) annotation (Line(
          points={{-628.2,-152.8},{-628.2,-145.9},{-628,-145.9},{-628,-139}},
          color={140,56,54},
          thickness=0.5));
      connect(TT501.inlet,S5_PL_CHP_EX501_cold2. inlet) annotation (Line(
          points={{-628.3,-107.5},{-628.3,-113.25},{-628,-113.25},{-628,-119}},
          color={140,56,54},
          thickness=0.5));
      connect(P501.inlet,E501. outcold) annotation (Line(
          points={{-588,-162.6},{-588,-167.55},{-588.4,-167.55},{-588.4,-188.5}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange1.inlet, rackCD_Cold_S300_S300.inlet) annotation (
          Line(
          points={{-628,-28},{-628,-12},{-498,-12},{-498,5.25},{-470,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(suddenAreaChange.inlet, rackCD_Hot_S500_SXXX.inlet) annotation (Line(
          points={{-588,-28},{-588,-20},{-492,-20},{-492,45},{-500,45}},
          color={140,56,54},
          thickness=0.5));
      connect(S5_PL_CHP_EX501_hot.inlet, CHP.outlet) annotation (Line(
          points={{-588,-261},{-588,-286},{-578,-286},{-578,-315},{-586,-315}},
          color={140,56,54},
          thickness=0.5));
      connect(S5_PL_CHP_EX501_cold.outlet, CHP.inlet) annotation (Line(
          points={{-628,-261},{-628,-286},{-636,-286},{-636,-315},{-628,-315}},
          color={140,56,54},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end CentralizedSystemIV;

    partial model CentralizedSystemLoadSimplifiedI
      "System with only Gas Boiler as source of heat"
      extends BaseClass.CentralizedNetworkBaseLoadSimplified;
      // System S100

      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1=1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1=1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1=30 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1=30 + 273.15;

      parameter DistrictHeatingNetwork.Types.Length L_S1=10;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL1=0.4;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL2=0.8;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL3=1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL4=0.7;
      parameter DistrictHeatingNetwork.Types.Length Di_S1=51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S1=1.5e-3;

      parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
      parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
      parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold=12.25;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot=10.85;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 0.2 "to be analysed";
      //parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";

      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1=m_flow_total;
      parameter Real q_m3h_S1 = 9;

      parameter Real P101omega[:,:] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
      parameter Real P101qm3h[:,:] = [0, 7.5; 100, 7.5];

      parameter Real FCV101theta[:,:] = [0, 1];
      parameter Real GB101_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

      DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P101(
        Tin_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tin_start,
        Tout_start(displayUnit="K") = DistrictHeatingNetwork.Data.PumpData.P101.Tout_start,
        a=DistrictHeatingNetwork.Data.PumpData.P101.a,
        b=DistrictHeatingNetwork.Data.PumpData.P101.b,
        m_flow_start=m_flow_total,
        dpnom=DistrictHeatingNetwork.Data.PumpData.P101.dpnom,
        etaelec=DistrictHeatingNetwork.Data.PumpData.P101.etaelec,
        etamech=DistrictHeatingNetwork.Data.PumpData.P101.etamech,
        etanom=DistrictHeatingNetwork.Data.PumpData.P101.etanom,
        hin_start=DistrictHeatingNetwork.Data.PumpData.P101.hin_start,
        m_flow_nom=DistrictHeatingNetwork.Data.PumpData.P101.m_flow_nom,
        omeganom=DistrictHeatingNetwork.Data.PumpData.P101.omeganom,
        pin_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pin_start,
        pout_start(displayUnit="Pa") = DistrictHeatingNetwork.Data.PumpData.P101.pout_start,
        qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h,
        rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P101.rhonom,
        headnom=DistrictHeatingNetwork.Data.PumpData.P101.headnom,
        headmax=DistrictHeatingNetwork.Data.PumpData.P101.headnommax,
        headmin=DistrictHeatingNetwork.Data.PumpData.P101.headnommin,
        qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P101.qnommin_inm3h,
        qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P101.qnommax_inm3h,
        use_in_omega=true)                                                      annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=90,
            origin={-240,-175})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV101(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV101.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV101.dp_nom,
        rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.rho_nom,
        q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV101.q_nom_m3h,
        Tin_start(displayUnit="K") = Tout_start_S1,
        pin_start=pout_start_S1,
        q_m3h_start=DistrictHeatingNetwork.Data.PumpData.P101.qnom_inm3h)
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-110})));

      DistrictHeatingNetwork.Components.ThermalMachines.ControlledGasBoiler GB101(
        Tin_start=Tin_start_S1,
        pin_start=pin_start_S1,
        pout_start=pout_start_S1,
        Tout_start=Tout_start_S1,
        HH=55.5e6) annotation (Placement(visible=true, transformation(
            origin={-257,-301},
            extent={{-35,-35},{35,35}},
            rotation=0)));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT102(T_start=
            Tout_start_S1, p_start=pout_start_S1)
        "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=-90,
            origin={-238,-72})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT102
        "Pressure sensor at the outlet of valve FCV101" annotation (Placement(
            transformation(
            extent={{6,6},{-6,-6}},
            rotation=90,
            origin={-238,-84})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT101
        "Pressure sensor at the inlet of gas boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-278,-130})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT101(T_start=
            Tin_start_S1, p_start=pin_start_S1)
        "Temperature sensor at the outlet of valve FCV101" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-278,-94})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT101(T_start=Tin_start_S1,
          p_start=pin_start_S1) annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=90,
            origin={-279,-195})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_hot(
        L=L_S1_rCD_hot,
        h=h_S1_rCD_hot,
        t=t_S1,
        pin_start=pout_start_S1,
        Tin_start=Tout_start_S1,
        Tout_start=Tout_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-40})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S100_rCD_cold(
        L=L_S1_rCD_cold,
        h=h_S1_rCD_cold,
        t=t_S1,
        pin_start=pin_start_S1,
        Tin_start=Tin_start_S1,
        Tout_start=Tin_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-276,-40})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV                   PL_S100_GB101_P101(
        L=L_GB101_P101,
        h=h_GB101_P101,
        t=t_S1,
        pin_start=pout_start_S1,
        Tin_start=Tout_start_S1,
        Tout_start=Tout_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        n=n,
        hctype=hctype)
             annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-230})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV                   PL_S100_FT101_GB101(
        L=L_FT101_GB101,
        h=h_FT101_GB101,
        t=t_S1,
        pin_start=pin_start_S1,
        Tin_start=Tin_start_S1,
        Tout_start=Tin_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype)        annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-276,-230})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV                   PL_S100_TT101_FT101(
        L=L_TT101_FT101,
        h=h_TT101_FT101,
        t=t_S1,
        pin_start=pin_start_S1,
        Tin_start=Tin_start_S1,
        Tout_start=Tin_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        hctype=hctype)
                  annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-276,-162})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV                   PL_S100_P101_FCV101(
        L=L_P101_FCV101,
        h=h_P101_FCV101,
        t=t_S1,
        pin_start=pout_start_S1,
        Tin_start=Tout_start_S1,
        Tout_start=Tout_start_S1,
        Di=Di_S1,
        q_m3h_start=q_m3h_S1,
        n=n,
        hctype=hctype)
                  annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-240,-142})));
    equation
      connect(TT102.inlet,PT102. inlet) annotation (Line(
          points={{-240.4,-72},{-240.4,-84}},
          color={140,56,54},
          thickness=0.5));
      connect(PT101.inlet,TT101. inlet) annotation (Line(
          points={{-275.6,-130},{-275.6,-94}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_rCD_hot.inlet,TT102. inlet) annotation (Line(
          points={{-240,-50},{-240,-72},{-240.4,-72}},
          color={140,56,54},
          thickness=0.5));
      connect(TT101.inlet,PL_S100_rCD_cold. outlet) annotation (Line(
          points={{-275.6,-94},{-275.6,-89},{-276,-89},{-276,-50}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_rCD_cold.inlet, rackCD_Cold_S400_S100.outlet) annotation (
          Line(
          points={{-276,-30},{-276,5.25},{-326.5,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_rCD_hot.outlet, rackCD_Hot_S100_S400.inlet) annotation (Line(
          points={{-240,-30},{-242,-30},{-242,44.75},{-257.5,44.75}},
          color={140,56,54},
          thickness=0.5));
      connect(P101.inlet, PL_S100_GB101_P101.outlet) annotation (Line(
          points={{-240,-184.6},{-240,-220}},
          color={140,56,54},
          thickness=0.5));
      connect(FT101.outlet, PL_S100_FT101_GB101.inlet) annotation (Line(
          points={{-276.2,-199.2},{-276.2,-220},{-276,-220}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_FT101_GB101.outlet, GB101.inlet) annotation (Line(
          points={{-276,-240},{-276,-252},{-267.5,-252},{-267.5,-273}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_GB101_P101.inlet, GB101.outlet) annotation (Line(
          points={{-240,-240},{-240,-252},{-246.5,-252},{-246.5,-273}},
          color={140,56,54},
          thickness=0.5));
      connect(FCV101.outlet, PT102.inlet) annotation (Line(
          points={{-240,-100},{-240,-92},{-240.4,-92},{-240.4,-84}},
          color={140,56,54},
          thickness=0.5));
      connect(FT101.inlet, PL_S100_TT101_FT101.outlet) annotation (Line(
          points={{-276.2,-190.8},{-276.2,-184},{-276,-184},{-276,-172}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_TT101_FT101.inlet, PT101.inlet) annotation (Line(
          points={{-276,-152},{-276,-141},{-275.6,-141},{-275.6,-130}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S100_P101_FCV101.inlet, P101.outlet) annotation (Line(
          points={{-240,-152},{-240,-165.4}},
          color={140,56,54},
          thickness=0.5));
      connect(FCV101.inlet, PL_S100_P101_FCV101.outlet) annotation (Line(
          points={{-240,-120},{-240,-132}},
          color={140,56,54},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end CentralizedSystemLoadSimplifiedI;

    partial model CentralizedSystemLoadSimplifiedI_B
      extends CentralizedSystemLoadSimplifiedI;

      // System 400
      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S4=1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S4=1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S4=72 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S4=80 + 273.15;

      parameter DistrictHeatingNetwork.Types.Length L_S4_PL1=0.82;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL2=0.47;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL3=1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_PL4=1.3;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_cold=5.5;
      parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_cold=0;
      parameter DistrictHeatingNetwork.Types.Length L_S4_rCD_hot=6;
      parameter DistrictHeatingNetwork.Types.Length h_S4_rCD_hot=-0.5;

      parameter DistrictHeatingNetwork.Types.Length Di_S4=51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S4=1.5e-3;

      parameter Real q_m3h_S4 = 5;
      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S4=q_m3h_S4*990/3600;

      parameter Real P401omega[:,:] = [0, 2*3.141592654*50; 100, 2*3.141592654*50; 100, 2*3.141592654*50; 200, 2*3.141592654*50];
      parameter Real P401qm3h[:,:] = [0, 5; 100, 5];
      parameter Real FCV401theta[:,:] = [0, 1; 100, 1];
      parameter Real EB401_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];
      parameter Boolean FV401_state = true;
      parameter Boolean FV402_state = true;
      parameter Boolean FV401_startValue = true;
      parameter Boolean FV402_startValue = true;
      parameter Real FV401_s[:] = {5e6};
      parameter Real FV402_s[:] = {5e6};

      DistrictHeatingNetwork.Components.ThermalMachines.ControlledElectricBoiler EB401(
        Tout_start=Tout_start_S4,
        D=0.4,
        Pmaxnom=50e3,
        Pnimnom=10e3,
        Pnom=50e3,
        Tin_start=Tin_start_S4,
        etanom=0.98,
        h=1.25,
        m_flow_nom=m_flow_S4,
        pin_start=pin_start_S4,
        pout_start=160000,
        nR=5) annotation (Placement(visible=true, transformation(
            origin={-337,-301},
            extent={{-35,-35},{35,35}},
            rotation=0)));
      DistrictHeatingNetwork.Components.TurboMachines.PrescribedPump P401(
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
        qnom_inm3h=DistrictHeatingNetwork.Data.PumpData.P401.qnom_inm3h,
        rhonom(displayUnit="kg/m3") = DistrictHeatingNetwork.Data.PumpData.P401.rhonom,
        headnom=DistrictHeatingNetwork.Data.PumpData.P401.headnom,
        headmax=DistrictHeatingNetwork.Data.PumpData.P401.headnommax,
        headmin=DistrictHeatingNetwork.Data.PumpData.P401.headnommin,
        qnom_inm3h_min=DistrictHeatingNetwork.Data.PumpData.P401.qnommin_inm3h,
        qnom_inm3h_max=DistrictHeatingNetwork.Data.PumpData.P401.qnommax_inm3h,
        use_in_omega=true)
                         annotation (Placement(transformation(
            extent={{-12,12},{12,-12}},
            rotation=90,
            origin={-318,-171})));

      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve FCV401(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        dp_nom(displayUnit="Pa") = DistrictHeatingNetwork.Data.ValveData.FCV401.dp_nom,
        rho_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.rho_nom,
        q_m3h_nom=DistrictHeatingNetwork.Data.ValveData.FCV401.q_nom_m3h,
        Tin_start(displayUnit="K") = Tout_start_S4,
        pin_start=pout_start_S4,
        q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-136})));

      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL3_S401(
        L=L_S4_PL3,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-232})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL2_S401(
        L=L_S4_PL2,
        t=t_S4,
        m_flow_start=m_flow_S4,
        pin_start=pin_start_S4,
        pout_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-358,-234})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL4_S401(
        L=L_S4_PL3,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-108})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT402(T_start=
            Tout_start_S4, p_start=pout_start_S4)
        "Temperature sensor at the outlet of valve FCV401" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=-90,
            origin={-316,-70})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT402
        "Pressure sensor at the outlet of valve FCV401" annotation (Placement(
            transformation(
            extent={{6,6},{-6,-6}},
            rotation=90,
            origin={-316,-82})));
      DistrictHeatingNetwork.Sensors.IdealAbsolutePressureSensor PT401
        "Pressure sensor at the inlet of gas boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-360,-114})));
      DistrictHeatingNetwork.Sensors.IdealAbsoluteTemperatureSensor TT401(T_start=
            Tin_start_S4, p_start=pin_start_S4)
        "Temperature sensor at the inlet of electrib boiler" annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-360,-102})));
      DistrictHeatingNetwork.Sensors.IdealMassFlowSensor FT401(T_start=Tin_start_S4,
          p_start=pin_start_S4) annotation (Placement(transformation(
            extent={{7,-7},{-7,7}},
            rotation=90,
            origin={-361,-191})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL1_S401(
        L=L_S4_PL1,
        t=t_S4,
        pin_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-358,-162})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_hot(
        L=L_S4_rCD_hot,
        t=t_S4,
        pin_start=pout_start_S4,
        Tin_start=Tout_start_S4,
        Tout_start=Tout_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-48})));
      DistrictHeatingNetwork.Components.Pipes.RoundPipe1DFV PL_S400_rCD_cold(
        L=L_S4_rCD_cold,
        t=t_S4,
        pin_start=pin_start_S4,
        Tin_start=Tin_start_S4,
        Tout_start=Tin_start_S4,
        Di=Di_S4,
        q_m3h_start=q_m3h_S4,
        hctype=hctype,
        n=n) annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={-358,-50})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV401(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        Tin_start=Tin_start_S4,
        pin_start=pin_start_S4,
        q_m3h_start=q_m3h_S4) "On-Off valve connecting inlet S400 & S900 "
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=-90,
            origin={-358,-16})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve FV402(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCV401.Kv,
        Tin_start=Tout_start_S4,
        pin_start=pout_start_S4,
        q_m3h_start=q_m3h_S4) annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={-318,-16})));
    equation
      connect(P401.inlet,PL3_S401. outlet) annotation (Line(
          points={{-318,-180.6},{-318,-222}},
          color={140,56,54},
          thickness=0.5));
      connect(FCV401.inlet,P401. outlet) annotation (Line(
          points={{-318,-146},{-318,-161.4}},
          color={140,56,54},
          thickness=0.5));
      connect(TT402.inlet,PT402. inlet) annotation (Line(
          points={{-318.4,-70},{-318.4,-82}},
          color={140,56,54},
          thickness=0.5));
      connect(PL4_S401.inlet,FCV401. outlet) annotation (Line(
          points={{-318,-118},{-318,-126}},
          color={140,56,54},
          thickness=0.5));
      connect(PT402.inlet,PL4_S401. outlet) annotation (Line(
          points={{-318.4,-82},{-318.4,-91},{-318,-91},{-318,-98}},
          color={140,56,54},
          thickness=0.5));
      connect(FT401.outlet,PL2_S401. inlet) annotation (Line(
          points={{-358.2,-195.2},{-358.2,-203.6},{-358,-203.6},{-358,-224}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S401.outlet,FT401. inlet) annotation (Line(
          points={{-358,-172},{-358,-179.4},{-358.2,-179.4},{-358.2,-186.8}},
          color={140,56,54},
          thickness=0.5));
      connect(PL1_S401.inlet,PT401. inlet) annotation (Line(
          points={{-358,-152},{-358,-114},{-357.6,-114}},
          color={140,56,54},
          thickness=0.5));
      connect(PT401.inlet,TT401. inlet) annotation (Line(
          points={{-357.6,-114},{-357.6,-102}},
          color={140,56,54},
          thickness=0.5));
      connect(EB401.outlet,PL3_S401. inlet) annotation (Line(
          points={{-326.5,-273},{-326.5,-256},{-318,-256},{-318,-242}},
          color={140,56,54},
          thickness=0.5));
      connect(TT402.inlet,PL_S400_rCD_hot. inlet) annotation (Line(
          points={{-318.4,-70},{-318,-70},{-318,-58}},
          color={140,56,54},
          thickness=0.5));
      connect(TT401.inlet,PL_S400_rCD_cold. outlet) annotation (Line(
          points={{-357.6,-102},{-358,-102},{-358,-60}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S400_rCD_cold.inlet,FV401. outlet) annotation (Line(
          points={{-358,-40},{-358,-26}},
          color={140,56,54},
          thickness=0.5));
      connect(PL_S400_rCD_hot.outlet,FV402. inlet) annotation (Line(
          points={{-318,-38},{-318,-26}},
          color={140,56,54},
          thickness=0.5));
      connect(FV401.inlet, rackCD_Cold_S300_S400.outlet) annotation (Line(
          points={{-358,-6},{-358,5.25},{-408.5,5.25}},
          color={140,56,54},
          thickness=0.5));
      connect(FV402.outlet, rackCD_Hot_S400_S300.inlet) annotation (Line(
          points={{-318,-6},{-318,45},{-338,45}},
          color={140,56,54},
          thickness=0.5));
      connect(PL2_S401.outlet, EB401.inlet) annotation (Line(
          points={{-358,-244},{-358,-258},{-347.5,-258},{-347.5,-273}},
          color={140,56,54},
          thickness=0.5));
    end CentralizedSystemLoadSimplifiedI_B;

    partial model CentralizedSystemSimplifiedLoadSimplifiedI
      "System with only Gas Boiler as source of heat"
      // System S100

      parameter DistrictHeatingNetwork.Types.Pressure pin_start_S1=1.695e5;
      parameter DistrictHeatingNetwork.Types.Pressure pout_start_S1=1.6e5;
      parameter DistrictHeatingNetwork.Types.Temperature Tin_start_S1=30 + 273.15;
      parameter DistrictHeatingNetwork.Types.Temperature Tout_start_S1=30 + 273.15;

      parameter DistrictHeatingNetwork.Types.Length L_S1=10;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL1=0.4;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL2=0.8;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL3=1.5;
      parameter DistrictHeatingNetwork.Types.Length L_S1_PL4=0.7;
      parameter DistrictHeatingNetwork.Types.Length Di_S1=51e-3;
      parameter DistrictHeatingNetwork.Types.Length t_S1=1.5e-3;

      parameter DistrictHeatingNetwork.Types.Length L_TT101_FT101 = 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_TT101_FT101 = 0;
      parameter DistrictHeatingNetwork.Types.Length L_FT101_GB101 = 1.25 + 0.7;
      parameter DistrictHeatingNetwork.Types.Length h_FT101_GB101 = -0.7*0;
      parameter DistrictHeatingNetwork.Types.Length L_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length h_GB101_P101 = 0.7 + 0.95;
      parameter DistrictHeatingNetwork.Types.Length L_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length h_P101_FCV101 = 1;
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_cold=12.25;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_cold = -0.66-0.54+1.3+1-0.5-0.3 "0.3";
      parameter DistrictHeatingNetwork.Types.Length L_S1_rCD_hot=10.85;
      parameter DistrictHeatingNetwork.Types.Length h_S1_rCD_hot = 1 - 1.1 - 1.2 + 0.6 "-0.7";

      parameter DistrictHeatingNetwork.Types.MassFlowRate m_flow_S1=m_flow_total;
      parameter Real q_m3h_S1 = 9;

      parameter Real P101omega[:,:] = [0, 2*pi*50; 100, 2*pi*50; 100, 2*pi*50; 200, 2*pi*50];
      parameter Real P101qm3h[:,:] = [0, 7.5; 100, 7.5];

      parameter Real FCV101theta[:,:] = [0, 1];
      parameter Real GB101_ToutSP[:,:] = [0, 80+273.15; 100, 80+273.15];

      Plants.Thermal.Systems.GasBoiler S100
        annotation (Placement(transformation(extent={{-112,-83},{-52,-23}})));
      Plants.Thermal.Systems.CirculationPump S900 annotation (Placement(transformation(
            extent={{-25,-25},{25,25}},
            rotation=-90,
            origin={-106,65})));
      Plants.Thermal.Systems.CoolingSingleLoad EX701
        annotation (Placement(transformation(extent={{-47,-84},{13,-24}})));
      Plants.Thermal.Systems.RackCD rackCD
        annotation (Placement(transformation(extent={{-160,-45},{-60,55}})));
      Plants.Thermal.Systems.ElectricBoiler S400
        annotation (Placement(transformation(extent={{-168,-82},{-108,-22}})));
      Plants.Thermal.Systems.RackType2 rackType2_1
        annotation (Placement(transformation(extent={{-40,14},{62,116}})));
      Plants.Thermal.Systems.CoolingSingleLoad EX711
        annotation (Placement(transformation(extent={{9,-84},{69,-24}})));
      Plants.Thermal.Systems.RackCD rackCD1
        annotation (Placement(transformation(extent={{80,15},{180,115}})));
      Plants.Thermal.Systems.CoolingSingleLoad EX721
        annotation (Placement(transformation(extent={{73,-84},{133,-24}})));
      Plants.Thermal.Systems.CoolingSingleLoad EX731
        annotation (Placement(transformation(extent={{128,-84},{188,-24}})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientOnOffValve
        FV933(
        Kv=33,
        dp_nom=50000,
        Tin_start=T_start,
        pin_start=pin_start) annotation (Placement(visible=true,
            transformation(
            origin={-50,5},
            extent={{-3,3},{3,-3}},
            rotation=90)));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
        FCVC02(
        q_m3h_start=q_m3h_rackHot/4,
        Kv=DistrictHeatingNetwork.Data.ValveData.FCVC02.Kv,
        dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
        Tin_start(displayUnit="K") = T_start_hot,
        pin_start=200000) annotation (Placement(transformation(
            extent={{3,-3},{-3,3}},
            rotation=-90,
            origin={190,65})));
      DistrictHeatingNetwork.Components.Valves.FlowCoefficientValve
        FCVC01(
        Kv=DistrictHeatingNetwork.Data.ValveData.FCVC01.Kv,
        dp_nom(displayUnit="Pa") = dp_nom_UsersValve,
        Tin_start(displayUnit="K") = 60 + 273.15,
        pin_start=200000) annotation (Placement(transformation(
            extent={{3,-3},{-3,3}},
            rotation=-90,
            origin={70,65})));
    equation
      connect(rackType2_1.inletLoad2, EX711.outlet) annotation (Line(
          points={{46.7,49.7},{46.7,38.85},{46.5,38.85},{46.5,-30}},
          color={140,56,54},
          thickness=0.5));
      connect(rackType2_1.outletLoad2, EX711.inlet) annotation (Line(
          points={{31.4,49.7},{31.4,47},{31.5,47},{31.5,-30}},
          color={140,56,54},
          thickness=0.5));
      connect(rackType2_1.inletLoad1, EX701.outlet) annotation (Line(
          points={{-9.4,49.7},{-9.4,39.35},{-9.5,39.35},{-9.5,-30}},
          color={140,56,54},
          thickness=0.5));
      connect(rackType2_1.outletLoad1, EX701.inlet) annotation (Line(
          points={{-24.7,49.7},{-24.7,39.35},{-24.5,39.35},{-24.5,-30}},
          color={140,56,54},
          thickness=0.5));
      connect(S900.fluidPortInlet1, rackType2_1.outletCold) annotation (Line(
          points={{-86.25,70},{-63.125,70},{-63.125,70.1},{-40,70.1}},
          color={140,56,54},
          thickness=0.5));
      connect(S900.fluidPortOutlet1, rackType2_1.inletHot) annotation (Line(
          points={{-86,60},{-63,60},{-63,59.9},{-40,59.9}},
          color={140,56,54},
          thickness=0.5));
      connect(EX721.inlet, rackCD1.outletElectricBoiler) annotation (Line(
          points={{95.5,-30},{95.5,39},{95,39},{95,50}},
          color={140,56,54},
          thickness=0.5));
      connect(EX721.outlet, rackCD1.inletElectricBoiler) annotation (Line(
          points={{110.5,-30},{110,-30},{110,50}},
          color={140,56,54},
          thickness=0.5));
      connect(EX731.inlet, rackCD1.outletGasBoiler) annotation (Line(
          points={{150.5,-30},{150.5,39},{150,39},{150,50}},
          color={140,56,54},
          thickness=0.5));
      connect(EX731.outlet, rackCD1.inletGasBoiler) annotation (Line(
          points={{165.5,-30},{165.5,39},{165,39},{165,50}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD.outletPump, S900.fluidPortInlet) annotation (Line(
          points={{-160,10},{-170,10},{-170,60},{-126,60}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD.inletPump, S900.fluidPortOutlet) annotation (Line(
          points={{-160,0},{-180,0},{-180,70},{-126,70}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD.inletGasBoiler, S100.outlet) annotation (Line(
          points={{-75,-10},{-75,-25},{-74.5,-25},{-74.5,-29}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD.outletGasBoiler, S100.inlet) annotation (Line(
          points={{-90,-10},{-90,-29},{-89.5,-29}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD.inletElectricBoiler, S400.outlet) annotation (Line(
          points={{-130,-10},{-130,-24.5},{-130.5,-24.5},{-130.5,-28}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD.outletElectricBoiler, S400.inlet) annotation (Line(
          points={{-145,-10},{-145.5,-10},{-145.5,-28}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD.outletCold, FV933.inlet) annotation (Line(
          points={{-60,0},{-50,0},{-50,2}},
          color={140,56,54},
          thickness=0.5));
      connect(FV933.outlet, rackCD.inletHot) annotation (Line(
          points={{-50,8},{-50,10},{-60,10}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD1.outletCold, FCVC02.inlet) annotation (Line(
          points={{180,60},{190,60},{190,62}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD1.inletHot, FCVC02.outlet) annotation (Line(
          points={{180,70},{190,70},{190,68}},
          color={140,56,54},
          thickness=0.5));
      connect(rackType2_1.outletHot, FCVC01.inlet) annotation (Line(
          points={{62,59.9},{70,59.9},{70,62}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD1.inletPump, FCVC01.inlet) annotation (Line(
          points={{80,60},{70,60},{70,62}},
          color={140,56,54},
          thickness=0.5));
      connect(rackCD1.outletPump, FCVC01.outlet) annotation (Line(
          points={{80,70},{70,70},{70,68}},
          color={140,56,54},
          thickness=0.5));
      connect(rackType2_1.inletCold, FCVC01.outlet) annotation (Line(
          points={{62,70.1},{70,70.1},{70,68}},
          color={140,56,54},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false,
            extent={{-200,-200},{200,200}},
            grid={1,1})));
    end CentralizedSystemSimplifiedLoadSimplifiedI;
  end Centralised;
end Configurations;
