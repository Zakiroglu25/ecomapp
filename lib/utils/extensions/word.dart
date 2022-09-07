extension Word on String {
  String get first => split(' ').first;

  String get notEmpty => (split(',').first.length > 2) ? this : '';

  String get clip14 => "...${substring(length - 14, length)}";
}
