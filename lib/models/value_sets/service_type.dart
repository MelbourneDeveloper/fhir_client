// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/misc.dart';
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
  ),

  /// Aged care assessment
  agedCareAssessment(
    code: '2',
    display: 'Aged Care Assessment',
    definition: 'Aged care assessment',
  ),

  /// Aged Care information/referral
  agedCareInformationReferral(
    code: '3',
    display: 'Aged Care Information/Referral',
    definition: 'Aged Care information/referral',
  ),

  /// Aged Residential Care
  agedResidentialCare(
    code: '4',
    display: 'Aged Residential Care',
    definition: 'Aged Residential Care',
  ),

  /// Case management for older persons
  caseManagementForOlderPersons(
    code: '5',
    display: 'Case Management for Older Persons',
    definition: 'Case management for older persons',
  ),

  /// Delivered meals (meals on wheels)
  deliveredMealsMealsOnWheels(
    code: '6',
    display: 'Delivered Meals (Meals On Wheels)',
    definition: 'Delivered meals (meals on wheels)',
  ),

  /// Friendly visiting
  friendlyVisiting(
    code: '7',
    display: 'Friendly Visiting',
    definition: 'Friendly visiting',
  ),

  /// Home care/housekeeping assistance
  homeCareHousekeepingAssistance(
    code: '8',
    display: 'Home Care/Housekeeping Assistance',
    definition: 'Home care/housekeeping assistance',
  ),

  /// Home maintenance and repair
  homeMaintenanceAndRepair(
    code: '9',
    display: 'Home Maintenance and Repair',
    definition: 'Home maintenance and repair',
  ),

  /// Personal alarms/alerts
  personalAlarmsAlerts(
    code: '10',
    display: 'Personal Alarms/Alerts',
    definition: 'Personal alarms/alerts',
  ),

  /// Personal care for older persons
  personalCareForOlderPersons(
    code: '11',
    display: 'Personal Care for Older Persons',
    definition: 'Personal care for older persons',
  ),

  /// Planned activity groups
  plannedActivityGroups(
    code: '12',
    display: 'Planned Activity Groups',
    definition: 'Planned activity groups',
  ),

  /// Acupuncture
  acupuncture(
    code: '13',
    display: 'Acupuncture',
    definition: 'Acupuncture',
  ),

  /// Alexander technique therapy
  alexanderTechniqueTherapy(
    code: '14',
    display: 'Alexander Technique Therapy',
    definition: 'Alexander technique therapy',
  ),

  /// Aromatherapy
  aromatherapy(
    code: '15',
    display: 'Aromatherapy',
    definition: 'Aromatherapy',
  ),

  /// Biorhythm services
  biorhythmServices(
    code: '16',
    display: 'Biorhythm Services',
    definition: 'Biorhythm services',
  ),

  /// Bowen therapy
  bowenTherapy(
    code: '17',
    display: 'Bowen Therapy',
    definition: 'Bowen therapy',
  ),

  /// Chinese herbal medicine
  chineseHerbalMedicine(
    code: '18',
    display: 'Chinese Herbal Medicine',
    definition: 'Chinese herbal medicine',
  ),

  /// Feldenkrais
  feldenkrais(
    code: '19',
    display: 'Feldenkrais',
    definition: 'Feldenkrais',
  ),

  /// Homoeopathy
  homoeopathy(
    code: '20',
    display: 'Homoeopathy',
    definition: 'Homoeopathy',
  ),

  /// Hydrotherapy
  hydrotherapy(
    code: '21',
    display: 'Hydrotherapy',
    definition: 'Hydrotherapy',
  ),

  /// Hypnotherapy
  hypnotherapy(
    code: '22',
    display: 'Hypnotherapy',
    definition: 'Hypnotherapy',
  ),

  /// Kinesiology
  kinesiology(
    code: '23',
    display: 'Kinesiology',
    definition: 'Kinesiology',
  ),

  /// Magnetic therapy
  magneticTherapy(
    code: '24',
    display: 'Magnetic Therapy',
    definition: 'Magnetic therapy',
  ),

  /// Massage therapy
  massageTherapy(
    code: '25',
    display: 'Massage Therapy',
    definition: 'Massage therapy',
  ),

  /// Meditation
  meditation(
    code: '26',
    display: 'Meditation',
    definition: 'Meditation',
  ),

  /// Myotherapy
  myotherapy(
    code: '27',
    display: 'Myotherapy',
    definition: 'Myotherapy',
  ),

  /// Naturopathy
  naturopathy(
    code: '28',
    display: 'Naturopathy',
    definition: 'Naturopathy',
  ),

  /// Reflexology
  reflexology(
    code: '29',
    display: 'Reflexology',
    definition: 'Reflexology',
  ),

  /// Reiki
  reiki(
    code: '30',
    display: 'Reiki',
    definition: 'Reiki',
  ),

  /// Relaxation therapy
  relaxationTherapy(
    code: '31',
    display: 'Relaxation Therapy',
    definition: 'Relaxation therapy',
  ),

  /// Shiatsu
  shiatsu(
    code: '32',
    display: 'Shiatsu',
    definition: 'Shiatsu',
  ),

  /// Western herbal medicine
  westernHerbalMedicine(
    code: '33',
    display: 'Western Herbal Medicine',
    definition: 'Western herbal medicine',
  ),

  /// Family day care
  familyDayCare(
    code: '34',
    display: 'Family Day care',
    definition: 'Family day care',
  ),

  /// Holiday programs
  holidayPrograms(
    code: '35',
    display: 'Holiday Programs',
    definition: 'Holiday programs',
  ),

  /// Kindergarten inclusion support for children with a disability
  kindergartenInclusionSupport(
    code: '36',
    display: 'Kindergarten Inclusion Support',
    definition: 'Kindergarten inclusion support for children with a disability',
  ),

  /// Kindergarten/preschool
  kindergartenPreschool(
    code: '37',
    display: 'Kindergarten/Preschool',
    definition: 'Kindergarten/preschool',
  ),

  /// Long day child care
  longDayChildCare(
    code: '38',
    display: 'Long Day Child Care',
    definition: 'Long day child care',
  ),

  /// Occasional child care
  occasionalChildCare(
    code: '39',
    display: 'Occasional Child Care',
    definition: 'Occasional child care',
  ),

  /// Outside school hours care
  outsideSchoolHoursCare(
    code: '40',
    display: 'Outside School Hours Care',
    definition: 'Outside school hours care',
  ),

  /// Children's play programs
  childrensPlayPrograms(
    code: '41',
    display: "Children's Play Programs",
    definition: "Children's play programs",
  ),

  /// Parenting & family management support/education
  parentingFamilyManagementSupportEducation(
    code: '42',
    display: 'Parenting/Family Support/Education',
    definition: 'Parenting & family management support/education',
  ),

  /// Playgroup
  playgroup(
    code: '43',
    display: 'Playgroup',
    definition: 'Playgroup',
  ),

  /// School nursing
  schoolNursing(
    code: '44',
    display: 'School Nursing',
    definition: 'School nursing',
  ),

  /// Toy library
  toyLibrary(
    code: '45',
    display: 'Toy Library',
    definition: 'Toy library',
  ),

  /// Child protection/child abuse report
  childProtectionChildAbuseReport(
    code: '46',
    display: 'Child Protection/Child Abuse Report',
    definition: 'Child protection/child abuse report',
  ),

  /// Foster care
  fosterCare(
    code: '47',
    display: 'Foster Care',
    definition: 'Foster care',
  ),

  /// Residential/out of home care
  residentialOutOfHomeCare(
    code: '48',
    display: 'Residential/Out-of-Home Care',
    definition: 'Residential/ out of home care',
  ),

  /// Support for young people leaving care
  supportForYoungPeopleLeavingCare(
    code: '49',
    display: 'Support - Young People Leaving Care',
    definition: 'Support for young people leaving care',
  ),

  /// Audiology
  audiology(
    code: '50',
    display: 'Audiology',
    definition: 'Audiology',
  ),

  /// Blood donation
  bloodDonation(
    code: '51',
    display: 'Blood Donation',
    definition: 'Blood donation',
  ),

  /// Chiropractic
  chiropractic(
    code: '52',
    display: 'Chiropractic',
    definition: 'Chiropractic',
  ),

  /// Dietetics
  dietetics(
    code: '53',
    display: 'Dietetics',
    definition: 'Dietetics',
  ),

  /// Family planning
  familyPlanning(
    code: '54',
    display: 'Family Planning',
    definition: 'Family planning',
  ),

  /// Health advocacy/Liaison service
  healthAdvocacyLiaisonService(
    code: '55',
    display: 'Health Advocacy/Liaison Service',
    definition: 'Health advocacy/Liaison service',
  ),

  /// Health information/referral
  healthInformationReferral(
    code: '56',
    display: 'Health Information/Referral',
    definition: 'Health information/referral',
  ),

  /// Immunization
  immunization(
    code: '57',
    display: 'Immunization',
    definition: 'Immunization',
  ),

  /// Maternal & child health
  maternalChildHealth(
    code: '58',
    display: 'Maternal & Child Health',
    definition: 'Maternal & child health',
  ),

  /// Nursing
  nursing(
    code: '59',
    display: 'Nursing',
    definition: 'Nursing',
  ),

  /// Nutrition
  nutrition(
    code: '60',
    display: 'Nutrition',
    definition: 'Nutrition',
  ),

  /// Occupational therapy
  occupationalTherapy(
    code: '61',
    display: 'Occupational Therapy',
    definition: 'Occupational therapy',
  ),

  /// Optometry
  optometry(
    code: '62',
    display: 'Optometry',
    definition: 'Optometry',
  ),

  /// Osteopathy
  osteopathy(
    code: '63',
    display: 'Osteopathy',
    definition: 'Osteopathy',
  ),

  /// Pharmacy
  pharmacy(
    code: '64',
    display: 'Pharmacy',
    definition: 'Pharmacy',
  ),

  /// Physiotherapy
  physiotherapy(
    code: '65',
    display: 'Physiotherapy',
    definition: 'Physiotherapy',
  ),

  /// Podiatry
  podiatry(
    code: '66',
    display: 'Podiatry',
    definition: 'Podiatry',
  ),

  /// Sexual health
  sexualHealth(
    code: '67',
    display: 'Sexual Health',
    definition: 'Sexual health',
  ),

  /// Speech pathology/therapy
  speechPathologyTherapy(
    code: '68',
    display: 'Speech Pathology/Therapy',
    definition: 'Speech pathology/therapy',
  ),

  /// Bereavement counselling
  bereavementCounselling(
    code: '69',
    display: 'Bereavement Counselling',
    definition: 'Bereavement counselling',
  ),

  /// Crisis counselling
  crisisCounselling(
    code: '70',
    display: 'Crisis Counselling',
    definition: 'Crisis counselling',
  ),

  /// Family counselling and/or family therapy
  familyCounsellingTherapy(
    code: '71',
    display: 'Family Counselling/Therapy',
    definition: 'Family counselling and/or family therapy',
  ),

  /// Family violence counselling
  familyViolenceCounselling(
    code: '72',
    display: 'Family Violence Counselling',
    definition: 'Family violence counselling',
  ),

  /// Financial counselling
  financialCounselling(
    code: '73',
    display: 'Financial Counselling',
    definition: 'Financial counselling',
  ),

  /// Generalist counselling
  generalistCounselling(
    code: '74',
    display: 'Generalist Counselling',
    definition: 'Generalist counselling',
  ),

  /// Genetic counselling
  geneticCounselling(
    code: '75',
    display: 'Genetic Counselling',
    definition: 'Genetic counselling',
  ),

  /// Health counselling
  healthCounselling(
    code: '76',
    display: 'Health Counselling',
    definition: 'Health counselling',
  ),

  /// Mediation
  mediation(
    code: '77',
    display: 'Mediation',
    definition: 'Mediation',
  ),

  /// Problem gambling counselling
  problemGamblingCounselling(
    code: '78',
    display: 'Problem Gambling Counselling',
    definition: 'Problem gambling counselling',
  ),

  /// Relationship counselling
  relationshipCounselling(
    code: '79',
    display: 'Relationship Counselling',
    definition: 'Relationship counselling',
  ),

  /// Sexual assault counselling
  sexualAssaultCounselling(
    code: '80',
    display: 'Sexual Assault Counselling',
    definition: 'Sexual assault counselling',
  ),

  /// Trauma counselling
  traumaCounselling(
    code: '81',
    display: 'Trauma Counselling',
    definition: 'Trauma counselling',
  ),

  /// Victims of crime counselling
  victimsOfCrimeCounselling(
    code: '82',
    display: 'Victims of Crime Counselling',
    definition: 'Victims of crime counselling',
  ),

  /// Cemetery operation
  cemeteryOperation(
    code: '83',
    display: 'Cemetery Operation',
    definition: 'Cemetery operation',
  ),

  /// Cremation
  cremation(
    code: '84',
    display: 'Cremation',
    definition: 'Cremation',
  ),

  /// Death service information
  deathServiceInformation(
    code: '85',
    display: 'Death Service Information',
    definition: 'Death service information',
  ),

  /// Funeral services
  funeralServices(
    code: '86',
    display: 'Funeral Services',
    definition: 'Funeral services',
  ),

  /// Endodontic
  endodontic(
    code: '87',
    display: 'Endodontic',
    definition: 'Endodontic',
  ),

  /// General dental
  generalDental(
    code: '88',
    display: 'General Dental',
    definition: 'General dental',
  ),

  /// Oral medicine
  oralMedicine(
    code: '89',
    display: 'Oral Medicine',
    definition: 'Oral medicine',
  ),

  /// Oral surgery
  oralSurgery(
    code: '90',
    display: 'Oral Surgery',
    definition: 'Oral surgery',
  ),

  /// Orthodontic
  orthodontic(
    code: '91',
    display: 'Orthodontic',
    definition: 'Orthodontic',
  ),

  /// Paediatric Dentistry
  paediatricDentistry(
    code: '92',
    display: 'Paediatric Dentistry',
    definition: 'Paediatric Dentistry',
  ),

  /// Periodontic
  periodontic(
    code: '93',
    display: 'Periodontic',
    definition: 'Periodontic',
  ),

  /// Prosthodontic
  prosthodontic(
    code: '94',
    display: 'Prosthodontic',
    definition: 'Prosthodontic',
  ),

  /// Acquired brain injury information/referral
  acquiredBrainInjuryInformationReferral(
    code: '95',
    display: 'Acquired Brain Injury Info/Referral',
    definition: 'Acquired brain injury information/referral',
  ),

  /// Disability advocacy
  disabilityAdvocacy(
    code: '96',
    display: 'Disability Advocacy',
    definition: 'Disability advocacy',
  ),

  /// Disability aids & equipment
  disabilityAidsEquipment(
    code: '97',
    display: 'Disability Aids & Equipment',
    definition: 'Disability aids & equipment',
  ),

  /// Disability case management
  disabilityCaseManagement(
    code: '98',
    display: 'Disability Case Management',
    definition: 'Disability case management',
  ),

  /// Disability day programs & activities
  disabilityDayProgramsActivities(
    code: '99',
    display: 'Disability Day Programs/Activities',
    definition: 'Disability day programs & activities',
  ),

  /// Disability information/referral
  disabilityInformationReferral(
    code: '100',
    display: 'Disability Information/Referral',
    definition: 'Disability information/referral',
  ),

  /// Disability support packages
  disabilitySupportPackages(
    code: '101',
    display: 'Disability Support Packages',
    definition: 'Disability support packages',
  ),

  /// Disability supported accommodation
  disabilitySupportedAccommodation(
    code: '102',
    display: 'Disability Supported Accommodation',
    definition: 'Disability supported accommodation',
  ),

  /// Early childhood intervention
  earlyChildhoodIntervention(
    code: '103',
    display: 'Early Childhood Intervention',
    definition: 'Early childhood intervention',
  ),

  /// Hearing aids & equipment
  hearingAidsEquipment(
    code: '104',
    display: 'Hearing Aids & Equipment',
    definition: 'Hearing aids & equipment',
  ),

  /// Drug and/or alcohol counselling
  drugAlcoholCounselling(
    code: '105',
    display: 'Drug and/or Alcohol Counselling',
    definition: 'Drug and/or alcohol counselling',
  ),

  /// Drug and/or alcohol information/referral
  drugAlcoholInformationReferral(
    code: '106',
    display: 'Drug/Alcohol Information/Referral',
    definition: 'Drug and/or alcohol information/referral',
  ),

  /// Needle & Syringe exchange
  needleSyringeExchange(
    code: '107',
    display: 'Needle & Syringe Exchange',
    definition: 'Needle & Syringe exchange',
  ),

  /// Non-residential alcohol and/or drug dependence treatment
  nonResidentialAlcoholDrugTreatment(
    code: '108',
    display: 'Non-resid. Alcohol/Drug Treatment',
    definition: 'Non-residential alcohol and/or drug dependence treatment',
  ),

  /// Pharmacotherapy (eg. methadone) program
  pharmacotherapyProgram(
    code: '109',
    display: 'Pharmacotherapy',
    definition: 'Pharmacotherapy (eg. methadone) program',
  ),

  /// Quit program
  quitProgram(
    code: '110',
    display: 'Quit Program',
    definition: 'Quit program',
  ),

  /// Residential alcohol and/or drug dependence treatment
  residentialAlcoholDrugTreatment(
    code: '111',
    display: 'Residential Alcohol/Drug Treatment',
    definition: 'Residential alcohol and/or drug dependence treatment',
  ),

  /// Adult/community education
  adultCommunityEducation(
    code: '112',
    display: 'Adult/Community Education',
    definition: 'Adult/community education',
  ),

  /// Higher education
  higherEducation(
    code: '113',
    display: 'Higher Education',
    definition: 'Higher education',
  ),

  /// Primary education
  primaryEducation(
    code: '114',
    display: 'Primary Education',
    definition: 'Primary education',
  ),

  /// Secondary education
  secondaryEducation(
    code: '115',
    display: 'Secondary Education',
    definition: 'Secondary education',
  ),

  /// Training & vocational education
  trainingVocationalEducation(
    code: '116',
    display: 'Training & Vocational Education',
    definition: 'Training & vocational education',
  ),

  /// Emergency medical
  emergencyMedical(
    code: '117',
    display: 'Emergency Medical',
    definition: 'Emergency medical',
  ),

  /// Employment placement and/or support
  employmentPlacementSupport(
    code: '118',
    display: 'Employment Placement and/or Support',
    definition: 'Employment placement and/or support',
  ),

  /// Vocational Rehabilitation
  vocationalRehabilitation(
    code: '119',
    display: 'Vocational Rehabilitation',
    definition: 'Vocational Rehabilitation',
  ),

  /// Workplace safety and/or accident prevention
  workplaceSafetyAccidentPrevention(
    code: '120',
    display: 'Work Safety/Accident Prevention',
    definition: 'Workplace safety and/or accident prevention',
  ),

  /// Financial assistance
  financialAssistance(
    code: '121',
    display: 'Financial Assistance',
    definition: 'Financial assistance',
  ),

  /// Financial information/advice
  financialInformationAdvice(
    code: '122',
    display: 'Financial Information/Advice',
    definition: 'Financial information/advice',
  ),

  /// Material aid
  materialAid(
    code: '123',
    display: 'Material Aid',
    definition: 'Material aid',
  ),

  /// General Practice/GP (doctor)
  generalPracticeGP(
    code: '124',
    display: 'General Practice',
    definition: 'General Practice/GP (doctor)',
  ),

  /// Accommodation placement and/or support
  accommodationPlacementSupport(
    code: '125',
    display: 'Accommodation Placement/Support',
    definition: 'Accommodation placement and/or support',
  ),

  /// Crisis/emergency accommodation
  crisisEmergencyAccommodation(
    code: '126',
    display: 'Crisis/Emergency Accommodation',
    definition: 'Crisis/emergency accommodation',
  ),

  /// Homelessness support
  homelessnessSupport(
    code: '127',
    display: 'Homelessness Support',
    definition: 'Homelessness support',
  ),

  /// Housing information/referral
  housingInformationReferral(
    code: '128',
    display: 'Housing Information/Referral',
    definition: 'Housing information/referral',
  ),

  /// Public rental housing
  publicRentalHousing(
    code: '129',
    display: 'Public Rental Housing',
    definition: 'Public rental housing',
  ),

  /// Interpreting/Multilingual/Language service
  interpretingMultilingualLanguageService(
    code: '130',
    display: 'Interpreting/Multilingual Service',
    definition: 'Interpreting/Multilingual/Language service',
  ),

  /// Juvenile Justice
  juvenileJustice(
    code: '131',
    display: 'Juvenile Justice',
    definition: 'Juvenile Justice',
  ),

  /// Legal advocacy
  legalAdvocacy(
    code: '132',
    display: 'Legal Advocacy',
    definition: 'Legal advocacy',
  ),

  /// Legal information/advice/referral
  legalInformationAdviceReferral(
    code: '133',
    display: 'Legal Information/Advice/Referral',
    definition: 'Legal information/advice/referral',
  ),

  /// Mental health advocacy
  mentalHealthAdvocacy(
    code: '134',
    display: 'Mental Health Advocacy',
    definition: 'Mental health advocacy',
  ),

  /// Mental health assessment/triage/crisis response
  mentalHealthAssessmentTriageCrisisResponse(
    code: '135',
    display: 'Mental Health Assess/Triage/Crisis Response',
    definition: 'Mental health assessment/triage/crisis response',
  ),

  /// Mental health case management/continuing care
  mentalHealthCaseManagementContinuingCare(
    code: '136',
    display: 'Mental Health Case Management',
    definition: 'Mental health case management/continuing care',
  ),

  /// Mental health information/referral
  mentalHealthInformationReferral(
    code: '137',
    display: 'Mental Health Information/Referral',
    definition: 'Mental health information/referral',
  ),

  /// Mental health inpatient services (hospital psychiatric unit) - requires referral
  mentalHealthInpatientServices(
    code: '138',
    display: 'Mental Health Inpatient Services',
    definition:
        'Mental health inpatient services (hospital psychiatric unit) - requires referral',
  ),

  /// Mental health non-residential rehabilitation
  mentalHealthNonResidentialRehabilitation(
    code: '139',
    display: 'Mental Health Non-residential Rehab',
    definition: 'Mental health non-residential rehabilitation',
  ),

  /// Mental health residential rehabilitation/community care unit
  mentalHealthResidentialRehabilitationCommunityCareUnit(
    code: '140',
    display: 'Mental Health Residential Rehab/CCU',
    definition: 'Mental health residential rehabilitation/community care unit',
  ),

  /// Psychiatry (requires referral)
  psychiatryRequiresReferral(
    code: '141',
    display: 'Psychiatry (Requires Referral)',
    definition: 'Psychiatry (requires referral)',
  ),

  /// Psychology
  psychology(
    code: '142',
    display: 'Psychology',
    definition: 'Psychology',
  ),

  /// Martial arts
  martialArts(
    code: '143',
    display: 'Martial Arts',
    definition: 'Martial arts',
  ),

  /// Personal fitness training
  personalFitnessTraining(
    code: '144',
    display: 'Personal Fitness Training',
    definition: 'Personal fitness training',
  ),

  /// Physical activity group
  physicalActivityGroup(
    code: '145',
    display: 'Physical Activity Group',
    definition: 'Physical activity group',
  ),

  /// Physical activity programs
  physicalActivityPrograms(
    code: '146',
    display: 'Physical Activity Programs',
    definition: 'Physical activity programs',
  ),

  /// Physical fitness testing
  physicalFitnessTesting(
    code: '147',
    display: 'Physical Fitness Testing',
    definition: 'Physical fitness testing',
  ),

  /// Pilates
  pilates(
    code: '148',
    display: 'Pilates',
    definition: 'Pilates',
  ),

  /// Self defence
  selfDefence(
    code: '149',
    display: 'Self-Defence',
    definition: 'Self defence',
  ),

  /// Sporting club
  sportingClub(
    code: '150',
    display: 'Sporting Club',
    definition: 'Sporting club',
  ),

  /// Yoga
  yoga(
    code: '151',
    display: 'Yoga',
    definition: 'Yoga',
  ),

  /// Food safety
  foodSafety(
    code: '152',
    display: 'Food Safety',
    definition: 'Food safety',
  ),

  /// Health regulatory, inspection and/or certification
  healthRegulatoryInspectionCertification(
    code: '153',
    display: 'Health Regulatory /Inspection /Cert.',
    definition: 'Health regulatory, inspection and/or certification',
  ),

  /// Workplace health and/or safety inspection and/or certification
  workplaceHealthSafetyInspectionCertification(
    code: '154',
    display: 'Work Health/Safety Inspection/Cert.',
    definition:
        'Workplace health and/or safety inspection and/or certification',
  ),

  /// Carer support
  carerSupport(
    code: '155',
    display: 'Carer Support',
    definition: 'Carer support',
  ),

  /// Respite care
  respiteCare(
    code: '156',
    display: 'Respite Care',
    definition: 'Respite care',
  ),

  /// Anatomical Pathology (including Cytopathology & Forensic Pathology)
  anatomicalPathology(
    code: '157',
    display: 'Anatomical Pathology',
    definition:
        'Anatomical Pathology (including Cytopathology & Forensic Pathology)',
  ),

  /// Pathology - Clinical Chemistry
  pathologyClinicalChemistry(
    code: '158',
    display: 'Pathology - Clinical Chemistry',
    definition: 'Pathology - Clinical Chemistry',
  ),

  /// Pathology - General
  pathologyGeneral(
    code: '159',
    display: 'Pathology - General',
    definition: 'Pathology - General',
  ),

  /// Pathology - Genetics
  pathologyGenetics(
    code: '160',
    display: 'Pathology - Genetics',
    definition: 'Pathology - Genetics',
  ),

  /// Pathology - Haematology
  pathologyHaematology(
    code: '161',
    display: 'Pathology - Haematology',
    definition: 'Pathology - Haematology',
  ),

  /// Pathology - Immunology
  pathologyImmunology(
    code: '162',
    display: 'Pathology - Immunology',
    definition: 'Pathology - Immunology',
  ),

  /// Pathology - Microbiology
  pathologyMicrobiology(
    code: '163',
    display: 'Pathology - Microbiology',
    definition: 'Pathology - Microbiology',
  ),

  /// Anaesthesiology - Pain Medicine
  anaesthesiologyPainMedicine(
    code: '164',
    display: 'Anaesthesiology - Pain Medicine',
    definition: 'Anaesthesiology - Pain Medicine',
  ),

  /// Cardiology
  cardiology(
    code: '165',
    display: 'Cardiology',
    definition: 'Cardiology',
  ),

  /// Clinical Genetics
  clinicalGenetics(
    code: '166',
    display: 'Clinical Genetics',
    definition: 'Clinical Genetics',
  ),

  /// Clinical Pharmacology
  clinicalPharmacology(
    code: '167',
    display: 'Clinical Pharmacology',
    definition: 'Clinical Pharmacology',
  ),

  /// Dermatology
  dermatology(
    code: '168',
    display: 'Dermatology',
    definition: 'Dermatology',
  ),

  /// Endocrinology
  endocrinology(
    code: '169',
    display: 'Endocrinology',
    definition: 'Endocrinology',
  ),

  /// Gastroenterology & Hepatology
  gastroenterologyHepatology(
    code: '170',
    display: 'Gastroenterology & Hepatology',
    definition: 'Gastroenterology & Hepatology',
  ),

  /// Geriatric medicine
  geriatricMedicine(
    code: '171',
    display: 'Geriatric Medicine',
    definition: 'Geriatric medicine',
  ),

  /// Immunology & Allergy
  immunologyAllergy(
    code: '172',
    display: 'Immunology & Allergy',
    definition: 'Immunology & Allergy',
  ),

  /// Infectious diseases
  infectiousDiseases(
    code: '173',
    display: 'Infectious Diseases',
    definition: 'Infectious diseases',
  ),

  /// Intensive care medicine
  intensiveCareMedicine(
    code: '174',
    display: 'Intensive Care Medicine',
    definition: 'Intensive care medicine',
  ),

  /// Medical Oncology
  medicalOncology(
    code: '175',
    display: 'Medical Oncology',
    definition: 'Medical Oncology',
  ),

  /// Nephrology
  nephrology(
    code: '176',
    display: 'Nephrology',
    definition: 'Nephrology',
  ),

  /// Neurology
  neurology(
    code: '177',
    display: 'Neurology',
    definition: 'Neurology',
  ),

  /// Occupational Medicine
  occupationalMedicine(
    code: '178',
    display: 'Occupational Medicine',
    definition: 'Occupational Medicine',
  ),

  /// Palliative Medicine
  palliativeMedicine(
    code: '179',
    display: 'Palliative Medicine',
    definition: 'Palliative Medicine',
  ),

  /// Public Health Medicine
  publicHealthMedicine(
    code: '180',
    display: 'Public Health Medicine',
    definition: 'Public Health Medicine',
  ),

  /// Rehabilitation Medicine
  rehabilitationMedicine(
    code: '181',
    display: 'Rehabilitation Medicine',
    definition: 'Rehabilitation Medicine',
  ),

  /// Rheumatology
  rheumatology(
    code: '182',
    display: 'Rheumatology',
    definition: 'Rheumatology',
  ),

  /// Sleep Medicine
  sleepMedicine(
    code: '183',
    display: 'Sleep Medicine',
    definition: 'Sleep Medicine',
  ),

  /// Thoracic medicine
  thoracicMedicine(
    code: '184',
    display: 'Thoracic Medicine',
    definition: 'Thoracic medicine',
  ),

  /// Gynaecological Oncology
  gynaecologicalOncology(
    code: '185',
    display: 'Gynaecological Oncology',
    definition: 'Gynaecological Oncology',
  ),

  /// Obstetrics & Gynaecology
  obstetricsGynaecology(
    code: '186',
    display: 'Obstetrics & Gynaecology',
    definition: 'Obstetrics & Gynaecology',
  ),

  /// Reproductive Endocrinology & Infertility
  reproductiveEndocrinologyInfertility(
    code: '187',
    display: 'Reproductive Endocrinology/Infertility',
    definition: 'Reproductive Endocrinology & Infertility',
  ),

  /// Urogynaecology
  urogynaecology(
    code: '188',
    display: 'Urogynaecology',
    definition: 'Urogynaecology',
  ),

  /// Neonatology & Perinatology
  neonatologyPerinatology(
    code: '189',
    display: 'Neonatology & Perinatology',
    definition: 'Neonatology & Perinatology',
  ),

  /// Paediatric Cardiology
  paediatricCardiology(
    code: '190',
    display: 'Paediatric Cardiology',
    definition: 'Paediatric Cardiology',
  ),

  /// Paediatric Clinical Genetics
  paediatricClinicalGenetics(
    code: '191',
    display: 'Paediatric Clinical Genetics',
    definition: 'Paediatric Clinical Genetics',
  ),

  /// Paediatric Clinical Pharmacology
  paediatricClinicalPharmacology(
    code: '192',
    display: 'Paediatric Clinical Pharmacology',
    definition: 'Paediatric Clinical Pharmacology',
  ),

  /// Paediatric Endocrinology
  paediatricEndocrinology(
    code: '193',
    display: 'Paediatric Endocrinology',
    definition: 'Paediatric Endocrinology',
  ),

  /// Paediatric Gastroenterology & Hepatology
  paediatricGastroenterologyHepatology(
    code: '194',
    display: 'Paed. Gastroenterology/Hepatology',
    definition: 'Paediatric Gastroenterology & Hepatology',
  ),

  /// Paediatric Haematology
  paediatricHaematology(
    code: '195',
    display: 'Paediatric Haematology',
    definition: 'Paediatric Haematology',
  ),

  /// Paediatric Immunology & Allergy
  paediatricImmunologyAllergy(
    code: '196',
    display: 'Paediatric Immunology & Allergy',
    definition: 'Paediatric Immunology & Allergy',
  ),

  /// Paediatric Infectious diseases
  paediatricInfectiousDiseases(
    code: '197',
    display: 'Paediatric Infectious Diseases',
    definition: 'Paediatric Infectious diseases',
  ),

  /// Paediatric intensive care medicine
  paediatricIntensiveCareMedicine(
    code: '198',
    display: 'Paediatric Intensive Care Medicine',
    definition: 'Paediatric intensive care medicine',
  ),

  /// Paediatric Medical Oncology
  paediatricMedicalOncology(
    code: '199',
    display: 'Paediatric Medical Oncology',
    definition: 'Paediatric Medical Oncology',
  ),

  /// Paediatric Medicine
  paediatricMedicine(
    code: '200',
    display: 'Paediatric Medicine',
    definition: 'Paediatric Medicine',
  ),

  /// Paediatric Nephrology
  paediatricNephrology(
    code: '201',
    display: 'Paediatric Nephrology',
    definition: 'Paediatric Nephrology',
  ),

  /// Paediatric Neurology
  paediatricNeurology(
    code: '202',
    display: 'Paediatric Neurology',
    definition: 'Paediatric Neurology',
  ),

  /// Paediatric Nuclear Medicine
  paediatricNuclearMedicine(
    code: '203',
    display: 'Paediatric Nuclear Medicine',
    definition: 'Paediatric Nuclear Medicine',
  ),

  /// Paediatric Rehabilitation Medicine
  paediatricRehabilitationMedicine(
    code: '204',
    display: 'Paediatric Rehabilitation Medicine',
    definition: 'Paediatric Rehabilitation Medicine',
  ),

  /// Paediatric Rheumatology
  paediatricRheumatology(
    code: '205',
    display: 'Paediatric Rheumatology',
    definition: 'Paediatric Rheumatology',
  ),

  /// Paediatric Sleep Medicine
  paediatricSleepMedicine(
    code: '206',
    display: 'Paediatric Sleep Medicine',
    definition: 'Paediatric Sleep Medicine',
  ),

  /// Paediatric Surgery
  paediatricSurgery(
    code: '207',
    display: 'Paediatric Surgery',
    definition: 'Paediatric Surgery',
  ),

  /// Paediatric Thoracic Medicine
  paediatricThoracicMedicine(
    code: '208',
    display: 'Paediatric Thoracic Medicine',
    definition: 'Paediatric Thoracic Medicine',
  ),

  /// Diagnostic Radiology/Xray/CT/Fluoroscopy
  diagnosticRadiologyXrayCTFluoroscopy(
    code: '209',
    display: 'Diag. Radiology /Xray /CT /Fluoroscopy',
    definition: 'Diagnostic Radiology/Xray/CT/Fluoroscopy',
  ),

  /// Diagnostic Ultrasound
  diagnosticUltrasound(
    code: '210',
    display: 'Diagnostic Ultrasound',
    definition: 'Diagnostic Ultrasound',
  ),

  /// Magnetic Resonance Imaging (MRI)
  magneticResonanceImagingMRI(
    code: '211',
    display: 'Magnetic Resonance Imaging (MRI)',
    definition: 'Magnetic Resonance Imaging (MRI)',
  ),

  /// Nuclear Medicine
  nuclearMedicine(
    code: '212',
    display: 'Nuclear Medicine',
    definition: 'Nuclear Medicine',
  ),

  /// Obstetric & Gynaecological Ultrasound
  obstetricGynaecologicalUltrasound(
    code: '213',
    display: 'Obstetric/Gynaecological Ultrasound',
    definition: 'Obstetric & Gynaecological Ultrasound',
  ),

  /// Radiation oncology
  radiationOncology(
    code: '214',
    display: 'Radiation Oncology',
    definition: 'Radiation oncology',
  ),

  /// Cardiothoracic surgery
  cardiothoracicSurgery(
    code: '215',
    display: 'Cardiothoracic Surgery',
    definition: 'Cardiothoracic surgery',
  ),

  /// Neurosurgery
  neurosurgery(
    code: '216',
    display: 'Neurosurgery',
    definition: 'Neurosurgery',
  ),

  /// Ophthalmology
  ophthalmology(
    code: '217',
    display: 'Ophthalmology',
    definition: 'Ophthalmology',
  ),

  /// Orthopaedic surgery
  orthopaedicSurgery(
    code: '218',
    display: 'Orthopaedic Surgery',
    definition: 'Orthopaedic surgery',
  ),

  /// Otolaryngology - Head & Neck Surgery
  otolaryngologyHeadNeckSurgery(
    code: '219',
    display: 'Otolaryngology/Head & Neck Surgery',
    definition: 'Otolaryngology - Head & Neck Surgery',
  ),

  /// Plastic & Reconstructive Surgery
  plasticReconstructiveSurgery(
    code: '220',
    display: 'Plastic & Reconstructive Surgery',
    definition: 'Plastic & Reconstructive Surgery',
  ),

  /// Surgery - General
  surgeryGeneral(
    code: '221',
    display: 'Surgery - General',
    definition: 'Surgery - General',
  ),

  /// Urology
  urology(
    code: '222',
    display: 'Urology',
    definition: 'Urology',
  ),

  /// Vascular surgery
  vascularSurgery(
    code: '223',
    display: 'Vascular Surgery',
    definition: 'Vascular surgery',
  ),

  /// Support groups
  supportGroups(
    code: '224',
    display: 'Support Groups',
    definition: 'Support groups',
  ),

  /// Air ambulance
  airAmbulance(
    code: '225',
    display: 'Air ambulance',
    definition: 'Air ambulance',
  ),

  /// Ambulance
  ambulance(
    code: '226',
    display: 'Ambulance',
    definition: 'Ambulance',
  ),

  /// Blood transport
  bloodTransport(
    code: '227',
    display: 'Blood Transport',
    definition: 'Blood transport',
  ),

  /// Community bus
  communityBus(
    code: '228',
    display: 'Community Bus',
    definition: 'Community bus',
  ),

  /// Flying doctor service
  flyingDoctorService(
    code: '229',
    display: 'Flying Doctor Service',
    definition: 'Flying doctor service',
  ),

  /// Patient transport
  patientTransport(
    code: '230',
    display: 'Patient Transport',
    definition: 'Patient transport',
  ),

  /// A&E
  aAndE(
    code: '231',
    display: 'A&E',
    definition: 'A&E',
  ),

  /// A&EP
  aAndEP(
    code: '232',
    display: 'A&EP',
    definition: 'A&EP',
  ),

  /// Abuse
  abuse(
    code: '233',
    display: 'Abuse',
    definition: 'Abuse',
  ),

  /// ACAS
  acas(
    code: '234',
    display: 'ACAS',
    definition: 'ACAS',
  ),

  /// Access
  access(
    code: '235',
    display: 'Access',
    definition: 'Access',
  ),

  /// Accident
  accident(
    code: '236',
    display: 'Accident',
    definition: 'Accident',
  ),

  /// Acute Inpatient Service's
  acuteInpatientServices(
    code: '237',
    display: 'Acute Inpatient Serv',
    definition: "Acute Inpatient Service's",
  ),

  /// Adult Day Programs
  adultDayPrograms(
    code: '238',
    display: 'Adult Day Programs',
    definition: 'Adult Day Programs',
  ),

  /// Adult Mental Health Services
  adultMentalHealthServices(
    code: '239',
    display: 'Adult Mental Health Services',
    definition: 'Adult Mental Health Services',
  ),

  /// Advice
  advice(
    code: '240',
    display: 'Advice',
    definition: 'Advice',
  ),

  /// Advocacy
  advocacy(
    code: '241',
    display: 'Advocacy',
    definition: 'Advocacy',
  ),

  /// Aged Persons Mental Health Residential Units
  agedPersonsMentalHealthResidentialUnits(
    code: '242',
    display: 'Aged Persons Mental',
    definition: 'Aged Persons Mental Health Residential Units',
  ),

  /// Aged Persons Mental Health Services
  agedPersonsMentalHealthServices(
    code: '243',
    display: 'Aged Persons Mental',
    definition: 'Aged Persons Mental Health Services',
  ),

  /// Aged Persons Mental Health Teams
  agedPersonsMentalHealthTeams(
    code: '244',
    display: 'Aged Persons Mental',
    definition: 'Aged Persons Mental Health Teams',
  ),

  /// Aids
  aids(
    code: '245',
    display: 'Aids',
    definition: 'Aids',
  ),

  /// Al-Anon
  alAnon(
    code: '246',
    display: 'Al-Anon',
    definition: 'Al-Anon',
  ),

  /// Alcohol
  alcohol(
    code: '247',
    display: 'Alcohol',
    definition: 'Alcohol',
  ),

  /// Al-Teen
  alTeen(
    code: '248',
    display: 'Al-Teen',
    definition: 'Al-Teen',
  ),

  /// Antenatal
  antenatal(
    code: '249',
    display: 'Antenatal',
    definition: 'Antenatal',
  ),

  /// Anxiety
  anxiety(
    code: '250',
    display: 'Anxiety',
    definition: 'Anxiety',
  ),

  /// Arthritis
  arthritis(
    code: '251',
    display: 'Arthritis',
    definition: 'Arthritis',
  ),

  /// Assessment
  assessment(
    code: '252',
    display: 'Assessment',
    definition: 'Assessment',
  ),

  /// Assistance
  assistance(
    code: '253',
    display: 'Assistance',
    definition: 'Assistance',
  ),

  /// Asthma
  asthma(
    code: '254',
    display: 'Asthma',
    definition: 'Asthma',
  ),

  /// ATSS
  atss(
    code: '255',
    display: 'ATSS',
    definition: 'ATSS',
  ),

  /// Attendant Care
  attendantCare(
    code: '256',
    display: 'Attendant Care',
    definition: 'Attendant Care',
  ),

  /// Babies
  babies(
    code: '257',
    display: 'Babies',
    definition: 'Babies',
  ),

  /// Bathroom Modification
  bathroomModification(
    code: '258',
    display: 'Bathroom Modificatio',
    definition: 'Bathroom Modification',
  ),

  /// Behavior
  behavior(
    code: '259',
    display: 'Behavior',
    definition: 'Behavior',
  ),

  /// Behavior Intervention
  behaviorIntervention(
    code: '260',
    display: 'Behavior Interventi',
    definition: 'Behavior Intervention',
  ),

  /// Bereavement
  bereavement(
    code: '261',
    display: 'Bereavement',
    definition: 'Bereavement',
  ),

  /// Bipolar
  bipolar(
    code: '262',
    display: 'Bipolar',
    definition: 'Bipolar',
  ),

  /// Birth
  birth(
    code: '263',
    display: 'Birth',
    definition: 'Birth',
  ),

  /// Birth Control
  birthControl(
    code: '264',
    display: 'Birth Control',
    definition: 'Birth Control',
  ),

  /// Birthing Options
  birthingOptions(
    code: '265',
    display: 'Birthing Options',
    definition: 'Birthing Options',
  ),

  /// BIST
  bist(
    code: '266',
    display: 'BIST',
    definition: 'BIST',
  ),

  /// Blood
  blood(
    code: '267',
    display: 'Blood',
    definition: 'Blood',
  ),

  /// Bone
  bone(
    code: '268',
    display: 'Bone',
    definition: 'Bone',
  ),

  /// Bowel
  bowel(
    code: '269',
    display: 'Bowel',
    definition: 'Bowel',
  ),

  /// Brain
  brain(
    code: '270',
    display: 'Brain',
    definition: 'Brain',
  ),

  /// Breast Feeding
  breastFeeding(
    code: '271',
    display: 'Breast Feeding',
    definition: 'Breast Feeding',
  ),

  /// Breast Screen
  breastScreen(
    code: '272',
    display: 'Breast Screen',
    definition: 'Breast Screen',
  ),

  /// Brokerage
  brokerage(
    code: '273',
    display: 'Brokerage',
    definition: 'Brokerage',
  ),

  /// Cancer
  cancer(
    code: '274',
    display: 'Cancer',
    definition: 'Cancer',
  ),

  /// Cancer Support
  cancerSupport(
    code: '275',
    display: 'Cancer Support',
    definition: 'Cancer Support',
  ),

  /// Cardiovascular Disease
  cardiovascularDisease(
    code: '276',
    display: 'Cardiovascular Disea',
    definition: 'Cardiovascular Disease',
  ),

  /// Care Packages
  carePackages(
    code: '277',
    display: 'Care Packages',
    definition: 'Care Packages',
  ),

  /// Carer
  carer(
    code: '278',
    display: 'Carer',
    definition: 'Carer',
  ),

  /// Case Management
  caseManagement(
    code: '279',
    display: 'Case',
    definition: 'Case Management',
  ),

  /// Casualty
  casualty(
    code: '280',
    display: 'Casualty',
    definition: 'Casualty',
  ),

  /// Centrelink
  centrelink(
    code: '281',
    display: 'Centrelink',
    definition: 'Centrelink',
  ),

  /// Chemists
  chemists(
    code: '282',
    display: 'Chemists',
    definition: 'Chemists',
  ),

  /// Child And Adolescent Mental Health Services
  childAndAdolescentMentalHealthServices(
    code: '283',
    display: 'Child And Adolescent',
    definition: 'Child And Adolescent Mental Health Services',
  ),

  /// Child Care
  childCare(
    code: '284',
    display: 'Child Care',
    definition: 'Child Care',
  ),

  /// Child Services
  childServices(
    code: '285',
    display: 'Child Services',
    definition: 'Child Services',
  ),

  /// Children
  children(
    code: '286',
    display: 'Children',
    definition: 'Children',
  ),

  /// Children's Services
  childrensServices(
    code: '287',
    display: "Children's Services",
    definition: "Children's Services",
  ),

  /// Cholesterol
  cholesterol(
    code: '288',
    display: 'Cholesterol',
    definition: 'Cholesterol',
  ),

  /// Clothing
  clothing(
    code: '289',
    display: 'Clothing',
    definition: 'Clothing',
  ),

  /// Community Based Accommodation
  communityBasedAccommodation(
    code: '290',
    display: 'Community Based Acco',
    definition: 'Community Based Accommodation',
  ),

  /// Community Care Unit
  communityCareUnit(
    code: '291',
    display: 'Community Care Unit',
    definition: 'Community Care Unit',
  ),

  /// Community Child And Adolescent Mental Health Services
  communityChildAndAdolescentMentalHealthServices(
    code: '292',
    display: 'Community Child And',
    definition: 'Community Child And Adolescent Mental Health Services',
  ),

  /// Community Health
  communityHealth(
    code: '293',
    display: 'Community Health',
    definition: 'Community Health',
  ),

  /// Community Residential Unit
  communityResidentialUnit(
    code: '294',
    display: 'Community Residentia',
    definition: 'Community Residential Unit',
  ),

  /// Community Transport
  communityTransport(
    code: '295',
    display: 'Community Transport',
    definition: 'Community Transport',
  ),

  /// Companion Visiting
  companionVisiting(
    code: '296',
    display: 'Companion Visiting',
    definition: 'Companion Visiting',
  ),

  /// Companionship
  companionship(
    code: '297',
    display: 'Companionship',
    definition: 'Companionship',
  ),

  /// Consumer Advice
  consumerAdvice(
    code: '298',
    display: 'Consumer Advice',
    definition: 'Consumer Advice',
  ),

  /// Consumer Issues
  consumerIssues(
    code: '299',
    display: 'Consumer Issues',
    definition: 'Consumer Issues',
  ),

  /// Continuing Care Services
  continuingCareServices(
    code: '300',
    display: 'Continuing Care Serv',
    definition: 'Continuing Care Services',
  ),

  /// Contraception Information
  contraceptionInformation(
    code: '301',
    display: 'Contraception Inform',
    definition: 'Contraception Information',
  ),

  /// Coordinating Bodies
  coordinatingBodies(
    code: '302',
    display: 'Coordinating Bodies',
    definition: 'Coordinating Bodies',
  ),

  /// Correctional Services
  correctionalServices(
    code: '303',
    display: 'Correctional Service',
    definition: 'Correctional Services',
  ),

  /// Council Environmental Health
  councilEnvironmentalHealth(
    code: '304',
    display: 'Council Environmenta',
    definition: 'Council Environmental Health',
  ),

  /// Counselling
  counselling(
    code: '305',
    display: 'Counselling',
    definition: 'Counselling',
  ),

  /// Criminal
  criminal(
    code: '306',
    display: 'Criminal',
    definition: 'Criminal',
  ),

  /// Crises
  crises(
    code: '307',
    display: 'Crises',
    definition: 'Crises',
  ),

  /// Crisis Assessment And Treatment Services (Cats)
  crisisAssessmentAndTreatmentServicesCats(
    code: '308',
    display: 'Crisis Assessment An',
    definition: 'Crisis Assessment And Treatment Services (Cats)',
  ),

  /// Crisis Assistance
  crisisAssistance(
    code: '309',
    display: 'Crisis Assistance',
    definition: 'Crisis Assistance',
  ),

  /// Crisis Refuge
  crisisRefuge(
    code: '310',
    display: 'Crisis Refuge',
    definition: 'Crisis Refuge',
  ),

  /// Day Program
  dayProgram(
    code: '311',
    display: 'Day Program',
    definition: 'Day Program',
  ),

  /// Deaf
  deaf(
    code: '312',
    display: 'Deaf',
    definition: 'Deaf',
  ),

  /// Dental Hygiene
  dentalHygiene(
    code: '313',
    display: 'Dental Hygiene',
    definition: 'Dental Hygiene',
  ),

  /// Dentistry
  dentistry(
    code: '314',
    display: 'Dentistry',
    definition: 'Dentistry',
  ),

  /// Dentures
  dentures(
    code: '315',
    display: 'Dentures',
    definition: 'Dentures',
  ),

  /// Depression
  depression(
    code: '316',
    display: 'Depression',
    definition: 'Depression',
  ),

  /// Detoxification
  detoxification(
    code: '317',
    display: 'Detoxification',
    definition: 'Detoxification',
  ),

  /// Diabetes
  diabetes(
    code: '318',
    display: 'Diabetes',
    definition: 'Diabetes',
  ),

  /// Diaphragm Fitting
  diaphragmFitting(
    code: '319',
    display: 'Diaphragm Fitting',
    definition: 'Diaphragm Fitting',
  ),

  /// Dieticians
  dieticians(
    code: '320',
    display: 'Dieticians',
    definition: 'Dieticians',
  ),

  /// Disabled Parking
  disabledParking(
    code: '321',
    display: 'Disabled Parking',
    definition: 'Disabled Parking',
  ),

  /// District Nursing
  districtNursing(
    code: '322',
    display: 'District Nursing',
    definition: 'District Nursing',
  ),

  /// Divorce
  divorce(
    code: '323',
    display: 'Divorce',
    definition: 'Divorce',
  ),

  /// Doctors
  doctors(
    code: '324',
    display: 'Doctors',
    definition: 'Doctors',
  ),

  /// Drink-Drive
  drinkDrive(
    code: '325',
    display: 'Drink-Drive',
    definition: 'Drink-Drive',
  ),

  /// Dual Diagnosis Services
  dualDiagnosisServices(
    code: '326',
    display: 'Dual Diagnosis Servi',
    definition: 'Dual Diagnosis Services',
  ),

  /// Early Choice
  earlyChoice(
    code: '327',
    display: 'Early Choice',
    definition: 'Early Choice',
  ),

  /// Eating Disorder
  eatingDisorder(
    code: '328',
    display: 'Eating Disorder',
    definition: 'Eating Disorder',
  ),

  /// Emergency Relief
  emergencyRelief(
    code: '330',
    display: 'Emergency Relief',
    definition: 'Emergency Relief',
  ),

  /// Employment And Training
  employmentAndTraining(
    code: '331',
    display: 'Employment And Train',
    definition: 'Employment And Training',
  ),

  /// Environment
  environment(
    code: '332',
    display: 'Environment',
    definition: 'Environment',
  ),

  /// Equipment
  equipment(
    code: '333',
    display: 'Equipment',
    definition: 'Equipment',
  ),

  /// Exercise
  exercise(
    code: '334',
    display: 'Exercise',
    definition: 'Exercise',
  ),

  /// Facility
  facility(
    code: '335',
    display: 'Facility',
    definition: 'Facility',
  ),

  /// Family Choice
  familyChoice(
    code: '336',
    display: 'Family Choice',
    definition: 'Family Choice',
  ),

  /// Family Law
  familyLaw(
    code: '337',
    display: 'Family Law',
    definition: 'Family Law',
  ),

  /// Family Options
  familyOptions(
    code: '338',
    display: 'Family Options',
    definition: 'Family Options',
  ),

  /// Family Services
  familyServices(
    code: '339',
    display: 'Family Services',
    definition: 'Family Services',
  ),

  /// FFYA
  ffya(
    code: '340',
    display: 'FFYA',
    definition: 'FFYA',
  ),

  /// Financial Aid
  financialAid(
    code: '341',
    display: 'Financial Aid',
    definition: 'Financial Aid',
  ),

  /// Fitness
  fitness(
    code: '342',
    display: 'Fitness',
    definition: 'Fitness',
  ),

  /// Flexible Care Packages
  flexibleCarePackages(
    code: '343',
    display: 'Flexible Care Packag',
    definition: 'Flexible Care Packages',
  ),

  /// Food
  food(
    code: '344',
    display: 'Food',
    definition: 'Food',
  ),

  /// Food Vouchers
  foodVouchers(
    code: '345',
    display: 'Food Vouchers',
    definition: 'Food Vouchers',
  ),

  /// Forensic Mental Health Services
  forensicMentalHealthServices(
    code: '346',
    display: 'Forensic Mental Heal',
    definition: 'Forensic Mental Health Services',
  ),

  /// Futures
  futures(
    code: '347',
    display: 'Futures',
    definition: 'Futures',
  ),

  /// Futures For Young Adults
  futuresForYoungAdults(
    code: '348',
    display: 'Futures For Young Ad',
    definition: 'Futures For Young Adults',
  ),

  /// General Practitioners
  generalPractitioners(
    code: '349',
    display: 'General Practitioner',
    definition: 'General Practitioners',
  ),

  /// Grants
  grants(
    code: '350',
    display: 'Grants',
    definition: 'Grants',
  ),

  /// Grief
  grief(
    code: '351',
    display: 'Grief',
    definition: 'Grief',
  ),

  /// Grief Counselling
  griefCounselling(
    code: '352',
    display: 'Grief Counselling',
    definition: 'Grief Counselling',
  ),

  /// HACC
  hacc(
    code: '353',
    display: 'HACC',
    definition: 'HACC',
  ),

  /// Heart Disease
  heartDisease(
    code: '354',
    display: 'Heart Disease',
    definition: 'Heart Disease',
  ),

  /// Help
  help(
    code: '355',
    display: 'Help',
    definition: 'Help',
  ),

  /// High Blood Pressure
  highBloodPressure(
    code: '356',
    display: 'High Blood Pressure',
    definition: 'High Blood Pressure',
  ),

  /// Home Help
  homeHelp(
    code: '357',
    display: 'Home Help',
    definition: 'Home Help',
  ),

  /// Home Nursing
  homeNursing(
    code: '358',
    display: 'Home Nursing',
    definition: 'Home Nursing',
  ),

  /// Homefirst
  homefirst(
    code: '359',
    display: 'Homefirst',
    definition: 'Homefirst',
  ),

  /// Hospice Care
  hospiceCare(
    code: '360',
    display: 'Hospice Care',
    definition: 'Hospice Care',
  ),

  /// Hospital Services
  hospitalServices(
    code: '361',
    display: 'Hospital Services',
    definition: 'Hospital Services',
  ),

  /// Hospital To Home
  hospitalToHome(
    code: '362',
    display: 'Hospital To Home',
    definition: 'Hospital To Home',
  ),

  /// Hostel
  hostel(
    code: '364',
    display: 'Hostel',
    definition: 'Hostel',
  ),

  /// Hostel Accommodation
  hostelAccommodation(
    code: '365',
    display: 'Hostel Accommodation',
    definition: 'Hostel Accommodation',
  ),

  /// Household Items
  householdItems(
    code: '366',
    display: 'Household Items',
    definition: 'Household Items',
  ),

  /// Hypertension
  hypertension(
    code: '367',
    display: 'Hypertension',
    definition: 'Hypertension',
  ),

  /// Illness
  illness(
    code: '368',
    display: 'Illness',
    definition: 'Illness',
  ),

  /// Independent Living
  independentLiving(
    code: '369',
    display: 'Independent Living',
    definition: 'Independent Living',
  ),

  /// Information
  information(
    code: '370',
    display: 'Information',
    definition: 'Information',
  ),

  /// Injury
  injury(
    code: '371',
    display: 'Injury',
    definition: 'Injury',
  ),

  /// Intake
  intake(
    code: '372',
    display: 'Intake',
    definition: 'Intake',
  ),

  /// Intensive Mobile Youth Outreach Services (Imyos)
  intensiveMobileYouthOutreachServicesImyos(
    code: '373',
    display: 'Intensive Mobile You',
    definition: 'Intensive Mobile Youth Outreach Services (Imyos)',
  ),

  /// Intervention
  intervention(
    code: '374',
    display: 'Intervention',
    definition: 'Intervention',
  ),

  /// Job Searching
  jobSearching(
    code: '375',
    display: 'Job Searching',
    definition: 'Job Searching',
  ),

  /// Justice
  justice(
    code: '376',
    display: 'Justice',
    definition: 'Justice',
  ),

  /// Leisure
  leisure(
    code: '377',
    display: 'Leisure',
    definition: 'Leisure',
  ),

  /// Loans
  loans(
    code: '378',
    display: 'Loans',
    definition: 'Loans',
  ),

  /// Low Income Earners
  lowIncomeEarners(
    code: '379',
    display: 'Low Income Earners',
    definition: 'Low Income Earners',
  ),

  /// Lung
  lung(
    code: '380',
    display: 'Lung',
    definition: 'Lung',
  ),

  /// Making A Difference
  makingADifference(
    code: '381',
    display: 'Making A Difference',
    definition: 'Making A Difference',
  ),

  /// Medical Services
  medicalServices(
    code: '382',
    display: 'Medical Services',
    definition: 'Medical Services',
  ),

  /// Medical Specialists
  medicalSpecialists(
    code: '383',
    display: 'Medical Specialists',
    definition: 'Medical Specialists',
  ),

  /// Medication Administration
  medicationAdministration(
    code: '384',
    display: 'Medication Administr',
    definition: 'Medication Administration',
  ),

  /// Menstrual Information
  menstrualInformation(
    code: '385',
    display: 'Menstrual Informatio',
    definition: 'Menstrual Information',
  ),

  /// Methadone
  methadone(
    code: '386',
    display: 'Methadone',
    definition: 'Methadone',
  ),

  /// Mobile Support And Treatment Services (MSTS)
  mobileSupportAndTreatmentServicesMSTS(
    code: '387',
    display: 'Mobile Support And T',
    definition: 'Mobile Support And Treatment Services (MSTS)',
  ),

  /// Motor Neurone
  motorNeurone(
    code: '388',
    display: 'Motor Neurone',
    definition: 'Motor Neurone',
  ),

  /// Multiple Sclerosis
  multipleSclerosis(
    code: '389',
    display: 'Multiple Sclerosis',
    definition: 'Multiple Sclerosis',
  ),

  /// Neighbourhood House
  neighbourhoodHouse(
    code: '390',
    display: 'Neighbourhood House',
    definition: 'Neighbourhood House',
  ),

  /// Nursing Home
  nursingHome(
    code: '391',
    display: 'Nursing Home',
    definition: 'Nursing Home',
  ),

  /// Nursing Mothers
  nursingMothers(
    code: '392',
    display: 'Nursing Mothers',
    definition: 'Nursing Mothers',
  ),

  /// Obesity
  obesity(
    code: '393',
    display: 'Obesity',
    definition: 'Obesity',
  ),

  /// Occupational Health & Safety
  occupationalHealthSafety(
    code: '394',
    display: 'Occupational Health',
    definition: 'Occupational Health & Safety',
  ),

  /// Optometrist
  optometrist(
    code: '395',
    display: 'Optometrist',
    definition: 'Optometrist',
  ),

  /// Oral Hygiene
  oralHygiene(
    code: '396',
    display: 'Oral Hygiene',
    definition: 'Oral Hygiene',
  ),

  /// Outpatients
  outpatients(
    code: '397',
    display: 'Outpatients',
    definition: 'Outpatients',
  ),

  /// Outreach Service
  outreachService(
    code: '398',
    display: 'Outreach Service',
    definition: 'Outreach Service',
  ),

  /// PADP
  padp(
    code: '399',
    display: 'PADP',
    definition: 'PADP',
  ),

  /// Pain
  pain(
    code: '400',
    display: 'Pain',
    definition: 'Pain',
  ),

  /// Pap Smear
  papSmear(
    code: '401',
    display: 'Pap Smear',
    definition: 'Pap Smear',
  ),

  /// Parenting
  parenting(
    code: '402',
    display: 'Parenting',
    definition: 'Parenting',
  ),

  /// Peak Organizations
  peakOrganizations(
    code: '403',
    display: 'Peak Organizations',
    definition: 'Peak Organizations',
  ),

  /// Personal Care
  personalCare(
    code: '404',
    display: 'Personal Care',
    definition: 'Personal Care',
  ),

  /// Pharmacies
  pharmacies(
    code: '405',
    display: 'Pharmacies',
    definition: 'Pharmacies',
  ),

  /// Phobias
  phobias(
    code: '406',
    display: 'Phobias',
    definition: 'Phobias',
  ),

  /// Physical
  physical(
    code: '407',
    display: 'Physical',
    definition: 'Physical',
  ),

  /// Physical Activity
  physicalActivity(
    code: '408',
    display: 'Physical Activity',
    definition: 'Physical Activity',
  ),

  /// Postnatal
  postnatal(
    code: '409',
    display: 'Postnatal',
    definition: 'Postnatal',
  ),

  /// Pregnancy
  pregnancy(
    code: '410',
    display: 'Pregnancy',
    definition: 'Pregnancy',
  ),

  /// Pregnancy Tests
  pregnancyTests(
    code: '411',
    display: 'Pregnancy Tests',
    definition: 'Pregnancy Tests',
  ),

  /// Preschool
  preschool(
    code: '412',
    display: 'Preschool',
    definition: 'Preschool',
  ),

  /// Prescriptions
  prescriptions(
    code: '413',
    display: 'Prescriptions',
    definition: 'Prescriptions',
  ),

  /// Primary Mental Health And Early Intervention Teams
  primaryMentalHealthAndEarlyInterventionTeams(
    code: '414',
    display: 'Primary Mental Healt',
    definition: 'Primary Mental Health And Early Intervention Teams',
  ),

  /// Property Maintenance
  propertyMaintenance(
    code: '415',
    display: 'Property Maintenance',
    definition: 'Property Maintenance',
  ),

  /// Prostate
  prostate(
    code: '416',
    display: 'Prostate',
    definition: 'Prostate',
  ),

  /// Psychiatric
  psychiatric(
    code: '417',
    display: 'Psychiatric',
    definition: 'Psychiatric',
  ),

  /// Psychiatric Disability Support Services - Home-Based Outreach
  psychiatricDisabilitySupportServicesHomeBasedOutreach(
    code: '418',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services - Home-Based Outreach',
  ),

  /// Psychiatric Disability Support Services - Planned Respite
  psychiatricDisabilitySupportServicesPlannedRespite(
    code: '419',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services - Planned Respite',
  ),

  /// Psychiatric Disability Support Services - Residential Rehabilitation
  psychiatricDisabilitySupportServicesResidentialRehabilitation(
    code: '420',
    display: 'Psychiatric Disabili',
    definition:
        'Psychiatric Disability Support Services - Residential Rehabilitation',
  ),

  /// Psychiatric Disability Support Services Home-Based Outreach
  psychiatricDisabilitySupportServicesHomeBasedOutreach2(
    code: '421',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services Home-Based Outreach',
  ),

  /// Psychiatric Disability Support Services Mutual Support And Self Help
  psychiatricDisabilitySupportServicesMutualSupportAndSelfHelp(
    code: '422',
    display: 'Psychiatric Disabili',
    definition:
        'Psychiatric Disability Support Services Mutual Support And Self Help',
  ),

  /// Psychiatric Support
  psychiatricSupport(
    code: '423',
    display: 'Psychiatric Support',
    definition: 'Psychiatric Support',
  ),

  /// Recreation
  recreation(
    code: '424',
    display: 'Recreation',
    definition: 'Recreation',
  ),

  /// Referral
  referral(
    code: '425',
    display: 'Referral',
    definition: 'Referral',
  ),

  /// Refuge
  refuge(
    code: '426',
    display: 'Refuge',
    definition: 'Refuge',
  ),

  /// Rent Assistance
  rentAssistance(
    code: '427',
    display: 'Rent Assistance',
    definition: 'Rent Assistance',
  ),

  /// Residential Facilities
  residentialFacilities(
    code: '428',
    display: 'Residential Faciliti',
    definition: 'Residential Facilities',
  ),

  /// Residential Respite
  residentialRespite(
    code: '429',
    display: 'Residential Respite',
    definition: 'Residential Respite',
  ),

  /// Respiratory
  respiratory(
    code: '430',
    display: 'Respiratory',
    definition: 'Respiratory',
  ),

  /// Response
  response(
    code: '431',
    display: 'Response',
    definition: 'Response',
  ),

  /// Rooming Houses
  roomingHouses(
    code: '432',
    display: 'Rooming Houses',
    definition: 'Rooming Houses',
  ),

  /// Safe Sex
  safeSex(
    code: '433',
    display: 'Safe Sex',
    definition: 'Safe Sex',
  ),

  /// Secure Extended Care Inpatient Services
  secureExtendedCareInpatientServices(
    code: '434',
    display: 'Secure Extended Care',
    definition: 'Secure Extended Care Inpatient Services',
  ),

  /// Self Help
  selfHelp(
    code: '435',
    display: 'Self Help',
    definition: 'Self Help',
  ),

  /// Separation
  separation(
    code: '436',
    display: 'Separation',
    definition: 'Separation',
  ),

  /// Services
  services(
    code: '437',
    display: 'Services',
    definition: 'Services',
  ),

  /// Sex Education
  sexEducation(
    code: '438',
    display: 'Sex Education',
    definition: 'Sex Education',
  ),

  /// Sexual Abuse
  sexualAbuse(
    code: '439',
    display: 'Sexual Abuse',
    definition: 'Sexual Abuse',
  ),

  /// Sexual Issues
  sexualIssues(
    code: '440',
    display: 'Sexual Issues',
    definition: 'Sexual Issues',
  ),

  /// Sexually Transmitted Diseases
  sexuallyTransmittedDiseases(
    code: '441',
    display: 'Sexually Transmitted',
    definition: 'Sexually Transmitted Diseases',
  ),

  /// SIDS
  sids(
    code: '442',
    display: 'SIDS',
    definition: 'SIDS',
  ),

  /// Social Support
  socialSupport(
    code: '443',
    display: 'Social Support',
    definition: 'Social Support',
  ),

  /// Socialisation
  socialisation(
    code: '444',
    display: 'Socialisation',
    definition: 'Socialisation',
  ),

  /// Special Needs
  specialNeeds(
    code: '445',
    display: 'Special Needs',
    definition: 'Special Needs',
  ),

  /// Speech Therapist
  speechTherapist(
    code: '446',
    display: 'Speech Therapist',
    definition: 'Speech Therapist',
  ),

  /// Splinting
  splinting(
    code: '447',
    display: 'Splinting',
    definition: 'Splinting',
  ),

  /// Sport
  sport(
    code: '448',
    display: 'Sport',
    definition: 'Sport',
  ),

  /// Statewide And Specialist Services
  statewideAndSpecialistServices(
    code: '449',
    display: 'Statewide And Specia',
    definition: 'Statewide And Specialist Services',
  ),

  /// STD
  std(
    code: '450',
    display: 'STD',
    definition: 'STD',
  ),

  /// STI
  sti(
    code: '451',
    display: 'STI',
    definition: 'STI',
  ),

  /// Stillbirth
  stillbirth(
    code: '452',
    display: 'Stillbirth',
    definition: 'Stillbirth',
  ),

  /// Stomal Care
  stomalCare(
    code: '453',
    display: 'Stomal Care',
    definition: 'Stomal Care',
  ),

  /// Stroke
  stroke(
    code: '454',
    display: 'Stroke',
    definition: 'Stroke',
  ),

  /// Substance Abuse
  substanceAbuse(
    code: '455',
    display: 'Substance Abuse',
    definition: 'Substance Abuse',
  ),

  /// Support
  support(
    code: '456',
    display: 'Support',
    definition: 'Support',
  ),

  /// Syringes
  syringes(
    code: '457',
    display: 'Syringes',
    definition: 'Syringes',
  ),

  /// Teeth
  teeth(
    code: '458',
    display: 'Teeth',
    definition: 'Teeth',
  ),

  /// Tenancy Advice
  tenancyAdvice(
    code: '459',
    display: 'Tenancy Advice',
    definition: 'Tenancy Advice',
  ),

  /// Terminal Illness
  terminalIllness(
    code: '460',
    display: 'Terminal Illness',
    definition: 'Terminal Illness',
  ),

  /// Therapy
  therapy(
    code: '461',
    display: 'Therapy',
    definition: 'Therapy',
  ),

  /// Transcription
  transcription(
    code: '462',
    display: 'Transcription',
    definition: 'Transcription',
  ),

  /// Translating Services
  translatingServices(
    code: '463',
    display: 'Translating Services',
    definition: 'Translating Services',
  ),

  /// Translator
  translator(
    code: '464',
    display: 'Translator',
    definition: 'Translator',
  ),

  /// Transport
  transport(
    code: '465',
    display: 'Transport',
    definition: 'Transport',
  ),

  /// Vertebrae
  vertebrae(
    code: '466',
    display: 'Vertebrae',
    definition: 'Vertebrae',
  ),

  /// Violence
  violence(
    code: '467',
    display: 'Violence',
    definition: 'Violence',
  ),

  /// Vocational Guidance
  vocationalGuidance(
    code: '468',
    display: 'Vocational Guidance',
    definition: 'Vocational Guidance',
  ),

  /// Weight
  weight(
    code: '469',
    display: 'Weight',
    definition: 'Weight',
  ),

  /// Welfare Assistance
  welfareAssistance(
    code: '470',
    display: 'Welfare Assistance',
    definition: 'Welfare Assistance',
  ),

  /// Welfare Counselling
  welfareCounselling(
    code: '471',
    display: 'Welfare Counselling',
    definition: 'Welfare Counselling',
  ),

  /// Wheelchairs
  wheelchairs(
    code: '472',
    display: 'Wheelchairs',
    definition: 'Wheelchairs',
  ),

  /// Wound Management
  woundManagement(
    code: '473',
    display: 'Wound Management',
    definition: 'Wound Management',
  ),

  /// Young People At Risk
  youngPeopleAtRisk(
    code: '474',
    display: 'Young People At Risk',
    definition: 'Young People At Risk',
  ),

  /// Further Description - Community Health Care
  furtherDescriptionCommunityHealthCare(
    code: '475',
    display: 'Further Desc. - Community Health Care',
    definition: 'Further Description - Community Health Care',
  ),

  /// Library
  library(
    code: '476',
    display: 'Library',
    definition: 'Library',
  ),

  /// Community Hours
  communityHours(
    code: '477',
    display: 'Community Hours',
    definition: 'Community Hours',
  ),

  /// Further Description - Specialist Medical
  furtherDescriptionSpecialistMedical(
    code: '478',
    display: 'Further Desc. - Specialist Medical',
    definition: 'Further Description - Specialist Medical',
  ),

  /// Hepatology
  hepatology(
    code: '479',
    display: 'Hepatology',
    definition: 'Hepatology',
  ),

  /// Gastroenterology
  gastroenterology(
    code: '480',
    display: 'Gastroenterology',
    definition: 'Gastroenterology',
  ),

  /// Gynaecology
  gynaecology(
    code: '481',
    display: 'Gynaecology',
    definition: 'Gynaecology',
  ),

  /// Obstetrics
  obstetrics(
    code: '482',
    display: 'Obstetrics',
    definition: 'Obstetrics',
  ),

  /// Further Description - Specialist Surgical
  furtherDescriptionSpecialistSurgical(
    code: '483',
    display: 'Further Desc. - Specialist Surgical',
    definition: 'Further Description - Specialist Surgical',
  ),

  /// Placement Protection
  placementProtection(
    code: '484',
    display: 'Placement Protection',
    definition: 'Placement Protection',
  ),

  /// Family Violence
  familyViolence(
    code: '485',
    display: 'Family Violence',
    definition: 'Family Violence',
  ),

  /// Integrated Family Services
  integratedFamilyServices(
    code: '486',
    display: 'Integrated Family Services',
    definition: 'Integrated Family Services',
  ),

  /// Diabetes Educator
  diabetesEducator(
    code: '488',
    display: 'Diabetes Educator',
    definition: 'Diabetes Educator',
  ),

  /// Kinship Care
  kinshipCare(
    code: '489',
    display: 'Kinship Care',
    definition: 'Kinship Care',
  ),

  /// General Mental Health Services
  generalMentalHealthServices(
    code: '490',
    display: 'General Mental Health Services',
    definition: 'General Mental Health Services',
  ),

  /// Exercise Physiology
  exercisePhysiology(
    code: '491',
    display: 'Exercise Physiology',
    definition: 'Exercise Physiology',
  ),

  /// Medical Research
  medicalResearch(
    code: '492',
    display: 'Medical Research',
    definition: 'Medical Research',
  ),

  /// Youth
  youth(
    code: '493',
    display: 'Youth',
    definition: 'Youth',
  ),

  /// Youth Services
  youthServices(
    code: '494',
    display: 'Youth Services',
    definition: 'Youth Services',
  ),

  /// Youth Health
  youthHealth(
    code: '495',
    display: 'Youth Health',
    definition: 'Youth Health',
  ),

  /// Child and Family Services
  childAndFamilyServices(
    code: '496',
    display: 'Child and Family Ser',
    definition: 'Child and Family Services',
  ),

  /// Home Visits
  homeVisits(
    code: '497',
    display: 'Home Visits',
    definition: 'Home Visits',
  ),

  /// Mobile Services
  mobileServices(
    code: '498',
    display: 'Mobile Services',
    definition: 'Mobile Services',
  ),

  /// Before and/or After School Care
  beforeAndOrAfterSchoolCare(
    code: '500',
    display: 'Before and/or After',
    definition: 'Before and/or After School Care',
  ),

  /// Cancer Services
  cancerServices(
    code: '501',
    display: 'Cancer Services',
    definition: 'Cancer Services',
  ),

  /// Integrated Cancer Services
  integratedCancerServices(
    code: '502',
    display: 'Integrated Cancer Se',
    definition: 'Integrated Cancer Services',
  ),

  /// Multidisciplinary Services
  multidisciplinaryServices(
    code: '503',
    display: 'Multidisciplinary Se',
    definition: 'Multidisciplinary Services',
  ),

  /// Multidisciplinary Cancer Services
  multidisciplinaryCancerServices(
    code: '504',
    display: 'Multidisciplinary Ca',
    definition: 'Multidisciplinary Cancer Services',
  ),

  /// Meetings
  meetings(
    code: '505',
    display: 'Meetings',
    definition: 'Meetings',
  ),

  /// Blood pressure monitoring
  bloodPressureMonitoring(
    code: '506',
    display: 'Blood pressure monit',
    definition: 'Blood pressure monitoring',
  ),

  /// Dose administration aid
  doseAdministrationAid(
    code: '507',
    display: 'Dose administration',
    definition: 'Dose administration aid',
  ),

  /// Medical Equipment Hire
  medicalEquipmentHire(
    code: '508',
    display: 'Medical Equipment Hi',
    definition: 'Medical Equipment Hire',
  ),

  /// Parenting & family support/education
  parentingFamilySupportEducation(
    code: '509',
    display: 'Parenting/Family Support/Education',
    definition: 'Parenting & family support/education',
  ),

  /// Deputising Service
  deputisingService(
    code: '510',
    display: 'Deputising Service',
    definition: 'Deputising Service',
  ),

  /// Cancer Support Groups
  cancerSupportGroups(
    code: '513',
    display: 'Cancer Support Groups',
    definition: 'Cancer Support Groups',
  ),

  /// Community Cancer Services
  communityCancerServices(
    code: '514',
    display: 'Community Cancer Services',
    definition: 'Community Cancer Services',
  ),

  /// Disability Care Transport
  disabilityCareTransport(
    code: '530',
    display: 'Disability Care Transport',
    definition: 'Disability Care Transport',
  ),

  /// Aged Care Transport
  agedCareTransport(
    code: '531',
    display: 'Aged Care Transport',
    definition: 'Aged Care Transport',
  ),

  /// Diabetes Education service
  diabetesEducationService(
    code: '532',
    display: 'Diabetes Education s',
    definition: 'Diabetes Education service',
  ),

  /// Cardiac Rehabilitation Service
  cardiacRehabilitationService(
    code: '533',
    display: 'Cardiac Rehabilitati',
    definition: 'Cardiac Rehabilitation Service',
  ),

  /// Young Adult Diabetes services (YADS)
  youngAdultDiabetesServices(
    code: '534',
    display: 'Young Adult Diabetes',
    definition: 'Young Adult Diabetes services (YADS)',
  ),

  /// Pulmonary Rehabilitation Service
  pulmonaryRehabilitationService(
    code: '535',
    display: 'Pulmonary Rehabilita',
    definition: 'Pulmonary Rehabilitation Service',
  ),

  /// Art therapy
  artTherapy(
    code: '536',
    display: 'Art therapy',
    definition: 'Art therapy',
  ),

  /// Medication Reviews
  medicationReviews(
    code: '537',
    display: 'Medication Reviews',
    definition: 'Medication Reviews',
  ),

  /// Telephone Counselling
  telephoneCounselling(
    code: '538',
    display: 'Telephone Counselling',
    definition: 'Telephone Counselling',
  ),

  /// Telephone Help Line
  telephoneHelpLine(
    code: '539',
    display: 'Telephone Help Line',
    definition: 'Telephone Help Line',
  ),

  /// Online Service
  onlineService(
    code: '540',
    display: 'Online Service',
    definition: 'Online Service',
  ),

  /// Crisis - Mental Health
  crisisMentalHealth(
    code: '541',
    display: 'Crisis - Mental Health',
    definition: 'Crisis - Mental Health',
  ),

  /// Youth Crisis
  youthCrisis(
    code: '542',
    display: 'Youth Crisis',
    definition: 'Youth Crisis',
  ),

  /// Sexual Assault
  sexualAssault(
    code: '543',
    display: 'Sexual Assault',
    definition: 'Sexual Assault',
  ),

  /// GPAH Other
  gpahOther(
    code: '544',
    display: 'GPAH Other',
    definition: 'GPAH Other',
  ),

  /// Paediatric Dermatology
  paediatricDermatology(
    code: '545',
    display: 'Paediatric Dermatology',
    definition: 'Paediatric Dermatology',
  ),

  /// Veterans Services
  veteransServices(
    code: '546',
    display: 'Veterans Services',
    definition: 'Veterans Services',
  ),

  /// Veterans
  veterans(
    code: '547',
    display: 'Veterans',
    definition: 'Veterans',
  ),

  /// Food Relief/food/meals
  foodReliefFoodMeals(
    code: '548',
    display: 'Food Relief/Food/Meals',
    definition: 'Food Relief/food/meals',
  ),

  /// Dementia Care
  dementiaCare(
    code: '550',
    display: 'Dementia Care',
    definition: 'Dementia Care',
  ),

  /// Alzheimer
  alzheimer(
    code: '551',
    display: 'Alzheimer',
    definition: 'Alzheimer',
  ),

  /// Drug and/or alcohol support groups
  drugAndOrAlcoholSupportGroups(
    code: '552',
    display: 'Drug and/or Alcohol Support Groups',
    definition: 'Drug and/or alcohol support groups',
  ),

  /// One on One Support/Mentoring/Coaching
  oneOnOneSupportMentoringCoaching(
    code: '553',
    display: '1-on-1 Support /Mentoring /Coaching',
    definition: 'One on One Support/Mentoring/Coaching',
  ),

  /// Chronic Disease Management
  chronicDiseaseManagement(
    code: '554',
    display: 'Chronic Disease Management',
    definition: 'Chronic Disease Management',
  ),

  /// Liaison Services
  liaisonServices(
    code: '555',
    display: 'Liaison Services',
    definition: 'Liaison Services',
  ),

  /// Walk in Centre / non emergency
  walkInCentreNonEmergency(
    code: '556',
    display: 'Walk-in Centre /Non-Emergency',
    definition: 'Walk in Centre / non emergency',
  ),

  /// Inpatients
  inpatients(
    code: '557',
    display: 'Inpatients',
    definition: 'Inpatients',
  ),

  /// Spiritual Counselling
  spiritualCounselling(
    code: '558',
    display: 'Spiritual Counselling',
    definition: 'Spiritual Counselling',
  ),

  /// Women's Health
  womensHealth(
    code: '559',
    display: "Women's Health",
    definition: "Women's Health",
  ),

  /// Men's Health
  mensHealth(
    code: '560',
    display: "Men's Health",
    definition: "Men's Health",
  ),

  /// Health education/Health awareness program
  healthEducationHealthAwarenessProgram(
    code: '561',
    display: 'Health Education/Awareness Program',
    definition: 'Health education/Health awareness program',
  ),

  /// Test Message
  testMessage(
    code: '562',
    display: 'Test Message',
    definition: 'Test Message',
  ),

  /// Remedial Massage
  remedialMassage(
    code: '563',
    display: 'Remedial Massage',
    definition: 'Remedial Massage',
  ),

  /// Adolescent Mental Health Services
  adolescentMentalHealthServices(
    code: '564',
    display: 'Adolescent Mental Health Services',
    definition: 'Adolescent Mental Health Services',
  ),

  /// Youth drop in/assistance/support
  youthDropInAssistanceSupport(
    code: '565',
    display: 'Youth Drop In/Assistance/Support',
    definition: 'Youth drop in/assistance/support',
  ),

  /// Aboriginal Health Worker
  aboriginalHealthWorker(
    code: '566',
    display: 'Aboriginal Health Worker',
    definition: 'Aboriginal Health Worker',
  ),

  /// Women's Health Clinic
  womensHealthClinic(
    code: '567',
    display: "Women's Health Clinic",
    definition: "Women's Health Clinic",
  ),

  /// Men's Health Clinic
  mensHealthClinic(
    code: '568',
    display: "Men's Health Clinic",
    definition: "Men's Health Clinic",
  ),

  /// Migrant Health Clinic
  migrantHealthClinic(
    code: '569',
    display: 'Migrant Health Clinic',
    definition: 'Migrant Health Clinic',
  ),

  /// Refugee Health Clinic
  refugeeHealthClinic(
    code: '570',
    display: 'Refugee Health Clinic',
    definition: 'Refugee Health Clinic',
  ),

  /// Aboriginal Health Clinic
  aboriginalHealthClinic(
    code: '571',
    display: 'Aboriginal Health Clinic',
    definition: 'Aboriginal Health Clinic',
  ),

  /// Nurse Practitioner lead Clinic/s
  nursePractitionerLeadClinics(
    code: '572',
    display: 'Nurse Practitioner Lead Clinic/s',
    definition: 'Nurse Practitioner lead Clinic/s',
  ),

  /// Nurse lead Clinic/s
  nurseLeadClinics(
    code: '573',
    display: 'Nurse Lead Clinic/s',
    definition: 'Nurse lead Clinic/s',
  ),

  /// Culturally tailored support groups
  culturallyTailoredSupportGroups(
    code: '574',
    display: 'Culturally Tailored Support Groups',
    definition: 'Culturally tailored support groups',
  ),

  /// Culturally tailored health promotion
  culturallyTailoredHealthPromotion(
    code: '575',
    display: 'Culturally Tailored Health Promotion',
    definition: 'Culturally tailored health promotion',
  ),

  /// Rehabilitation
  rehabilitation(
    code: '576',
    display: 'Rehabilitation',
    definition: 'Rehabilitation',
  ),

  /// Education information/referral
  educationInformationReferral(
    code: '577',
    display: 'Education Information/Referral',
    definition: 'Education information/referral',
  ),

  /// Social Work
  socialWork(
    code: '580',
    display: 'Social Work',
    definition: 'Social Work',
  ),

  /// Haematology
  haematology(
    code: '581',
    display: 'Haematology',
    definition: 'Haematology',
  ),

  /// Maternity Shared Care
  maternitySharedCare(
    code: '582',
    display: 'Maternity Shared Car',
    definition: 'Maternity Shared Care',
  ),

  /// Rehabilitation Service
  rehabilitationService(
    code: '583',
    display: 'Rehabilitation Servi',
    definition: 'Rehabilitation Service',
  ),

  /// Cranio-Sacral Therapy
  cranioSacralTherapy(
    code: '584',
    display: 'Cranio-sacral Therapy',
    definition: 'Cranio-Sacral Therapy',
  ),

  /// Prosthetics & Orthotics
  prostheticsOrthotics(
    code: '585',
    display: 'Prosthetics & Orthotics',
    definition: 'Prosthetics & Orthotics',
  ),

  /// Home Medicine Review
  homeMedicineReview(
    code: '589',
    display: 'Home Medicine Review',
    definition: 'Home Medicine Review',
  ),

  /// GPAH - Medical
  gpahMedical(
    code: '590',
    display: 'GPAH - Medical',
    definition: 'GPAH - Medical',
  ),

  /// Music Therapy
  musicTherapy(
    code: '591',
    display: 'Music Therapy',
    definition: 'Music Therapy',
  ),

  /// Falls Prevention
  fallsPrevention(
    code: '593',
    display: 'Falls Prevention',
    definition: 'Falls Prevention',
  ),

  /// Accommodation/Tenancy
  accommodationTenancy(
    code: '599',
    display: 'Accommodation/Tenancy',
    definition: 'Accommodation/Tenancy',
  ),

  /// Assess-Skill, Ability, Needs
  assessSkillAbilityNeeds(
    code: '600',
    display: 'Assess-Skill, Ability, Needs',
    definition: 'Assess-Skill, Ability, Needs',
  ),

  /// Assist Access/Maintain Employ
  assistAccessMaintainEmploy(
    code: '601',
    display: 'Assist Access/Maintain Employ',
    definition: 'Assist Access/Maintain Employ',
  ),

  /// Assist Prod-Pers Care/Safety
  assistProdPersSafety(
    code: '602',
    display: 'Assist Prod-Pers Care/Safety',
    definition: 'Assist Prod-Pers Care/Safety',
  ),

  /// Assist-Integrate School/Ed
  assistIntegrateSchoolEd(
    code: '603',
    display: 'Assist-Integrate School/Ed',
    definition: 'Assist-Integrate School/Ed',
  ),

  /// Assist-Life Stage, Transition
  assistLifeStageTransition(
    code: '604',
    display: 'Assist-Life Stage, Transition',
    definition: 'Assist-Life Stage, Transition',
  ),

  /// Assist-Personal Activities
  assistPersonalActivities(
    code: '605',
    display: 'Assist-Personal Activities',
    definition: 'Assist-Personal Activities',
  ),

  /// Assist-Travel/Transport
  assistTravelTransport(
    code: '606',
    display: 'Assist-Travel/Transport',
    definition: 'Assist-Travel/Transport',
  ),

  /// Assistive Equip-General Tasks
  assistiveEquipGeneralTasks(
    code: '607',
    display: 'Assistive Equip-General Tasks',
    definition: 'Assistive Equip-General Tasks',
  ),

  /// Assistive Equip-Recreation
  assistiveEquipRecreation(
    code: '608',
    display: 'Assistive Equip-Recreation',
    definition: 'Assistive Equip-Recreation',
  ),

  /// Assistive Prod-Household Task
  assistiveProdHouseholdTask(
    code: '609',
    display: 'Assistive Prod-Household Task',
    definition: 'Assistive Prod-Household Task',
  ),

  /// Behavior Support
  behaviorSupport(
    code: '610',
    display: 'Behavior Support',
    definition: 'Behavior Support',
  ),

  /// Comms & Info Equipment
  commsInfoEquipment(
    code: '611',
    display: 'Comms & Info Equipment',
    definition: 'Comms & Info Equipment',
  ),

  /// Community Nursing Care
  communityNursingCare(
    code: '612',
    display: 'Community Nursing Care',
    definition: 'Community Nursing Care',
  ),

  /// Daily Tasks/Shared Living
  dailyTasksSharedLiving(
    code: '613',
    display: 'Daily Tasks/Shared Living',
    definition: 'Daily Tasks/Shared Living',
  ),

  /// Development-Life Skills
  developmentLifeSkills(
    code: '614',
    display: 'Development-Life Skills',
    definition: 'Development-Life Skills',
  ),

  /// Early Childhood Supports
  earlyChildhoodSupports(
    code: '615',
    display: 'Early Childhood Supports',
    definition: 'Early Childhood Supports',
  ),

  /// Equipment Special Assess Setup
  equipmentSpecialAssessSetup(
    code: '616',
    display: 'Equipment Special Assess Setup',
    definition: 'Equipment Special Assess Setup',
  ),

  /// Hearing Equipment
  hearingEquipment(
    code: '617',
    display: 'Hearing Equipment',
    definition: 'Hearing Equipment',
  ),

  /// Home Modification
  homeModification(
    code: '618',
    display: 'Home Modification',
    definition: 'Home Modification',
  ),

  /// Household Tasks
  householdTasks(
    code: '619',
    display: 'Household Tasks',
    definition: 'Household Tasks',
  ),

  /// Interpret/Translate
  interpretTranslate(
    code: '620',
    display: 'Interpret/Translate',
    definition: 'Interpret/Translate',
  ),

  /// Other Innovative Supports
  otherInnovativeSupports(
    code: '621',
    display: 'Other Innovative Supports',
    definition: 'Other Innovative Supports',
  ),

  /// Participate Community
  participateCommunity(
    code: '622',
    display: 'Participate Community',
    definition: 'Participate Community',
  ),

  /// Personal Mobility Equipment
  personalMobilityEquipment(
    code: '623',
    display: 'Personal Mobility Equipment',
    definition: 'Personal Mobility Equipment',
  ),

  /// Physical Wellbeing
  physicalWellbeing(
    code: '624',
    display: 'Physical Wellbeing',
    definition: 'Physical Wellbeing',
  ),

  /// Plan Management
  planManagement(
    code: '625',
    display: 'Plan Management',
    definition: 'Plan Management',
  ),

  /// Therapeutic Supports
  therapeuticSupports(
    code: '626',
    display: 'Therapeutic Supports',
    definition: 'Therapeutic Supports',
  ),

  /// Training-Travel Independence
  trainingTravelIndependence(
    code: '627',
    display: 'Training-Travel Independence',
    definition: 'Training-Travel Independence',
  ),

  /// Vehicle modifications
  vehicleModifications(
    code: '628',
    display: 'Vehicle modifications',
    definition: 'Vehicle modifications',
  ),

  /// Vision Equipment
  visionEquipment(
    code: '629',
    display: 'Vision Equipment',
    definition: 'Vision Equipment',
  );

  const ServiceType({
    required this.code,
    required this.display,
    required this.definition,
  });

  final String code;
  final String display;
  final String definition;

  /// Returns the service type based on the string code, and returns null if
  /// no match is found
  static ServiceType? fromCode(String code) =>
      ServiceType.values.firstWhereOrNull(
        (serviceType) => serviceType.code == code,
      );

  JsonValue get json => JsonString(code);

  @override
  int compareTo(ServiceType other) => code == other.code ? 0 : 1;
}
