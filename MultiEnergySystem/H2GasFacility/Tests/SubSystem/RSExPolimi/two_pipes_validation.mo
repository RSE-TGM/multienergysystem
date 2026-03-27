within MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi;
model two_pipes_validation
  extends MultiEnergySystem.H2GasFacility.Tests.SubSystem.RSExPolimi.validation_base(
    sds1(
      L=1500,
      H=0,
      Di=0.08,
      n=15),
    s1(
      L=1500,
      H=0,
      Di=0.08,
      n=15),
    GRM_4(m_flow0=0.04, massflowratedemand=[0,0.04; 7500,0.04; 7501,0.07; 20000,
          0.07; 20001,0.04; 30000,0.04]));
  annotation (experiment(
      StopTime=30000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end two_pipes_validation;
