abstract class JsonObject {
  JsonObject(Map<String, dynamic> json)
      : json = Map.fromEntries(
          json.entries.map((entry) => MapEntry(entry.key, entry.value)),
        );

  //TODO: make this immutable at compile time
  final Map<String, dynamic> json;

  // static Definable<String> getString(JsonObject jo, String fieldName) =>
  //     jo.getValue<String>(fieldName);

  // static Definable<T> getObject<T>(JsonObject jo, String fieldName) =>
  //     jo.getValue<T>(fieldName);

  Definable<T> getValue<T>(
    String fieldName,
  ) =>
      json.containsKey(fieldName)
          ? json[fieldName] is T || json[fieldName] == null
              ? Defined(
                  json[fieldName] as T?,
                  fieldName,
                )
              : WrongType(
                  // ignore: avoid_dynamic_calls
                  json[fieldName].runtimeType.toString(),
                )
          : const Undefined();

  Definable<T> getValueFromObjectArray<T>(
    String fieldName, {
    required T? Function(List<dynamic>?) fromObjectArray,
  }) =>
      json.containsKey(fieldName)
          ? json[fieldName] is List<dynamic> || json[fieldName] == null
              ? Defined(
                  fromObjectArray(
                    json[fieldName] as List<dynamic>?,
                  ),
                  fieldName,
                )
              : WrongType(
                  // ignore: avoid_dynamic_calls
                  json[fieldName].runtimeType.toString(),
                )
          : const Undefined();

  Definable<T> getValueFromString<T>(
    String fieldName, {
    required T? Function(String?) tryParse,
  }) =>
      json.containsKey(fieldName)
          ? json[fieldName] is String || json[fieldName] == null
              ? Defined(tryParse(json[fieldName] as String?), fieldName)
              : WrongType(
                  // ignore: avoid_dynamic_calls
                  json[fieldName].runtimeType.toString(),
                )
          : const Undefined();

  Definable<T> getValueFromArray<T>(
    String fieldName,
    T? Function(List<dynamic>?) fromArray,
  ) =>
      json.containsKey(fieldName)
          ? Defined<T>(
              fromArray(json[fieldName] as List<dynamic>?),
              fieldName,
            ) as Definable<T>
          : const Undefined();

  Map<String, dynamic> toJson() => json;
}

sealed class Definable<T> {
  const Definable();
}

final class Undefined<T> extends Definable<T> {
  const Undefined();

  @override
  //Note: We don't specify a t-ype argument here because they may not
  //match. But, regardless of type, undefined is undefined
  bool operator ==(Object other) => other is Undefined;

  //TODO: is there a different option here?
  @override
  int get hashCode => 'Undefined'.hashCode;
}

final class WrongType<T> extends Definable<T> {
  WrongType(this.typeName);

  final String typeName;
}

final class Defined<T> extends Definable<T> {
  Defined(this.value, this.fieldName);

  final T? value;
  final String fieldName;

  MapEntry<String, dynamic> toMapEntry() => MapEntry(
        fieldName,
        value,
      );

  @override
  bool operator ==(Object other) =>
      (other is Defined<T> && other.value == value) ||
      other is T && other == value;

  //Is value.hashCode correct? Could this cause collisions?
  @override
  int get hashCode => value.hashCode;
}
