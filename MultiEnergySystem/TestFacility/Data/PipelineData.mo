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

  package S700
    constant DistrictHeatingNetwork.Types.PerUnit cf = 0.004;
    constant DistrictHeatingNetwork.Types.Length t_hot = 1.5e-3;
    constant DistrictHeatingNetwork.Types.Length Di_hot = 51e-3;
    constant DistrictHeatingNetwork.Types.Length t_cold = 1.5e-3;
    constant DistrictHeatingNetwork.Types.Length Di_cold = 32e-3;
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S701_TT7X2_InHot(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.9,
      h=2.5,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S701_OutHot_FCV7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=0.6,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S701_FCV7X1_FT7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.5,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S701_TT7X4_TCV7X1(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.5,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S701_TT7X3_InCold(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.5,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S711_TT7X2_InHot(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.9,
      h=2.5,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S711_OutHot_FCV7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=0.6,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S711_FCV7X1_FT7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.5,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S711_TT7X4_TCV7X1(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=0.8,
      h=0.8,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S711_TT7X3_InCold(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.1,
      h=-0.165,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S721_TT7X2_InHot(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.9,
      h=2.5,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S721_OutHot_FCV7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=0.6,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S721_FCV7X1_FT7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.5,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S721_TT7X4_TCV7X1(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=1.25,
      h=1.25,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S721_TT7X3_InCold(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.1,
      h=-0.165,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S731_TT7X2_InHot(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.9,
      h=2.5,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S731_OutHot_FCV7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=0.6,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S731_FCV7X1_FT7X1(
      Di=Di_hot,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.25,
      h=0,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=1,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S731_TT7X4_TCV7X1(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=0.65,
      h=0.4,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
    constant MultiEnergySystem.TestFacility.Data.RoundPipeLine PL_S731_TT7X3_InCold(
      Di=Di_cold,
      t=1.5e-3,
      tIns=1.5e-1,
      L=2.90,
      h=-0.165,
      lambdaIns=0.04,
      lambdam=45,
      rho_nom=1000,
      cf=cf,
      u_nom=3.5,
      cm=445,
      rhom=8000);
  end S700;
end PipelineData;
