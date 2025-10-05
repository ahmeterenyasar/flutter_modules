extension StringValidation on String {
  bool get isValidName {
    return this.trim().isNotEmpty && this.length >= 2;
  }
}