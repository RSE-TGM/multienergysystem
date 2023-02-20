within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
function smoothSat "Smooth saturation function"
  input Real x;
  input Real xmin "Lower bound of range where y = x";
  input Real xmax "Upper bound of range where y = x";
  input Real dxmin "Width of lower smoothing range";
  input Real dxmax=dxmin "Width of upper smoothing range";
  output Real y;
algorithm
  y := if x < xmin + dxmin then
         xmin + dxmin - dxmin*(xmin + dxmin - x)/(dxmin^4 + (xmin + dxmin - x)^4)^0.25
       else if x > xmax - dxmax then
         xmax - dxmax + dxmax*(x - xmax + dxmax)/(dxmax^4 + (x - xmax + dxmax)^4)^0.25
       else x;
  annotation (smoothOrder=4, InLine=true,
              normallyConstant = xmin, normallyConstant = xmax,
              normallyConstant = dxmin, normallyConstant = dxmax);
end smoothSat;
