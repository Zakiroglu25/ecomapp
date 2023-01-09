class OrderStatus {
  OrderStatus._();

  static const String PENDING_APPROVAL = 'PENDING_APPROVAL';
  static const String PENDING_PAYMENT = 'PENDING_PAYMENT';
  static const String CANCELED = 'CANCELED';
  static const String APPROVED = 'APPROVED';
  static const String REJECTED = 'REJECTED';
  static const String PAYMENT_UNSUCCESSFUL = 'PAYMENT_UNSUCCESSFUL';
  static const String PACKAGING = 'PACKAGING';
  static const String READY_TO_PICK_UP = 'READY_TO_PICK_UP';
  static const String PICKED_UP = 'PICKED_UP';
  static const String RETURNED = 'RETURNED';
  static const String DELIVERED = 'DELIVERED';
}
