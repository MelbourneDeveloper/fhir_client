abstract class JsonObject {
  JsonObject(Map<String, dynamic> json)
      : json = Map.fromEntries(
          json.entries.map((entry) => MapEntry(entry.key, entry.value)),
        );

  //TODO: make this immutable at compile time
  final Map<String, dynamic> json;

  Definable<T> getValue<T>(
    String fieldName, {
    T? Function(String?)? tryParse,
    T? Function(List<Map<String, dynamic>>?)? fromObjectArray,
  }) =>
      json.containsKey(fieldName)
          ? tryParse != null
              //TODO: may not be a string
              ? Defined(tryParse(json[fieldName] as String?))
              : fromObjectArray != null
                  ? Defined(
                      fromObjectArray(
                        json[fieldName] as List<Map<String, dynamic>>?,
                      ),
                    )
                  : json[fieldName] is T
                      ? Defined(json[fieldName] as T)
                      // ignore: avoid_dynamic_calls
                      : WrongType(json[fieldName].runtimeType.toString())
          : const Undefined();

  Definable<T> getValueFromArray<T>(
    String fieldName,
    T? Function(List<dynamic>?) fromArray,
  ) =>
      json.containsKey(fieldName)
          ? Defined<T>(fromArray(json[fieldName] as List<dynamic>?))
              as Definable<T>
          : const Undefined();

  Map<String, dynamic> toJson() => json;
}

sealed class Definable<T> {
  Definable(this._value) : isDefined = true;
  const Definable.undefined()
      : isDefined = false,
        _value = null;

  final T? _value;
  final bool isDefined;
}

final class Undefined<T> extends Definable<T> {
  const Undefined() : super.undefined();
}

final class WrongType<T> extends Definable<T> {
  WrongType(this.typeName) : super.undefined();

  final String typeName;
}

final class Defined<T> extends Definable<T> {
  Defined(super._value);
  T? get value => _value;

  @override
  bool operator ==(Object other) =>
      (other is Defined<T> && other.value == value) ||
      other is T && other == _value;

  //Is value.hashCode correct? Could this cause collisions?
  @override
  int get hashCode => value.hashCode;
}
