enum OrderStatus { pending, inProgress, rejected, delivered }

class Order {
  Order({
    required this.id,
    required this.price,
    required this.establishmentImage,
    required this.quantity,
    required this.status,
    required this.date,
  });

  final String id;
  final double price;
  final String establishmentImage;
  final int quantity;
  final OrderStatus status;
  final DateTime date;
}
