within MultiEnergySystem.DistrictHeatingNetwork.Data;

package PipelineData
  "Generic data depending on the system of the District Heating Network"
    constant MultiEnergySystem.DistrictHeatingNetwork.Data.RoundPipeLine S100(
    L = 5,
    Di = 51e-3,
    t = 1.5e-3,
    tIns = 1.5e-1,
    h = 0,
    lambdaIns = 0.04,
    lambdam = 45,
    hin_start = 1,
    pmax = 6e5,
    pin_start = 3e5,
    pout_start = 3e5,
    Tin_start = 80 + 273.15,
    Tout_start = 78 + 273.15,
    rho_nom  = 995,
    m_flow_start = 14*S100.rho_nom,
    cf = 0,
    u_nom = 3,
    k = 0.0001,
    cm = 445,
    rhom = 8000  
    );
end PipelineData;
