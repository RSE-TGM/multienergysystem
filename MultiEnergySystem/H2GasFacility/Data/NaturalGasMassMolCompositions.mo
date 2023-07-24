within MultiEnergySystem.H2GasFacility.Data;
record NaturalGasMassMolCompositions
  Types.MolarMass MM[:] "Molar mass of the gas components";
  Types.MoleFraction Y[:] "Mole fractions of the components";
  Types.MolarMass M[:] = Y.*MM;
  Types.MolarMass Mt = sum(M);
  Types.MassFraction X[:] = M/Mt "Mass fractions of the components";
end NaturalGasMassMolCompositions;
