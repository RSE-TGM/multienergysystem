within MultiEnergySystem.TestFacility.DHTF.Subsystems.Validation;
package S900 "Validation tests of pumping system"
  extends Modelica.Icons.ExamplesPackage;

  annotation (
    Documentation(info = "<html>
<p><span style=\"font-size: 12pt;\">This package includes all the tests used for validation of system S900 hot side. This includes the <b>pump</b> <b>P901</b>, valve <b>FCV901</b>, pipes connecting the inlet of pump P901 with the system S400 outlet pressure transmitter <b>PT402</b> and the pipe connecting the outlet of valve FCV901 and the pressure transmitter <b>PT902</b>.</span></p>
<p><span style=\"font-size: 12pt;\">The cold side is neglected in this test, then not real data in its boundary conditions.</span></p>
<p><span style=\"font-size: 12pt;\">The analysis takes into account the <b>outlet pressure of the hot side</b>, comparing the simulated outlet pressure with the measured outlet pressure in PT902. The mass flow rate through the hot side (FT902 values approximatly converted from m3/h to kg/s) and the inlet temperature in the hot side (TT902 considered as reference, assuming negligible temperature losses).</span></p>
</html>"));
end S900;
