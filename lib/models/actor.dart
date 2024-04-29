/// Participant involved in the resource.
class Actor {
  /// Creates an [Actor] instance
  Actor({
    this.reference,
    this.display,
  });

  /// Creates an [Actor] instance from JSON data
  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        reference:
            json['reference'] != null ? json['reference'] as String? : null,
        display: json['display'] != null ? json['display'] as String? : null,
      );

  /// The reference to the participant.
  final String? reference;

  /// The display name of the participant.
  final String? display;

  /// Converts an [Actor] instance to JSON data
  Map<String, dynamic> toJson() => {
        if (reference != null) 'reference': reference,
        'display': display,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Actor &&
          other.reference == reference &&
          other.display == display);

  @override
  int get hashCode => Object.hash(reference, display);

  /// Creates a copy of the [Actor] instance and allows
  /// for non-destructive mutation
  Actor copyWith({
    String? reference,
    String? display,
  }) =>
      Actor(
        reference: reference ?? this.reference,
        display: display ?? this.display,
      );
}
