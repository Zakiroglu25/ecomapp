extension IterableExtension<T> on Iterable<T?>? {
  //T? get firstOrNull => first != null ? first : null;
  T? get firstOrNull =>
      (isNotEmptyOrNull && this?.first != null) ? this!.first : null;
  //bool get isEmptyOrNull => this == null || this.isEmpty;
  bool get isEmptyOrNull => (this == null || (this != null && this!.isEmpty));
  bool get isNotEmptyOrNull => (this != null && this!.isNotEmpty);
}
