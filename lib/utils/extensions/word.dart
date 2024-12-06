

extension Word on String {
  String get first => split(' ').first;

  String get notEmpty => (split(',').first.length > 2) ? this : '';

  String get clip14 => length > 14
      ? "...${substring(length - 14, length)}"
      : "...${substring(length - 3, length)}";
  String get clip10 => "...${substring(length > 0 ? length - 10 : 0, length)}";

  String get withManat => "$this ₼";
  String get removeNewLineOperators => replaceAll('\n      ', '');

  //String withPrice(double price) => "$this: $price ₼";

  String withX(String x) => "$this $x";
}
