within MultiEnergySystem.H2GasFacility.Tests.SubSystem;
model PaperCaseI_CH4_A "Same as PaperCaseI_CH4 with pure CH4 and with at step CH4 injection in node 3"
  extends PaperCaseI_CH4(
  computeInertialTerm = false,
  hctype = DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle,
  m_flow_H2_ref = 0.005,
  sourceH2_A(G=0));
  annotation (experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=1000,
      Tolerance=2.5e-05,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>The <span style=\"font-family: Courier New;\">PaperCaseI_CH4_A</span> model is an extension of the <span style=\"font-family: Courier New;\">PaperCaseI_CH4</span> model. This version introduces a step injection of methane (<span style=\"font-family: Courier New;\">CH4</span>) at node 3, while maintaining most of the configurations and features of <span style=\"font-family: Courier New;\">PaperCaseI_CH4</span>. The model is designed to simulate and analyze the system&apos;s behavior when methane is dynamically introduced into a specific node.</p>
<h4>Modified Parameters</h4>
<ul>
<li><b><span style=\"font-family: Courier New;\">computeInertialTerm</span></b>: Set to <span style=\"font-family: Courier New;\">false</span> to disable the inertial term computation for dynamic flow equations.</li>
<li><b><span style=\"font-family: Courier New;\">hctype</span></b>: Configured as <span style=\"font-family: Courier New;\">DistrictHeatingNetwork.Choices.Pipe.HCtypes.Middle</span>, indicating the heat carrier pipe type.</li>
<li><b><span style=\"font-family: Courier New;\">m_flow_H2_ref</span></b>: Adjusted to <span style=\"font-family: Courier New;\">0.005</span> to introduce a step injection of methane at node 3.</li>
<li><b><span style=\"font-family: Courier New;\">sourceH2_A</span></b>: Hydrogen source is active but the fluid is methane.</li>
</ul>
<h4>Use Case</h4>
<p>This model is intended for analyzing transient flow dynamics and the system&apos;s response to methane injection. The injection of 0.005 kg/s is injected in node 3.</p>
<h4>Assumptions</h4>
<ul>
<li>Methane (<span style=\"font-family: Courier New;\">CH4</span>) remains the sole medium throughout the system.</li>
<li>The model is built on the simplified assumptions and configurations of <span style=\"font-family: Courier New;\">PaperCaseI_CH4</span>.</li>
<li>The transient behavior of the system is influenced solely by the step injection at node 3.</li>
</ul>
</html>"));
end PaperCaseI_CH4_A;
