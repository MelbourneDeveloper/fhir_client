// ignore_for_file: lines_longer_than_80_chars

import 'package:jayse/jayse.dart';

//https://hl7.org/fhir/R4/valueset-service-type.html

const serviceTypeUri = 'http://terminology.hl7.org/CodeSystem/service-type';

/// The type of service being delivered or performed.
enum ServiceType implements Comparable<ServiceType> {
  /// Adoption & permanent care information/support
  adoptionPermanentCareInfoSupport(
    code: '1',
    display: 'Adoption/Permanent Care Info/Support',
    definition: 'Adoption & permanent care information/support',
    system: serviceTypeUri,
  ),

  /// Aged care assessment
  agedCareAssessment(
    code: '2',
    display: 'Aged Care Assessment',
    definition: 'Aged care assessment',
    system: serviceTypeUri,
  ),

  /// Aged Care information/referral
  agedCareInformationReferral(
    code: '3',
    display: 'Aged Care Information/Referral',
    definition: 'Aged Care information/referral',
    system: serviceTypeUri,
  ),

  /// Aged Residential Care
  agedResidentialCare(
    code: '4',
    display: 'Aged Residential Care',
    definition: 'Aged Residential Care',
    system: serviceTypeUri,
  ),

  /// Case management for older persons
  caseManagementForOlderPersons(
    code: '5',
    display: 'Case Management for Older Persons',
    definition: 'Case management for older persons',
    system: serviceTypeUri,
  ),

  /// Delivered meals (meals on wheels)
  deliveredMealsMealsOnWheels(
    code: '6',
    display: 'Delivered Meals (Meals On Wheels)',
    definition: 'Delivered meals (meals on wheels)',
    system: serviceTypeUri,
  ),

  /// Friendly visiting
  friendlyVisiting(
    code: '7',
    display: 'Friendly Visiting',
    definition: 'Friendly visiting',
    system: serviceTypeUri,
  ),

  /// Home care/housekeeping assistance
  homeCareHousekeepingAssistance(
    code: '8',
    display: 'Home Care/Housekeeping Assistance',
    definition: 'Home care/housekeeping assistance',
    system: serviceTypeUri,
  ),

  /// Home maintenance and repair
  homeMaintenanceAndRepair(
    code: '9',
    display: 'Home Maintenance and Repair',
    definition: 'Home maintenance and repair',
    system: serviceTypeUri,
  ),

  /// Personal alarms/alerts
  personalAlarmsAlerts(
    code: '10',
    display: 'Personal Alarms/Alerts',
    definition: 'Personal alarms/alerts',
    system: serviceTypeUri,
  ),

  /// Personal care for older persons
  personalCareForOlderPersons(
    code: '11',
    display: 'Personal Care for Older Persons',
    definition: 'Personal care for older persons',
    system: serviceTypeUri,
  ),

  /// Planned activity groups
  plannedActivityGroups(
    code: '12',
    display: 'Planned Activity Groups',
    definition: 'Planned activity groups',
    system: serviceTypeUri,
  ),

  /// Acupuncture
  acupuncture(
    code: '13',
    display: 'Acupuncture',
    definition: 'Acupuncture',
    system: serviceTypeUri,
  ),

  /// Alexander technique therapy
  alexanderTechniqueTherapy(
    code: '14',
    display: 'Alexander Technique Therapy',
    definition: 'Alexander technique therapy',
    system: serviceTypeUri,
  ),

  /// Aromatherapy
  aromatherapy(
    code: '15',
    display: 'Aromatherapy',
    definition: 'Aromatherapy',
    system: serviceTypeUri,
  ),

  /// Biorhythm services
  biorhythmServices(
    code: '16',
    display: 'Biorhythm Services',
    definition: 'Biorhythm services',
    system: serviceTypeUri,
  ),

  /// Bowen therapy
  bowenTherapy(
    code: '17',
    display: 'Bowen Therapy',
    definition: 'Bowen therapy',
    system: serviceTypeUri,
  ),

  /// Chinese herbal medicine
  chineseHerbalMedicine(
    code: '18',
    display: 'Chinese Herbal Medicine',
    definition: 'Chinese herbal medicine',
    system: serviceTypeUri,
  ),

  /// Feldenkrais
  feldenkrais(
    code: '19',
    display: 'Feldenkrais',
    definition: 'Feldenkrais',
    system: serviceTypeUri,
  ),

  /// Homoeopathy
  homoeopathy(
    code: '20',
    display: 'Homoeopathy',
    definition: 'Homoeopathy',
    system: serviceTypeUri,
  ),

  /// Hydrotherapy
  hydrotherapy(
    code: '21',
    display: 'Hydrotherapy',
    definition: 'Hydrotherapy',
    system: serviceTypeUri,
  ),

  /// Hypnotherapy
  hypnotherapy(
    code: '22',
    display: 'Hypnotherapy',
    definition: 'Hypnotherapy',
    system: serviceTypeUri,
  ),

  /// Kinesiology
  kinesiology(
    code: '23',
    display: 'Kinesiology',
    definition: 'Kinesiology',
    system: serviceTypeUri,
  ),

  /// Magnetic therapy
  magneticTherapy(
    code: '24',
    display: 'Magnetic Therapy',
    definition: 'Magnetic therapy',
    system: serviceTypeUri,
  ),

  /// Massage therapy
  massageTherapy(
    code: '25',
    display: 'Massage Therapy',
    definition: 'Massage therapy',
    system: serviceTypeUri,
  ),

  /// Meditation
  meditation(
    code: '26',
    display: 'Meditation',
    definition: 'Meditation',
    system: serviceTypeUri,
  ),

  /// Myotherapy
  myotherapy(
    code: '27',
    display: 'Myotherapy',
    definition: 'Myotherapy',
    system: serviceTypeUri,
  ),

  /// Naturopathy
  naturopathy(
    code: '28',
    display: 'Naturopathy',
    definition: 'Naturopathy',
    system: serviceTypeUri,
  ),

  /// Reflexology
  reflexology(
    code: '29',
    display: 'Reflexology',
    definition: 'Reflexology',
    system: serviceTypeUri,
  ),

  /// Reiki
  reiki(
    code: '30',
    display: 'Reiki',
    definition: 'Reiki',
    system: serviceTypeUri,
  ),

  /// Relaxation therapy
  relaxationTherapy(
    code: '31',
    display: 'Relaxation Therapy',
    definition: 'Relaxation therapy',
    system: serviceTypeUri,
  ),

  /// Shiatsu
  shiatsu(
    code: '32',
    display: 'Shiatsu',
    definition: 'Shiatsu',
    system: serviceTypeUri,
  ),

  /// Western herbal medicine
  westernHerbalMedicine(
    code: '33',
    display: 'Western Herbal Medicine',
    definition: 'Western herbal medicine',
    system: serviceTypeUri,
  ),

  /// Family day care
  familyDayCare(
    code: '34',
    display: 'Family Day care',
    definition: 'Family day care',
    system: serviceTypeUri,
  ),

  /// Holiday programs
  holidayPrograms(
    code: '35',
    display: 'Holiday Programs',
    definition: 'Holiday programs',
    system: serviceTypeUri,
  ),

  /// Kindergarten inclusion support for children with a disability
  kindergartenInclusionSupport(
    code: '36',
    display: 'Kindergarten Inclusion Support',
    definition: 'Kindergarten inclusion support for children with a disability',
    system: serviceTypeUri,
  ),

  /// Kindergarten/preschool
  kindergartenPreschool(
    code: '37',
    display: 'Kindergarten/Preschool',
    definition: 'Kindergarten/preschool',
    system: serviceTypeUri,
  ),

  /// Long day child care
  longDayChildCare(
    code: '38',
    display: 'Long Day Child Care',
    definition: 'Long day child care',
    system: serviceTypeUri,
  ),

  /// Occasional child care
  occasionalChildCare(
    code: '39',
    display: 'Occasional Child Care',
    definition: 'Occasional child care',
    system: serviceTypeUri,
  ),

  /// Outside school hours care
  outsideSchoolHoursCare(
    code: '40',
    display: 'Outside School Hours Care',
    definition: 'Outside school hours care',
    system: serviceTypeUri,
  ),

  /// Children's play programs
  childrensPlayPrograms(
    code: '41',
    display: "Children's Play Programs",
    definition: "Children's play programs",
    system: serviceTypeUri,
  ),

  /// Parenting & family management support/education
  parentingFamilyManagementSupportEducation(
    code: '42',
    display: 'Parenting/Family Support/Education',
    definition: 'Parenting & family management support/education',
    system: serviceTypeUri,
  ),

  /// Playgroup
  playgroup(
    code: '43',
    display: 'Playgroup',
    definition: 'Playgroup',
    system: serviceTypeUri,
  ),

  /// School nursing
  schoolNursing(
    code: '44',
    display: 'School Nursing',
    definition: 'School nursing',
    system: serviceTypeUri,
  ),

  /// Toy library
  toyLibrary(
    code: '45',
    display: 'Toy Library',
    definition: 'Toy library',
    system: serviceTypeUri,
  ),

  /// Child protection/child abuse report
  childProtectionChildAbuseReport(
    code: '46',
    display: 'Child Protection/Child Abuse Report',
    definition: 'Child protection/child abuse report',
    system: serviceTypeUri,
  ),

  /// Foster care
  fosterCare(
    code: '47',
    display: 'Foster Care',
    definition: 'Foster care',
    system: serviceTypeUri,
  ),

  /// Residential/out of home care
  residentialOutOfHomeCare(
    code: '48',
    display: 'Residential/Out-of-Home Care',
    definition: 'Residential/ out of home care',
    system: serviceTypeUri,
  ),

  /// Support for young people leaving care
  supportForYoungPeopleLeavingCare(
    code: '49',
    display: 'Support - Young People Leaving Care',
    definition: 'Support for young people leaving care',
    system: serviceTypeUri,
  ),

  /// Audiology
  audiology(
    code: '50',
    display: 'Audiology',
    definition: 'Audiology',
    system: serviceTypeUri,
  ),

  /// Blood donation
  bloodDonation(
    code: '51',
    display: 'Blood Donation',
    definition: 'Blood donation',
    system: serviceTypeUri,
  ),

  /// Chiropractic
  chiropractic(
    code: '52',
    display: 'Chiropractic',
    definition: 'Chiropractic',
    system: serviceTypeUri,
  ),

  /// Dietetics
  dietetics(
    code: '53',
    display: 'Dietetics',
    definition: 'Dietetics',
    system: serviceTypeUri,
  ),

  /// Family planning
  familyPlanning(
    code: '54',
    display: 'Family Planning',
    definition: 'Family planning',
    system: serviceTypeUri,
  ),

  /// Health advocacy/Liaison service
  healthAdvocacyLiaisonService(
    code: '55',
    display: 'Health Advocacy/Liaison Service',
    definition: 'Health advocacy/Liaison service',
    system: serviceTypeUri,
  ),

  /// Health information/referral
  healthInformationReferral(
    code: '56',
    display: 'Health Information/Referral',
    definition: 'Health information/referral',
    system: serviceTypeUri,
  ),

  /// Immunization
  immunization(
    code: '57',
    display: 'Immunization',
    definition: 'Immunization',
    system: serviceTypeUri,
  ),

  /// Maternal & child health
  maternalChildHealth(
    code: '58',
    display: 'Maternal & Child Health',
    definition: 'Maternal & child health',
    system: serviceTypeUri,
  ),

  /// Nursing
  nursing(
    code: '59',
    display: 'Nursing',
    definition: 'Nursing',
    system: serviceTypeUri,
  ),

  /// Nutrition
  nutrition(
    code: '60',
    display: 'Nutrition',
    definition: 'Nutrition',
    system: serviceTypeUri,
  ),

  /// Occupational therapy
  occupationalTherapy(
    code: '61',
    display: 'Occupational Therapy',
    definition: 'Occupational therapy',
    system: serviceTypeUri,
  ),

  /// Optometry
  optometry(
    code: '62',
    display: 'Optometry',
    definition: 'Optometry',
    system: serviceTypeUri,
  ),

  /// Osteopathy
  osteopathy(
    code: '63',
    display: 'Osteopathy',
    definition: 'Osteopathy',
    system: serviceTypeUri,
  ),

  /// Pharmacy
  pharmacy(
    code: '64',
    display: 'Pharmacy',
    definition: 'Pharmacy',
    system: serviceTypeUri,
  ),

  /// Physiotherapy
  physiotherapy(
    code: '65',
    display: 'Physiotherapy',
    definition: 'Physiotherapy',
    system: serviceTypeUri,
  ),

  /// Podiatry
  podiatry(
    code: '66',
    display: 'Podiatry',
    definition: 'Podiatry',
    system: serviceTypeUri,
  ),

  /// Sexual health
  sexualHealth(
    code: '67',
    display: 'Sexual Health',
    definition: 'Sexual health',
    system: serviceTypeUri,
  ),

  /// Speech pathology/therapy
  speechPathologyTherapy(
    code: '68',
    display: 'Speech Pathology/Therapy',
    definition: 'Speech pathology/therapy',
    system: serviceTypeUri,
  ),

  /// Bereavement counselling
  bereavementCounselling(
    code: '69',
    display: 'Bereavement Counselling',
    definition: 'Bereavement counselling',
    system: serviceTypeUri,
  ),

  /// Crisis counselling
  crisisCounselling(
    code: '70',
    display: 'Crisis Counselling',
    definition: 'Crisis counselling',
    system: serviceTypeUri,
  ),

  /// Family counselling and/or family therapy
  familyCounsellingTherapy(
    code: '71',
    display: 'Family Counselling/Therapy',
    definition: 'Family counselling and/or family therapy',
    system: serviceTypeUri,
  ),

  /// Family violence counselling
  familyViolenceCounselling(
    code: '72',
    display: 'Family Violence Counselling',
    definition: 'Family violence counselling',
    system: serviceTypeUri,
  ),

  /// Financial counselling
  financialCounselling(
    code: '73',
    display: 'Financial Counselling',
    definition: 'Financial counselling',
    system: serviceTypeUri,
  ),

