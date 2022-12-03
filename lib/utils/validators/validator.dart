class Validator {
  static bool mail(String? value) {
    if (value == null) return false;
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value);
  }
}
