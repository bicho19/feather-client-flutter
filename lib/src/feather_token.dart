import 'package:meta/meta.dart';

class FeatherToken {
  final String idToken;
  final String refreshToken;

  FeatherToken({@required this.idToken, @required this.refreshToken});

  factory FeatherToken.fromJson(Map<String, dynamic> jsonData) {
    return FeatherToken(
      idToken: jsonData['idToken'],
      refreshToken: jsonData['refreshToken'],
    );
  }
}