  /// Generalist counselling
  generalistCounselling(
    code: '74',
    display: 'Generalist Counselling',
    definition: 'Generalist counselling',
    system: serviceTypeUri,
  ),

  /// Genetic counselling
  geneticCounselling(
    code: '75',
    display: 'Genetic Counselling',
    definition: 'Genetic counselling',
    system: serviceTypeUri,
  ),

  /// Health counselling
  healthCounselling(
    code: '76',
    display: 'Health Counselling',
    definition: 'Health counselling',
    system: serviceTypeUri,
  ),

  /// Mediation
  mediation(
    code: '77',
    display: 'Mediation',
    definition: 'Mediation',
    system: serviceTypeUri,
  ),

  /// Problem gambling counselling
  problemGamblingCounselling(
    code: '78',
    display: 'Problem Gambling Counselling',
    definition: 'Problem gambling counselling',
    system: serviceTypeUri,
  ),

  /// Relationship counselling
  relationshipCounselling(
    code: '79',
    display: 'Relationship Counselling',
    definition: 'Relationship counselling',
    system: serviceTypeUri,
  ),

  /// Sexual assault counselling
  sexualAssaultCounselling(
    code: '80',
    display: 'Sexual Assault Counselling',
    definition: 'Sexual assault counselling',
    system: serviceTypeUri,
  ),

  /// Trauma counselling
  traumaCounselling(
    code: '81',
    display: 'Trauma Counselling',
    definition: 'Trauma counselling',
    system: serviceTypeUri,
  ),

  /// Victims of crime counselling
  victimsOfCrimeCounselling(
    code: '82',
    display: 'Victims of Crime Counselling',
    definition: 'Victims of crime counselling',
    system: serviceTypeUri,
  ),

  /// Cemetery operation
  cemeteryOperation(
    code: '83',
    display: 'Cemetery Operation',
    definition: 'Cemetery operation',
    system: serviceTypeUri,
  ),

  /// Cremation
  cremation(
    code: '84',
    display: 'Cremation',
    definition: 'Cremation',
    system: serviceTypeUri,
  ),

  /// Death service information
  deathServiceInformation(
    code: '85',
    display: 'Death Service Information',
    definition: 'Death service information',
    system: serviceTypeUri,
  ),

  /// Funeral services
  funeralServices(
    code: '86',
    display: 'Funeral Services',
    definition: 'Funeral services',
    system: serviceTypeUri,
  ),

  /// Endodontic
  endodontic(
    code: '87',
    display: 'Endodontic',
    definition: 'Endodontic',
    system: serviceTypeUri,
  ),

  /// General dental
  generalDental(
    code: '88',
    display: 'General Dental',
    definition: 'General dental',
    system: serviceTypeUri,
  ),

  /// Oral medicine
  oralMedicine(
    code: '89',
    display: 'Oral Medicine',
    definition: 'Oral medicine',
    system: serviceTypeUri,
  ),

  /// Oral surgery
  oralSurgery(
    code: '90',
    display: 'Oral Surgery',
    definition: 'Oral surgery',
    system: serviceTypeUri,
  ),

  /// Orthodontic
  orthodontic(
    code: '91',
    display: 'Orthodontic',
    definition: 'Orthodontic',
    system: serviceTypeUri,
  ),

  /// Paediatric Dentistry
  paediatricDentistry(
    code: '92',
    display: 'Paediatric Dentistry',
    definition: 'Paediatric Dentistry',
    system: serviceTypeUri,
  ),

  /// Periodontic
  periodontic(
    code: '93',
    display: 'Periodontic',
    definition: 'Periodontic',
    system: serviceTypeUri,
  ),

  /// Prosthodontic
  prosthodontic(
    code: '94',
    display: 'Prosthodontic',
    definition: 'Prosthodontic',
    system: serviceTypeUri,
  ),

  /// Acquired brain injury information/referral
  acquiredBrainInjuryInformationReferral(
    code: '95',
    display: 'Acquired Brain Injury Info/Referral',
    definition: 'Acquired brain injury information/referral',
    system: serviceTypeUri,
  ),

  /// Disability advocacy
  disabilityAdvocacy(
    code: '96',
    display: 'Disability Advocacy',
    definition: 'Disability advocacy',
    system: serviceTypeUri,
  ),

  /// Disability aids & equipment
  disabilityAidsEquipment(
    code: '97',
    display: 'Disability Aids & Equipment',
    definition: 'Disability aids & equipment',
    system: serviceTypeUri,
  ),

  /// Disability case management
  disabilityCaseManagement(
    code: '98',
    display: 'Disability Case Management',
    definition: 'Disability case management',
    system: serviceTypeUri,
  ),

  /// Disability day programs & activities
  disabilityDayProgramsActivities(
    code: '99',
    display: 'Disability Day Programs/Activities',
    definition: 'Disability day programs & activities',
    system: serviceTypeUri,
  ),

  /// Disability information/referral
  disabilityInformationReferral(
    code: '100',
    display: 'Disability Information/Referral',
    definition: 'Disability information/referral',
    system: serviceTypeUri,
  ),

  /// Disability support packages
  disabilitySupportPackages(
    code: '101',
    display: 'Disability Support Packages',
    definition: 'Disability support packages',
    system: serviceTypeUri,
  ),

  /// Disability supported accommodation
  disabilitySupportedAccommodation(
    code: '102',
    display: 'Disability Supported Accommodation',
    definition: 'Disability supported accommodation',
    system: serviceTypeUri,
  ),

  /// Early childhood intervention
  earlyChildhoodIntervention(
    code: '103',
    display: 'Early Childhood Intervention',
    definition: 'Early childhood intervention',
    system: serviceTypeUri,
  ),

  /// Hearing aids & equipment
  hearingAidsEquipment(
    code: '104',
    display: 'Hearing Aids & Equipment',
    definition: 'Hearing aids & equipment',
    system: serviceTypeUri,
  ),

  /// Drug and/or alcohol counselling
  drugAlcoholCounselling(
    code: '105',
    display: 'Drug and/or Alcohol Counselling',
    definition: 'Drug and/or alcohol counselling',
    system: serviceTypeUri,
  ),

  /// Drug and/or alcohol information/referral
  drugAlcoholInformationReferral(
    code: '106',
    display: 'Drug/Alcohol Information/Referral',
    definition: 'Drug and/or alcohol information/referral',
    system: serviceTypeUri,
  ),

  /// Needle & Syringe exchange
  needleSyringeExchange(
    code: '107',
    display: 'Needle & Syringe Exchange',
    definition: 'Needle & Syringe exchange',
    system: serviceTypeUri,
  ),

  /// Non-residential alcohol and/or drug dependence treatment
  nonResidentialAlcoholDrugTreatment(
    code: '108',
    display: 'Non-resid. Alcohol/Drug Treatment',
    definition: 'Non-residential alcohol and/or drug dependence treatment',
    system: serviceTypeUri,
  ),

  /// Pharmacotherapy (eg. methadone) program
  pharmacotherapyProgram(
    code: '109',
    display: 'Pharmacotherapy',
    definition: 'Pharmacotherapy (eg. methadone) program',
    system: serviceTypeUri,
  ),

  /// Quit program
  quitProgram(
    code: '110',
    display: 'Quit Program',
    definition: 'Quit program',
    system: serviceTypeUri,
  ),

  /// Residential alcohol and/or drug dependence treatment
  residentialAlcoholDrugTreatment(
    code: '111',
    display: 'Residential Alcohol/Drug Treatment',
    definition: 'Residential alcohol and/or drug dependence treatment',
    system: serviceTypeUri,
  ),

  /// Adult/community education
  adultCommunityEducation(
    code: '112',
    display: 'Adult/Community Education',
    definition: 'Adult/community education',
    system: serviceTypeUri,
  ),

  /// Higher education
  higherEducation(
    code: '113',
    display: 'Higher Education',
    definition: 'Higher education',
    system: serviceTypeUri,
  ),

  /// Primary education
  primaryEducation(
    code: '114',
    display: 'Primary Education',
    definition: 'Primary education',
    system: serviceTypeUri,
  ),

  /// Secondary education
  secondaryEducation(
    code: '115',
    display: 'Secondary Education',
    definition: 'Secondary education',
    system: serviceTypeUri,
  ),

  /// Training & vocational education
  trainingVocationalEducation(
    code: '116',
    display: 'Training & Vocational Education',
    definition: 'Training & vocational education',
    system: serviceTypeUri,
  ),

  /// Emergency medical
  emergencyMedical(
    code: '117',
    display: 'Emergency Medical',
    definition: 'Emergency medical',
    system: serviceTypeUri,
  ),

  /// Employment placement and/or support
  employmentPlacementSupport(
    code: '118',
    display: 'Employment Placement and/or Support',
    definition: 'Employment placement and/or support',
    system: serviceTypeUri,
  ),

  /// Vocational Rehabilitation
  vocationalRehabilitation(
    code: '119',
    display: 'Vocational Rehabilitation',
    definition: 'Vocational Rehabilitation',
    system: serviceTypeUri,
  ),

  /// Workplace safety and/or accident prevention
  workplaceSafetyAccidentPrevention(
    code: '120',
    display: 'Work Safety/Accident Prevention',
    definition: 'Workplace safety and/or accident prevention',
    system: serviceTypeUri,
  ),

  /// Financial assistance
  financialAssistance(
    code: '121',
    display: 'Financial Assistance',
    definition: 'Financial assistance',
    system: serviceTypeUri,
  ),

  /// Financial information/advice
  financialInformationAdvice(
    code: '122',
    display: 'Financial Information/Advice',
    definition: 'Financial information/advice',
    system: serviceTypeUri,
  ),

  /// Material aid
  materialAid(
    code: '123',
    display: 'Material Aid',
    definition: 'Material aid',
    system: serviceTypeUri,
  ),

  /// General Practice/GP (doctor)
  generalPracticeGP(
    code: '124',
    display: 'General Practice',
    definition: 'General Practice/GP (doctor)',
    system: serviceTypeUri,
  ),

  /// Accommodation placement and/or support
  accommodationPlacementSupport(
    code: '125',
    display: 'Accommodation Placement/Support',
    definition: 'Accommodation placement and/or support',
    system: serviceTypeUri,
  ),

  /// Crisis/emergency accommodation
  crisisEmergencyAccommodation(
    code: '126',
    display: 'Crisis/Emergency Accommodation',
    definition: 'Crisis/emergency accommodation',
    system: serviceTypeUri,
  ),

  /// Homelessness support
  homelessnessSupport(
    code: '127',
    display: 'Homelessness Support',
    definition: 'Homelessness support',
    system: serviceTypeUri,
  ),

  /// Housing information/referral
  housingInformationReferral(
    code: '128',
    display: 'Housing Information/Referral',
    definition: 'Housing information/referral',
    system: serviceTypeUri,
  ),

  /// Public rental housing
  publicRentalHousing(
    code: '129',
    display: 'Public Rental Housing',
    definition: 'Public rental housing',
    system: serviceTypeUri,
  ),

  /// Interpreting/Multilingual/Language service
  interpretingMultilingualLanguageService(
    code: '130',
    display: 'Interpreting/Multilingual Service',
    definition: 'Interpreting/Multilingual/Language service',
    system: serviceTypeUri,
  ),

  /// Juvenile Justice
  juvenileJustice(
    code: '131',
    display: 'Juvenile Justice',
    definition: 'Juvenile Justice',
    system: serviceTypeUri,
  ),

  /// Legal advocacy
  legalAdvocacy(
    code: '132',
    display: 'Legal Advocacy',
    definition: 'Legal advocacy',
    system: serviceTypeUri,
  ),

  /// Legal information/advice/referral
  legalInformationAdviceReferral(
    code: '133',
    display: 'Legal Information/Advice/Referral',
    definition: 'Legal information/advice/referral',
    system: serviceTypeUri,
  ),

  /// Mental health advocacy
  mentalHealthAdvocacy(
    code: '134',
    display: 'Mental Health Advocacy',
    definition: 'Mental health advocacy',
    system: serviceTypeUri,
  ),

  /// Mental health assessment/triage/crisis response
  mentalHealthAssessmentTriageCrisisResponse(
    code: '135',
    display: 'Mental Health Assess/Triage/Crisis Response',
    definition: 'Mental health assessment/triage/crisis response',
    system: serviceTypeUri,
  ),

  /// Mental health case management/continuing care
  mentalHealthCaseManagementContinuingCare(
    code: '136',
    display: 'Mental Health Case Management',
    definition: 'Mental health case management/continuing care',
    system: serviceTypeUri,
  ),

  /// Mental health information/referral
  mentalHealthInformationReferral(
    code: '137',
    display: 'Mental Health Information/Referral',
    definition: 'Mental health information/referral',
    system: serviceTypeUri,
  ),

  /// Mental health inpatient services (hospital psychiatric unit) - requires referral
  mentalHealthInpatientServices(
    code: '138',
    display: 'Mental Health Inpatient Services',
    definition:
        'Mental health inpatient services (hospital psychiatric unit) - requires referral',
    system: serviceTypeUri,
  ),

  /// Mental health non-residential rehabilitation
  mentalHealthNonResidentialRehabilitation(
    code: '139',
    display: 'Mental Health Non-residential Rehab',
    definition: 'Mental health non-residential rehabilitation',
    system: serviceTypeUri,
  ),

  /// Mental health residential rehabilitation/community care unit
  mentalHealthResidentialRehabilitationCommunityCareUnit(
    code: '140',
    display: 'Mental Health Residential Rehab/CCU',
    definition: 'Mental health residential rehabilitation/community care unit',
    system: serviceTypeUri,
  ),

  /// Psychiatry (requires referral)
  psychiatryRequiresReferral(
    code: '141',
    display: 'Psychiatry (Requires Referral)',
    definition: 'Psychiatry (requires referral)',
    system: serviceTypeUri,
  ),

  /// Psychology
  psychology(
    code: '142',
    display: 'Psychology',
    definition: 'Psychology',
    system: serviceTypeUri,
  ),

