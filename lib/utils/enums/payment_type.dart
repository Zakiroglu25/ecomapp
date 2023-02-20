enum PaymentType {
  ONLINE,
  CASH,
  card,
  unselected;

  String get toText => name;
  String? get toValue =>
      this == PaymentType.unselected ? ONLINE.toText : toText;
}
