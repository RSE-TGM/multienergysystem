within MultiEnergySystem.DistrictHeatingNetwork.Utilities;
model ReadRealMatrixFromFile
  "Demonstrate usage of function Streams.readRealMatrix"
  import Modelica.Utilities.Streams.print;
  extends Modelica.Icons.Example;
//   parameter String file = Modelica.Utilities.Files.loadResource("modelica://Modelica/Resources/Data/Utilities/Test_RealMatrix_v4.mat") "File name of matrix"
//     annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
//   parameter String file = Modelica.Utilities.Files.loadResource("C:\DiscoD\Muro\Lavoro\Temperatures.mat") "File name of matrix"
//     annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String Temperatures = Modelica.Utilities.Files.loadResource("modelica://MultiEnergySystem/TestFacility/Resources/Centralised/0412_Test2.mat") "File name of matrix"
    annotation(Dialog(loadSelector(filter="MATLAB MAT files (*.mat)", caption="Open MATLAB MAT file")));
  parameter String matrixTT701 = "TT701" "Matrix name in file";
  parameter String matrixTT702 = "TT702" "Matrix name in file";
  parameter String matrixTT703 = "TT703" "Matrix name in file";
  parameter String matrixTT704 = "TT704" "Matrix name in file";
  final parameter Integer dim[2] = Modelica.Utilities.Streams.readMatrixSize(Temperatures,matrixTT701) "Dimension of matrix";
  final parameter Real TT701[dim[1],dim[2]] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT701,dim[1],dim[2]) "Matrix data";
//  final parameter Real TT702[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT702,dim[1],dim[2]) "Matrix data";
//  final parameter Real TT703[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT704,dim[1],dim[2]) "Matrix data";
//  final parameter Real TT704[:,:] = Modelica.Utilities.Streams.readRealMatrix(Temperatures,matrixTT704,dim[1],dim[2]) "Matrix data";

//   final parameter String file1 = Modelica.Utilities.Files.loadResource("modelica://Modelica/Resources/Data/Utilities/Test_RealMatrix_v4.mat") "File name of check matrix 1";
//   final parameter String file2 = Modelica.Utilities.Files.loadResource("modelica://Modelica/Resources/Data/Utilities/Test_RealMatrix_v6.mat") "File name of check matrix 2";
//   final parameter String file3 = Modelica.Utilities.Files.loadResource("modelica://Modelica/Resources/Data/Utilities/Test_RealMatrix_v7.mat") "File name of check matrix 3";
//   final parameter String matrixName1 = "Matrix_A" "Names of check matrices";
//   final parameter Integer dim1[2] = Modelica.Utilities.Streams.readMatrixSize(file1,matrixName1) "Dimension of check matrix 1";
//   final parameter Integer dim2[2] = Modelica.Utilities.Streams.readMatrixSize(file2,matrixName1) "Dimension of check matrix 2";
//   final parameter Integer dim3[2] = Modelica.Utilities.Streams.readMatrixSize(file3,matrixName1) "Dimension of check matrix 3";
//   final parameter Real A1[:,:] = Modelica.Utilities.Streams.readRealMatrix(file1,matrixName1,dim1[1],dim1[2]) "Data of check matrix 1";
//   final parameter Real A2[:,:] = Modelica.Utilities.Streams.readRealMatrix(file2,matrixName1,dim2[1],dim2[2]) "Data of check matrix 2";
//   final parameter Real A3[:,:] = Modelica.Utilities.Streams.readRealMatrix(file3,matrixName1,dim3[1],dim3[2]) "Data of check matrix 3";
//   Real x(start=1, fixed=true) "Dummy state";
protected
  constant Real eps = 10* Modelica.Constants.eps;
equation
//   assert(abs(A1[1,1] - 11) <= eps, "Resources/Data/Utilities/Test_RealMatrix_v4.mat not correctly loaded");
//   assert(abs(A2[1,1] - 11) <= eps, "Resources/Data/Utilities/Test_RealMatrix_v6.mat not correctly loaded");
//   assert(abs(A3[1,1] - 11) <= eps, "Resources/Data/Utilities/Test_RealMatrix_v7.mat not correctly loaded");
//
//   der(x) = -A[1,1]*x;
algorithm
//   when initial() then
//      print("... Matrix " + matrixName + "[" + String(size(A,1)) + "," + String(size(A,2)) + "] read from file " + file);
//      print("...    " + matrixName + "[1,1] = " + String(A[1,1]));
//   end when;

  annotation(preferredView="text", experiment(StopTime=0.1), Documentation(info="<html>
<p>
Example model that shows how to read a Real matrix in MATLAB MAT format from file
using functions
<a href=\"modelica://Modelica.Utilities.Streams.readMatrixSize\">readMatrixSize</a> and
<a href=\"modelica://Modelica.Utilities.Streams.readRealMatrix\">readRealMatrix</a>.
</p>

<p>
Additionally, specific matrices from the supported file formats are loaded and it is checked
whether the loaded matrices have the expected values.
</p>
</html>"));
end ReadRealMatrixFromFile;
