import '../../domain/entities/order.dart';

class OrderModel extends Order {
  OrderModel({
    required super.id,
    required super.price,
    required super.establishmentImage,
    required super.quantity,
    required super.status,
    required super.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    double quantity = 0;
    double price = 0.0;

    for (var product in json['products']) {
      price += product['product']['price'] * product['quantity'];
      quantity += product['quantity'];
    }

    return OrderModel(
      id: json['id'],
      price: price,
      establishmentImage:
          'https://img.freepik.com/vetores-gratis/ilustracao-de-preparacao-de-refeicao-de-design-plano-desenhado-a-mao_23-2149350982.jpg',
      quantity: quantity.ceil(),
      status: OrderStatus.inProgress,
      date: DateTime.parse(json['updated_at']),
    );
  }
}
