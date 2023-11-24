import 'characteristics.dart';
import 'header_card_helper.dart';

class Product extends HeaderCardHelper {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.weight,
    required this.discount,
    required this.imagePath,
    required this.characteristics,
    this.quantity = 1,
  });

  final String id;
  final String title;
  final String description;
  final double price;
  final double weight;
  final double discount;
  final List<Characteristic> characteristics;

  final int quantity;

  @override
  final String imagePath;

  double get discountPrice => price - (price * (discount / 100));

  double get totalPrice => discountPrice * quantity;

  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? weight,
    double? discount,
    String? imagePath,
    List<Characteristic>? characteristics,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      weight: weight ?? this.weight,
      discount: discount ?? this.discount,
      imagePath: imagePath ?? this.imagePath,
      characteristics: characteristics ?? this.characteristics,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'weight': weight,
      'discount': discount,
      'imagePath': imagePath,
      'quantity': quantity,
    };
  }
}