  /// Martial arts
  martialArts(
    code: '143',
    display: 'Martial Arts',
    definition: 'Martial arts',
    system: serviceTypeUri,
  ),

  /// Personal fitness training
  personalFitnessTraining(
    code: '144',
    display: 'Personal Fitness Training',
    definition: 'Personal fitness training',
    system: serviceTypeUri,
  ),

  /// Physical activity group
  physicalActivityGroup(
    code: '145',
    display: 'Physical Activity Group',
    definition: 'Physical activity group',
    system: serviceTypeUri,
  ),

  /// Physical activity programs
  physicalActivityPrograms(
    code: '146',
    display: 'Physical Activity Programs',
    definition: 'Physical activity programs',
    system: serviceTypeUri,
  ),

  /// Physical fitness testing
  physicalFitnessTesting(
    code: '147',
    display: 'Physical Fitness Testing',
    definition: 'Physical fitness testing',
    system: serviceTypeUri,
  ),

  /// Pilates
  pilates(
    code: '148',
    display: 'Pilates',
    definition: 'Pilates',
    system: serviceTypeUri,
  ),

  /// Self defence
  selfDefence(
    code: '149',
    display: 'Self-Defence',
    definition: 'Self defence',
    system: serviceTypeUri,
  ),

  /// Sporting club
  sportingClub(
    code: '150',
    display: 'Sporting Club',
    definition: 'Sporting club',
    system: serviceTypeUri,
  ),

  /// Yoga
  yoga(
    code: '151',
    display: 'Yoga',
    definition: 'Yoga',
    system: serviceTypeUri,
  ),

  /// Food safety
  foodSafety(
    code: '152',
    display: 'Food Safety',
    definition: 'Food safety',
    system: serviceTypeUri,
  ),

  /// Health regulatory, inspection and/or certification
  healthRegulatoryInspectionCertification(
    code: '153',
    display: 'Health Regulatory /Inspection /Cert.',
    definition: 'Health regulatory, inspection and/or certification',
    system: serviceTypeUri,
  ),

  /// Workplace health and/or safety inspection and/or certification
  workplaceHealthSafetyInspectionCertification(
    code: '154',
    display: 'Work Health/Safety Inspection/Cert.',
    definition:
        'Workplace health and/or safety inspection and/or certification',
    system: serviceTypeUri,
  ),

  /// Carer support
  carerSupport(
    code: '155',
    display: 'Carer Support',
    definition: 'Carer support',
    system: serviceTypeUri,
  ),

  /// Respite care
  respiteCare(
    code: '156',
    display: 'Respite Care',
    definition: 'Respite care',
    system: serviceTypeUri,
  ),

  /// Anatomical Pathology (including Cytopathology & Forensic Pathology)
  anatomicalPathology(
    code: '157',
    display: 'Anatomical Pathology',
    definition:
        'Anatomical Pathology (including Cytopathology & Forensic Pathology)',
    system: serviceTypeUri,
  ),

  /// Pathology - Clinical Chemistry
  pathologyClinicalChemistry(
    code: '158',
    display: 'Pathology - Clinical Chemistry',
    definition: 'Pathology - Clinical Chemistry',
    system: serviceTypeUri,
  ),

  /// Pathology - General
  pathologyGeneral(
    code: '159',
    display: 'Pathology - General',
    definition: 'Pathology - General',
    system: serviceTypeUri,
  ),

  /// Pathology - Genetics
  pathologyGenetics(
    code: '160',
    display: 'Pathology - Genetics',
    definition: 'Pathology - Genetics',
    system: serviceTypeUri,
  ),

  /// Pathology - Haematology
  pathologyHaematology(
    code: '161',
    display: 'Pathology - Haematology',
    definition: 'Pathology - Haematology',
    system: serviceTypeUri,
  ),

  /// Pathology - Immunology
  pathologyImmunology(
    code: '162',
    display: 'Pathology - Immunology',
    definition: 'Pathology - Immunology',
    system: serviceTypeUri,
  ),

  /// Pathology - Microbiology
  pathologyMicrobiology(
    code: '163',
    display: 'Pathology - Microbiology',
    definition: 'Pathology - Microbiology',
    system: serviceTypeUri,
  ),

  /// Anaesthesiology - Pain Medicine
  anaesthesiologyPainMedicine(
    code: '164',
    display: 'Anaesthesiology - Pain Medicine',
    definition: 'Anaesthesiology - Pain Medicine',
    system: serviceTypeUri,
  ),

  /// Cardiology
  cardiology(
    code: '165',
    display: 'Cardiology',
    definition: 'Cardiology',
    system: serviceTypeUri,
  ),

  /// Clinical Genetics
  clinicalGenetics(
    code: '166',
    display: 'Clinical Genetics',
    definition: 'Clinical Genetics',
    system: serviceTypeUri,
  ),

  /// Clinical Pharmacology
  clinicalPharmacology(
    code: '167',
    display: 'Clinical Pharmacology',
    definition: 'Clinical Pharmacology',
    system: serviceTypeUri,
  ),

  /// Dermatology
  dermatology(
    code: '168',
    display: 'Dermatology',
    definition: 'Dermatology',
    system: serviceTypeUri,
  ),

  /// Endocrinology
  endocrinology(
    code: '169',
    display: 'Endocrinology',
    definition: 'Endocrinology',
    system: serviceTypeUri,
  ),

  /// Gastroenterology & Hepatology
  gastroenterologyHepatology(
    code: '170',
    display: 'Gastroenterology & Hepatology',
    definition: 'Gastroenterology & Hepatology',
    system: serviceTypeUri,
  ),

  /// Geriatric medicine
  geriatricMedicine(
    code: '171',
    display: 'Geriatric Medicine',
    definition: 'Geriatric medicine',
    system: serviceTypeUri,
  ),

  /// Immunology & Allergy
  immunologyAllergy(
    code: '172',
    display: 'Immunology & Allergy',
    definition: 'Immunology & Allergy',
    system: serviceTypeUri,
  ),

  /// Infectious diseases
  infectiousDiseases(
    code: '173',
    display: 'Infectious Diseases',
    definition: 'Infectious diseases',
    system: serviceTypeUri,
  ),

  /// Intensive care medicine
  intensiveCareMedicine(
    code: '174',
    display: 'Intensive Care Medicine',
    definition: 'Intensive care medicine',
    system: serviceTypeUri,
  ),

  /// Medical Oncology
  medicalOncology(
    code: '175',
    display: 'Medical Oncology',
    definition: 'Medical Oncology',
    system: serviceTypeUri,
  ),

  /// Nephrology
  nephrology(
    code: '176',
    display: 'Nephrology',
    definition: 'Nephrology',
    system: serviceTypeUri,
  ),

  /// Neurology
  neurology(
    code: '177',
    display: 'Neurology',
    definition: 'Neurology',
    system: serviceTypeUri,
  ),

  /// Occupational Medicine
  occupationalMedicine(
    code: '178',
    display: 'Occupational Medicine',
    definition: 'Occupational Medicine',
    system: serviceTypeUri,
  ),

  /// Palliative Medicine
  palliativeMedicine(
    code: '179',
    display: 'Palliative Medicine',
    definition: 'Palliative Medicine',
    system: serviceTypeUri,
  ),

  /// Public Health Medicine
  publicHealthMedicine(
    code: '180',
    display: 'Public Health Medicine',
    definition: 'Public Health Medicine',
    system: serviceTypeUri,
  ),

  /// Rehabilitation Medicine
  rehabilitationMedicine(
    code: '181',
    display: 'Rehabilitation Medicine',
    definition: 'Rehabilitation Medicine',
    system: serviceTypeUri,
  ),

  /// Rheumatology
  rheumatology(
    code: '182',
    display: 'Rheumatology',
    definition: 'Rheumatology',
    system: serviceTypeUri,
  ),

  /// Sleep Medicine
  sleepMedicine(
    code: '183',
    display: 'Sleep Medicine',
    definition: 'Sleep Medicine',
    system: serviceTypeUri,
  ),

  /// Thoracic medicine
  thoracicMedicine(
    code: '184',
    display: 'Thoracic Medicine',
    definition: 'Thoracic medicine',
    system: serviceTypeUri,
  ),

  /// Gynaecological Oncology
  gynaecologicalOncology(
    code: '185',
    display: 'Gynaecological Oncology',
    definition: 'Gynaecological Oncology',
    system: serviceTypeUri,
  ),

  /// Obstetrics & Gynaecology
  obstetricsGynaecology(
    code: '186',
    display: 'Obstetrics & Gynaecology',
    definition: 'Obstetrics & Gynaecology',
    system: serviceTypeUri,
  ),

  /// Reproductive Endocrinology & Infertility
  reproductiveEndocrinologyInfertility(
    code: '187',
    display: 'Reproductive Endocrinology/Infertility',
    definition: 'Reproductive Endocrinology & Infertility',
    system: serviceTypeUri,
  ),

  /// Urogynaecology
  urogynaecology(
    code: '188',
    display: 'Urogynaecology',
    definition: 'Urogynaecology',
    system: serviceTypeUri,
  ),

  /// Neonatology & Perinatology
  neonatologyPerinatology(
    code: '189',
    display: 'Neonatology & Perinatology',
    definition: 'Neonatology & Perinatology',
    system: serviceTypeUri,
  ),

  /// Paediatric Cardiology
  paediatricCardiology(
    code: '190',
    display: 'Paediatric Cardiology',
    definition: 'Paediatric Cardiology',
    system: serviceTypeUri,
  ),

  /// Paediatric Clinical Genetics
  paediatricClinicalGenetics(
    code: '191',
    display: 'Paediatric Clinical Genetics',
    definition: 'Paediatric Clinical Genetics',
    system: serviceTypeUri,
  ),

  /// Paediatric Clinical Pharmacology
  paediatricClinicalPharmacology(
    code: '192',
    display: 'Paediatric Clinical Pharmacology',
    definition: 'Paediatric Clinical Pharmacology',
    system: serviceTypeUri,
  ),

  /// Paediatric Endocrinology
  paediatricEndocrinology(
    code: '193',
    display: 'Paediatric Endocrinology',
    definition: 'Paediatric Endocrinology',
    system: serviceTypeUri,
  ),

  /// Paediatric Gastroenterology & Hepatology
  paediatricGastroenterologyHepatology(
    code: '194',
    display: 'Paed. Gastroenterology/Hepatology',
    definition: 'Paediatric Gastroenterology & Hepatology',
    system: serviceTypeUri,
  ),

  /// Paediatric Haematology
  paediatricHaematology(
    code: '195',
    display: 'Paediatric Haematology',
    definition: 'Paediatric Haematology',
    system: serviceTypeUri,
  ),

  /// Paediatric Immunology & Allergy
  paediatricImmunologyAllergy(
    code: '196',
    display: 'Paediatric Immunology & Allergy',
    definition: 'Paediatric Immunology & Allergy',
    system: serviceTypeUri,
  ),

  /// Paediatric Infectious diseases
  paediatricInfectiousDiseases(
    code: '197',
    display: 'Paediatric Infectious Diseases',
    definition: 'Paediatric Infectious diseases',
    system: serviceTypeUri,
  ),

  /// Paediatric intensive care medicine
  paediatricIntensiveCareMedicine(
    code: '198',
    display: 'Paediatric Intensive Care Medicine',
    definition: 'Paediatric intensive care medicine',
    system: serviceTypeUri,
  ),

  /// Paediatric Medical Oncology
  paediatricMedicalOncology(
    code: '199',
    display: 'Paediatric Medical Oncology',
    definition: 'Paediatric Medical Oncology',
    system: serviceTypeUri,
  ),

  /// Paediatric Medicine
  paediatricMedicine(
    code: '200',
    display: 'Paediatric Medicine',
    definition: 'Paediatric Medicine',
    system: serviceTypeUri,
  ),

  /// Paediatric Nephrology
  paediatricNephrology(
    code: '201',
    display: 'Paediatric Nephrology',
    definition: 'Paediatric Nephrology',
    system: serviceTypeUri,
  ),

  /// Paediatric Neurology
  paediatricNeurology(
    code: '202',
    display: 'Paediatric Neurology',
    definition: 'Paediatric Neurology',
    system: serviceTypeUri,
  ),

  /// Paediatric Nuclear Medicine
  paediatricNuclearMedicine(
    code: '203',
    display: 'Paediatric Nuclear Medicine',
    definition: 'Paediatric Nuclear Medicine',
    system: serviceTypeUri,
  ),

  /// Paediatric Rehabilitation Medicine
  paediatricRehabilitationMedicine(
    code: '204',
    display: 'Paediatric Rehabilitation Medicine',
    definition: 'Paediatric Rehabilitation Medicine',
    system: serviceTypeUri,
  ),

  /// Paediatric Rheumatology
  paediatricRheumatology(
    code: '205',
    display: 'Paediatric Rheumatology',
    definition: 'Paediatric Rheumatology',
    system: serviceTypeUri,
  ),

  /// Paediatric Sleep Medicine
  paediatricSleepMedicine(
    code: '206',
    display: 'Paediatric Sleep Medicine',
    definition: 'Paediatric Sleep Medicine',
    system: serviceTypeUri,
  ),

  /// Paediatric Surgery
  paediatricSurgery(
    code: '207',
    display: 'Paediatric Surgery',
    definition: 'Paediatric Surgery',
    system: serviceTypeUri,
  ),

  /// Paediatric Thoracic Medicine
  paediatricThoracicMedicine(
    code: '208',
    display: 'Paediatric Thoracic Medicine',
    definition: 'Paediatric Thoracic Medicine',
    system: serviceTypeUri,
  ),

  /// Diagnostic Radiology/Xray/CT/Fluoroscopy
  diagnosticRadiologyXrayCTFluoroscopy(
    code: '209',
    display: 'Diag. Radiology /Xray /CT /Fluoroscopy',
    definition: 'Diagnostic Radiology/Xray/CT/Fluoroscopy',
    system: serviceTypeUri,
  ),

