class FeatherCredential {
  final String id;
  final String object;
  final DateTime createdAt;
  final DateTime expiresAt;
  final List<String> factors;
  final String status;
  final String token;

  FeatherCredential(
      {this.id,
      this.object,
      this.createdAt,
      this.expiresAt,
      this.factors,
      this.status,
      this.token});

  factory FeatherCredential.fromJson(Map<String, dynamic> jsonData) {
    return FeatherCredential(
      id: jsonData['id'],
      object: jsonData['object'],
      createdAt: DateTime.parse(jsonData['created_at'].toString()),
      expiresAt: DateTime.parse(jsonData['expires_at'].toString()),
      factors: List<String>.from(jsonData['factors']),
      status: jsonData['status'],
      token: jsonData['token'],
    );
  }
}
