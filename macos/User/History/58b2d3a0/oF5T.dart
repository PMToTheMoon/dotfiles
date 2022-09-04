class Validator {
  static String? Function(T?) required<T>() => (T? value) {
        if (value == null) return ':(';
        return null;
      };
}
