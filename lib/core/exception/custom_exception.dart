enum AlertTheme { normal, error, info, warning, success, hlError, hlinfo, hlWarning, hlSuccess }

class CustomException implements Exception {
  final int? codeNumber;
  final String? codeString;
  final String message;
  final String title;

  /// filename.function name
  final String code;
  final AlertTheme alertTheme;
  const CustomException({
    this.codeNumber,
    this.codeString,
    this.alertTheme = AlertTheme.normal,
    required this.title,
    required this.message,
    required this.code,
  });

  @override
  String toString() {
    return 'CustomException(codeNumber: $codeNumber, codeString: $codeString, title: $title,  message: $message, code: $code)';
  }
}