  /// Diagnostic Ultrasound
  diagnosticUltrasound(
    code: '210',
    display: 'Diagnostic Ultrasound',
    definition: 'Diagnostic Ultrasound',
    system: serviceTypeUri,
  ),

  /// Magnetic Resonance Imaging (MRI)
  magneticResonanceImagingMRI(
    code: '211',
    display: 'Magnetic Resonance Imaging (MRI)',
    definition: 'Magnetic Resonance Imaging (MRI)',
    system: serviceTypeUri,
  ),

  /// Nuclear Medicine
  nuclearMedicine(
    code: '212',
    display: 'Nuclear Medicine',
    definition: 'Nuclear Medicine',
    system: serviceTypeUri,
  ),

  /// Obstetric & Gynaecological Ultrasound
  obstetricGynaecologicalUltrasound(
    code: '213',
    display: 'Obstetric/Gynaecological Ultrasound',
    definition: 'Obstetric & Gynaecological Ultrasound',
    system: serviceTypeUri,
  ),

  /// Radiation oncology
  radiationOncology(
    code: '214',
    display: 'Radiation Oncology',
    definition: 'Radiation oncology',
    system: serviceTypeUri,
  ),

  /// Cardiothoracic surgery
  cardiothoracicSurgery(
    code: '215',
    display: 'Cardiothoracic Surgery',
    definition: 'Cardiothoracic surgery',
    system: serviceTypeUri,
  ),

  /// Neurosurgery
  neurosurgery(
    code: '216',
    display: 'Neurosurgery',
    definition: 'Neurosurgery',
    system: serviceTypeUri,
  ),

  /// Ophthalmology
  ophthalmology(
    code: '217',
    display: 'Ophthalmology',
    definition: 'Ophthalmology',
    system: serviceTypeUri,
  ),

  /// Orthopaedic surgery
  orthopaedicSurgery(
    code: '218',
    display: 'Orthopaedic Surgery',
    definition: 'Orthopaedic surgery',
    system: serviceTypeUri,
  ),

  /// Otolaryngology - Head & Neck Surgery
  otolaryngologyHeadNeckSurgery(
    code: '219',
    display: 'Otolaryngology/Head & Neck Surgery',
    definition: 'Otolaryngology - Head & Neck Surgery',
    system: serviceTypeUri,
  ),

  /// Plastic & Reconstructive Surgery
  plasticReconstructiveSurgery(
    code: '220',
    display: 'Plastic & Reconstructive Surgery',
    definition: 'Plastic & Reconstructive Surgery',
    system: serviceTypeUri,
  ),

  /// Surgery - General
  surgeryGeneral(
    code: '221',
    display: 'Surgery - General',
    definition: 'Surgery - General',
    system: serviceTypeUri,
  ),

  /// Urology
  urology(
    code: '222',
    display: 'Urology',
    definition: 'Urology',
    system: serviceTypeUri,
  ),

  /// Vascular surgery
  vascularSurgery(
    code: '223',
    display: 'Vascular Surgery',
    definition: 'Vascular surgery',
    system: serviceTypeUri,
  ),

  /// Support groups
  supportGroups(
    code: '224',
    display: 'Support Groups',
    definition: 'Support groups',
    system: serviceTypeUri,
  ),

  /// Air ambulance
  airAmbulance(
    code: '225',
    display: 'Air ambulance',
    definition: 'Air ambulance',
    system: serviceTypeUri,
  ),

  /// Ambulance
  ambulance(
    code: '226',
    display: 'Ambulance',
    definition: 'Ambulance',
    system: serviceTypeUri,
  ),

  /// Blood transport
  bloodTransport(
    code: '227',
    display: 'Blood Transport',
    definition: 'Blood transport',
    system: serviceTypeUri,
  ),

  /// Community bus
  communityBus(
    code: '228',
    display: 'Community Bus',
    definition: 'Community bus',
    system: serviceTypeUri,
  ),

  /// Flying doctor service
  flyingDoctorService(
    code: '229',
    display: 'Flying Doctor Service',
    definition: 'Flying doctor service',
    system: serviceTypeUri,
  ),

  /// Patient transport
  patientTransport(
    code: '230',
    display: 'Patient Transport',
    definition: 'Patient transport',
    system: serviceTypeUri,
  ),

  /// A&E
  aAndE(
    code: '231',
    display: 'A&E',
    definition: 'A&E',
    system: serviceTypeUri,
  ),

  /// A&EP
  aAndEP(
    code: '232',
    display: 'A&EP',
    definition: 'A&EP',
    system: serviceTypeUri,
  ),

  /// Abuse
  abuse(
    code: '233',
    display: 'Abuse',
    definition: 'Abuse',
    system: serviceTypeUri,
  ),

  /// ACAS
  acas(
    code: '234',
    display: 'ACAS',
    definition: 'ACAS',
    system: serviceTypeUri,
  ),

  /// Access
  access(
    code: '235',
    display: 'Access',
    definition: 'Access',
    system: serviceTypeUri,
  ),

  /// Accident
  accident(
    code: '236',
    display: 'Accident',
    definition: 'Accident',
    system: serviceTypeUri,
  ),

  /// Acute Inpatient Service's
  acuteInpatientServices(
    code: '237',
    display: 'Acute Inpatient Serv',
    definition: "Acute Inpatient Service's",
    system: serviceTypeUri,
  ),

  /// Adult Day Programs
  adultDayPrograms(
    code: '238',
    display: 'Adult Day Programs',
    definition: 'Adult Day Programs',
    system: serviceTypeUri,
  ),

  /// Adult Mental Health Services
  adultMentalHealthServices(
    code: '239',
    display: 'Adult Mental Health Services',
    definition: 'Adult Mental Health Services',
    system: serviceTypeUri,
  ),

  /// Advice
  advice(
    code: '240',
    display: 'Advice',
    definition: 'Advice',
    system: serviceTypeUri,
  ),

  /// Advocacy
  advocacy(
    code: '241',
    display: 'Advocacy',
    definition: 'Advocacy',
    system: serviceTypeUri,
  ),

  /// Aged Persons Mental Health Residential Units
  agedPersonsMentalHealthResidentialUnits(
    code: '242',
    display: 'Aged Persons Mental',
    definition: 'Aged Persons Mental Health Residential Units',
    system: serviceTypeUri,
  ),

  /// Aged Persons Mental Health Services
  agedPersonsMentalHealthServices(
    code: '243',
    display: 'Aged Persons Mental',
    definition: 'Aged Persons Mental Health Services',
    system: serviceTypeUri,
  ),

  /// Aged Persons Mental Health Teams
  agedPersonsMentalHealthTeams(
    code: '244',
    display: 'Aged Persons Mental',
    definition: 'Aged Persons Mental Health Teams',
    system: serviceTypeUri,
  ),

  /// Aids
  aids(
    code: '245',
    display: 'Aids',
    definition: 'Aids',
    system: serviceTypeUri,
  ),

  /// Al-Anon
  alAnon(
    code: '246',
    display: 'Al-Anon',
    definition: 'Al-Anon',
    system: serviceTypeUri,
  ),

  /// Alcohol
  alcohol(
    code: '247',
    display: 'Alcohol',
    definition: 'Alcohol',
    system: serviceTypeUri,
  ),

  /// Al-Teen
  alTeen(
    code: '248',
    display: 'Al-Teen',
    definition: 'Al-Teen',
    system: serviceTypeUri,
  ),

  /// Antenatal
  antenatal(
    code: '249',
    display: 'Antenatal',
    definition: 'Antenatal',
    system: serviceTypeUri,
  ),

  /// Anxiety
  anxiety(
    code: '250',
    display: 'Anxiety',
    definition: 'Anxiety',
    system: serviceTypeUri,
  ),

  /// Arthritis
  arthritis(
    code: '251',
    display: 'Arthritis',
    definition: 'Arthritis',
    system: serviceTypeUri,
  ),

  /// Assessment
  assessment(
    code: '252',
    display: 'Assessment',
    definition: 'Assessment',
    system: serviceTypeUri,
  ),

  /// Assistance
  assistance(
    code: '253',
    display: 'Assistance',
    definition: 'Assistance',
    system: serviceTypeUri,
  ),

  /// Asthma
  asthma(
    code: '254',
    display: 'Asthma',
    definition: 'Asthma',
    system: serviceTypeUri,
  ),

  /// ATSS
  atss(
    code: '255',
    display: 'ATSS',
    definition: 'ATSS',
    system: serviceTypeUri,
  ),

  /// Attendant Care
  attendantCare(
    code: '256',
    display: 'Attendant Care',
    definition: 'Attendant Care',
    system: serviceTypeUri,
  ),

  /// Babies
  babies(
    code: '257',
    display: 'Babies',
    definition: 'Babies',
    system: serviceTypeUri,
  ),

  /// Bathroom Modification
  bathroomModification(
    code: '258',
    display: 'Bathroom Modificatio',
    definition: 'Bathroom Modification',
    system: serviceTypeUri,
  ),

  /// Behavior
  behavior(
    code: '259',
    display: 'Behavior',
    definition: 'Behavior',
    system: serviceTypeUri,
  ),

  /// Behavior Intervention
  behaviorIntervention(
    code: '260',
    display: 'Behavior Interventi',
    definition: 'Behavior Intervention',
    system: serviceTypeUri,
  ),

  /// Bereavement
  bereavement(
    code: '261',
    display: 'Bereavement',
    definition: 'Bereavement',
    system: serviceTypeUri,
  ),

  /// Bipolar
  bipolar(
    code: '262',
    display: 'Bipolar',
    definition: 'Bipolar',
    system: serviceTypeUri,
  ),

  /// Birth
  birth(
    code: '263',
    display: 'Birth',
    definition: 'Birth',
    system: serviceTypeUri,
  ),

  /// Birth Control
  birthControl(
    code: '264',
    display: 'Birth Control',
    definition: 'Birth Control',
    system: serviceTypeUri,
  ),

  /// Birthing Options
  birthingOptions(
    code: '265',
    display: 'Birthing Options',
    definition: 'Birthing Options',
    system: serviceTypeUri,
  ),

  /// BIST
  bist(
    code: '266',
    display: 'BIST',
    definition: 'BIST',
    system: serviceTypeUri,
  ),

  /// Blood
  blood(
    code: '267',
    display: 'Blood',
    definition: 'Blood',
    system: serviceTypeUri,
  ),

  /// Bone
  bone(
    code: '268',
    display: 'Bone',
    definition: 'Bone',
    system: serviceTypeUri,
  ),

  /// Bowel
  bowel(
    code: '269',
    display: 'Bowel',
    definition: 'Bowel',
    system: serviceTypeUri,
  ),

  /// Brain
  brain(
    code: '270',
    display: 'Brain',
    definition: 'Brain',
    system: serviceTypeUri,
  ),

  /// Breast Feeding
  breastFeeding(
    code: '271',
    display: 'Breast Feeding',
    definition: 'Breast Feeding',
    system: serviceTypeUri,
  ),

  /// Breast Screen
  breastScreen(
    code: '272',
    display: 'Breast Screen',
    definition: 'Breast Screen',
    system: serviceTypeUri,
  ),

  /// Brokerage
  brokerage(
    code: '273',
    display: 'Brokerage',
    definition: 'Brokerage',
    system: serviceTypeUri,
  ),

  /// Cancer
  cancer(
    code: '274',
    display: 'Cancer',
    definition: 'Cancer',
    system: serviceTypeUri,
  ),

  /// Cancer Support
  cancerSupport(
    code: '275',
    display: 'Cancer Support',
    definition: 'Cancer Support',
    system: serviceTypeUri,
  ),

  /// Cardiovascular Disease
  cardiovascularDisease(
    code: '276',
    display: 'Cardiovascular Disea',
    definition: 'Cardiovascular Disease',
    system: serviceTypeUri,
  ),

  /// Care Packages
  carePackages(
    code: '277',
    display: 'Care Packages',
    definition: 'Care Packages',
    system: serviceTypeUri,
  ),

  /// Carer
  carer(
    code: '278',
    display: 'Carer',
    definition: 'Carer',
    system: serviceTypeUri,
  ),

  /// Case Management
  caseManagement(
    code: '279',
    display: 'Case',
    definition: 'Case Management',
    system: serviceTypeUri,
  ),

  /// Casualty
  casualty(
    code: '280',
    display: 'Casualty',
    definition: 'Casualty',
    system: serviceTypeUri,
  ),

  /// Centrelink
  centrelink(
    code: '281',
    display: 'Centrelink',
    definition: 'Centrelink',
    system: serviceTypeUri,
  ),

  /// Chemists
  chemists(
    code: '282',
    display: 'Chemists',
    definition: 'Chemists',
    system: serviceTypeUri,
  ),

  /// Child And Adolescent Mental Health Services
  childAndAdolescentMentalHealthServices(
    code: '283',
    display: 'Child And Adolescent',
    definition: 'Child And Adolescent Mental Health Services',
    system: serviceTypeUri,
  ),

  /// Child Care
  childCare(
    code: '284',
    display: 'Child Care',
    definition: 'Child Care',
    system: serviceTypeUri,
  ),

  /// Child Services
  childServices(
    code: '285',
    display: 'Child Services',
    definition: 'Child Services',
    system: serviceTypeUri,
  ),

  /// Children
  children(
    code: '286',
    display: 'Children',
    definition: 'Children',
    system: serviceTypeUri,
  ),

  /// Children's Services
  childrensServices(
    code: '287',
    display: "Children's Services",
    definition: "Children's Services",
    system: serviceTypeUri,
  ),

  /// Cholesterol
  cholesterol(
    code: '288',
    display: 'Cholesterol',
    definition: 'Cholesterol',
    system: serviceTypeUri,
  ),

  /// Clothing
  clothing(
    code: '289',
    display: 'Clothing',
    definition: 'Clothing',
    system: serviceTypeUri,
  ),

  /// Community Based Accommodation
  communityBasedAccommodation(
    code: '290',
    display: 'Community Based Acco',
    definition: 'Community Based Accommodation',
    system: serviceTypeUri,
  ),

