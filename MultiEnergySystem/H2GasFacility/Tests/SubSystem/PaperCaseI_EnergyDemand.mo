within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_EnergyDemand
  extends PaperCaseI_Demand(useEnergyDemand = true,
  industrialDemand4 = industrialDemand_W(W_max_user4),
  industrialDemand5 = industrialDemand_W(W_max_user5),
  industrialDemand10 = industrialDemand_W(W_max_user10),
  residentialDemand11 = residentialDemand_W(W_max_user11),
  residentialDemand12 = residentialDemand_W(W_max_user12),
  residentialDemand13 = residentialDemand_W(W_max_user13),
  residentialDemand14 = residentialDemand_W(W_max_user14),
  residentialDemand15 = residentialDemand_W(W_max_user15),
  residentialDemand16 = residentialDemand_W(W_max_user16),
  residentialDemand17 = residentialDemand_W(W_max_user17),
  user4(energydemand=industrialDemand4),
  user10(energydemand=industrialDemand10),
  user5(energydemand=industrialDemand5),
  user15(energydemand=residentialDemand15),
  user16(energydemand=residentialDemand16),
  user14(energydemand=residentialDemand14),
  user11(energydemand=residentialDemand11),
  user12(energydemand=residentialDemand12),
  user17(energydemand=residentialDemand17),
  user13(energydemand=residentialDemand13));

  parameter Real W_max_user4 = 0.044645108*3.84E+07/0.696977;
  parameter Real W_max_user5 = 0.03493965*3.84E+07/0.696977;
  parameter Real W_max_user10 = 0.040762925*3.84E+07/0.696977;
  parameter Real W_max_user11 = 0.009705458*3.84E+07/0.696977;
  parameter Real W_max_user12 = 0.014558188*3.84E+07/0.696977;
  parameter Real W_max_user13 = 0.006793821*3.84E+07/0.696977;
  parameter Real W_max_user14 = 0.008734913*3.84E+07/0.696977;
  parameter Real W_max_user15 = 0.017469825*3.84E+07/0.696977;
  parameter Real W_max_user16 = 0.012723856*3.84E+07/0.696977;
  parameter Real W_max_user17 = 0.010676004*3.84E+07/0.696977;

protected
  function residentialDemand_W
    input Types.Power W_max;
    output Real[:,2] demand;
  algorithm
    demand := [0, W_max*0.9; 1*3600, W_max*0.9; 2*3600, W_max*0.4; 3*3600, W_max*0.4; 4*3600, W_max*0.8; 6*3600, W_max*0.8; 7*3600, W_max*0.4; 9*3600, W_max*0.4; 10*3600, W_max*1; 13*3600, W_max*1; 15*3600, W_max*0.1; 21*3600, W_max*0.1; 22*3600, W_max*0.9; 24*3600, W_max*0.9];
    annotation (
      Inline = true);
  end residentialDemand_W;

  function industrialDemand_W
    input Types.Power W_max;
    output Real[:,2] demand;
  algorithm
    demand := [0, W_max*1; 10*3600, W_max*1; 11*3600, W_max*0.75; 22*3600, W_max*0.75; 24*3600, W_max*1];
    annotation (
      Inline = true);
  end industrialDemand_W;
  annotation (experiment(
      StopTime=84000,
      Interval=44,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PaperCaseI_EnergyDemand;
