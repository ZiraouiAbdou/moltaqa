String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    caseSensitive: false,
    multiLine: false,
  );

  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email.';
  }

  return null;
}
