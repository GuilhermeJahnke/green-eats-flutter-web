import '../../../../../shared/configs/data/network/app_network.dart';
import '../../../../../shared/data/dio/logged_dio.dart';
import '../../../../../shared/data/models/user_model.dart';
import '../../../../../shared/domain/entities/user.dart';
import 'profile_remote_datasource.dart';

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  ProfileRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<User> updateUser({
    required String userId,
    String? name,
    String? email,
  }) async {
    final Map<String, dynamic> body = {};

    if (name != null) {
      body['name'] = name;
    }

    if (email != null) {
      body['email'] = email;
    }

    final response = await loggedDio.patch(
      '${appNetwork.updateProfile}$userId',
      data: body,
      // queryParameters: {
      //   'id': userId,
      // },
    );

    return UserModel.fromJson(response.data);
  }
}
