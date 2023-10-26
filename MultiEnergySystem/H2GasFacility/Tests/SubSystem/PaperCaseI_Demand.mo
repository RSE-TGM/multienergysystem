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

equation
  connect(H2_Production.y, sourceH2_A.in_m_flow0) annotation (Line(points={{-159,-60},{-140,
          -60},{-140,-28},{-120,-28},{-120,-35}}, color={0,0,127}));
 annotation (experiment(StopTime = 86400, Interval = 44, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
  Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})));
end PaperCaseI_Demand;
