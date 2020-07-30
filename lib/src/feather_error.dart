class FeatherException implements Exception {
  /// object, default ["error"]
  final String object;

  /// The type of error which has occured. One of api_error, api_authentication_error,
  /// rate_limit_error, or validation_error
  final String type;

  /// An error code that can be used to handle the error programmatically.
  final String code;

  /// A human-readable message providing more information about the error.
  final String message;

  FeatherException({this.object = "error", this.type, this.code, this.message});

  factory FeatherException.fromJson(Map<String, dynamic> jsonData) {
    return FeatherException(
        type: jsonData['type'],
        code: jsonData['code'],
        message: jsonData['message']);
  }
  @override
  String toString() => "FeatherException: $message";
}
