within MultiEnergySystem.ElectricNetwork.Icons;
partial model SourceV
  annotation (
    Icon(graphics={  Ellipse(fillColor={79,129,189},    fillPattern=FillPattern.Solid,   extent = {{-80, 80}, {80, -80}},
          lineColor={56,93,138}),                                                                                          Text(textColor={255,255,255},     extent={{-24,30},{24,-30}},
          textString="V"),                                                                                                                                                                                       Text(origin = {0, 31}, textColor={79,129,
              189},                                                                                                                                                                                                        extent = {{-100, -111}, {100, -151}},
          textString="%name")}));
end SourceV;
