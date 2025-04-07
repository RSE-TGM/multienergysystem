within MultiEnergySystem.CaseStudies.Report_062024;
model PaperCaseI_Demand
  extends MultiEnergySystem.CaseStudies.Report_062024.PaperCaseI(
    user4(massflowratedemand=industrialDemand4),
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
  connect(H2_Production.y, sourceH2_A.in_m_flow0) annotation (Line(points={{-124,-60},{-116,-60},{-116,-28},{-110,-28},{-110,-35}}, color={0,0,127}));
 annotation (experiment(StopTime = 86400, Interval = 44, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
  Diagram(coordinateSystem(extent = {{-180, -140}, {180, 140}}, grid = {1, 1})),
    Documentation(info="<html>
<p><span style=\"font-family: Segoe UI;\">User (industrial or residential) demand. </span></p>
<p><span style=\"font-family: Segoe UI;\">No injection. </span></p>
</html>"));
end PaperCaseI_Demand;
