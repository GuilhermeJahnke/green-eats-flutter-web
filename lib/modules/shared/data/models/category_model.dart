import '../../domain/entities/category.dart';
import '../exceptions/exceptions.dart';

class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.title,
    required super.imagePath,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    try {
      return CategoryModel(
        id: json['id'],
        title: json['title'],
        imagePath: json['image_url'],
      );
    } catch (error) {
      throw ParseException(
        message: 'Ocorreu um erro ao converter a categoria',
        data: error,
      );
    }
  }
}
