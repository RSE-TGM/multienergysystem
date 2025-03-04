within MultiEnergySystem.ElectricNetwork.Interfaces;
connector ElectricPortOutlet
  extends ElectricPort;
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{102,-100}},
          lineColor={56,93,138},
          lineThickness=1,
          fillColor={79,129,189},
          fillPattern=FillPattern.Solid), Rectangle(
          extent={{-78,80},{82,-80}},
          lineColor={56,93,138},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}));
end ElectricPortOutlet;
