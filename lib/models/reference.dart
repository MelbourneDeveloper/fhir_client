// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Reference {
  final String? reference;

  Reference({
    this.reference,
  });

  factory Reference.fromJson(Map<String, dynamic> json) {
    return Reference(
      reference:
          json['reference'] != null ? json['reference'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
    };
  }
}
