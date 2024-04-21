// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Location {
  final String? reference;

  Location({
    this.reference,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
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
