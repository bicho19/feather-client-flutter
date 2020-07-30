import 'dart:convert';
import 'feather_token.dart';

class FeatherUser {
  ///A unique identifier for the user.
  final String id;

  /// object, default ["user"]
  final String object;

  /// The user's email address.
  final String email;

  /// Indicates whether the user is anonymous or authenticated.
  final bool isAnonymous;

  /// Indicates whether the user has verified ownership of their email address.
  final bool isEmailVerified;

  /// A set of key-value pairs that you can edit to store additional custom information about the user.
  final Map<String, dynamic> metadata;

  /// The moment the user was created.
  final DateTime createdAt;

  /// The most recent moment the user was updated.
  final DateTime updatedAt;

  /// A FeatherToken object containing the user's tokens.
  final FeatherToken token;

  FeatherUser({
    this.id,
    this.object = "user",
    this.email,
    this.isAnonymous,
    this.isEmailVerified,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.metadata,
  });

  factory FeatherUser.fromJson(Map<String, dynamic> jsonData) {
    return FeatherUser(
      id: jsonData['id'],
      createdAt: DateTime.parse(['created_at'].toString()),
      updatedAt: DateTime.parse(['updated_at'].toString()),
      email: jsonData['email'],
      isAnonymous: jsonData['is_anonymous'],
      isEmailVerified: jsonData['is_email_verified'],
      metadata: jsonData['metadata'],
      token: FeatherToken.fromJson(json.decode(jsonData['tokens'])),
    );
  }
}
