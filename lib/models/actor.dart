/// Participant involved in the resource.
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

  /// The reference to the participant.
  final String? reference;

  /// The display name of the participant.
  final String? display;

  Map<String, dynamic> toJson() => {
        'reference': reference,
        'display': display,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Actor &&
        other.reference == reference &&
        other.display == display;
  }

  @override
  int get hashCode => reference.hashCode ^ display.hashCode;
}
