within MultiEnergySystem.H2GasFacility.Tests.Media;
model H2
  extends Tests.Media.SinglePTXFluidTest(
    redeclare model Medium = H2GasFacility.Media.IdealGases.H2,
    T_ref = 15 + 273.15,
    p_ref = 0.5E5,
    Y = {1});
    //Y = {0.97745, 0.01862, 0.00393, 0.0});
    //Y = {0.96595, 0.02697, 0.00537, 0.00171});
    //X_ref = {0.929, 0.06, 0.01, 0.001},
equation

  annotation (
    Documentation(info = "<html><head></head><body><h4>Test Model for pure ideal CH4</h4><div>The fluid model is taken from the MSL and the nominal data is consideren from the following .pdf file:</div><div><br></div><div>22007170_SpecTecApp_Progettazione impianti idrogeno_VM.pdf</div><div><br></div><div><ul><li>Linee circuito gas naturale</li><li>Fluido: gas naturale di rete</li><li>Pressione alla radice: 0.3 barg</li><li>Pressione massima: 0.3 barg</li><li>Temperatura: ambiente</li><li>Portata massima: 25 Nm3/h</li><li>Potenza max combustibile: 250 kW</li></ul></div></body></html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end H2;
