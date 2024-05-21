import 'package:jayse/jayse.dart';

/// Represents a reference from one resource to another within the
/// FHIR specification.
class Reference {
  /// Constructs a new [Reference] from a [JsonObject].
  Reference({
    String? reference,
    String? type,
    String? identifier,
    String? display,
  }) : this.fromJson(
          JsonObject({
            if (reference != null) 'reference': JsonString(reference),
            if (type != null) 'type': JsonString(type),
            if (identifier != null) 'identifier': JsonString(identifier),
            if (display != null) 'display': JsonString(display),
          }),
        );

  /// Constructs a [Reference] instance from a JSON object.
  Reference.fromJson(this._json);

  final JsonObject _json;

  /// A reference to a resource.
  String? get reference => _json.getValue('reference').stringValue;

  /// The type of the referenced resource.
  String? get type => _json.getValue('type').stringValue;

  /// An identifier for the referenced resource.
  String? get identifier => _json.getValue('identifier').stringValue;

  /// A human-readable string to accompany the reference, providing more
  /// context.
  String? get display => _json.getValue('display').stringValue;

  /// Converts this [Reference] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reference &&
          other.reference == reference &&
          other.type == type &&
          other.identifier == identifier &&
          other.display == display);

  @override
  int get hashCode => Object.hash(reference, type, identifier, display);

  /// Creates a deep copy of this [Reference].
  Reference copyWith({
    String? reference,
    String? type,
    String? identifier,
    String? display,
  }) =>
      Reference(
        reference: reference ?? this.reference,
        type: type ?? this.type,
        identifier: identifier ?? this.identifier,
        display: display ?? this.display,
      );
}
