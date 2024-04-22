class Actor {
  Actor({
    this.reference,
    this.display,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        reference:
            json['reference'] != null ? json['reference'] as String? : null,
        display: json['display'] != null ? json['display'] as String? : null,
      );
  final String? reference;
  final String? display;

  Map<String, dynamic> toJson() => {
        'reference': reference,
        'display': display,
      };
}
