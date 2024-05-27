import 'package:jayse/jayse.dart';

const serviceCategoryUri =
    'http://terminology.hl7.org/CodeSystem/service-category';

/// The category of a service.
enum ServiceCategory implements Comparable<ServiceCategory> {
  /// Adoption services.
  adoption(
    code: '1',
    display: 'Adoption',
    definition: 'Adoption services.',
    system: serviceCategoryUri,
  ),

  /// Aged care services.
  agedCare(
    code: '2',
    display: 'Aged Care',
    definition: 'Aged care services.',
    system: serviceCategoryUri,
  ),

  /// Allied health services.
  alliedHealth(
    code: '34',
    display: 'Allied Health',
    definition: 'Allied health services.',
    system: serviceCategoryUri,
  ),

  /// Alternative and complementary therapies.
  alternativeComplementaryTherapies(
    code: '3',
    display: 'Alternative/Complementary Therapies',
    definition: 'Alternative and complementary therapies.',
    system: serviceCategoryUri,
  ),

  /// Child care and kindergarten services.
  childCareKindergarten(
    code: '4',
    display: 'Child Care/Kindergarten',
    definition: 'Child care and kindergarten services.',
    system: serviceCategoryUri,
  ),

  /// Child development services.
  childDevelopment(
    code: '5',
    display: 'Child Development',
    definition: 'Child development services.',
    system: serviceCategoryUri,
  ),

  /// Child protection and family services.
  childProtectionFamilyServices(
    code: '6',
    display: 'Child Protection & Family Services',
    definition: 'Child protection and family services.',
    system: serviceCategoryUri,
  ),

  /// Community health care services.
  communityHealthCare(
    code: '7',
    display: 'Community Health Care',
    definition: 'Community health care services.',
    system: serviceCategoryUri,
  ),

  /// Counselling services.
  counselling(
    code: '8',
    display: 'Counselling',
    definition: 'Counselling services.',
    system: serviceCategoryUri,
  ),

  /// Crisis line services (GPAH use only).
  crisisLine(
    code: '36',
    display: 'Crisis Line (GPAH use only)',
    definition: 'Crisis line services (GPAH use only).',
    system: serviceCategoryUri,
  ),

  /// Death services.
  deathServices(
    code: '9',
    display: 'Death Services',
    definition: 'Death services.',
    system: serviceCategoryUri,
  ),

  /// Dental services.
  dental(
    code: '10',
    display: 'Dental',
    definition: 'Dental services.',
    system: serviceCategoryUri,
  ),

  /// Disability support services.
  disabilitySupport(
    code: '11',
    display: 'Disability Support',
    definition: 'Disability support services.',
    system: serviceCategoryUri,
  ),

  /// Drug and alcohol services.
  drugAlcohol(
    code: '12',
    display: 'Drug/Alcohol',
    definition: 'Drug and alcohol services.',
    system: serviceCategoryUri,
  ),

  /// Education and learning services.
  educationLearning(
    code: '13',
    display: 'Education & Learning',
    definition: 'Education and learning services.',
    system: serviceCategoryUri,
  ),

  /// Emergency department services.
  emergencyDepartment(
    code: '14',
    display: 'Emergency Department',
    definition: 'Emergency department services.',
    system: serviceCategoryUri,
  ),

  /// Employment services.
  employment(
    code: '15',
    display: 'Employment',
    definition: 'Employment services.',
    system: serviceCategoryUri,
  ),

  /// Financial and material aid services.
  financialMaterialAid(
    code: '16',
    display: 'Financial & Material aid',
    definition: 'Financial and material aid services.',
    system: serviceCategoryUri,
  ),

  /// General practice and GP (doctor) services.
  generalPracticeGP(
    code: '17',
    display: 'General Practice/GP (doctor)',
    definition: 'General practice and GP (doctor) services.',
    system: serviceCategoryUri,
  ),

  /// Hospital services.
  hospital(
    code: '35',
    display: 'Hospital',
    definition: 'Hospital services.',
    system: serviceCategoryUri,
  ),

  /// Housing and homelessness services.
  housingHomelessness(
    code: '18',
    display: 'Housing/Homelessness',
    definition: 'Housing and homelessness services.',
    system: serviceCategoryUri,
  ),

  /// Interpreting services.
  interpreting(
    code: '19',
    display: 'Interpreting',
    definition: 'Interpreting services.',
    system: serviceCategoryUri,
  ),

  /// Justice services.
  justice(
    code: '20',
    display: 'Justice',
    definition: 'Justice services.',
    system: serviceCategoryUri,
  ),

  /// Legal services.
  legal(
    code: '21',
    display: 'Legal',
    definition: 'Legal services.',
    system: serviceCategoryUri,
  ),

  /// Mental health services.
  mentalHealth(
    code: '22',
    display: 'Mental Health',
    definition: 'Mental health services.',
    system: serviceCategoryUri,
  ),

  /// National Disability Insurance Agency services.
  ndia(
    code: '38',
    display: 'NDIA',
    definition: 'National Disability Insurance Agency services.',
    system: serviceCategoryUri,
  ),