  /// Community Care Unit
  communityCareUnit(
    code: '291',
    display: 'Community Care Unit',
    definition: 'Community Care Unit',
    system: serviceTypeUri,
  ),

  /// Community Child And Adolescent Mental Health Services
  communityChildAndAdolescentMentalHealthServices(
    code: '292',
    display: 'Community Child And',
    definition: 'Community Child And Adolescent Mental Health Services',
    system: serviceTypeUri,
  ),

  /// Community Health
  communityHealth(
    code: '293',
    display: 'Community Health',
    definition: 'Community Health',
    system: serviceTypeUri,
  ),

  /// Community Residential Unit
  communityResidentialUnit(
    code: '294',
    display: 'Community Residentia',
    definition: 'Community Residential Unit',
    system: serviceTypeUri,
  ),

  /// Community Transport
  communityTransport(
    code: '295',
    display: 'Community Transport',
    definition: 'Community Transport',
    system: serviceTypeUri,
  ),

  /// Companion Visiting
  companionVisiting(
    code: '296',
    display: 'Companion Visiting',
    definition: 'Companion Visiting',
    system: serviceTypeUri,
  ),

  /// Companionship
  companionship(
    code: '297',
    display: 'Companionship',
    definition: 'Companionship',
    system: serviceTypeUri,
  ),

  /// Consumer Advice
  consumerAdvice(
    code: '298',
    display: 'Consumer Advice',
    definition: 'Consumer Advice',
    system: serviceTypeUri,
  ),

  /// Consumer Issues
  consumerIssues(
    code: '299',
    display: 'Consumer Issues',
    definition: 'Consumer Issues',
    system: serviceTypeUri,
  ),

  /// Continuing Care Services
  continuingCareServices(
    code: '300',
    display: 'Continuing Care Serv',
    definition: 'Continuing Care Services',
    system: serviceTypeUri,
  ),

  /// Contraception Information
  contraceptionInformation(
    code: '301',
    display: 'Contraception Inform',
    definition: 'Contraception Information',
    system: serviceTypeUri,
  ),

  /// Coordinating Bodies
  coordinatingBodies(
    code: '302',
    display: 'Coordinating Bodies',
    definition: 'Coordinating Bodies',
    system: serviceTypeUri,
  ),

  /// Correctional Services
  correctionalServices(
    code: '303',
    display: 'Correctional Service',
    definition: 'Correctional Services',
    system: serviceTypeUri,
  ),

  /// Council Environmental Health
  councilEnvironmentalHealth(
    code: '304',
    display: 'Council Environmenta',
    definition: 'Council Environmental Health',
    system: serviceTypeUri,
  ),

  /// Counselling
  counselling(
    code: '305',
    display: 'Counselling',
    definition: 'Counselling',
    system: serviceTypeUri,
  ),

  /// Criminal
  criminal(
    code: '306',
    display: 'Criminal',
    definition: 'Criminal',
    system: serviceTypeUri,
  ),

  /// Crises
  crises(
    code: '307',
    display: 'Crises',
    definition: 'Crises',
    system: serviceTypeUri,
  ),

  /// Crisis Assessment And Treatment Services (Cats)
  crisisAssessmentAndTreatmentServicesCats(
    code: '308',
    display: 'Crisis Assessment An',
    definition: 'Crisis Assessment And Treatment Services (Cats)',
    system: serviceTypeUri,
  ),

  /// Crisis Assistance
  crisisAssistance(
    code: '309',
    display: 'Crisis Assistance',
    definition: 'Crisis Assistance',
    system: serviceTypeUri,
  ),

  /// Crisis Refuge
  crisisRefuge(
    code: '310',
    display: 'Crisis Refuge',
    definition: 'Crisis Refuge',
    system: serviceTypeUri,
  ),

  /// Day Program
  dayProgram(
    code: '311',
    display: 'Day Program',
    definition: 'Day Program',
    system: serviceTypeUri,
  ),

  /// Deaf
  deaf(
    code: '312',
    display: 'Deaf',
    definition: 'Deaf',
    system: serviceTypeUri,
  ),

  /// Dental Hygiene
  dentalHygiene(
    code: '313',
    display: 'Dental Hygiene',
    definition: 'Dental Hygiene',
    system: serviceTypeUri,
  ),

  /// Dentistry
  dentistry(
    code: '314',
    display: 'Dentistry',
    definition: 'Dentistry',
    system: serviceTypeUri,
  ),

  /// Dentures
  dentures(
    code: '315',
    display: 'Dentures',
    definition: 'Dentures',
    system: serviceTypeUri,
  ),

  /// Depression
  depression(
    code: '316',
    display: 'Depression',
    definition: 'Depression',
    system: serviceTypeUri,
  ),

  /// Detoxification
  detoxification(
    code: '317',
    display: 'Detoxification',
    definition: 'Detoxification',
    system: serviceTypeUri,
  ),

  /// Diabetes
  diabetes(
    code: '318',
    display: 'Diabetes',
    definition: 'Diabetes',
    system: serviceTypeUri,
  ),

  /// Diaphragm Fitting
  diaphragmFitting(
    code: '319',
    display: 'Diaphragm Fitting',
    definition: 'Diaphragm Fitting',
    system: serviceTypeUri,
  ),

  /// Dieticians
  dieticians(
    code: '320',
    display: 'Dieticians',
    definition: 'Dieticians',
    system: serviceTypeUri,
  ),

  /// Disabled Parking
  disabledParking(
    code: '321',
    display: 'Disabled Parking',
    definition: 'Disabled Parking',
    system: serviceTypeUri,
  ),

  /// District Nursing
  districtNursing(
    code: '322',
    display: 'District Nursing',
    definition: 'District Nursing',
    system: serviceTypeUri,
  ),

  /// Divorce
  divorce(
    code: '323',
    display: 'Divorce',
    definition: 'Divorce',
    system: serviceTypeUri,
  ),

  /// Doctors
  doctors(
    code: '324',
    display: 'Doctors',
    definition: 'Doctors',
    system: serviceTypeUri,
  ),

  /// Drink-Drive
  drinkDrive(
    code: '325',
    display: 'Drink-Drive',
    definition: 'Drink-Drive',
    system: serviceTypeUri,
  ),

  /// Dual Diagnosis Services
  dualDiagnosisServices(
    code: '326',
    display: 'Dual Diagnosis Servi',
    definition: 'Dual Diagnosis Services',
    system: serviceTypeUri,
  ),

  /// Early Choice
  earlyChoice(
    code: '327',
    display: 'Early Choice',
    definition: 'Early Choice',
    system: serviceTypeUri,
  ),

  /// Eating Disorder
  eatingDisorder(
    code: '328',
    display: 'Eating Disorder',
    definition: 'Eating Disorder',
    system: serviceTypeUri,
  ),

  /// Emergency Relief
  emergencyRelief(
    code: '330',
    display: 'Emergency Relief',
    definition: 'Emergency Relief',
    system: serviceTypeUri,
  ),

  /// Employment And Training
  employmentAndTraining(
    code: '331',
    display: 'Employment And Train',
    definition: 'Employment And Training',
    system: serviceTypeUri,
  ),

  /// Environment
  environment(
    code: '332',
    display: 'Environment',
    definition: 'Environment',
    system: serviceTypeUri,
  ),

  /// Equipment
  equipment(
    code: '333',
    display: 'Equipment',
    definition: 'Equipment',
    system: serviceTypeUri,
  ),

  /// Exercise
  exercise(
    code: '334',
    display: 'Exercise',
    definition: 'Exercise',
    system: serviceTypeUri,
  ),

  /// Facility
  facility(
    code: '335',
    display: 'Facility',
    definition: 'Facility',
    system: serviceTypeUri,
  ),

  /// Family Choice
  familyChoice(
    code: '336',
    display: 'Family Choice',
    definition: 'Family Choice',
    system: serviceTypeUri,
  ),

  /// Family Law
  familyLaw(
    code: '337',
    display: 'Family Law',
    definition: 'Family Law',
    system: serviceTypeUri,
  ),

  /// Family Options
  familyOptions(
    code: '338',
    display: 'Family Options',
    definition: 'Family Options',
    system: serviceTypeUri,
  ),

  /// Family Services
  familyServices(
    code: '339',
    display: 'Family Services',
    definition: 'Family Services',
    system: serviceTypeUri,
  ),

  /// FFYA
  ffya(
    code: '340',
    display: 'FFYA',
    definition: 'FFYA',
    system: serviceTypeUri,
  ),

  /// Financial Aid
  financialAid(
    code: '341',
    display: 'Financial Aid',
    definition: 'Financial Aid',
    system: serviceTypeUri,
  ),

  /// Fitness
  fitness(
    code: '342',
    display: 'Fitness',
    definition: 'Fitness',
    system: serviceTypeUri,
  ),

  /// Flexible Care Packages
  flexibleCarePackages(
    code: '343',
    display: 'Flexible Care Packag',
    definition: 'Flexible Care Packages',
    system: serviceTypeUri,
  ),

  /// Food
  food(
    code: '344',
    display: 'Food',
    definition: 'Food',
    system: serviceTypeUri,
  ),

  /// Food Vouchers
  foodVouchers(
    code: '345',
    display: 'Food Vouchers',
    definition: 'Food Vouchers',
    system: serviceTypeUri,
  ),

  /// Forensic Mental Health Services
  forensicMentalHealthServices(
    code: '346',
    display: 'Forensic Mental Heal',
    definition: 'Forensic Mental Health Services',
    system: serviceTypeUri,
  ),

  /// Futures
  futures(
    code: '347',
    display: 'Futures',
    definition: 'Futures',
    system: serviceTypeUri,
  ),

  /// Futures For Young Adults
  futuresForYoungAdults(
    code: '348',
    display: 'Futures For Young Ad',
    definition: 'Futures For Young Adults',
    system: serviceTypeUri,
  ),

  /// General Practitioners
  generalPractitioners(
    code: '349',
    display: 'General Practitioner',
    definition: 'General Practitioners',
    system: serviceTypeUri,
  ),

  /// Grants
  grants(
    code: '350',
    display: 'Grants',
    definition: 'Grants',
    system: serviceTypeUri,
  ),

  /// Grief
  grief(
    code: '351',
    display: 'Grief',
    definition: 'Grief',
    system: serviceTypeUri,
  ),

  /// Grief Counselling
  griefCounselling(
    code: '352',
    display: 'Grief Counselling',
    definition: 'Grief Counselling',
    system: serviceTypeUri,
  ),

  /// HACC
  hacc(
    code: '353',
    display: 'HACC',
    definition: 'HACC',
    system: serviceTypeUri,
  ),

  /// Heart Disease
  heartDisease(
    code: '354',
    display: 'Heart Disease',
    definition: 'Heart Disease',
    system: serviceTypeUri,
  ),

  /// Help
  help(
    code: '355',
    display: 'Help',
    definition: 'Help',
    system: serviceTypeUri,
  ),

  /// High Blood Pressure
  highBloodPressure(
    code: '356',
    display: 'High Blood Pressure',
    definition: 'High Blood Pressure',
    system: serviceTypeUri,
  ),

  /// Home Help
  homeHelp(
    code: '357',
    display: 'Home Help',
    definition: 'Home Help',
    system: serviceTypeUri,
  ),

  /// Home Nursing
  homeNursing(
    code: '358',
    display: 'Home Nursing',
    definition: 'Home Nursing',
    system: serviceTypeUri,
  ),

  /// Homefirst
  homefirst(
    code: '359',
    display: 'Homefirst',
    definition: 'Homefirst',
    system: serviceTypeUri,
  ),

  /// Hospice Care
  hospiceCare(
    code: '360',
    display: 'Hospice Care',
    definition: 'Hospice Care',
    system: serviceTypeUri,
  ),

  /// Hospital Services
  hospitalServices(
    code: '361',
    display: 'Hospital Services',
    definition: 'Hospital Services',
    system: serviceTypeUri,
  ),

  /// Hospital To Home
  hospitalToHome(
    code: '362',
    display: 'Hospital To Home',
    definition: 'Hospital To Home',
    system: serviceTypeUri,
  ),

  /// Hostel
  hostel(
    code: '364',
    display: 'Hostel',
    definition: 'Hostel',
    system: serviceTypeUri,
  ),

  /// Hostel Accommodation
  hostelAccommodation(
    code: '365',
    display: 'Hostel Accommodation',
    definition: 'Hostel Accommodation',
    system: serviceTypeUri,
  ),

  /// Household Items
  householdItems(
    code: '366',
    display: 'Household Items',
    definition: 'Household Items',
    system: serviceTypeUri,
  ),

  /// Hypertension
  hypertension(
    code: '367',
    display: 'Hypertension',
    definition: 'Hypertension',
    system: serviceTypeUri,
  ),

  /// Illness
  illness(
    code: '368',
    display: 'Illness',
    definition: 'Illness',
    system: serviceTypeUri,
  ),

  /// Independent Living
  independentLiving(
    code: '369',
    display: 'Independent Living',
    definition: 'Independent Living',
    system: serviceTypeUri,
  ),

  /// Information
  information(
    code: '370',
    display: 'Information',
    definition: 'Information',
    system: serviceTypeUri,
  ),

  /// Injury
  injury(
    code: '371',
    display: 'Injury',
    definition: 'Injury',
    system: serviceTypeUri,
  ),

  /// Intake
  intake(
    code: '372',
    display: 'Intake',
    definition: 'Intake',
    system: serviceTypeUri,
  ),

  /// Intensive Mobile Youth Outreach Services (Imyos)
  intensiveMobileYouthOutreachServicesImyos(
    code: '373',
    display: 'Intensive Mobile You',
    definition: 'Intensive Mobile Youth Outreach Services (Imyos)',
    system: serviceTypeUri,
  ),

  /// Intervention
  intervention(
    code: '374',
    display: 'Intervention',
    definition: 'Intervention',
    system: serviceTypeUri,
  ),

  /// Job Searching
  jobSearching(
    code: '375',
    display: 'Job Searching',
    definition: 'Job Searching',
    system: serviceTypeUri,
  ),

