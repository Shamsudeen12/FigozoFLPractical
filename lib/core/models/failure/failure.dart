class Failure {
  final String message;
  final int code;

  Failure(this.message, this.code);

  static const int socketExceptionCode = 1;
  static const String socketExceptionMsg =
      'Please check your internet connection';

  static const int httpExceptionCode = 2;
  static const String httpExceptionMsg =
      'Oops! An error occurred. Please try again';

  static const int formatExceptionCode = 3;
  static const String formatExceptionMsg =
      'Oops! A cast error occurred. Please try again';

  static const int somethingWentWrongCode = 4;
  static const String somethingWentWrongMsg =
      'Oops! An error occurred. Please try again';
}
