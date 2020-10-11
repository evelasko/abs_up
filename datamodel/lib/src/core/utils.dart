double Function(double) generateMapper(
    {double inputStart,
    double inputEnd,
    double outputStart,
    double outputEnd}) {
  double mapper(double input) {
    final double slope =
        1.0 * (outputEnd - outputStart) / (inputEnd - inputStart);
    final int output = (outputStart + slope * (input - inputStart)).round();
    return output.toDouble();
  }

  return mapper;
}
