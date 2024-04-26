class Reference {
  Reference({
    this.reference,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        reference:
            json['reference'] != null ? json['reference'] as String? : null,
      );
  final String? reference;

  Map<String, dynamic> toJson() => {
        'reference': reference,
      };
}
