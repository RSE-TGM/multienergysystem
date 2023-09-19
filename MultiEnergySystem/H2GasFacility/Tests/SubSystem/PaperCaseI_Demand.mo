within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_Demand
  extends PaperCaseI(user4(massflowratedemand=industrialDemand4),
    user10(massflowratedemand=industrialDemand10),
    user5(massflowratedemand=industrialDemand5),
    user15(massflowratedemand=residentialDemand15),
    user16(massflowratedemand=residentialDemand16),
    user14(massflowratedemand=residentialDemand14),
    user11(massflowratedemand=residentialDemand11),
    user12(massflowratedemand=residentialDemand12),
    user17(massflowratedemand=residentialDemand17),
    user13(massflowratedemand=residentialDemand13));
  parameter Real m_flow_max_user4 = 0.044645108;
  parameter Real industrialDemand4[5, 2] = industrialDemand_mfr(m_flow_max_user4);
  parameter Real m_flow_max_user5 = 0.03493965;
  parameter Real industrialDemand5[5, 2] = industrialDemand_mfr(m_flow_max_user5);
  parameter Real m_flow_max_user10 = 0.040762925;
  parameter Real industrialDemand10[5, 2] = industrialDemand_mfr(m_flow_max_user10);
  //parameter Real industrialDemand4[:, 2] = [0, m_flow_max_user4*1; 10*3600, m_flow_max_user4*1; 11*3600, m_flow_max_user4*0.5; 16*3600, m_flow_max_user4*0.5] "Table for demand";
  //parameter Real industrialDemand5[:, 2] = [0, m_flow_max_user5*1; 10*3600, m_flow_max_user5*1; 11*3600, m_flow_max_user5*0.5; 16*3600, m_flow_max_user5*0.5] "Table for demand";
  //parameter Real industrialDemand10[:, 2] = [0, m_flow_max_user10*1; 10*3600, m_flow_max_user10*1; 11*3600, m_flow_max_user10*0.5; 16*3600, m_flow_max_user10*0.5] "Table for demand";

  parameter Types.MassFlowRate m_flow_max_user11 = 0.009705458;
  //parameter Real residentialDemand11[:, 2] = [0, m_flow_max_user11*0.9; 2*3600, m_flow_max_user11*0.9; 3*3600, m_flow_max_user11*0.4; 4*3600, m_flow_max_user11*0.4] "Table for demand";
  parameter Real residentialDemand11[14, 2] = residentialDemand_mfr(m_flow_max_user11) "Table for demand";
  parameter Real m_flow_max_user12 = 0.014558188;
  //parameter Real residentialDemand12[:, 2] = [0, m_flow_max_user12*0.9; 2*3600, m_flow_max_user12*0.9; 3*3600, m_flow_max_user12*0.4; 4*3600, m_flow_max_user12*0.4] "Table for demand";
  parameter Real residentialDemand12[14, 2] = residentialDemand_mfr(m_flow_max_user12);
  parameter Real m_flow_max_user13 = 0.006793821;
  //parameter Real residentialDemand13[:, 2] = [0, m_flow_max_user13*0.9; 2*3600, m_flow_max_user13*0.9; 3*3600, m_flow_max_user13*0.4; 4*3600, m_flow_max_user13*0.4] "Table for demand";
  parameter Real residentialDemand13[14, 2] = residentialDemand_mfr(m_flow_max_user13);
  parameter Real m_flow_max_user14 = 0.008734913;
  //parameter Real residentialDemand14[:, 2] = [0, m_flow_max_user14*0.9; 2*3600, m_flow_max_user14*0.9; 3*3600, m_flow_max_user14*0.4; 4*3600, m_flow_max_user14*0.4] "Table for demand";
  parameter Real residentialDemand14[14, 2] = residentialDemand_mfr(m_flow_max_user14);
  parameter Real m_flow_max_user15 = 0.017469825;
  //parameter Real residentialDemand15[:, 2] = [0, m_flow_max_user15*0.9; 2*3600, m_flow_max_user15*0.9; 3*3600, m_flow_max_user15*0.4; 4*3600, m_flow_max_user15*0.4] "Table for demand";
  parameter Real residentialDemand15[14, 2] = residentialDemand_mfr(m_flow_max_user15);
  parameter Real m_flow_max_user16 = 0.012723856;
  //parameter Real residentialDemand16[:, 2] = [0, m_flow_max_user16*0.9; 2*3600, m_flow_max_user16*0.9; 3*3600, m_flow_max_user16*0.4; 4*3600, m_flow_max_user16*0.4] "Table for demand";
  parameter Real residentialDemand16[14, 2] = residentialDemand_mfr(m_flow_max_user16);
  parameter Real m_flow_max_user17 = 0.010676004;
  //parameter Real residentialDemand17[:, 2] = [0, m_flow_max_user17*0.9; 2*3600, m_flow_max_user17*0.9; 3*3600, m_flow_max_user17*0.4; 4*3600, m_flow_max_user17*0.4] "Table for demand";
  parameter Real residentialDemand17[14, 2] = residentialDemand_mfr(m_flow_max_user17);




protected
  function residentialDemand_mfr
    input Types.MassFlowRate m_flow_max;
    output Real[:,2] demand;
  algorithm
    demand := [0, m_flow_max*0.9; 1*3600, m_flow_max*0.9; 2*3600, m_flow_max*0.4; 3*3600, m_flow_max*0.4; 4*3600, m_flow_max*0.8; 6*3600, m_flow_max*0.8; 7*3600, m_flow_max*0.4; 9*3600, m_flow_max*0.4; 10*3600, m_flow_max*1; 13*3600, m_flow_max*1; 15*3600, m_flow_max*0.1; 21*3600, m_flow_max*0.1; 22*3600, m_flow_max*0.9; 24*3600, m_flow_max*0.9];
    annotation (
      Inline = true);
  end residentialDemand_mfr;

  function industrialDemand_mfr
    input Types.MassFlowRate m_flow_max;
    output Real[:,2] demand;
  algorithm
    demand := [0, m_flow_max*1; 10*3600, m_flow_max*1; 11*3600, m_flow_max*0.75; 22*3600, m_flow_max*0.75; 24*3600, m_flow_max*1];
    annotation (
      Inline = true);
  end industrialDemand_mfr;

equation
  connect(H2_Production.y, sourceH2_A.in_m_flow0) annotation (Line(points={{-129,-66},{
          -124,-66},{-124,-37},{-120,-37}}, color={0,0,127}));
 annotation (experiment(
      StopTime=86400,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_Demand;
