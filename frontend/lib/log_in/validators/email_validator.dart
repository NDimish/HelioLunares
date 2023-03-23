String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter your email.";
  }

  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);

  if (!emailValid) {
    return "This email is not valid.";
  }
  return value;
}