  /// Physical activity and recreation services.
  physicalActivityRecreation(
    code: '23',
    display: 'Physical Activity & Recreation',
    definition: 'Physical activity and recreation services.',
    system: serviceCategoryUri,
  ),

  /// Regulation services.
  regulation(
    code: '24',
    display: 'Regulation',
    definition: 'Regulation services.',
    system: serviceCategoryUri,
  ),

  /// Respite and carer support services.
  respiteCarerSupport(
    code: '25',
    display: 'Respite/Carer Support',
    definition: 'Respite and carer support services.',
    system: serviceCategoryUri,
  ),

  /// Specialist clinical pathology services.
  specialistClinicalPathology(
    code: '26',
    display: 'Specialist Clinical Pathology',
    definition: 'Specialist clinical pathology services.',
    system: serviceCategoryUri,
  ),

  /// Specialist medical services.
  specialistMedical(
    code: '27',
    display: 'Specialist Medical',
    definition: 'Specialist medical services.',
    system: serviceCategoryUri,
  ),

  /// Specialist obstetrics and gynecology services.
  specialistObstetricsGynecology(
    code: '28',
    display: 'Specialist Obstetrics & Gynecology',
    definition: 'Specialist obstetrics and gynecology services.',
    system: serviceCategoryUri,
  ),

  /// Specialist paediatric services.
  specialistPaediatric(
    code: '29',
    display: 'Specialist Paediatric',
    definition: 'Specialist paediatric services.',
    system: serviceCategoryUri,
  ),

  /// Specialist radiology and imaging services.
  specialistRadiologyImaging(
    code: '30',
    display: 'Specialist Radiology/Imaging',
    definition: 'Specialist radiology and imaging services.',
    system: serviceCategoryUri,
  ),

  /// Specialist surgical services.
  specialistSurgical(
    code: '31',
    display: 'Specialist Surgical',
    definition: 'Specialist surgical services.',
    system: serviceCategoryUri,
  ),

  /// Support group services.
  supportGroup(
    code: '32',
    display: 'Support group/s',
    definition: 'Support group services.',
    system: serviceCategoryUri,
  ),

  /// Test message services (HSD admin use only).
  testMessage(
    code: '37',
    display: 'Test Message (HSD admin use only)',
    definition: 'Test message services (HSD admin use only).',
    system: serviceCategoryUri,
  ),

  /// Transport services.
  transport(
    code: '33',
    display: 'Transport',
    definition: 'Transport services.',
    system: serviceCategoryUri,
  );

  const ServiceCategory({
    required this.code,
    required this.display,
    required this.definition,
    required this.system,
  });

  final String code;
  final String display;
  final String definition;
  final String system;

  /// Returns the service category based on the string code, and returns null if
  /// no match is found
  static ServiceCategory? fromCode(String code) => switch (code) {
        ('1') => ServiceCategory.adoption,
        ('2') => ServiceCategory.agedCare,
        ('34') => ServiceCategory.alliedHealth,
        ('3') => ServiceCategory.alternativeComplementaryTherapies,
        ('4') => ServiceCategory.childCareKindergarten,
        ('5') => ServiceCategory.childDevelopment,
        ('6') => ServiceCategory.childProtectionFamilyServices,
        ('7') => ServiceCategory.communityHealthCare,
        ('8') => ServiceCategory.counselling,
        ('36') => ServiceCategory.crisisLine,
        ('9') => ServiceCategory.deathServices,
        ('10') => ServiceCategory.dental,
        ('11') => ServiceCategory.disabilitySupport,
        ('12') => ServiceCategory.drugAlcohol,
        ('13') => ServiceCategory.educationLearning,
        ('14') => ServiceCategory.emergencyDepartment,
        ('15') => ServiceCategory.employment,
        ('16') => ServiceCategory.financialMaterialAid,
        ('17') => ServiceCategory.generalPracticeGP,
        ('35') => ServiceCategory.hospital,
        ('18') => ServiceCategory.housingHomelessness,
        ('19') => ServiceCategory.interpreting,
        ('20') => ServiceCategory.justice,
        ('21') => ServiceCategory.legal,
        ('22') => ServiceCategory.mentalHealth,
        ('38') => ServiceCategory.ndia,
        ('23') => ServiceCategory.physicalActivityRecreation,
        ('24') => ServiceCategory.regulation,
        ('25') => ServiceCategory.respiteCarerSupport,
        ('26') => ServiceCategory.specialistClinicalPathology,
        ('27') => ServiceCategory.specialistMedical,
        ('28') => ServiceCategory.specialistObstetricsGynecology,
        ('29') => ServiceCategory.specialistPaediatric,
        ('30') => ServiceCategory.specialistRadiologyImaging,
        ('31') => ServiceCategory.specialistSurgical,
        ('32') => ServiceCategory.supportGroup,
        ('37') => ServiceCategory.testMessage,
        ('33') => ServiceCategory.transport,
        (_) => null,
      };

  JsonValue get json => JsonString(code);

  @override
  int compareTo(ServiceCategory other) => code == other.code ? 0 : 1;
}
