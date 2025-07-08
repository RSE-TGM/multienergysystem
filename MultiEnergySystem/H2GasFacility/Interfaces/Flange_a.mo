within MultiEnergySystem.H2GasFacility.Interfaces;
connector Flange_a
  "\"One-dimensional rotational flange of a shaft (filled circle icon)\""
  extends Flange;
  annotation (Icon(graphics={Ellipse(
          extent={{-100,-100},{100,100}},
          lineThickness=1,
          fillColor={108,108,108},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}));
end Flange_a;
