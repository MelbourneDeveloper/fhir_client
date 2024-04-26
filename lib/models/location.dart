class Location {
  Location({
    this.reference,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        reference:
            json['reference'] != null ? json['reference'] as String? : null,
      );
  final String? reference;

  Map<String, dynamic> toJson() => {
        'reference': reference,
      };
}
