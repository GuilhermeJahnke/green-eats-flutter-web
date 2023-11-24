import 'environment.dart';

class DevEnvironment implements Environment {
  @override
  final String suffix = 'dev';

  @override
  final String baseUrl = '';

  @override
  final bool isMock = true;
}

class HmgEnvironment implements Environment {
  @override
  final String suffix = 'hmg';

  @override
  final String baseUrl =
      'http://ec2-100-24-12-220.compute-1.amazonaws.com:3000';

  @override
  final bool isMock = false;
}

class ProdEnvironment implements Environment {
  @override
  final String suffix = '';

  @override
  final String baseUrl = '';

  @override
  final bool isMock = false;
}
