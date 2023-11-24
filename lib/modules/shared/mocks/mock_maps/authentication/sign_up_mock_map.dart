class SignUpMockMap {
  const SignUpMockMap._();

  static const Map<String, dynamic> body = {
    'email': 'teste@gmail.com',
    'document': '12345678909',
    'name': 'Amelia rodrigues',
    'password': '2313123',
  };

  static const Map<String, dynamic> response = {
    'id': '123312313',
    'email': 'teste@gmail.com',
    'document': '12345678909',
    'name': 'Amelia rodrigues',
    'lastName': 'rodrigues',
  };
}
