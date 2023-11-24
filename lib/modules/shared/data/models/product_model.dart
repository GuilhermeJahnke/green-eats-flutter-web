import '../../domain/entities/product.dart';
import '../exceptions/exceptions.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.weight,
    required super.discount,
    required super.imagePath,
    super.characteristics = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        weight: json['weight'],
        discount: json['discount'],
        imagePath: json['image_url'],
      );
    } catch (error) {
      throw ParseException(
        message: 'Ocorreu um erro ao converter o produto',
        data: error,
      );
    }
  }
}
