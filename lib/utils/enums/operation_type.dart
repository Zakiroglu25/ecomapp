enum OperationType {
  add,
  delete;

  String get toText => this == add ? '+' : "-";
}
//trn =>: transaction
