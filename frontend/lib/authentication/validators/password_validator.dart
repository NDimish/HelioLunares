String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your password.";
  }
  if (value.length < 8) {
    return "Password too short";
  }
  return null;
}
