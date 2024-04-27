enum ResourceType implements Comparable<ResourceType> {
  appointment(
    code: 'Appointment',
    display: 'Appointment',
  ),
  bundle(
    code: 'Bundle',
    display: 'Bundle',
  ),
  encounter(
    code: 'Encounter',
    display: 'Encounter',
  ),
  organization(
    code: 'Organization',
    display: 'Organization',
  ),
  operationOutcome(
    code: 'OperationOutcome',
    display: 'Operation Outcome',
  ),
  patient(
    code: 'Patient',
    display: 'Patient',
  ),
  practitioner(
    code: 'Practitioner',
    display: 'Practitioner',
  ),
  practitionerRole(
    code: 'PractitionerRole',
    display: 'Practitioner Role',
  ),
  schedule(
    code: 'Schedule',
    display: 'Schedule',
  ),
  slot(
    code: 'Slot',
    display: 'Slot',
  );

  const ResourceType({
    required this.code,
    required this.display,
  });

  final String code;
  final String display;

  static ResourceType fromCode(String code) => switch (code) {
        ('Appointment') => appointment,
        ('Bundle') => bundle,
        ('Encounter') => encounter,
        ('Organization') => organization,
        ('OperationOutcome') => operationOutcome,
        ('Patient') => patient,
        ('Practitioner') => practitioner,
        ('PractitionerRole') => practitionerRole,
        ('Schedule') => schedule,
        ('Slot') => slot,
        (_) => throw UnimplementedError(
            'Hey you! The resource $code is not implemented! Please head over to https://github.com/MelbourneDeveloper/fhir_client and write a PR to add this resource.',
          ),
      };

  @override
  int compareTo(ResourceType other) => code == other.code ? 0 : 1;
}
