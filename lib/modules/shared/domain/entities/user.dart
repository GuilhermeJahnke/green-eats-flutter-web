import 'package:hive_flutter/hive_flutter.dart';

import '../../configs/constants/app_assets.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.document,
    this.photoUrl = AppAssets.defaultProfileIcon,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String document;
  @HiveField(4)
  final String photoUrl;

  User copyWith({
    String? id,
    String? name,
    String? lastName,
    String? email,
    String? document,
    String? photoUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      document: document ?? this.document,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
