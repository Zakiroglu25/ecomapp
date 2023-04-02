enum PaymentType {
  ONLINE,
  CASH,
  card;

  String get toText => name;
  String? get toValue => this == PaymentType.card ? ONLINE.toText : toText;
}
