class AppBaseError implements Exception {
  final String code;
  final String description;
  final StackTrace? stack;

  AppBaseError({
    this.code = '',
    this.description = '',
    this.stack,
  });

  @override
  String toString() {
    return '$code: $description';
  }
}

class ValidationError {
  ValidationError._();

  static final AppBaseError loginEmpty = AppBaseError(description: 'Login is empty');

  static final AppBaseError passwordEmpty = AppBaseError(description: 'Password is empty');
}

class NetworkError {
  static final AppBaseError invalidSession = AppBaseError(description: 'Invalid authorization token');

  static final AppBaseError loginFailed = AppBaseError(description: 'Wrong login or password');

  static AppBaseError unknown(String code, String description, StackTrace? stack) =>
      AppBaseError(code: code, description: description.isNotEmpty ? description : "Something Went Wrong", stack: stack);
}
