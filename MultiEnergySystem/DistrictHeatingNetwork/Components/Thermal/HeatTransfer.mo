within MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal;
package HeatTransfer
import DistrictHeatingNetwork.Types;

  model IdealHeatTransfer "Ideal heat transfer model"
    extends Thermal.BaseClasses.BaseConvectiveHeatTransfer(
      computeTransport = false);
  equation
    for i in 1:n loop
      //Twall[i] = Tmean[i];
      gamma[i] = 1e9 "not used, should be infinite";
      Q_flow[i] = 0 "ideal heat transfer, non heat flow";
      if computeTransport then
        Re[i] = sqrt(m_flow[i]^2 + (epsilon*m_flow_nom)^2)*Lc/mu[i]/A "All referred to a single tube (in fact we get a (m_flow*nPipes)/(A*nPipes)";
        Pr[i] = mu[i] * cp[i] / k[i];
        Nu[i] = gamma[i] * Lc / k[i];
      else
        Re[i] = 0;
        Pr[i] = 0;
        Nu[i] = 0;
      end if;
    end for;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end IdealHeatTransfer;

  model FlowDependentHeatTransferCoefficient
    extends
      MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer(
       final computeTransport=false, gamma(each start=gamma_approx));

  initial equation
    assert(not computeTransport, "The model cannot use transport properties");
  equation

    for i in 1:n loop
      gamma[i] = homotopy(gamma_nom*mflow_mflownom_reg^alpha,gamma_approx) "Q flow è definito positivo entrante";
      Q_flow[i] = gamma[i]*kc*S/n*(Twall[i]-Tmean[i]);

      if computeTransport then
        Re[i] = sqrt(m_flow[i]^2 + (epsilon*m_flow_nom)^2)*Lc/mu[i]/A "All referred to a single tube (in fact we get a (m_flow*nPipes)/(A*nPipes)";
        Pr[i] = mu[i] * cp[i] / k[i];
        Nu[i] = gamma[i] * Lc / k[i];
      else
        Re[i] = 0;
        Pr[i] = 0;
        Nu[i] = 0;
      end if;
    end for;

  end FlowDependentHeatTransferCoefficient;

  model ConstantHeatTransferCoefficient
    extends FlowDependentHeatTransferCoefficient(
    alpha = 0 "it means gamma = gamma_nom",
    final beta = 1,
    final gamma_approx = gamma_nom);
  end ConstantHeatTransferCoefficient;

  model FlowPressureDependentHeatTransferCoefficient
    extends
      MultiEnergySystem.DistrictHeatingNetwork.Components.Thermal.BaseClasses.BaseConvectiveHeatTransfer(
       final computeTransport=false, gamma(each start=gamma_approx));

    parameter Modelica.Units.SI.Pressure pnom_ht = p_nom
      "Nominal pressure for heat transfer correlation (single tube)";
    parameter Modelica.Units.SI.PerUnit theta = 0.5
      "Exponent in the pressure-dependency law";
    Modelica.Units.SI.PerUnit p_over_pnom(start = 1)
      "Ratio between actual and nominap pressure";
    Modelica.Units.SI.PerUnit p_pnom_reg
      "Regularized ratio between actual and nominal pressure";
  initial equation
    assert(not computeTransport, "The model cannot use transport properties");
  equation
    p_over_pnom = abs(p)/pnom_ht;
    p_pnom_reg = DistrictHeatingNetwork.Utilities.smoothSat(p_over_pnom, beta, 1e9, beta/2);

    for i in 1:n loop
      gamma[i] = homotopy(gamma_nom*mflow_mflownom_reg^alpha*p_pnom_reg^theta,gamma_approx);
      Q_flow[i] = gamma[i]*kc*S/n*(Twall[i]-Tmean[i]) "Q flow è definito positivo entrante";

      if computeTransport then
        Re[i] = sqrt(m_flow[i]^2 + (epsilon*m_flow_nom)^2)*Lc/mu[i]/A "All referred to a single tube (in fact we get a (m_flow*nPipes)/(A*nPipes)";
        Pr[i] = mu[i] * cp[i] / k[i];
        Nu[i] = gamma[i] * Lc / k[i];
      else
        Re[i] = 0;
        Pr[i] = 0;
        Nu[i] = 0;
      end if;
    end for;

  end FlowPressureDependentHeatTransferCoefficient;
end HeatTransfer;
