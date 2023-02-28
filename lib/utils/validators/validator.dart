class Validator {
  static bool mail(String? value) {
    if (value == null) return false;
    return RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }
}
