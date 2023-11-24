import '../../../../../shared/mocks/mock_request.dart';

extension StringExtension on String {
  MockRequestType get httpMethod {
    switch (toUpperCase()) {
      case 'GET':
        return MockRequestType.get;
      case 'POST':
        return MockRequestType.post;
      case 'PATCH':
        return MockRequestType.patch;
      case 'DELETE':
        return MockRequestType.delete;
      default:
        throw Exception('Method not found for string: $this');
    }
  }
}
