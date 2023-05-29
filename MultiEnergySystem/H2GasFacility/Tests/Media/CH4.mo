within MultiEnergySystem.H2GasFacility.Tests.Media;

model CH4
  extends Tests.Media.SinglePTXFluidTest(
    redeclare model Medium = H2GasFacility.Media.IdealGases.CH4,
    T_ref = 10 + 273.15,
    p_ref = 1e5,
    X_ref = {1},
    Y = {1});
equation
annotation(
    Documentation(info = "<html><head></head><body><h4>Test Model for pure ideal CH4</h4><div>The fluid model is taken from the MSL and the nominal data is consideren from the following .pdf file:</div><div><br></div><div>22007170_SpecTecApp_Progettazione impianti idrogeno_VM.pdf</div><div><br></div><div><ul><li>Linee circuito gas naturale</li><li>Fluido: gas naturale di rete</li><li>Pressione alla radice: 0.3 barg</li><li>Pressione massima: 0.3 barg</li><li>Temperatura: ambiente</li><li>Portata massima: 25 Nm3/h</li><li>Potenza max combustibile: 250 kW</li></ul></div></body></html>"),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
end CH4;
