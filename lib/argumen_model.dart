class ArgumentModel {
  final String referenceArgument;
  final Map<String, int> argumentMap;
  final String argumentPrefix;
  final Function minMaxFct;
  final int lowerBoundValue;
  final int invalidValue;
  final int minMaxNoValueReference;
  const ArgumentModel(
      {required this.referenceArgument,
      required this.argumentMap,
      required this.argumentPrefix,
      required this.minMaxFct,
      this.lowerBoundValue = 0,
      required this.invalidValue,
      required this.minMaxNoValueReference});
}
