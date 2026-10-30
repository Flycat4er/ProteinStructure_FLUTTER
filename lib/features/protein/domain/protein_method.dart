enum ProteinMethod {
  xray('X-RAY DIFFRACTION'),
  electronMicroscopy('ELECTRON MICROSCOPY'),
  nmr('SOLUTION NMR'),
  neutron('NEUTRON DIFFRACTION'),
  other('OTHER');

  const ProteinMethod(this.rawName);

  final String rawName;

  static ProteinMethod fromRaw(String raw) {
    final upper = raw.toUpperCase();
    if (upper.contains('X-RAY')) return ProteinMethod.xray;
    if (upper.contains('MICROSCOPY') || upper.contains('CRYO')) {
      return ProteinMethod.electronMicroscopy;
    }
    if (upper.contains('NMR')) return ProteinMethod.nmr;
    if (upper.contains('NEUTRON')) return ProteinMethod.neutron;
    return ProteinMethod.other;
  }
}
