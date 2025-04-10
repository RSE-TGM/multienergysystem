within MultiEnergySystem.TestFacility.Data;
package PipelineData
  "Generic data depending on the system of the District Heating Network"
  extends DistrictHeatingNetwork.Icons.Generic.Pipes;
  package S100 "Package including pipelines' information from subsystem S100"
    constant DistrictHeatingNetwork.Types.PerUnit cf = 0.005;
    constant DistrictHeatingNetwork.Types.Velocity u_nom = 5;
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_FT101_GB101(
      Di=51e-3,
      t=1.5e-3,
      tIns=1.5e-1,
      L=1.95,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=u_nom,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_GB101_P101(
      Di=51e-3,
      t=1.5e-3,
      tIns=1.5e-1,
      L=1.65,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=u_nom,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_P101_FCV101(
      Di=51e-3,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=u_nom,
      cm=445,
      rhom=8000);
  end S100;
end PipelineData;