  /// Justice
  justice(
    code: '376',
    display: 'Justice',
    definition: 'Justice',
    system: serviceTypeUri,
  ),

  /// Leisure
  leisure(
    code: '377',
    display: 'Leisure',
    definition: 'Leisure',
    system: serviceTypeUri,
  ),

  /// Loans
  loans(
    code: '378',
    display: 'Loans',
    definition: 'Loans',
    system: serviceTypeUri,
  ),

  /// Low Income Earners
  lowIncomeEarners(
    code: '379',
    display: 'Low Income Earners',
    definition: 'Low Income Earners',
    system: serviceTypeUri,
  ),

  /// Lung
  lung(
    code: '380',
    display: 'Lung',
    definition: 'Lung',
    system: serviceTypeUri,
  ),

  /// Making A Difference
  makingADifference(
    code: '381',
    display: 'Making A Difference',
    definition: 'Making A Difference',
    system: serviceTypeUri,
  ),

  /// Medical Services
  medicalServices(
    code: '382',
    display: 'Medical Services',
    definition: 'Medical Services',
    system: serviceTypeUri,
  ),

  /// Medical Specialists
  medicalSpecialists(
    code: '383',
    display: 'Medical Specialists',
    definition: 'Medical Specialists',
    system: serviceTypeUri,
  ),

  /// Medication Administration
  medicationAdministration(
    code: '384',
    display: 'Medication Administr',
    definition: 'Medication Administration',
    system: serviceTypeUri,
  ),

  /// Menstrual Information
  menstrualInformation(
    code: '385',
    display: 'Menstrual Informatio',
    definition: 'Menstrual Information',
    system: serviceTypeUri,
  ),

  /// Methadone
  methadone(
    code: '386',
    display: 'Methadone',
    definition: 'Methadone',
    system: serviceTypeUri,
  ),

  /// Mobile Support And Treatment Services (MSTS)
  mobileSupportAndTreatmentServicesMSTS(
    code: '387',
    display: 'Mobile Support And T',
    definition: 'Mobile Support And Treatment Services (MSTS)',
    system: serviceTypeUri,
  ),

  /// Motor Neurone
  motorNeurone(
    code: '388',
    display: 'Motor Neurone',
    definition: 'Motor Neurone',
    system: serviceTypeUri,
  ),

  /// Multiple Sclerosis
  multipleSclerosis(
    code: '389',
    display: 'Multiple Sclerosis',
    definition: 'Multiple Sclerosis',
    system: serviceTypeUri,
  ),

  /// Neighbourhood House
  neighbourhoodHouse(
    code: '390',
    display: 'Neighbourhood House',
    definition: 'Neighbourhood House',
    system: serviceTypeUri,
  ),

  /// Nursing Home
  nursingHome(
    code: '391',
    display: 'Nursing Home',
    definition: 'Nursing Home',
    system: serviceTypeUri,
  ),

  /// Nursing Mothers
  nursingMothers(
    code: '392',
    display: 'Nursing Mothers',
    definition: 'Nursing Mothers',
    system: serviceTypeUri,
  ),

  /// Obesity
  obesity(
    code: '393',
    display: 'Obesity',
    definition: 'Obesity',
    system: serviceTypeUri,
  ),

  /// Occupational Health & Safety
  occupationalHealthSafety(
    code: '394',
    display: 'Occupational Health',
    definition: 'Occupational Health & Safety',
    system: serviceTypeUri,
  ),

  /// Optometrist
  optometrist(
    code: '395',
    display: 'Optometrist',
    definition: 'Optometrist',
    system: serviceTypeUri,
  ),

  /// Oral Hygiene
  oralHygiene(
    code: '396',
    display: 'Oral Hygiene',
    definition: 'Oral Hygiene',
    system: serviceTypeUri,
  ),

  /// Outpatients
  outpatients(
    code: '397',
    display: 'Outpatients',
    definition: 'Outpatients',
    system: serviceTypeUri,
  ),

  /// Outreach Service
  outreachService(
    code: '398',
    display: 'Outreach Service',
    definition: 'Outreach Service',
    system: serviceTypeUri,
  ),

  /// PADP
  padp(
    code: '399',
    display: 'PADP',
    definition: 'PADP',
    system: serviceTypeUri,
  ),

  /// Pain
  pain(
    code: '400',
    display: 'Pain',
    definition: 'Pain',
    system: serviceTypeUri,
  ),

  /// Pap Smear
  papSmear(
    code: '401',
    display: 'Pap Smear',
    definition: 'Pap Smear',
    system: serviceTypeUri,
  ),

  /// Parenting
  parenting(
    code: '402',
    display: 'Parenting',
    definition: 'Parenting',
    system: serviceTypeUri,
  ),

  /// Peak Organizations
  peakOrganizations(
    code: '403',
    display: 'Peak Organizations',
    definition: 'Peak Organizations',
    system: serviceTypeUri,
  ),

  /// Personal Care
  personalCare(
    code: '404',
    display: 'Personal Care',
    definition: 'Personal Care',
    system: serviceTypeUri,
  ),

  /// Pharmacies
  pharmacies(
    code: '405',
    display: 'Pharmacies',
    definition: 'Pharmacies',
    system: serviceTypeUri,
  ),

  /// Phobias
  phobias(
    code: '406',
    display: 'Phobias',
    definition: 'Phobias',
    system: serviceTypeUri,
  ),

  /// Physical
  physical(
    code: '407',
    display: 'Physical',
    definition: 'Physical',
    system: serviceTypeUri,
  ),

  /// Physical Activity
  physicalActivity(
    code: '408',
    display: 'Physical Activity',
    definition: 'Physical Activity',
    system: serviceTypeUri,
  ),

  /// Postnatal
  postnatal(
    code: '409',
    display: 'Postnatal',
    definition: 'Postnatal',
    system: serviceTypeUri,
  ),

  /// Pregnancy
  pregnancy(
    code: '410',
    display: 'Pregnancy',
    definition: 'Pregnancy',
    system: serviceTypeUri,
  ),

  /// Pregnancy Tests
  pregnancyTests(
    code: '411',
    display: 'Pregnancy Tests',
    definition: 'Pregnancy Tests',
    system: serviceTypeUri,
  ),

  /// Preschool
  preschool(
    code: '412',
    display: 'Preschool',
    definition: 'Preschool',
    system: serviceTypeUri,
  ),

  /// Prescriptions
  prescriptions(
    code: '413',
    display: 'Prescriptions',
    definition: 'Prescriptions',
    system: serviceTypeUri,
  ),

  /// Primary Mental Health And Early Intervention Teams
  primaryMentalHealthAndEarlyInterventionTeams(
    code: '414',
    display: 'Primary Mental Healt',
    definition: 'Primary Mental Health And Early Intervention Teams',
    system: serviceTypeUri,
  ),

  /// Property Maintenance
  propertyMaintenance(
    code: '415',
    display: 'Property Maintenance',
    definition: 'Property Maintenance',
    system: serviceTypeUri,
  ),

  /// Prostate
  prostate(
    code: '416',
    display: 'Prostate',
    definition: 'Prostate',
    system: serviceTypeUri,
  ),

  /// Psychiatric
  psychiatric(
    code: '417',
    display: 'Psychiatric',
    definition: 'Psychiatric',
    system: serviceTypeUri,
  ),

  /// Psychiatric Disability Support Services - Home-Based Outreach
  psychiatricDisabilitySupportServicesHomeBasedOutreach(
    code: '418',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services - Home-Based Outreach',
    system: serviceTypeUri,
  ),

  /// Psychiatric Disability Support Services - Planned Respite
  psychiatricDisabilitySupportServicesPlannedRespite(
    code: '419',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services - Planned Respite',
    system: serviceTypeUri,
  ),

  /// Psychiatric Disability Support Services - Residential Rehabilitation
  psychiatricDisabilitySupportServicesResidentialRehabilitation(
    code: '420',
    display: 'Psychiatric Disabili',
    definition:
        'Psychiatric Disability Support Services - Residential Rehabilitation',
    system: serviceTypeUri,
  ),

  /// Psychiatric Disability Support Services Home-Based Outreach
  psychiatricDisabilitySupportServicesHomeBasedOutreach2(
    code: '421',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services Home-Based Outreach',
    system: serviceTypeUri,
  ),

  /// Psychiatric Disability Support Services Mutual Support And Self Help
  psychiatricDisabilitySupportServicesMutualSupportAndSelfHelp(
    code: '422',
    display: 'Psychiatric Disabili',
    definition:
        'Psychiatric Disability Support Services Mutual Support And Self Help',
    system: serviceTypeUri,
  ),

  /// Psychiatric Support
  psychiatricSupport(
    code: '423',
    display: 'Psychiatric Support',
    definition: 'Psychiatric Support',
    system: serviceTypeUri,
  ),

  /// Recreation
  recreation(
    code: '424',
    display: 'Recreation',
    definition: 'Recreation',
    system: serviceTypeUri,
  ),

  /// Referral
  referral(
    code: '425',
    display: 'Referral',
    definition: 'Referral',
    system: serviceTypeUri,
  ),

  /// Refuge
  refuge(
    code: '426',
    display: 'Refuge',
    definition: 'Refuge',
    system: serviceTypeUri,
  ),

  /// Rent Assistance
  rentAssistance(
    code: '427',
    display: 'Rent Assistance',
    definition: 'Rent Assistance',
    system: serviceTypeUri,
  ),

  /// Residential Facilities
  residentialFacilities(
    code: '428',
    display: 'Residential Faciliti',
    definition: 'Residential Facilities',
    system: serviceTypeUri,
  ),

  /// Residential Respite
  residentialRespite(
    code: '429',
    display: 'Residential Respite',
    definition: 'Residential Respite',
    system: serviceTypeUri,
  ),

  /// Respiratory
  respiratory(
    code: '430',
    display: 'Respiratory',
    definition: 'Respiratory',
    system: serviceTypeUri,
  ),

  /// Response
  response(
    code: '431',
    display: 'Response',
    definition: 'Response',
    system: serviceTypeUri,
  ),

  /// Rooming Houses
  roomingHouses(
    code: '432',
    display: 'Rooming Houses',
    definition: 'Rooming Houses',
    system: serviceTypeUri,
  ),

  /// Safe Sex
  safeSex(
    code: '433',
    display: 'Safe Sex',
    definition: 'Safe Sex',
    system: serviceTypeUri,
  ),

  /// Secure Extended Care Inpatient Services
  secureExtendedCareInpatientServices(
    code: '434',
    display: 'Secure Extended Care',
    definition: 'Secure Extended Care Inpatient Services',
    system: serviceTypeUri,
  ),

  /// Self Help
  selfHelp(
    code: '435',
    display: 'Self Help',
    definition: 'Self Help',
    system: serviceTypeUri,
  ),

  /// Separation
  separation(
    code: '436',
    display: 'Separation',
    definition: 'Separation',
    system: serviceTypeUri,
  ),

  /// Services
  services(
    code: '437',
    display: 'Services',
    definition: 'Services',
    system: serviceTypeUri,
  ),

  /// Sex Education
  sexEducation(
    code: '438',
    display: 'Sex Education',
    definition: 'Sex Education',
    system: serviceTypeUri,
  ),

  /// Sexual Abuse
  sexualAbuse(
    code: '439',
    display: 'Sexual Abuse',
    definition: 'Sexual Abuse',
    system: serviceTypeUri,
  ),

  /// Sexual Issues
  sexualIssues(
    code: '440',
    display: 'Sexual Issues',
    definition: 'Sexual Issues',
    system: serviceTypeUri,
  ),

  /// Sexually Transmitted Diseases
  sexuallyTransmittedDiseases(
    code: '441',
    display: 'Sexually Transmitted',
    definition: 'Sexually Transmitted Diseases',
    system: serviceTypeUri,
  ),

  /// SIDS
  sids(
    code: '442',
    display: 'SIDS',
    definition: 'SIDS',
    system: serviceTypeUri,
  ),

  /// Social Support
  socialSupport(
    code: '443',
    display: 'Social Support',
    definition: 'Social Support',
    system: serviceTypeUri,
  ),

  /// Socialisation
  socialisation(
    code: '444',
    display: 'Socialisation',
    definition: 'Socialisation',
    system: serviceTypeUri,
  ),

  /// Special Needs
  specialNeeds(
    code: '445',
    display: 'Special Needs',
    definition: 'Special Needs',
    system: serviceTypeUri,
  ),

  /// Speech Therapist
  speechTherapist(
    code: '446',
    display: 'Speech Therapist',
    definition: 'Speech Therapist',
    system: serviceTypeUri,
  ),

  /// Splinting
  splinting(
    code: '447',
    display: 'Splinting',
    definition: 'Splinting',
    system: serviceTypeUri,
  ),

  /// Sport
  sport(
    code: '448',
    display: 'Sport',
    definition: 'Sport',
    system: serviceTypeUri,
  ),

  /// Statewide And Specialist Services
  statewideAndSpecialistServices(
    code: '449',
    display: 'Statewide And Specia',
    definition: 'Statewide And Specialist Services',
    system: serviceTypeUri,
  ),

  /// STD
  std(
    code: '450',
    display: 'STD',
    definition: 'STD',
    system: serviceTypeUri,
  ),

  /// STI
  sti(
    code: '451',
    display: 'STI',
    definition: 'STI',
    system: serviceTypeUri,
  ),

  /// Stillbirth
  stillbirth(
    code: '452',
    display: 'Stillbirth',
    definition: 'Stillbirth',
    system: serviceTypeUri,
  ),

  /// Stomal Care
  stomalCare(
    code: '453',
    display: 'Stomal Care',
    definition: 'Stomal Care',
    system: serviceTypeUri,
  ),

  /// Stroke
  stroke(
    code: '454',
    display: 'Stroke',
    definition: 'Stroke',
    system: serviceTypeUri,
  ),

  /// Substance Abuse
  substanceAbuse(
    code: '455',
    display: 'Substance Abuse',
    definition: 'Substance Abuse',
    system: serviceTypeUri,
  ),

