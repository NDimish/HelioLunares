String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your password.";
  }
  return null;
}
