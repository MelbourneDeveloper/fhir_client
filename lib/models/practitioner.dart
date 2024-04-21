// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Practitioner {
  final String? reference;

  Practitioner({
    this.reference,
  });

  factory Practitioner.fromJson(Map<String, dynamic> json) {
    return Practitioner(
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
