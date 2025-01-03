class PricingModel {
  PricingModel(
      {required this.name,
      required this.price,
      required this.included,
      required this.notIncluded});
  final String name;
  final double price;
  final List<String> included;
  final List<String> notIncluded;
}
