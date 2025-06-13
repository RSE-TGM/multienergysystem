within MultiEnergySystem.TestFacility.Export.FMU;
model CaseCentralisedII_Polimi_I
  extends CaseCentralisedII(
    redeclare DHTF.Networks.Centralised.LoadControl.CSLC_II_withoutChiller_FC facility(load(
        EX701_Tin_hot=ToutGen_start,
        EX711_Tin_hot=ToutGen_start,
        EX721_Tin_hot=ToutGen_start,
        EX731_Tin_hot=ToutGen_start,
        S701(y_start_PI_TT=0.25, y_start_PI_Pt=0.3),
        S711(y_start_PI_TT=0.25, y_start_PI_Pt=0.3),
        S721(y_start_PI_TT=0.25, y_start_PI_Pt=0.3),
        S731(y_start_PI_TT=0.25, y_start_PI_Pt=0.3)), distribution(T_start_cold=338.15, T_start_hot=ToutGen_start)),
    multiplexFT7X1(
      n1=1,
      n2=1,
      n3=1,
      n4=1));
  annotation (
    Icon(coordinateSystem(grid={0.5,0.5})),
    Diagram(coordinateSystem(grid={0.5,0.5})));
end CaseCentralisedII_Polimi_I;