  /// Support
  support(
    code: '456',
    display: 'Support',
    definition: 'Support',
    system: serviceTypeUri,
  ),

  /// Syringes
  syringes(
    code: '457',
    display: 'Syringes',
    definition: 'Syringes',
    system: serviceTypeUri,
  ),

  /// Teeth
  teeth(
    code: '458',
    display: 'Teeth',
    definition: 'Teeth',
    system: serviceTypeUri,
  ),

  /// Tenancy Advice
  tenancyAdvice(
    code: '459',
    display: 'Tenancy Advice',
    definition: 'Tenancy Advice',
    system: serviceTypeUri,
  ),

  /// Terminal Illness
  terminalIllness(
    code: '460',
    display: 'Terminal Illness',
    definition: 'Terminal Illness',
    system: serviceTypeUri,
  ),

  /// Therapy
  therapy(
    code: '461',
    display: 'Therapy',
    definition: 'Therapy',
    system: serviceTypeUri,
  ),

  /// Transcription
  transcription(
    code: '462',
    display: 'Transcription',
    definition: 'Transcription',
    system: serviceTypeUri,
  ),

  /// Translating Services
  translatingServices(
    code: '463',
    display: 'Translating Services',
    definition: 'Translating Services',
    system: serviceTypeUri,
  ),

  /// Translator
  translator(
    code: '464',
    display: 'Translator',
    definition: 'Translator',
    system: serviceTypeUri,
  ),

  /// Transport
  transport(
    code: '465',
    display: 'Transport',
    definition: 'Transport',
    system: serviceTypeUri,
  ),

  /// Vertebrae
  vertebrae(
    code: '466',
    display: 'Vertebrae',
    definition: 'Vertebrae',
    system: serviceTypeUri,
  ),

  /// Violence
  violence(
    code: '467',
    display: 'Violence',
    definition: 'Violence',
    system: serviceTypeUri,
  ),

  /// Vocational Guidance
  vocationalGuidance(
    code: '468',
    display: 'Vocational Guidance',
    definition: 'Vocational Guidance',
    system: serviceTypeUri,
  ),

  /// Weight
  weight(
    code: '469',
    display: 'Weight',
    definition: 'Weight',
    system: serviceTypeUri,
  ),

  /// Welfare Assistance
  welfareAssistance(
    code: '470',
    display: 'Welfare Assistance',
    definition: 'Welfare Assistance',
    system: serviceTypeUri,
  ),

  /// Welfare Counselling
  welfareCounselling(
    code: '471',
    display: 'Welfare Counselling',
    definition: 'Welfare Counselling',
    system: serviceTypeUri,
  ),

  /// Wheelchairs
  wheelchairs(
    code: '472',
    display: 'Wheelchairs',
    definition: 'Wheelchairs',
    system: serviceTypeUri,
  ),

  /// Wound Management
  woundManagement(
    code: '473',
    display: 'Wound Management',
    definition: 'Wound Management',
    system: serviceTypeUri,
  ),

  /// Young People At Risk
  youngPeopleAtRisk(
    code: '474',
    display: 'Young People At Risk',
    definition: 'Young People At Risk',
    system: serviceTypeUri,
  ),

  /// Further Description - Community Health Care
  furtherDescriptionCommunityHealthCare(
    code: '475',
    display: 'Further Desc. - Community Health Care',
    definition: 'Further Description - Community Health Care',
    system: serviceTypeUri,
  ),

  /// Library
  library(
    code: '476',
    display: 'Library',
    definition: 'Library',
    system: serviceTypeUri,
  ),

  /// Community Hours
  communityHours(
    code: '477',
    display: 'Community Hours',
    definition: 'Community Hours',
    system: serviceTypeUri,
  ),

  /// Further Description - Specialist Medical
  furtherDescriptionSpecialistMedical(
    code: '478',
    display: 'Further Desc. - Specialist Medical',
    definition: 'Further Description - Specialist Medical',
    system: serviceTypeUri,
  ),

  /// Hepatology
  hepatology(
    code: '479',
    display: 'Hepatology',
    definition: 'Hepatology',
    system: serviceTypeUri,
  ),

  /// Gastroenterology
  gastroenterology(
    code: '480',
    display: 'Gastroenterology',
    definition: 'Gastroenterology',
    system: serviceTypeUri,
  ),

  /// Gynaecology
  gynaecology(
    code: '481',
    display: 'Gynaecology',
    definition: 'Gynaecology',
    system: serviceTypeUri,
  ),

  /// Obstetrics
  obstetrics(
    code: '482',
    display: 'Obstetrics',
    definition: 'Obstetrics',
    system: serviceTypeUri,
  ),

  /// Further Description - Specialist Surgical
  furtherDescriptionSpecialistSurgical(
    code: '483',
    display: 'Further Desc. - Specialist Surgical',
    definition: 'Further Description - Specialist Surgical',
    system: serviceTypeUri,
  ),

  /// Placement Protection
  placementProtection(
    code: '484',
    display: 'Placement Protection',
    definition: 'Placement Protection',
    system: serviceTypeUri,
  ),

  /// Family Violence
  familyViolence(
    code: '485',
    display: 'Family Violence',
    definition: 'Family Violence',
    system: serviceTypeUri,
  ),

  /// Integrated Family Services
  integratedFamilyServices(
    code: '486',
    display: 'Integrated Family Services',
    definition: 'Integrated Family Services',
    system: serviceTypeUri,
  ),

  /// Diabetes Educator
  diabetesEducator(
    code: '488',
    display: 'Diabetes Educator',
    definition: 'Diabetes Educator',
    system: serviceTypeUri,
  ),

  /// Kinship Care
  kinshipCare(
    code: '489',
    display: 'Kinship Care',
    definition: 'Kinship Care',
    system: serviceTypeUri,
  ),

  /// General Mental Health Services
  generalMentalHealthServices(
    code: '490',
    display: 'General Mental Health Services',
    definition: 'General Mental Health Services',
    system: serviceTypeUri,
  ),

  /// Exercise Physiology
  exercisePhysiology(
    code: '491',
    display: 'Exercise Physiology',
    definition: 'Exercise Physiology',
    system: serviceTypeUri,
  ),

  /// Medical Research
  medicalResearch(
    code: '492',
    display: 'Medical Research',
    definition: 'Medical Research',
    system: serviceTypeUri,
  ),

  /// Youth
  youth(
    code: '493',
    display: 'Youth',
    definition: 'Youth',
    system: serviceTypeUri,
  ),

  /// Youth Services
  youthServices(
    code: '494',
    display: 'Youth Services',
    definition: 'Youth Services',
    system: serviceTypeUri,
  ),

  /// Youth Health
  youthHealth(
    code: '495',
    display: 'Youth Health',
    definition: 'Youth Health',
    system: serviceTypeUri,
  ),

  /// Child and Family Services
  childAndFamilyServices(
    code: '496',
    display: 'Child and Family Ser',
    definition: 'Child and Family Services',
    system: serviceTypeUri,
  ),

  /// Home Visits
  homeVisits(
    code: '497',
    display: 'Home Visits',
    definition: 'Home Visits',
    system: serviceTypeUri,
  ),

  /// Mobile Services
  mobileServices(
    code: '498',
    display: 'Mobile Services',
    definition: 'Mobile Services',
    system: serviceTypeUri,
  ),

  /// Before and/or After School Care
  beforeAndOrAfterSchoolCare(
    code: '500',
    display: 'Before and/or After',
    definition: 'Before and/or After School Care',
    system: serviceTypeUri,
  ),

  /// Cancer Services
  cancerServices(
    code: '501',
    display: 'Cancer Services',
    definition: 'Cancer Services',
    system: serviceTypeUri,
  ),

  /// Integrated Cancer Services
  integratedCancerServices(
    code: '502',
    display: 'Integrated Cancer Se',
    definition: 'Integrated Cancer Services',
    system: serviceTypeUri,
  ),

  /// Multidisciplinary Services
  multidisciplinaryServices(
    code: '503',
    display: 'Multidisciplinary Se',
    definition: 'Multidisciplinary Services',
    system: serviceTypeUri,
  ),

  /// Multidisciplinary Cancer Services
  multidisciplinaryCancerServices(
    code: '504',
    display: 'Multidisciplinary Ca',
    definition: 'Multidisciplinary Cancer Services',
    system: serviceTypeUri,
  ),

  /// Meetings
  meetings(
    code: '505',
    display: 'Meetings',
    definition: 'Meetings',
    system: serviceTypeUri,
  ),

  /// Blood pressure monitoring
  bloodPressureMonitoring(
    code: '506',
    display: 'Blood pressure monit',
    definition: 'Blood pressure monitoring',
    system: serviceTypeUri,
  ),

  /// Dose administration aid
  doseAdministrationAid(
    code: '507',
    display: 'Dose administration',
    definition: 'Dose administration aid',
    system: serviceTypeUri,
  ),

  /// Medical Equipment Hire
  medicalEquipmentHire(
    code: '508',
    display: 'Medical Equipment Hi',
    definition: 'Medical Equipment Hire',
    system: serviceTypeUri,
  ),

  /// Parenting & family support/education
  parentingFamilySupportEducation(
    code: '509',
    display: 'Parenting/Family Support/Education',
    definition: 'Parenting & family support/education',
    system: serviceTypeUri,
  ),

  /// Deputising Service
  deputisingService(
    code: '510',
    display: 'Deputising Service',
    definition: 'Deputising Service',
    system: serviceTypeUri,
  ),

  /// Cancer Support Groups
  cancerSupportGroups(
    code: '513',
    display: 'Cancer Support Groups',
    definition: 'Cancer Support Groups',
    system: serviceTypeUri,
  ),

  /// Community Cancer Services
  communityCancerServices(
    code: '514',
    display: 'Community Cancer Services',
    definition: 'Community Cancer Services',
    system: serviceTypeUri,
  ),

  /// Disability Care Transport
  disabilityCareTransport(
    code: '530',
    display: 'Disability Care Transport',
    definition: 'Disability Care Transport',
    system: serviceTypeUri,
  ),

  /// Aged Care Transport
  agedCareTransport(
    code: '531',
    display: 'Aged Care Transport',
    definition: 'Aged Care Transport',
    system: serviceTypeUri,
  ),

  /// Diabetes Education service
  diabetesEducationService(
    code: '532',
    display: 'Diabetes Education s',
    definition: 'Diabetes Education service',
    system: serviceTypeUri,
  ),

  /// Cardiac Rehabilitation Service
  cardiacRehabilitationService(
    code: '533',
    display: 'Cardiac Rehabilitati',
    definition: 'Cardiac Rehabilitation Service',
    system: serviceTypeUri,
  ),

  /// Young Adult Diabetes services (YADS)
  youngAdultDiabetesServices(
    code: '534',
    display: 'Young Adult Diabetes',
    definition: 'Young Adult Diabetes services (YADS)',
    system: serviceTypeUri,
  ),

  /// Pulmonary Rehabilitation Service
  pulmonaryRehabilitationService(
    code: '535',
    display: 'Pulmonary Rehabilita',
    definition: 'Pulmonary Rehabilitation Service',
    system: serviceTypeUri,
  ),

  /// Art therapy
  artTherapy(
    code: '536',
    display: 'Art therapy',
    definition: 'Art therapy',
    system: serviceTypeUri,
  ),

  /// Medication Reviews
  medicationReviews(
    code: '537',
    display: 'Medication Reviews',
    definition: 'Medication Reviews',
    system: serviceTypeUri,
  ),

  /// Telephone Counselling
  telephoneCounselling(
    code: '538',
    display: 'Telephone Counselling',
    definition: 'Telephone Counselling',
    system: serviceTypeUri,
  ),

  /// Telephone Help Line
  telephoneHelpLine(
    code: '539',
    display: 'Telephone Help Line',
    definition: 'Telephone Help Line',
    system: serviceTypeUri,
  ),

  /// Online Service
  onlineService(
    code: '540',
    display: 'Online Service',
    definition: 'Online Service',
    system: serviceTypeUri,
  ),

  /// Crisis - Mental Health
  crisisMentalHealth(
    code: '541',
    display: 'Crisis - Mental Health',
    definition: 'Crisis - Mental Health',
    system: serviceTypeUri,
  ),

  /// Youth Crisis
  youthCrisis(
    code: '542',
    display: 'Youth Crisis',
    definition: 'Youth Crisis',
    system: serviceTypeUri,
  ),

  /// Sexual Assault
  sexualAssault(
    code: '543',
    display: 'Sexual Assault',
    definition: 'Sexual Assault',
    system: serviceTypeUri,
  ),

  /// GPAH Other
  gpahOther(
    code: '544',
    display: 'GPAH Other',
    definition: 'GPAH Other',
    system: serviceTypeUri,
  ),

  /// Paediatric Dermatology
  paediatricDermatology(
    code: '545',
    display: 'Paediatric Dermatology',
    definition: 'Paediatric Dermatology',
    system: serviceTypeUri,
  ),

  /// Veterans Services
  veteransServices(
    code: '546',
    display: 'Veterans Services',
    definition: 'Veterans Services',
    system: serviceTypeUri,
  ),

  /// Veterans
  veterans(
    code: '547',
    display: 'Veterans',
    definition: 'Veterans',
    system: serviceTypeUri,
  ),

  /// Food Relief/food/meals
  foodReliefFoodMeals(
    code: '548',
    display: 'Food Relief/Food/Meals',
    definition: 'Food Relief/food/meals',
    system: serviceTypeUri,
  ),

  /// Dementia Care
  dementiaCare(
    code: '550',
    display: 'Dementia Care',
    definition: 'Dementia Care',
    system: serviceTypeUri,
  ),

  /// Alzheimer
  alzheimer(
    code: '551',
    display: 'Alzheimer',
    definition: 'Alzheimer',
    system: serviceTypeUri,
  ),

  /// Drug and/or alcohol support groups
  drugAndOrAlcoholSupportGroups(
    code: '552',
    display: 'Drug and/or Alcohol Support Groups',
    definition: 'Drug and/or alcohol support groups',
    system: serviceTypeUri,
  ),

