within MultiEnergySystem.H2GasFacility.Data;

package PipelineData
  "Generic data depending on the system of the District Heating Network"
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.RoundPipeLine InletGasBoiler(
    L = 5,
    Di = 29.4e-3,
    t = 2e-3,
    tIns = 1.5e-1,
    h = 0,
    lambdaIns = 0.04,
    lambdam = 45,
    hin_start = 105113,
    pmax = 6e5,
    pin_start = 0.3e5,
    pout_start = 0.29e5,
    Tin_start = 25 + 273.15,
    Tout_start = 24.9 + 273.15,
    rho_nom  = 0.71,
    m_flow_start = 0.003339,
    cf = 0,
    u_nom = 6.93,
    k = 91345.474,
    cm = 445,
    rhom = 8000  
    );
end PipelineData;
