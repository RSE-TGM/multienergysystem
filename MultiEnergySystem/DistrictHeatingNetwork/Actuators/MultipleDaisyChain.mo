within MultiEnergySystem.DistrictHeatingNetwork.Actuators;

model MultipleDaisyChain
  parameter Integer n = 5 "Number of actuators to be activated in sequence";
  Modelica.Blocks.Interfaces.RealInput U;
  Modelica.Blocks.Interfaces.RealOutput Yi[n];
  Actuators.DaisyChain DC[n - 1];
equation
  for i in 1:n - 2 loop
    connect(DC[i+1].U, DC[i].Yout2);
  end for;
  
  for i in 1:n - 1 loop
    connect(DC[i].Yout1, Yi[i]);
  end for;
  
  connect(DC[1].U, U);
  connect(DC[n - 1].Yout2, Yi[n]);

end MultipleDaisyChain;
