import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

/// An address expressed using postal conventions (as opposed to GPS or
/// other location definition formats). This datatype may be used
/// to convey addresses for use in delivering mail as well as for
/// visiting locations which might not be valid for mail delivery.
/// There are a variety of postal address formats defined around the world.
///
/// https://hl7.org/fhir/datatypes.html#Address
class Address {
  /// Creates an instance of [Address].
  Address({
    String? use,
    String? type,
    String? text,
    FixedList<String>? line,
    String? city,
    String? district,
    String? state,
    String? postalCode,
    String? country,
    Period? period,
  }) : this.fromJson(
          JsonObject({
            if (use != null) useField.name: JsonString(use),
            if (type != null) typeField.name: JsonString(type),
            if (text != null) textField.name: JsonString(text),
            if (line != null)
              lineField.name: JsonArray.unmodifiable(line.map(JsonString.new)),
            if (city != null) cityField.name: JsonString(city),
            if (district != null) districtField.name: JsonString(district),
            if (state != null) stateField.name: JsonString(state),
            if (postalCode != null)
              postalCodeField.name: JsonString(postalCode),
            if (country != null) countryField.name: JsonString(country),
            if (period != null) periodField.name: period.json,
          }),
        );

  /// Creates an instance of [Address] from a JSON object.
  Address.fromJson(this._json);

  final JsonObject _json;

  /// Converts the [Address] instance to a JSON object.
  JsonObject get json => _json;

  /// home | work | temp | old | billing - purpose of this address
  String? get use => useField.getValue(_json);

  /// postal | physical | both
  String? get type => typeField.getValue(_json);

  /// Text representation of the address
  String? get text => textField.getValue(_json);

  /// Street name, number, direction & P.O. Box etc. This repeating element
  /// order: The order in which lines should appear in an address label
  FixedList<String>? get line => lineField.getValue(_json);

  /// Name of city, town etc.
  String? get city => cityField.getValue(_json);

  /// District name (aka county)
  String? get district => districtField.getValue(_json);

  /// Sub-unit of country (abbreviations ok)
  String? get state => stateField.getValue(_json);

  /// Postal code for area
  String? get postalCode => postalCodeField.getValue(_json);

  /// Country (e.g. may be ISO 3166 2 or 3 letter code)
  String? get country => countryField.getValue(_json);

  /// Time period when address was/is in use
  Period? get period => periodField.getValue(_json);

  /// Field definition for [use]
  static const useField = FieldDefinition(
    name: 'use',
    getValue: _getUse,
  );

  /// Field definition for [type]
  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  /// Field definition for [text]
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
  );

  /// Field definition for [line]
  static const lineField = FieldDefinition(
    name: 'line',
    getValue: _getLine,
  );

  /// Field definition for [city]
  static const cityField = FieldDefinition(
    name: 'city',
    getValue: _getCity,
  );

  /// Field definition for [district]
  static const districtField = FieldDefinition(
    name: 'district',
    getValue: _getDistrict,
  );

  /// Field definition for [state]
  static const stateField = FieldDefinition(
    name: 'state',
    getValue: _getState,
  );

  /// Field definition for [postalCode]
  static const postalCodeField = FieldDefinition(
    name: 'postalCode',
    getValue: _getPostalCode,
  );

  /// Field definition for [country]
  static const countryField = FieldDefinition(
    name: 'country',
    getValue: _getCountry,
  );

  /// Field definition for [period]
  static const periodField = FieldDefinition(
    name: 'period',
    getValue: _getPeriod,
  );

  /// All field definitions for [Address]
  static const fieldDefinitions = [
    useField,
    typeField,
    textField,
    lineField,
    cityField,
    districtField,
    stateField,
    postalCodeField,
    countryField,
    periodField,
  ];

  static String? _getUse(JsonObject jo) => jo[useField.name].stringValue;

  static String? _getType(JsonObject jo) => jo[typeField.name].stringValue;

  static String? _getText(JsonObject jo) => jo[textField.name].stringValue;

  static FixedList<String>? _getLine(JsonObject jo) =>
      switch (jo[lineField.name]) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.map((e) => e.stringValue!)),
        _ => null,
      };

  static String? _getCity(JsonObject jo) => jo[cityField.name].stringValue;

  static String? _getDistrict(JsonObject jo) =>
      jo[districtField.name].stringValue;

  static String? _getState(JsonObject jo) => jo[stateField.name].stringValue;

  static String? _getPostalCode(JsonObject jo) =>
      jo[postalCodeField.name].stringValue;

  static String? _getCountry(JsonObject jo) =>
      jo[countryField.name].stringValue;

  static Period? _getPeriod(JsonObject jo) => switch (jo[periodField.name]) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Address && other.json == _json);

  @override
  int get hashCode => Object.hash(runtimeType, _json);

  /// Creates a copy of the [Address] instance and allows
  /// for non-destructive mutation.
  Address copyWith({
    String? use,
    String? type,
    String? text,
    FixedList<String>? line,
    String? city,
    String? district,
    String? state,
    String? postalCode,
    String? country,
    Period? period,
  }) =>
      Address(
        use: use ?? this.use,
        type: type ?? this.type,
        text: text ?? this.text,
        line: line ?? this.line,
        city: city ?? this.city,
        district: district ?? this.district,
        state: state ?? this.state,
        postalCode: postalCode ?? this.postalCode,
        country: country ?? this.country,
        period: period ?? this.period,
      );
}