  /// One on One Support/Mentoring/Coaching
  oneOnOneSupportMentoringCoaching(
    code: '553',
    display: '1-on-1 Support /Mentoring /Coaching',
    definition: 'One on One Support/Mentoring/Coaching',
    system: serviceTypeUri,
  ),

  /// Chronic Disease Management
  chronicDiseaseManagement(
    code: '554',
    display: 'Chronic Disease Management',
    definition: 'Chronic Disease Management',
    system: serviceTypeUri,
  ),

  /// Liaison Services
  liaisonServices(
    code: '555',
    display: 'Liaison Services',
    definition: 'Liaison Services',
    system: serviceTypeUri,
  ),

  /// Walk in Centre / non emergency
  walkInCentreNonEmergency(
    code: '556',
    display: 'Walk-in Centre /Non-Emergency',
    definition: 'Walk in Centre / non emergency',
    system: serviceTypeUri,
  ),

  /// Inpatients
  inpatients(
    code: '557',
    display: 'Inpatients',
    definition: 'Inpatients',
    system: serviceTypeUri,
  ),

  /// Spiritual Counselling
  spiritualCounselling(
    code: '558',
    display: 'Spiritual Counselling',
    definition: 'Spiritual Counselling',
    system: serviceTypeUri,
  ),

  /// Women's Health
  womensHealth(
    code: '559',
    display: "Women's Health",
    definition: "Women's Health",
    system: serviceTypeUri,
  ),

  /// Men's Health
  mensHealth(
    code: '560',
    display: "Men's Health",
    definition: "Men's Health",
    system: serviceTypeUri,
  ),

  /// Health education/Health awareness program
  healthEducationHealthAwarenessProgram(
    code: '561',
    display: 'Health Education/Awareness Program',
    definition: 'Health education/Health awareness program',
    system: serviceTypeUri,
  ),

  /// Test Message
  testMessage(
    code: '562',
    display: 'Test Message',
    definition: 'Test Message',
    system: serviceTypeUri,
  ),

  /// Remedial Massage
  remedialMassage(
    code: '563',
    display: 'Remedial Massage',
    definition: 'Remedial Massage',
    system: serviceTypeUri,
  ),

  /// Adolescent Mental Health Services
  adolescentMentalHealthServices(
    code: '564',
    display: 'Adolescent Mental Health Services',
    definition: 'Adolescent Mental Health Services',
    system: serviceTypeUri,
  ),

  /// Youth drop in/assistance/support
  youthDropInAssistanceSupport(
    code: '565',
    display: 'Youth Drop In/Assistance/Support',
    definition: 'Youth drop in/assistance/support',
    system: serviceTypeUri,
  ),

  /// Aboriginal Health Worker
  aboriginalHealthWorker(
    code: '566',
    display: 'Aboriginal Health Worker',
    definition: 'Aboriginal Health Worker',
    system: serviceTypeUri,
  ),

  /// Women's Health Clinic
  womensHealthClinic(
    code: '567',
    display: "Women's Health Clinic",
    definition: "Women's Health Clinic",
    system: serviceTypeUri,
  ),

  /// Men's Health Clinic
  mensHealthClinic(
    code: '568',
    display: "Men's Health Clinic",
    definition: "Men's Health Clinic",
    system: serviceTypeUri,
  ),

  /// Migrant Health Clinic
  migrantHealthClinic(
    code: '569',
    display: 'Migrant Health Clinic',
    definition: 'Migrant Health Clinic',
    system: serviceTypeUri,
  ),

  /// Refugee Health Clinic
  refugeeHealthClinic(
    code: '570',
    display: 'Refugee Health Clinic',
    definition: 'Refugee Health Clinic',
    system: serviceTypeUri,
  ),

  /// Aboriginal Health Clinic
  aboriginalHealthClinic(
    code: '571',
    display: 'Aboriginal Health Clinic',
    definition: 'Aboriginal Health Clinic',
    system: serviceTypeUri,
  ),

  /// Nurse Practitioner lead Clinic/s
  nursePractitionerLeadClinics(
    code: '572',
    display: 'Nurse Practitioner Lead Clinic/s',
    definition: 'Nurse Practitioner lead Clinic/s',
    system: serviceTypeUri,
  ),

  /// Nurse lead Clinic/s
  nurseLeadClinics(
    code: '573',
    display: 'Nurse Lead Clinic/s',
    definition: 'Nurse lead Clinic/s',
    system: serviceTypeUri,
  ),

  /// Culturally tailored support groups
  culturallyTailoredSupportGroups(
    code: '574',
    display: 'Culturally Tailored Support Groups',
    definition: 'Culturally tailored support groups',
    system: serviceTypeUri,
  ),

  /// Culturally tailored health promotion
  culturallyTailoredHealthPromotion(
    code: '575',
    display: 'Culturally Tailored Health Promotion',
    definition: 'Culturally tailored health promotion',
    system: serviceTypeUri,
  ),

  /// Rehabilitation
  rehabilitation(
    code: '576',
    display: 'Rehabilitation',
    definition: 'Rehabilitation',
    system: serviceTypeUri,
  ),

  /// Education information/referral
  educationInformationReferral(
    code: '577',
    display: 'Education Information/Referral',
    definition: 'Education information/referral',
    system: serviceTypeUri,
  ),

  /// Social Work
  socialWork(
    code: '580',
    display: 'Social Work',
    definition: 'Social Work',
    system: serviceTypeUri,
  ),

  /// Haematology
  haematology(
    code: '581',
    display: 'Haematology',
    definition: 'Haematology',
    system: serviceTypeUri,
  ),

  /// Maternity Shared Care
  maternitySharedCare(
    code: '582',
    display: 'Maternity Shared Car',
    definition: 'Maternity Shared Care',
    system: serviceTypeUri,
  ),

  /// Rehabilitation Service
  rehabilitationService(
    code: '583',
    display: 'Rehabilitation Servi',
    definition: 'Rehabilitation Service',
    system: serviceTypeUri,
  ),

  /// Cranio-Sacral Therapy
  cranioSacralTherapy(
    code: '584',
    display: 'Cranio-sacral Therapy',
    definition: 'Cranio-Sacral Therapy',
    system: serviceTypeUri,
  ),

  /// Prosthetics & Orthotics
  prostheticsOrthotics(
    code: '585',
    display: 'Prosthetics & Orthotics',
    definition: 'Prosthetics & Orthotics',
    system: serviceTypeUri,
  ),

  /// Home Medicine Review
  homeMedicineReview(
    code: '589',
    display: 'Home Medicine Review',
    definition: 'Home Medicine Review',
    system: serviceTypeUri,
  ),

  /// GPAH - Medical
  gpahMedical(
    code: '590',
    display: 'GPAH - Medical',
    definition: 'GPAH - Medical',
    system: serviceTypeUri,
  ),

  /// Music Therapy
  musicTherapy(
    code: '591',
    display: 'Music Therapy',
    definition: 'Music Therapy',
    system: serviceTypeUri,
  ),

  /// Falls Prevention
  fallsPrevention(
    code: '593',
    display: 'Falls Prevention',
    definition: 'Falls Prevention',
    system: serviceTypeUri,
  ),

  /// Accommodation/Tenancy
  accommodationTenancy(
    code: '599',
    display: 'Accommodation/Tenancy',
    definition: 'Accommodation/Tenancy',
    system: serviceTypeUri,
  ),

  /// Assess-Skill, Ability, Needs
  assessSkillAbilityNeeds(
    code: '600',
    display: 'Assess-Skill, Ability, Needs',
    definition: 'Assess-Skill, Ability, Needs',
    system: serviceTypeUri,
  ),

  /// Assist Access/Maintain Employ
  assistAccessMaintainEmploy(
    code: '601',
    display: 'Assist Access/Maintain Employ',
    definition: 'Assist Access/Maintain Employ',
    system: serviceTypeUri,
  ),

  /// Assist Prod-Pers Care/Safety
  assistProdPersSafety(
    code: '602',
    display: 'Assist Prod-Pers Care/Safety',
    definition: 'Assist Prod-Pers Care/Safety',
    system: serviceTypeUri,
  ),

  /// Assist-Integrate School/Ed
  assistIntegrateSchoolEd(
    code: '603',
    display: 'Assist-Integrate School/Ed',
    definition: 'Assist-Integrate School/Ed',
    system: serviceTypeUri,
  ),

  /// Assist-Life Stage, Transition
  assistLifeStageTransition(
    code: '604',
    display: 'Assist-Life Stage, Transition',
    definition: 'Assist-Life Stage, Transition',
    system: serviceTypeUri,
  ),

  /// Assist-Personal Activities
  assistPersonalActivities(
    code: '605',
    display: 'Assist-Personal Activities',
    definition: 'Assist-Personal Activities',
    system: serviceTypeUri,
  ),

  /// Assist-Travel/Transport
  assistTravelTransport(
    code: '606',
    display: 'Assist-Travel/Transport',
    definition: 'Assist-Travel/Transport',
    system: serviceTypeUri,
  ),

  /// Assistive Equip-General Tasks
  assistiveEquipGeneralTasks(
    code: '607',
    display: 'Assistive Equip-General Tasks',
    definition: 'Assistive Equip-General Tasks',
    system: serviceTypeUri,
  ),

  /// Assistive Equip-Recreation
  assistiveEquipRecreation(
    code: '608',
    display: 'Assistive Equip-Recreation',
    definition: 'Assistive Equip-Recreation',
    system: serviceTypeUri,
  ),

  /// Assistive Prod-Household Task
  assistiveProdHouseholdTask(
    code: '609',
    display: 'Assistive Prod-Household Task',
    definition: 'Assistive Prod-Household Task',
    system: serviceTypeUri,
  ),

  /// Behavior Support
  behaviorSupport(
    code: '610',
    display: 'Behavior Support',
    definition: 'Behavior Support',
    system: serviceTypeUri,
  ),

  /// Comms & Info Equipment
  commsInfoEquipment(
    code: '611',
    display: 'Comms & Info Equipment',
    definition: 'Comms & Info Equipment',
    system: serviceTypeUri,
  ),

  /// Community Nursing Care
  communityNursingCare(
    code: '612',
    display: 'Community Nursing Care',
    definition: 'Community Nursing Care',
    system: serviceTypeUri,
  ),

  /// Daily Tasks/Shared Living
  dailyTasksSharedLiving(
    code: '613',
    display: 'Daily Tasks/Shared Living',
    definition: 'Daily Tasks/Shared Living',
    system: serviceTypeUri,
  ),

  /// Development-Life Skills
  developmentLifeSkills(
    code: '614',
    display: 'Development-Life Skills',
    definition: 'Development-Life Skills',
    system: serviceTypeUri,
  ),

  /// Early Childhood Supports
  earlyChildhoodSupports(
    code: '615',
    display: 'Early Childhood Supports',
    definition: 'Early Childhood Supports',
    system: serviceTypeUri,
  ),

  /// Equipment Special Assess Setup
  equipmentSpecialAssessSetup(
    code: '616',
    display: 'Equipment Special Assess Setup',
    definition: 'Equipment Special Assess Setup',
    system: serviceTypeUri,
  ),

  /// Hearing Equipment
  hearingEquipment(
    code: '617',
    display: 'Hearing Equipment',
    definition: 'Hearing Equipment',
    system: serviceTypeUri,
  ),

  /// Home Modification
  homeModification(
    code: '618',
    display: 'Home Modification',
    definition: 'Home Modification',
    system: serviceTypeUri,
  ),

  /// Household Tasks
  householdTasks(
    code: '619',
    display: 'Household Tasks',
    definition: 'Household Tasks',
    system: serviceTypeUri,
  ),

  /// Interpret/Translate
  interpretTranslate(
    code: '620',
    display: 'Interpret/Translate',
    definition: 'Interpret/Translate',
    system: serviceTypeUri,
  ),

  /// Other Innovative Supports
  otherInnovativeSupports(
    code: '621',
    display: 'Other Innovative Supports',
    definition: 'Other Innovative Supports',
    system: serviceTypeUri,
  ),

  /// Participate Community
  participateCommunity(
    code: '622',
    display: 'Participate Community',
    definition: 'Participate Community',
    system: serviceTypeUri,
  ),

  /// Personal Mobility Equipment
  personalMobilityEquipment(
    code: '623',
    display: 'Personal Mobility Equipment',
    definition: 'Personal Mobility Equipment',
    system: serviceTypeUri,
  ),

  /// Physical Wellbeing
  physicalWellbeing(
    code: '624',
    display: 'Physical Wellbeing',
    definition: 'Physical Wellbeing',
    system: serviceTypeUri,
  ),

  /// Plan Management
  planManagement(
    code: '625',
    display: 'Plan Management',
    definition: 'Plan Management',
    system: serviceTypeUri,
  ),

  /// Therapeutic Supports
  therapeuticSupports(
    code: '626',
    display: 'Therapeutic Supports',
    definition: 'Therapeutic Supports',
    system: serviceTypeUri,
  ),

  /// Training-Travel Independence
  trainingTravelIndependence(
    code: '627',
    display: 'Training-Travel Independence',
    definition: 'Training-Travel Independence',
    system: serviceTypeUri,
  ),

  /// Vehicle modifications
  vehicleModifications(
    code: '628',
    display: 'Vehicle modifications',
    definition: 'Vehicle modifications',
    system: serviceTypeUri,
  ),

  /// Vision Equipment
  visionEquipment(
    code: '629',
    display: 'Vision Equipment',
    definition: 'Vision Equipment',
    system: serviceTypeUri,
  );

  const ServiceType({
    required this.code,
    required this.display,
    required this.definition,
    required this.system,
  });

  final String code;
  final String display;
  final String definition;
  final String system;

  /// Returns the service type based on the string code, and returns null if
  /// no match is found
  static ServiceType? fromCode(String code) => ServiceType.values.firstWhere(
        (serviceType) => serviceType.code == code,
        orElse: () => null,
      );

  JsonValue get json => JsonString(code);

  @override
  int compareTo(ServiceType other) => code == other.code ? 0 : 1;
}
