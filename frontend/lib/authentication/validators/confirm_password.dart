String? confirmPasswordValidator(String? value, String? compValue) {
  if (value == null || value.isEmpty) {
    return "Please re-enter your password.";
  }

  if (value != compValue) {
    return "Passwords do not match.";
  }

  return null;
}
