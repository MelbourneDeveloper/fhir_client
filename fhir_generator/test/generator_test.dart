// ignore_for_file: lines_longer_than_80_chars

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../bin/fhir_generator.dart';

const addressField = Field(
  name: 'address',
  types: ['Address'],
  dartType: 'FixedList<Address>',
  min: 0,
  max: null,
  isMaxStar: true,
  definition: 'An address for the individual.',
);

const expectedFields = [
  Field(
    name: 'id',
    types: ['http://hl7.org/fhirpath/System.String'],
    dartType: 'String',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition:
        'The logical id of the resource, as used in the URL for the resource. Once assigned, this value never changes.',
  ),
  Field(
    name: 'meta',
    types: ['Meta'],
    dartType: 'Meta',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition:
        'The metadata about the resource. This is content that is maintained by the infrastructure. Changes to the content might not always be associated with version changes to the resource.',
  ),
  Field(
    name: 'implicitRules',
    types: ['uri'],
    dartType: 'Uri',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition:
        'A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.',
  ),
  Field(
    name: 'language',
    types: ['code'],
    dartType: 'Language',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition: 'The base language in which the resource is written.',
  ),
  Field(
    name: 'text',
    types: ['Narrative'],
    dartType: 'Narrative',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition:
        'A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human. The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative. Resource definitions may define what content should be represented in the narrative to ensure clinical safety.',
  ),
  Field(
    name: 'contained',
    types: ['Resource'],
    dartType: 'FixedList<Resource>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition:
        'These resources do not have an independent existence apart from the resource that contains them - they cannot be identified independently, and nor can they have their own independent transaction scope.',
  ),
  Field(
    name: 'extension',
    types: ['Extension'],
    dartType: 'FixedList<Extension>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition:
        'May be used to represent additional information that is not part of the basic definition of the resource. To make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.',
  ),
  Field(
    name: 'modifierExtension',
    types: ['Extension'],
    dartType: 'FixedList<Extension>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition:
        "May be used to represent additional information that is not part of the basic definition of the resource and that modifies the understanding of the element that contains it and/or the understanding of the containing element's descendants. Usually modifier elements provide negation or qualification. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.",
  ),
  Field(
    name: 'identifier',
    types: ['Identifier'],
    dartType: 'FixedList<Identifier>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition: 'An identifier for this patient.',
  ),
  Field(
    name: 'active',
    types: ['boolean'],
    dartType: 'bool',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition:
        "Whether this patient record is in active use. \nMany systems use this property to mark as non-current patients, such as those that have not been seen for a period of time based on an organization's business rules.\n\nIt is often used to filter patient lists to exclude inactive patients\n\nDeceased patients may also be marked as inactive for the same reasons, but may be active for some time after death.",
  ),
  Field(
    name: 'name',
    types: ['HumanName'],
    dartType: 'FixedList<HumanName>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition: 'A name associated with the individual.',
  ),
  Field(
    name: 'telecom',
    types: ['ContactPoint'],
    dartType: 'FixedList<ContactPoint>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition:
        'A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.',
  ),
  Field(
    name: 'gender',
    types: ['code'],
    dartType: 'AdministrativeGender',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition:
        'Administrative Gender - the gender that the patient is considered to have for administration and record keeping purposes.',
    allowedStringValues: ['male', 'female', 'other', 'unknown'],
  ),
  Field(
    name: 'birthDate',
    types: ['date'],
    dartType: 'DateTime',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition: 'The date of birth for the individual.',
  ),
  Field(
    name: 'deceased',
    types: ['boolean', 'dateTime'],
    dartType: 'BooleanOrDateTimeChoice',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition: 'Indicates if the individual is deceased or not.',
  ),
  addressField,
  Field(
    name: 'maritalStatus',
    types: ['CodeableConcept'],
    dartType: 'MaritalStatus',
    min: 0,
    max: 1,
    isMaxStar: false,
    allowedStringValues: [
      'A',
      'D',
      'I',
      'L',
      'M',
      'P',
      'S',
      'T',
      'U',
      'W',
      'UNK',
    ],
    definition:
        "This field contains a patient's most recent marital (civil) status.",
  ),
  Field(
    name: 'multipleBirth',
    types: ['boolean', 'integer'],
    dartType: 'BooleanOrIntegerChoice',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition:
        'Indicates whether the patient is part of a multiple (boolean) or indicates the actual birth order (integer).',
  ),
  Field(
    name: 'photo',
    types: ['Attachment'],
    dartType: 'FixedList<Attachment>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition: 'Image of the patient.',
  ),
  Field(
    name: 'contact',
    types: ['BackboneElement'],
    dartType: 'FixedList<BackboneElement>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition:
        'A contact party (e.g. guardian, partner, friend) for the patient.',
  ),
  Field(
    name: 'communication',
    types: ['BackboneElement'],
    dartType: 'FixedList<BackboneElement>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition:
        'A language which may be used to communicate with the patient about his or her health.',
  ),
  Field(
    name: 'generalPractitioner',
    types: ['Reference'],
    dartType: 'FixedList<Reference>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition: "Patient's nominated care provider.",
  ),
  Field(
    name: 'managingOrganization',
    types: ['Reference'],
    dartType: 'Reference',
    min: 0,
    max: 1,
    isMaxStar: false,
    definition: 'Organization that is the custodian of the patient record.',
  ),
  Field(
    name: 'link',
    types: ['BackboneElement'],
    dartType: 'FixedList<BackboneElement>',
    min: 0,
    max: null,
    isMaxStar: true,
    definition:
        'Link to another patient resource that concerns the same actual patient.',
  ),
];

void main() {
  test('Get Fields', () {
    final (_, _, fields) = processProfile('patient.json');

    expect(fields.length, 24);

    for (var i = 0; i < fields.length; i++) {
      final field = fields[i];
      final expectedField = expectedFields[i];

      expect(field.name, expectedField.name);
      expect(field.types, expectedField.types);
      expect(field.dartType, expectedField.dartType);
      expect(field.min, expectedField.min);
      expect(field.max, expectedField.max);
      expect(field.isMaxStar, expectedField.isMaxStar);
      expect(field.definition.contains(expectedField.definition), true);

      if (expectedField.allowedStringValues == null) {
        expect(field.allowedStringValues, null);
        continue;
      }

      expect(
        field.allowedStringValues,
        containsAll(expectedField.allowedStringValues!),
      );
    }
  });

  test('List of Components (Address)', () {
    expect(staticGetterBody(addressField), '''
switch (jo[addressField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Address.fromJson(e as JsonObject)),
          ),
        _ => null,
      }''');

    expect(fieldDefinition(addressField), """
/// Field definition for [address].
  static const addressField = FieldDefinition(
    name: 'address',
    getValue: _getAddress,
    description: '''
An address for the individual.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );""");
  });

  test('Field Definition List', () {
    final fieldDefinitions = fieldDefinitionList('Patient', expectedFields);
    expect(fieldDefinitions, '''
/// R4: All field definitions for [Patient].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    implicitRulesField,
    languageField,
    textField,
    containedField,
    extensionField,
    modifierExtensionField,
    identifierField,
    activeField,
    nameField,
    telecomField,
    genderField,
    birthDateField,
    deceasedField,
    addressField,
    maritalStatusField,
    multipleBirthField,
    photoField,
    contactField,
    communicationField,
    generalPractitionerField,
    managingOrganizationField,
    linkField,
  ];''');
  });
}
