class AppDimen {
  AppDimen({
    this.value,
    this.name,
  });

  final double? value;
  final String? name;

  AppDimen copyWith({
    double? value,
    String? name,
  }) {
    return AppDimen(
      value: value ?? this.value,
      name: name ?? this.name,
    );
  }
}
