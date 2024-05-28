// ignore_for_file: lines_longer_than_80_chars, constant_identifier_names

import 'package:fhir_client/models/value_sets/value_set_concept.dart';

/// This value set defines an example set of codes of service-types.
enum ServiceType with ValueSetConcept<ServiceType> {
  /// Adoption & permanent care information/support
  n1(
    code: '1',
    display: 'Adoption/Permanent Care Info/Support',
    definition: 'Adoption & permanent care information/support',
  ),

  /// Personal alarms/alerts
  n10(
    code: '10',
    display: 'Personal Alarms/Alerts',
    definition: 'Personal alarms/alerts',
  ),

  /// Disability information/referral
  n100(
    code: '100',
    display: 'Disability Information/Referral',
    definition: 'Disability information/referral',
  ),

  /// Disability support packages
  n101(
    code: '101',
    display: 'Disability Support Packages',
    definition: 'Disability support packages',
  ),

  /// Disability supported accommodation
  n102(
    code: '102',
    display: 'Disability Supported Accommodation',
    definition: 'Disability supported accommodation',
  ),

  /// Early childhood intervention
  n103(
    code: '103',
    display: 'Early Childhood Intervention',
    definition: 'Early childhood intervention',
  ),

  /// Hearing aids & equipment
  n104(
    code: '104',
    display: 'Hearing Aids & Equipment',
    definition: 'Hearing aids & equipment',
  ),

  /// Drug and/or alcohol counselling
  n105(
    code: '105',
    display: 'Drug and/or Alcohol Counselling',
    definition: 'Drug and/or alcohol counselling',
  ),

  /// Drug and/or alcohol information/referral
  n106(
    code: '106',
    display: 'Drug/Alcohol Information/Referral',
    definition: 'Drug and/or alcohol information/referral',
  ),

  /// Needle & Syringe exchange
  n107(
    code: '107',
    display: 'Needle & Syringe Exchange',
    definition: 'Needle & Syringe exchange',
  ),

  /// Non-residential alcohol and/or drug dependence treatment
  n108(
    code: '108',
    display: 'Non-resid. Alcohol/Drug Treatment ',
    definition: 'Non-residential alcohol and/or drug dependence treatment',
  ),

  /// Pharmacotherapy (eg. methadone) program
  n109(
    code: '109',
    display: 'Pharmacotherapy',
    definition: 'Pharmacotherapy (eg. methadone) program',
  ),

  /// Personal care for older persons
  n11(
    code: '11',
    display: 'Personal Care for Older Persons',
    definition: 'Personal care for older persons',
  ),

  /// Quit program
  n110(
    code: '110',
    display: 'Quit Program',
    definition: 'Quit program',
  ),

  /// Residential alcohol and/or drug dependence treatment
  n111(
    code: '111',
    display: 'Residential Alcohol/Drug Treatment ',
    definition: 'Residential alcohol and/or drug dependence treatment',
  ),

  /// Adult/community education
  n112(
    code: '112',
    display: 'Adult/Community Education',
    definition: 'Adult/community education',
  ),

  /// Higher education
  n113(
    code: '113',
    display: 'Higher Education',
    definition: 'Higher education',
  ),

  /// Primary education
  n114(
    code: '114',
    display: 'Primary Education',
    definition: 'Primary education',
  ),

  /// Secondary education
  n115(
    code: '115',
    display: 'Secondary Education',
    definition: 'Secondary education',
  ),

  /// Training & vocational education
  n116(
    code: '116',
    display: 'Training & Vocational Education',
    definition: 'Training & vocational education',
  ),

  /// Emergency medical
  n117(
    code: '117',
    display: 'Emergency Medical',
    definition: 'Emergency medical',
  ),

  /// Employment placement and/or support
  n118(
    code: '118',
    display: 'Employment Placement and/or Support',
    definition: 'Employment placement and/or support',
  ),

  /// Vocational Rehabilitation
  n119(
    code: '119',
    display: 'Vocational Rehabilitation',
    definition: 'Vocational Rehabilitation',
  ),

  /// Planned activity groups
  n12(
    code: '12',
    display: 'Planned Activity Groups',
    definition: 'Planned activity groups',
  ),

  /// Workplace safety and/or accident prevention
  n120(
    code: '120',
    display: 'Work Safety/Accident Prevention',
    definition: 'Workplace safety and/or accident prevention',
  ),

  /// Financial assistance
  n121(
    code: '121',
    display: 'Financial Assistance',
    definition: 'Financial assistance',
  ),

  /// Financial information/advice
  n122(
    code: '122',
    display: 'Financial Information/Advice',
    definition: 'Financial information/advice',
  ),

  /// Material aid
  n123(
    code: '123',
    display: 'Material Aid',
    definition: 'Material aid',
  ),

  /// General Practice/GP (doctor)
  n124(
    code: '124',
    display: 'General Practice',
    definition: 'General Practice/GP (doctor)',
  ),

  /// Accommodation placement and/or support
  n125(
    code: '125',
    display: 'Accommodation Placement/Support',
    definition: 'Accommodation placement and/or support',
  ),

  /// Crisis/emergency accommodation
  n126(
    code: '126',
    display: 'Crisis/Emergency Accommodation',
    definition: 'Crisis/emergency accommodation',
  ),

  /// Homelessness support
  n127(
    code: '127',
    display: 'Homelessness Support',
    definition: 'Homelessness support',
  ),

  /// Housing information/referral
  n128(
    code: '128',
    display: 'Housing Information/Referral',
    definition: 'Housing information/referral',
  ),

  /// Public rental housing
  n129(
    code: '129',
    display: 'Public Rental Housing',
    definition: 'Public rental housing',
  ),

  /// Acupuncture
  n13(
    code: '13',
    display: 'Acupuncture',
    definition: 'Acupuncture',
  ),

  /// Interpreting/Multilingual/Language service
  n130(
    code: '130',
    display: 'Interpreting/Multilingual Service',
    definition: 'Interpreting/Multilingual/Language service',
  ),

  /// Juvenile Justice
  n131(
    code: '131',
    display: 'Juvenile Justice',
    definition: 'Juvenile Justice',
  ),

  /// Legal advocacy
  n132(
    code: '132',
    display: 'Legal Advocacy',
    definition: 'Legal advocacy',
  ),

  /// Legal information/advice/referral
  n133(
    code: '133',
    display: 'Legal Information/Advice/Referral',
    definition: 'Legal information/advice/referral',
  ),

  /// Mental health advocacy
  n134(
    code: '134',
    display: 'Mental Health Advocacy',
    definition: 'Mental health advocacy',
  ),

  /// Mental health assessment/triage/crisis response
  n135(
    code: '135',
    display: 'Mental Health Assess/Triage/Crisis Response',
    definition: 'Mental health assessment/triage/crisis response',
  ),

  /// Mental health case management/continuing care
  n136(
    code: '136',
    display: 'Mental Health Case Management',
    definition: 'Mental health case management/continuing care',
  ),

  /// Mental health information/referral
  n137(
    code: '137',
    display: 'Mental Health Information/Referral',
    definition: 'Mental health information/referral',
  ),

  /// Mental health inpatient services (hospital psychiatric unit) - requires referral
  n138(
    code: '138',
    display: 'Mental Health Inpatient Services',
    definition:
        'Mental health inpatient services (hospital psychiatric unit) - requires referral',
  ),

  /// Mental health non-residential rehabilitation
  n139(
    code: '139',
    display: 'Mental Health Non-residential Rehab',
    definition: 'Mental health non-residential rehabilitation',
  ),

  /// Alexander technique therapy
  n14(
    code: '14',
    display: 'Alexander Technique Therapy',
    definition: 'Alexander technique therapy',
  ),

  /// Mental health residential rehabilitation/community care unit
  n140(
    code: '140',
    display: 'Mental Health Residential Rehab/CCU',
    definition: 'Mental health residential rehabilitation/community care unit',
  ),

  /// Psychiatry (requires referral)
  n141(
    code: '141',
    display: 'Psychiatry (Requires Referral)',
    definition: 'Psychiatry (requires referral)',
  ),

  /// Psychology
  n142(
    code: '142',
    display: 'Psychology',
    definition: 'Psychology',
  ),

  /// Martial arts
  n143(
    code: '143',
    display: 'Martial Arts',
    definition: 'Martial arts',
  ),

  /// Personal fitness training
  n144(
    code: '144',
    display: 'Personal Fitness Training',
    definition: 'Personal fitness training',
  ),

  /// Physical activity group
  n145(
    code: '145',
    display: 'Physical Activity Group',
    definition: 'Physical activity group',
  ),

  /// Physical activity programs
  n146(
    code: '146',
    display: 'Physical Activity Programs',
    definition: 'Physical activity programs',
  ),

  /// Physical fitness testing
  n147(
    code: '147',
    display: 'Physical Fitness Testing',
    definition: 'Physical fitness testing',
  ),

  /// Pilates
  n148(
    code: '148',
    display: 'Pilates',
    definition: 'Pilates',
  ),

  /// Self defence
  n149(
    code: '149',
    display: 'Self-Defence',
    definition: 'Self defence',
  ),

  /// Aromatherapy
  n15(
    code: '15',
    display: 'Aromatherapy',
    definition: 'Aromatherapy',
  ),

  /// Sporting club
  n150(
    code: '150',
    display: 'Sporting Club',
    definition: 'Sporting club',
  ),

  /// Yoga
  n151(
    code: '151',
    display: 'Yoga',
    definition: 'Yoga',
  ),

  /// Food safety
  n152(
    code: '152',
    display: 'Food Safety',
    definition: 'Food safety',
  ),

  /// Health regulatory, inspection and/or certification
  n153(
    code: '153',
    display: 'Health Regulatory /Inspection /Cert.',
    definition: 'Health regulatory, inspection and/or certification',
  ),

  /// Workplace health and/or safety inspection and/or certification
  n154(
    code: '154',
    display: 'Work Health/Safety Inspection/Cert.',
    definition:
        'Workplace health and/or safety inspection and/or certification',
  ),

  /// Carer support
  n155(
    code: '155',
    display: 'Carer Support',
    definition: 'Carer support',
  ),

  /// Respite care
  n156(
    code: '156',
    display: 'Respite Care',
    definition: 'Respite care',
  ),

  /// Anatomical Pathology (including Cytopathology & Forensic Pathology)
  n157(
    code: '157',
    display: 'Anatomical Pathology ',
    definition:
        'Anatomical Pathology (including Cytopathology & Forensic Pathology)',
  ),

  /// Pathology - Clinical Chemistry
  n158(
    code: '158',
    display: 'Pathology - Clinical Chemistry',
    definition: 'Pathology - Clinical Chemistry',
  ),

  /// Pathology - General
  n159(
    code: '159',
    display: 'Pathology - General',
    definition: 'Pathology - General',
  ),

  /// Biorhythm services
  n16(
    code: '16',
    display: 'Biorhythm Services',
    definition: 'Biorhythm services',
  ),

  /// Pathology - Genetics
  n160(
    code: '160',
    display: 'Pathology - Genetics',
    definition: 'Pathology - Genetics',
  ),

  /// Pathology - Haematology
  n161(
    code: '161',
    display: 'Pathology - Haematology',
    definition: 'Pathology - Haematology',
  ),

  /// Pathology - Immunology
  n162(
    code: '162',
    display: 'Pathology - Immunology',
    definition: 'Pathology - Immunology',
  ),

  /// Pathology - Microbiology
  n163(
    code: '163',
    display: 'Pathology - Microbiology',
    definition: 'Pathology - Microbiology',
  ),

  /// Anaesthesiology - Pain Medicine
  n164(
    code: '164',
    display: 'Anaesthesiology - Pain Medicine',
    definition: 'Anaesthesiology - Pain Medicine',
  ),

  /// Cardiology
  n165(
    code: '165',
    display: 'Cardiology',
    definition: 'Cardiology',
  ),

  /// Clinical Genetics
  n166(
    code: '166',
    display: 'Clinical Genetics',
    definition: 'Clinical Genetics',
  ),

  /// Clinical Pharmacology
  n167(
    code: '167',
    display: 'Clinical Pharmacology',
    definition: 'Clinical Pharmacology',
  ),

  /// Dermatology
  n168(
    code: '168',
    display: 'Dermatology',
    definition: 'Dermatology',
  ),

  /// Endocrinology
  n169(
    code: '169',
    display: 'Endocrinology',
    definition: 'Endocrinology',
  ),

  /// Bowen therapy
  n17(
    code: '17',
    display: 'Bowen Therapy',
    definition: 'Bowen therapy',
  ),

  /// Gastroenterology & Hepatology
  n170(
    code: '170',
    display: 'Gastroenterology & Hepatology',
    definition: 'Gastroenterology & Hepatology',
  ),

  /// Geriatric medicine
  n171(
    code: '171',
    display: 'Geriatric Medicine',
    definition: 'Geriatric medicine',
  ),

  /// Immunology & Allergy
  n172(
    code: '172',
    display: 'Immunology & Allergy',
    definition: 'Immunology & Allergy',
  ),

  /// Infectious diseases
  n173(
    code: '173',
    display: 'Infectious Diseases',
    definition: 'Infectious diseases',
  ),

  /// Intensive care medicine
  n174(
    code: '174',
    display: 'Intensive Care Medicine',
    definition: 'Intensive care medicine',
  ),

  /// Medical Oncology
  n175(
    code: '175',
    display: 'Medical Oncology',
    definition: 'Medical Oncology',
  ),

  /// Nephrology
  n176(
    code: '176',
    display: 'Nephrology',
    definition: 'Nephrology',
  ),

  /// Neurology
  n177(
    code: '177',
    display: 'Neurology',
    definition: 'Neurology',
  ),

  /// Occupational Medicine
  n178(
    code: '178',
    display: 'Occupational Medicine',
    definition: 'Occupational Medicine',
  ),

  /// Palliative Medicine
  n179(
    code: '179',
    display: 'Palliative Medicine',
    definition: 'Palliative Medicine',
  ),

  /// Chinese herbal medicine
  n18(
    code: '18',
    display: 'Chinese Herbal Medicine',
    definition: 'Chinese herbal medicine',
  ),

  /// Public Health Medicine
  n180(
    code: '180',
    display: 'Public Health Medicine',
    definition: 'Public Health Medicine',
  ),

  /// Rehabilitation Medicine
  n181(
    code: '181',
    display: 'Rehabilitation Medicine',
    definition: 'Rehabilitation Medicine',
  ),

  /// Rheumatology
  n182(
    code: '182',
    display: 'Rheumatology',
    definition: 'Rheumatology',
  ),

  /// Sleep Medicine
  n183(
    code: '183',
    display: 'Sleep Medicine',
    definition: 'Sleep Medicine',
  ),

  /// Thoracic medicine
  n184(
    code: '184',
    display: 'Thoracic Medicine',
    definition: 'Thoracic medicine',
  ),

  /// Gynaecological Oncology
  n185(
    code: '185',
    display: 'Gynaecological Oncology',
    definition: 'Gynaecological Oncology',
  ),

  /// Obstetrics & Gynaecology
  n186(
    code: '186',
    display: 'Obstetrics & Gynaecology',
    definition: 'Obstetrics & Gynaecology',
  ),

  /// Reproductive Endocrinology & Infertility
  n187(
    code: '187',
    display: 'Reproductive Endocrinology/Infertility',
    definition: 'Reproductive Endocrinology & Infertility',
  ),

  /// Urogynaecology
  n188(
    code: '188',
    display: 'Urogynaecology',
    definition: 'Urogynaecology',
  ),

  /// Neonatology & Perinatology
  n189(
    code: '189',
    display: 'Neonatology & Perinatology',
    definition: 'Neonatology & Perinatology',
  ),

  /// Feldenkrais
  n19(
    code: '19',
    display: 'Feldenkrais',
    definition: 'Feldenkrais',
  ),

  /// Paediatric Cardiology
  n190(
    code: '190',
    display: 'Paediatric Cardiology',
    definition: 'Paediatric Cardiology',
  ),

  /// Paediatric Clinical Genetics
  n191(
    code: '191',
    display: 'Paediatric Clinical Genetics',
    definition: 'Paediatric Clinical Genetics',
  ),

  /// Paediatric Clinical Pharmacology
  n192(
    code: '192',
    display: 'Paediatric Clinical Pharmacology',
    definition: 'Paediatric Clinical Pharmacology',
  ),

  /// Paediatric Endocrinology
  n193(
    code: '193',
    display: 'Paediatric Endocrinology',
    definition: 'Paediatric Endocrinology',
  ),

  /// Paediatric Gastroenterology & Hepatology
  n194(
    code: '194',
    display: 'Paed. Gastroenterology/Hepatology',
    definition: 'Paediatric Gastroenterology & Hepatology',
  ),

  /// Paediatric Haematology
  n195(
    code: '195',
    display: 'Paediatric Haematology',
    definition: 'Paediatric Haematology',
  ),

  /// Paediatric Immunology & Allergy
  n196(
    code: '196',
    display: 'Paediatric Immunology & Allergy',
    definition: 'Paediatric Immunology & Allergy',
  ),

  /// Paediatric Infectious diseases
  n197(
    code: '197',
    display: 'Paediatric Infectious Diseases',
    definition: 'Paediatric Infectious diseases',
  ),

  /// Paediatric intensive care medicine
  n198(
    code: '198',
    display: 'Paediatric Intensive Care Medicine',
    definition: 'Paediatric intensive care medicine',
  ),

  /// Paediatric Medical Oncology
  n199(
    code: '199',
    display: 'Paediatric Medical Oncology',
    definition: 'Paediatric Medical Oncology',
  ),

  /// Aged care assessment
  n2(
    code: '2',
    display: 'Aged Care Assessment',
    definition: 'Aged care assessment',
  ),

  /// Homoeopathy
  n20(
    code: '20',
    display: 'Homoeopathy',
    definition: 'Homoeopathy',
  ),

  /// Paediatric Medicine
  n200(
    code: '200',
    display: 'Paediatric Medicine',
    definition: 'Paediatric Medicine',
  ),

  /// Paediatric Nephrology
  n201(
    code: '201',
    display: 'Paediatric Nephrology',
    definition: 'Paediatric Nephrology',
  ),

  /// Paediatric Neurology
  n202(
    code: '202',
    display: 'Paediatric Neurology',
    definition: 'Paediatric Neurology',
  ),

  /// Paediatric Nuclear Medicine
  n203(
    code: '203',
    display: 'Paediatric Nuclear Medicine',
    definition: 'Paediatric Nuclear Medicine',
  ),

  /// Paediatric Rehabilitation Medicine
  n204(
    code: '204',
    display: 'Paediatric Rehabilitation Medicine',
    definition: 'Paediatric Rehabilitation Medicine',
  ),

  /// Paediatric Rheumatology
  n205(
    code: '205',
    display: 'Paediatric Rheumatology',
    definition: 'Paediatric Rheumatology',
  ),

  /// Paediatric Sleep Medicine
  n206(
    code: '206',
    display: 'Paediatric Sleep Medicine',
    definition: 'Paediatric Sleep Medicine',
  ),

  /// Paediatric Surgery
  n207(
    code: '207',
    display: 'Paediatric Surgery',
    definition: 'Paediatric Surgery',
  ),

  /// Paediatric Thoracic Medicine
  n208(
    code: '208',
    display: 'Paediatric Thoracic Medicine',
    definition: 'Paediatric Thoracic Medicine',
  ),

  /// Diagnostic Radiology/Xray/CT/Fluoroscopy
  n209(
    code: '209',
    display: 'Diag. Radiology /Xray /CT /Fluoroscopy',
    definition: 'Diagnostic Radiology/Xray/CT/Fluoroscopy',
  ),

  /// Hydrotherapy
  n21(
    code: '21',
    display: 'Hydrotherapy',
    definition: 'Hydrotherapy',
  ),

  /// Diagnostic Ultrasound
  n210(
    code: '210',
    display: 'Diagnostic Ultrasound',
    definition: 'Diagnostic Ultrasound',
  ),

  /// Magnetic Resonance Imaging (MRI)
  n211(
    code: '211',
    display: 'Magnetic Resonance Imaging (MRI)',
    definition: 'Magnetic Resonance Imaging (MRI)',
  ),

  /// Nuclear Medicine
  n212(
    code: '212',
    display: 'Nuclear Medicine',
    definition: 'Nuclear Medicine',
  ),

  /// Obstetric & Gynaecological Ultrasound
  n213(
    code: '213',
    display: 'Obstetric/Gynaecological Ultrasound',
    definition: 'Obstetric & Gynaecological Ultrasound',
  ),

  /// Radiation oncology
  n214(
    code: '214',
    display: 'Radiation Oncology',
    definition: 'Radiation oncology',
  ),

  /// Cardiothoracic surgery
  n215(
    code: '215',
    display: 'Cardiothoracic Surgery',
    definition: 'Cardiothoracic surgery',
  ),

  /// Neurosurgery
  n216(
    code: '216',
    display: 'Neurosurgery',
    definition: 'Neurosurgery',
  ),

  /// Ophthalmology
  n217(
    code: '217',
    display: 'Ophthalmology',
    definition: 'Ophthalmology',
  ),

  /// Orthopaedic surgery
  n218(
    code: '218',
    display: 'Orthopaedic Surgery',
    definition: 'Orthopaedic surgery',
  ),

  /// Otolaryngology - Head & Neck Surgery
  n219(
    code: '219',
    display: 'Otolaryngology/Head & Neck Surgery',
    definition: 'Otolaryngology - Head & Neck Surgery',
  ),

  /// Hypnotherapy
  n22(
    code: '22',
    display: 'Hypnotherapy',
    definition: 'Hypnotherapy',
  ),

  /// Plastic & Reconstructive Surgery
  n220(
    code: '220',
    display: 'Plastic & Reconstructive Surgery',
    definition: 'Plastic & Reconstructive Surgery',
  ),

  /// Surgery - General
  n221(
    code: '221',
    display: 'Surgery - General',
    definition: 'Surgery - General',
  ),

  /// Urology
  n222(
    code: '222',
    display: 'Urology',
    definition: 'Urology',
  ),

  /// Vascular surgery
  n223(
    code: '223',
    display: 'Vascular Surgery',
    definition: 'Vascular surgery',
  ),

  /// Support groups
  n224(
    code: '224',
    display: 'Support Groups',
    definition: 'Support groups',
  ),

  /// Air ambulance
  n225(
    code: '225',
    display: 'Air ambulance',
    definition: 'Air ambulance',
  ),

  /// Ambulance
  n226(
    code: '226',
    display: 'Ambulance',
    definition: 'Ambulance',
  ),

  /// Blood transport
  n227(
    code: '227',
    display: 'Blood Transport',
    definition: 'Blood transport',
  ),

  /// Community bus
  n228(
    code: '228',
    display: 'Community Bus',
    definition: 'Community bus',
  ),

  /// Flying doctor service
  n229(
    code: '229',
    display: 'Flying Doctor Service',
    definition: 'Flying doctor service',
  ),

  /// Kinesiology
  n23(
    code: '23',
    display: 'Kinesiology',
    definition: 'Kinesiology',
  ),

  /// Patient transport
  n230(
    code: '230',
    display: 'Patient Transport',
    definition: 'Patient transport',
  ),

  /// A&E
  n231(
    code: '231',
    display: 'A&E',
    definition: 'A&E',
  ),

  /// A&EP
  n232(
    code: '232',
    display: 'A&EP',
    definition: 'A&EP',
  ),

  /// Abuse
  n233(
    code: '233',
    display: 'Abuse',
    definition: 'Abuse',
  ),

  /// ACAS
  n234(
    code: '234',
    display: 'ACAS',
    definition: 'ACAS',
  ),

  /// Access
  n235(
    code: '235',
    display: 'Access',
    definition: 'Access',
  ),

  /// Accident
  n236(
    code: '236',
    display: 'Accident',
    definition: 'Accident',
  ),

  /// Acute Inpatient Service's
  n237(
    code: '237',
    display: 'Acute Inpatient Serv',
    definition: "Acute Inpatient Service's",
  ),

  /// Adult Day Programs
  n238(
    code: '238',
    display: 'Adult Day Programs',
    definition: 'Adult Day Programs',
  ),

  /// Adult Mental Health Services
  n239(
    code: '239',
    display: 'Adult Mental Health Services',
    definition: 'Adult Mental Health Services',
  ),

  /// Magnetic therapy
  n24(
    code: '24',
    display: 'Magnetic Therapy',
    definition: 'Magnetic therapy',
  ),

  /// Advice
  n240(
    code: '240',
    display: 'Advice',
    definition: 'Advice',
  ),

  /// Advocacy
  n241(
    code: '241',
    display: 'Advocacy',
    definition: 'Advocacy',
  ),

  /// Aged Persons Mental Health Residential Units
  n242(
    code: '242',
    display: 'Aged Persons Mental ',
    definition: 'Aged Persons Mental Health Residential Units',
  ),

  /// Aged Persons Mental Health Services
  n243(
    code: '243',
    display: 'Aged Persons Mental ',
    definition: 'Aged Persons Mental Health Services',
  ),

  /// Aged Persons Mental Health Teams
  n244(
    code: '244',
    display: 'Aged Persons Mental ',
    definition: 'Aged Persons Mental Health Teams',
  ),

  /// Aids
  n245(
    code: '245',
    display: 'Aids',
    definition: 'Aids',
  ),

  /// Al-Anon
  n246(
    code: '246',
    display: 'Al-Anon',
    definition: 'Al-Anon',
  ),

  /// Alcohol
  n247(
    code: '247',
    display: 'Alcohol',
    definition: 'Alcohol',
  ),

  /// Al-Teen
  n248(
    code: '248',
    display: 'Al-Teen',
    definition: 'Al-Teen',
  ),

  /// Antenatal
  n249(
    code: '249',
    display: 'Antenatal',
    definition: 'Antenatal',
  ),

  /// Massage therapy
  n25(
    code: '25',
    display: 'Massage Therapy',
    definition: 'Massage therapy',
  ),

  /// Anxiety
  n250(
    code: '250',
    display: 'Anxiety',
    definition: 'Anxiety',
  ),

  /// Arthritis
  n251(
    code: '251',
    display: 'Arthritis',
    definition: 'Arthritis',
  ),

  /// Assessment
  n252(
    code: '252',
    display: 'Assessment',
    definition: 'Assessment',
  ),

  /// Assistance
  n253(
    code: '253',
    display: 'Assistance',
    definition: 'Assistance',
  ),

  /// Asthma
  n254(
    code: '254',
    display: 'Asthma',
    definition: 'Asthma',
  ),

  /// ATSS
  n255(
    code: '255',
    display: 'ATSS',
    definition: 'ATSS',
  ),

  /// Attendant Care
  n256(
    code: '256',
    display: 'Attendant Care',
    definition: 'Attendant Care',
  ),

  /// Babies
  n257(
    code: '257',
    display: 'Babies',
    definition: 'Babies',
  ),

  /// Bathroom Modification
  n258(
    code: '258',
    display: 'Bathroom Modificatio',
    definition: 'Bathroom Modification',
  ),

  /// Behavior
  n259(
    code: '259',
    display: 'Behavior',
    definition: 'Behavior',
  ),

  /// Meditation
  n26(
    code: '26',
    display: 'Meditation',
    definition: 'Meditation',
  ),

  /// Behavior Intervention
  n260(
    code: '260',
    display: 'Behavior Interventi',
    definition: 'Behavior Intervention',
  ),

  /// Bereavement
  n261(
    code: '261',
    display: 'Bereavement',
    definition: 'Bereavement',
  ),

  /// Bipolar
  n262(
    code: '262',
    display: 'Bipolar',
    definition: 'Bipolar',
  ),

  /// Birth
  n263(
    code: '263',
    display: 'Birth',
    definition: 'Birth',
  ),

  /// Birth Control
  n264(
    code: '264',
    display: 'Birth Control',
    definition: 'Birth Control',
  ),

  /// Birthing Options
  n265(
    code: '265',
    display: 'Birthing Options',
    definition: 'Birthing Options',
  ),

  /// BIST
  n266(
    code: '266',
    display: 'BIST',
    definition: 'BIST',
  ),

  /// Blood
  n267(
    code: '267',
    display: 'Blood',
    definition: 'Blood',
  ),

  /// Bone
  n268(
    code: '268',
    display: 'Bone',
    definition: 'Bone',
  ),

  /// Bowel
  n269(
    code: '269',
    display: 'Bowel',
    definition: 'Bowel',
  ),

  /// Myotherapy
  n27(
    code: '27',
    display: 'Myotherapy',
    definition: 'Myotherapy',
  ),

  /// Brain
  n270(
    code: '270',
    display: 'Brain',
    definition: 'Brain',
  ),

  /// Breast Feeding
  n271(
    code: '271',
    display: 'Breast Feeding',
    definition: 'Breast Feeding',
  ),

  /// Breast Screen
  n272(
    code: '272',
    display: 'Breast Screen',
    definition: 'Breast Screen',
  ),

  /// Brokerage
  n273(
    code: '273',
    display: 'Brokerage',
    definition: 'Brokerage',
  ),

  /// Cancer
  n274(
    code: '274',
    display: 'Cancer',
    definition: 'Cancer',
  ),

  /// Cancer Support
  n275(
    code: '275',
    display: 'Cancer Support',
    definition: 'Cancer Support',
  ),

  /// Cardiovascular Disease
  n276(
    code: '276',
    display: 'Cardiovascular Disea',
    definition: 'Cardiovascular Disease',
  ),

  /// Care Packages
  n277(
    code: '277',
    display: 'Care Packages',
    definition: 'Care Packages',
  ),

  /// Carer
  n278(
    code: '278',
    display: 'Carer',
    definition: 'Carer',
  ),

  /// Case Management
  n279(
    code: '279',
    display: 'Case Management',
    definition: 'Case Management',
  ),

  /// Naturopathy
  n28(
    code: '28',
    display: 'Naturopathy',
    definition: 'Naturopathy',
  ),

  /// Casualty
  n280(
    code: '280',
    display: 'Casualty',
    definition: 'Casualty',
  ),

  /// Centrelink
  n281(
    code: '281',
    display: 'Centrelink',
    definition: 'Centrelink',
  ),

  /// Chemists
  n282(
    code: '282',
    display: 'Chemists',
    definition: 'Chemists',
  ),

  /// Child And Adolescent Mental Health Services
  n283(
    code: '283',
    display: 'Child And Adolescent',
    definition: 'Child And Adolescent Mental Health Services',
  ),

  /// Child Care
  n284(
    code: '284',
    display: 'Child Care',
    definition: 'Child Care',
  ),

  /// Child Services
  n285(
    code: '285',
    display: 'Child Services',
    definition: 'Child Services',
  ),

  /// Children
  n286(
    code: '286',
    display: 'Children',
    definition: 'Children',
  ),

  /// Children's Services
  n287(
    code: '287',
    display: "Children's Services",
    definition: "Children's Services",
  ),

  /// Cholesterol
  n288(
    code: '288',
    display: 'Cholesterol',
    definition: 'Cholesterol',
  ),

  /// Clothing
  n289(
    code: '289',
    display: 'Clothing',
    definition: 'Clothing',
  ),

  /// Reflexology
  n29(
    code: '29',
    display: 'Reflexology',
    definition: 'Reflexology',
  ),

  /// Community Based Accommodation
  n290(
    code: '290',
    display: 'Community Based Acco',
    definition: 'Community Based Accommodation',
  ),

  /// Community Care Unit
  n291(
    code: '291',
    display: 'Community Care Unit',
    definition: 'Community Care Unit',
  ),

  /// Community Child And Adolescent Mental Health Services
  n292(
    code: '292',
    display: 'Community Child And ',
    definition: 'Community Child And Adolescent Mental Health Services',
  ),

  /// Community Health
  n293(
    code: '293',
    display: 'Community Health',
    definition: 'Community Health',
  ),

  /// Community Residential Unit
  n294(
    code: '294',
    display: 'Community Residentia',
    definition: 'Community Residential Unit',
  ),

  /// Community Transport
  n295(
    code: '295',
    display: 'Community Transport',
    definition: 'Community Transport',
  ),

  /// Companion Visiting
  n296(
    code: '296',
    display: 'Companion Visiting',
    definition: 'Companion Visiting',
  ),

  /// Companionship
  n297(
    code: '297',
    display: 'Companionship',
    definition: 'Companionship',
  ),

  /// Consumer Advice
  n298(
    code: '298',
    display: 'Consumer Advice',
    definition: 'Consumer Advice',
  ),

  /// Consumer Issues
  n299(
    code: '299',
    display: 'Consumer Issues',
    definition: 'Consumer Issues',
  ),

  /// Aged Care information/referral
  n3(
    code: '3',
    display: 'Aged Care Information/Referral',
    definition: 'Aged Care information/referral',
  ),

  /// Reiki
  n30(
    code: '30',
    display: 'Reiki',
    definition: 'Reiki',
  ),

  /// Continuing Care Services
  n300(
    code: '300',
    display: 'Continuing Care Serv',
    definition: 'Continuing Care Services',
  ),

  /// Contraception Information
  n301(
    code: '301',
    display: 'Contraception Inform',
    definition: 'Contraception Information',
  ),

  /// Coordinating Bodies
  n302(
    code: '302',
    display: 'Coordinating Bodies',
    definition: 'Coordinating Bodies',
  ),

  /// Correctional Services
  n303(
    code: '303',
    display: 'Correctional Service',
    definition: 'Correctional Services',
  ),

  /// Council Environmental Health
  n304(
    code: '304',
    display: 'Council Environmenta',
    definition: 'Council Environmental Health',
  ),

  /// Counselling
  n305(
    code: '305',
    display: 'Counselling',
    definition: 'Counselling',
  ),

  /// Criminal
  n306(
    code: '306',
    display: 'Criminal',
    definition: 'Criminal',
  ),

  /// Crises
  n307(
    code: '307',
    display: 'Crises',
    definition: 'Crises',
  ),

  /// Crisis Assessment And Treatment Services (Cats)
  n308(
    code: '308',
    display: 'Crisis Assessment An',
    definition: 'Crisis Assessment And Treatment Services (Cats)',
  ),

  /// Crisis Assistance
  n309(
    code: '309',
    display: 'Crisis Assistance',
    definition: 'Crisis Assistance',
  ),

  /// Relaxation therapy
  n31(
    code: '31',
    display: 'Relaxation Therapy',
    definition: 'Relaxation therapy',
  ),

  /// Crisis Refuge
  n310(
    code: '310',
    display: 'Crisis Refuge',
    definition: 'Crisis Refuge',
  ),

  /// Day Program
  n311(
    code: '311',
    display: 'Day Program',
    definition: 'Day Program',
  ),

  /// Deaf
  n312(
    code: '312',
    display: 'Deaf',
    definition: 'Deaf',
  ),

  /// Dental Hygiene
  n313(
    code: '313',
    display: 'Dental Hygiene',
    definition: 'Dental Hygiene',
  ),

  /// Dentistry
  n314(
    code: '314',
    display: 'Dentistry',
    definition: 'Dentistry',
  ),

  /// Dentures
  n315(
    code: '315',
    display: 'Dentures',
    definition: 'Dentures',
  ),

  /// Depression
  n316(
    code: '316',
    display: 'Depression',
    definition: 'Depression',
  ),

  /// Detoxification
  n317(
    code: '317',
    display: 'Detoxification',
    definition: 'Detoxification',
  ),

  /// Diabetes
  n318(
    code: '318',
    display: 'Diabetes',
    definition: 'Diabetes',
  ),

  /// Diaphragm Fitting
  n319(
    code: '319',
    display: 'Diaphragm Fitting',
    definition: 'Diaphragm Fitting',
  ),

  /// Shiatsu
  n32(
    code: '32',
    display: 'Shiatsu',
    definition: 'Shiatsu',
  ),

  /// Dieticians
  n320(
    code: '320',
    display: 'Dieticians',
    definition: 'Dieticians',
  ),

  /// Disabled Parking
  n321(
    code: '321',
    display: 'Disabled Parking',
    definition: 'Disabled Parking',
  ),

  /// District Nursing
  n322(
    code: '322',
    display: 'District Nursing',
    definition: 'District Nursing',
  ),

  /// Divorce
  n323(
    code: '323',
    display: 'Divorce',
    definition: 'Divorce',
  ),

  /// Doctors
  n324(
    code: '324',
    display: 'Doctors',
    definition: 'Doctors',
  ),

  /// Drink-Drive
  n325(
    code: '325',
    display: 'Drink-Drive',
    definition: 'Drink-Drive',
  ),

  /// Dual Diagnosis Services
  n326(
    code: '326',
    display: 'Dual Diagnosis Servi',
    definition: 'Dual Diagnosis Services',
  ),

  /// Early Choice
  n327(
    code: '327',
    display: 'Early Choice',
    definition: 'Early Choice',
  ),

  /// Eating Disorder
  n328(
    code: '328',
    display: 'Eating Disorder',
    definition: 'Eating Disorder',
  ),

  /// Western herbal medicine
  n33(
    code: '33',
    display: 'Western Herbal Medicine',
    definition: 'Western herbal medicine',
  ),

  /// Emergency Relief
  n330(
    code: '330',
    display: 'Emergency Relief',
    definition: 'Emergency Relief',
  ),

  /// Employment And Training
  n331(
    code: '331',
    display: 'Employment And Train',
    definition: 'Employment And Training',
  ),

  /// Environment
  n332(
    code: '332',
    display: 'Environment',
    definition: 'Environment',
  ),

  /// Equipment
  n333(
    code: '333',
    display: 'Equipment',
    definition: 'Equipment',
  ),

  /// Exercise
  n334(
    code: '334',
    display: 'Exercise',
    definition: 'Exercise',
  ),

  /// Facility
  n335(
    code: '335',
    display: 'Facility',
    definition: 'Facility',
  ),

  /// Family Choice
  n336(
    code: '336',
    display: 'Family Choice',
    definition: 'Family Choice',
  ),

  /// Family Law
  n337(
    code: '337',
    display: 'Family Law',
    definition: 'Family Law',
  ),

  /// Family Options
  n338(
    code: '338',
    display: 'Family Options',
    definition: 'Family Options',
  ),

  /// Family Services
  n339(
    code: '339',
    display: 'Family Services',
    definition: 'Family Services',
  ),

  /// Family day care
  n34(
    code: '34',
    display: 'Family Day care',
    definition: 'Family day care',
  ),

  /// FFYA
  n340(
    code: '340',
    display: 'FFYA',
    definition: 'FFYA',
  ),

  /// Financial Aid
  n341(
    code: '341',
    display: 'Financial Aid',
    definition: 'Financial Aid',
  ),

  /// Fitness
  n342(
    code: '342',
    display: 'Fitness',
    definition: 'Fitness',
  ),

  /// Flexible Care Packages
  n343(
    code: '343',
    display: 'Flexible Care Packag',
    definition: 'Flexible Care Packages',
  ),

  /// Food
  n344(
    code: '344',
    display: 'Food',
    definition: 'Food',
  ),

  /// Food Vouchers
  n345(
    code: '345',
    display: 'Food Vouchers',
    definition: 'Food Vouchers',
  ),

  /// Forensic Mental Health Services
  n346(
    code: '346',
    display: 'Forensic Mental Heal',
    definition: 'Forensic Mental Health Services',
  ),

  /// Futures
  n347(
    code: '347',
    display: 'Futures',
    definition: 'Futures',
  ),

  /// Futures For Young Adults
  n348(
    code: '348',
    display: 'Futures For Young Ad',
    definition: 'Futures For Young Adults',
  ),

  /// General Practitioners
  n349(
    code: '349',
    display: 'General Practitioner',
    definition: 'General Practitioners',
  ),

  /// Holiday programs
  n35(
    code: '35',
    display: 'Holiday Programs',
    definition: 'Holiday programs',
  ),

  /// Grants
  n350(
    code: '350',
    display: 'Grants',
    definition: 'Grants',
  ),

  /// Grief
  n351(
    code: '351',
    display: 'Grief',
    definition: 'Grief',
  ),

  /// Grief Counselling
  n352(
    code: '352',
    display: 'Grief Counselling',
    definition: 'Grief Counselling',
  ),

  /// HACC
  n353(
    code: '353',
    display: 'HACC',
    definition: 'HACC',
  ),

  /// Heart Disease
  n354(
    code: '354',
    display: 'Heart Disease',
    definition: 'Heart Disease',
  ),

  /// Help
  n355(
    code: '355',
    display: 'Help',
    definition: 'Help',
  ),

  /// High Blood Pressure
  n356(
    code: '356',
    display: 'High Blood Pressure',
    definition: 'High Blood Pressure',
  ),

  /// Home Help
  n357(
    code: '357',
    display: 'Home Help',
    definition: 'Home Help',
  ),

  /// Home Nursing
  n358(
    code: '358',
    display: 'Home Nursing',
    definition: 'Home Nursing',
  ),

  /// Homefirst
  n359(
    code: '359',
    display: 'Homefirst',
    definition: 'Homefirst',
  ),

  /// Kindergarten inclusion support for children with a disability
  n36(
    code: '36',
    display: 'Kindergarten Inclusion Support ',
    definition: 'Kindergarten inclusion support for children with a disability',
  ),

  /// Hospice Care
  n360(
    code: '360',
    display: 'Hospice Care',
    definition: 'Hospice Care',
  ),

  /// Hospital Services
  n361(
    code: '361',
    display: 'Hospital Services',
    definition: 'Hospital Services',
  ),

  /// Hospital To Home
  n362(
    code: '362',
    display: 'Hospital To Home',
    definition: 'Hospital To Home',
  ),

  /// Hostel
  n364(
    code: '364',
    display: 'Hostel',
    definition: 'Hostel',
  ),

  /// Hostel Accommodation
  n365(
    code: '365',
    display: 'Hostel Accommodation',
    definition: 'Hostel Accommodation',
  ),

  /// Household Items
  n366(
    code: '366',
    display: 'Household Items',
    definition: 'Household Items',
  ),

  /// Hypertension
  n367(
    code: '367',
    display: 'Hypertension',
    definition: 'Hypertension',
  ),

  /// Illness
  n368(
    code: '368',
    display: 'Illness',
    definition: 'Illness',
  ),

  /// Independent Living
  n369(
    code: '369',
    display: 'Independent Living',
    definition: 'Independent Living',
  ),

  /// Kindergarten/preschool
  n37(
    code: '37',
    display: 'Kindergarten/Preschool',
    definition: 'Kindergarten/preschool',
  ),

  /// Information
  n370(
    code: '370',
    display: 'Information',
    definition: 'Information',
  ),

  /// Injury
  n371(
    code: '371',
    display: 'Injury',
    definition: 'Injury',
  ),

  /// Intake
  n372(
    code: '372',
    display: 'Intake',
    definition: 'Intake',
  ),

  /// Intensive Mobile Youth Outreach Services (Imyos)
  n373(
    code: '373',
    display: 'Intensive Mobile You',
    definition: 'Intensive Mobile Youth Outreach Services (Imyos)',
  ),

  /// Intervention
  n374(
    code: '374',
    display: 'Intervention',
    definition: 'Intervention',
  ),

  /// Job Searching
  n375(
    code: '375',
    display: 'Job Searching',
    definition: 'Job Searching',
  ),

  /// Justice
  n376(
    code: '376',
    display: 'Justice',
    definition: 'Justice',
  ),

  /// Leisure
  n377(
    code: '377',
    display: 'Leisure',
    definition: 'Leisure',
  ),

  /// Loans
  n378(
    code: '378',
    display: 'Loans',
    definition: 'Loans',
  ),

  /// Low Income Earners
  n379(
    code: '379',
    display: 'Low Income Earners',
    definition: 'Low Income Earners',
  ),

  /// Long day child care
  n38(
    code: '38',
    display: 'Long Day Child Care',
    definition: 'Long day child care',
  ),

  /// Lung
  n380(
    code: '380',
    display: 'Lung',
    definition: 'Lung',
  ),

  /// Making A Difference
  n381(
    code: '381',
    display: 'Making A Difference',
    definition: 'Making A Difference',
  ),

  /// Medical Services
  n382(
    code: '382',
    display: 'Medical Services',
    definition: 'Medical Services',
  ),

  /// Medical Specialists
  n383(
    code: '383',
    display: 'Medical Specialists',
    definition: 'Medical Specialists',
  ),

  /// Medication Administration
  n384(
    code: '384',
    display: 'Medication Administr',
    definition: 'Medication Administration',
  ),

  /// Menstrual Information
  n385(
    code: '385',
    display: 'Menstrual Informatio',
    definition: 'Menstrual Information',
  ),

  /// Methadone
  n386(
    code: '386',
    display: 'Methadone',
    definition: 'Methadone',
  ),

  /// Mobile Support And Treatment Services (MSTS)
  n387(
    code: '387',
    display: 'Mobile Support And T',
    definition: 'Mobile Support And Treatment Services (MSTS)',
  ),

  /// Motor Neurone
  n388(
    code: '388',
    display: 'Motor Neurone',
    definition: 'Motor Neurone',
  ),

  /// Multiple Sclerosis
  n389(
    code: '389',
    display: 'Multiple Sclerosis',
    definition: 'Multiple Sclerosis',
  ),

  /// Occasional child care
  n39(
    code: '39',
    display: 'Occasional Child Care',
    definition: 'Occasional child care',
  ),

  /// Neighbourhood House
  n390(
    code: '390',
    display: 'Neighbourhood House',
    definition: 'Neighbourhood House',
  ),

  /// Nursing Home
  n391(
    code: '391',
    display: 'Nursing Home',
    definition: 'Nursing Home',
  ),

  /// Nursing Mothers
  n392(
    code: '392',
    display: 'Nursing Mothers',
    definition: 'Nursing Mothers',
  ),

  /// Obesity
  n393(
    code: '393',
    display: 'Obesity',
    definition: 'Obesity',
  ),

  /// Occupational Health & Safety
  n394(
    code: '394',
    display: 'Occupational Health ',
    definition: 'Occupational Health & Safety',
  ),

  /// Optometrist
  n395(
    code: '395',
    display: 'Optometrist',
    definition: 'Optometrist',
  ),

  /// Oral Hygiene
  n396(
    code: '396',
    display: 'Oral Hygiene',
    definition: 'Oral Hygiene',
  ),

  /// Outpatients
  n397(
    code: '397',
    display: 'Outpatients',
    definition: 'Outpatients',
  ),

  /// Outreach Service
  n398(
    code: '398',
    display: 'Outreach Service',
    definition: 'Outreach Service',
  ),

  /// PADP
  n399(
    code: '399',
    display: 'PADP',
    definition: 'PADP',
  ),

  /// Aged Residential Care
  n4(
    code: '4',
    display: 'Aged Residential Care',
    definition: 'Aged Residential Care',
  ),

  /// Outside school hours care
  n40(
    code: '40',
    display: 'Outside School Hours Care',
    definition: 'Outside school hours care',
  ),

  /// Pain
  n400(
    code: '400',
    display: 'Pain',
    definition: 'Pain',
  ),

  /// Pap Smear
  n401(
    code: '401',
    display: 'Pap Smear',
    definition: 'Pap Smear',
  ),

  /// Parenting
  n402(
    code: '402',
    display: 'Parenting',
    definition: 'Parenting',
  ),

  /// Peak Organizations
  n403(
    code: '403',
    display: 'Peak Organizations',
    definition: 'Peak Organizations',
  ),

  /// Personal Care
  n404(
    code: '404',
    display: 'Personal Care',
    definition: 'Personal Care',
  ),

  /// Pharmacies
  n405(
    code: '405',
    display: 'Pharmacies',
    definition: 'Pharmacies',
  ),

  /// Phobias
  n406(
    code: '406',
    display: 'Phobias',
    definition: 'Phobias',
  ),

  /// Physical
  n407(
    code: '407',
    display: 'Physical',
    definition: 'Physical',
  ),

  /// Physical Activity
  n408(
    code: '408',
    display: 'Physical Activity',
    definition: 'Physical Activity',
  ),

  /// Postnatal
  n409(
    code: '409',
    display: 'Postnatal',
    definition: 'Postnatal',
  ),

  /// Children's play programs
  n41(
    code: '41',
    display: "Children's Play Programs",
    definition: "Children's play programs",
  ),

  /// Pregnancy
  n410(
    code: '410',
    display: 'Pregnancy',
    definition: 'Pregnancy',
  ),

  /// Pregnancy Tests
  n411(
    code: '411',
    display: 'Pregnancy Tests',
    definition: 'Pregnancy Tests',
  ),

  /// Preschool
  n412(
    code: '412',
    display: 'Preschool',
    definition: 'Preschool',
  ),

  /// Prescriptions
  n413(
    code: '413',
    display: 'Prescriptions',
    definition: 'Prescriptions',
  ),

  /// Primary Mental Health And Early Intervention Teams
  n414(
    code: '414',
    display: 'Primary Mental Healt',
    definition: 'Primary Mental Health And Early Intervention Teams',
  ),

  /// Property Maintenance
  n415(
    code: '415',
    display: 'Property Maintenance',
    definition: 'Property Maintenance',
  ),

  /// Prostate
  n416(
    code: '416',
    display: 'Prostate',
    definition: 'Prostate',
  ),

  /// Psychiatric
  n417(
    code: '417',
    display: 'Psychiatric',
    definition: 'Psychiatric',
  ),

  /// Psychiatric Disability Support Services - Home-Based Outreach
  n418(
    code: '418',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services - Home-Based Outreach',
  ),

  /// Psychiatric Disability Support Services - Planned Respite
  n419(
    code: '419',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services - Planned Respite',
  ),

  /// Parenting & family management support/education
  n42(
    code: '42',
    display: 'Parenting/Family Support/Education',
    definition: 'Parenting & family management support/education',
  ),

  /// Psychiatric Disability Support Services - Residential Rehabilitation
  n420(
    code: '420',
    display: 'Psychiatric Disabili',
    definition:
        'Psychiatric Disability Support Services - Residential Rehabilitation',
  ),

  /// Psychiatric Disability Support Services Home-Based Outreach
  n421(
    code: '421',
    display: 'Psychiatric Disabili',
    definition: 'Psychiatric Disability Support Services Home-Based Outreach',
  ),

  /// Psychiatric Disability Support Services Mutual Support And Self Help
  n422(
    code: '422',
    display: 'Psychiatric Disabili',
    definition:
        'Psychiatric Disability Support Services Mutual Support And Self Help',
  ),

  /// Psychiatric Support
  n423(
    code: '423',
    display: 'Psychiatric Support',
    definition: 'Psychiatric Support',
  ),

  /// Recreation
  n424(
    code: '424',
    display: 'Recreation',
    definition: 'Recreation',
  ),

  /// Referral
  n425(
    code: '425',
    display: 'Referral',
    definition: 'Referral',
  ),

  /// Refuge
  n426(
    code: '426',
    display: 'Refuge',
    definition: 'Refuge',
  ),

  /// Rent Assistance
  n427(
    code: '427',
    display: 'Rent Assistance',
    definition: 'Rent Assistance',
  ),

  /// Residential Facilities
  n428(
    code: '428',
    display: 'Residential Faciliti',
    definition: 'Residential Facilities',
  ),

  /// Residential Respite
  n429(
    code: '429',
    display: 'Residential Respite',
    definition: 'Residential Respite',
  ),

  /// Playgroup
  n43(
    code: '43',
    display: 'Playgroup',
    definition: 'Playgroup',
  ),

  /// Respiratory
  n430(
    code: '430',
    display: 'Respiratory',
    definition: 'Respiratory',
  ),

  /// Response
  n431(
    code: '431',
    display: 'Response',
    definition: 'Response',
  ),

  /// Rooming Houses
  n432(
    code: '432',
    display: 'Rooming Houses',
    definition: 'Rooming Houses',
  ),

  /// Safe Sex
  n433(
    code: '433',
    display: 'Safe Sex',
    definition: 'Safe Sex',
  ),

  /// Secure Extended Care Inpatient Services
  n434(
    code: '434',
    display: 'Secure Extended Care',
    definition: 'Secure Extended Care Inpatient Services',
  ),

  /// Self Help
  n435(
    code: '435',
    display: 'Self Help',
    definition: 'Self Help',
  ),

  /// Separation
  n436(
    code: '436',
    display: 'Separation',
    definition: 'Separation',
  ),

  /// Services
  n437(
    code: '437',
    display: 'Services',
    definition: 'Services',
  ),

  /// Sex Education
  n438(
    code: '438',
    display: 'Sex Education',
    definition: 'Sex Education',
  ),

  /// Sexual Abuse
  n439(
    code: '439',
    display: 'Sexual Abuse',
    definition: 'Sexual Abuse',
  ),

  /// School nursing
  n44(
    code: '44',
    display: 'School Nursing',
    definition: 'School nursing',
  ),

  /// Sexual Issues
  n440(
    code: '440',
    display: 'Sexual Issues',
    definition: 'Sexual Issues',
  ),

  /// Sexually Transmitted Diseases
  n441(
    code: '441',
    display: 'Sexually Transmitted',
    definition: 'Sexually Transmitted Diseases',
  ),

  /// SIDS
  n442(
    code: '442',
    display: 'SIDS',
    definition: 'SIDS',
  ),

  /// Social Support
  n443(
    code: '443',
    display: 'Social Support',
    definition: 'Social Support',
  ),

  /// Socialisation
  n444(
    code: '444',
    display: 'Socialisation',
    definition: 'Socialisation',
  ),

  /// Special Needs
  n445(
    code: '445',
    display: 'Special Needs',
    definition: 'Special Needs',
  ),

  /// Speech Therapist
  n446(
    code: '446',
    display: 'Speech Therapist',
    definition: 'Speech Therapist',
  ),

  /// Splinting
  n447(
    code: '447',
    display: 'Splinting',
    definition: 'Splinting',
  ),

  /// Sport
  n448(
    code: '448',
    display: 'Sport',
    definition: 'Sport',
  ),

  /// Statewide And Specialist Services
  n449(
    code: '449',
    display: 'Statewide And Specia',
    definition: 'Statewide And Specialist Services',
  ),

  /// Toy library
  n45(
    code: '45',
    display: 'Toy Library',
    definition: 'Toy library',
  ),

  /// STD
  n450(
    code: '450',
    display: 'STD',
    definition: 'STD',
  ),

  /// STI
  n451(
    code: '451',
    display: 'STI',
    definition: 'STI',
  ),

  /// Stillbirth
  n452(
    code: '452',
    display: 'Stillbirth',
    definition: 'Stillbirth',
  ),

  /// Stomal Care
  n453(
    code: '453',
    display: 'Stomal Care',
    definition: 'Stomal Care',
  ),

  /// Stroke
  n454(
    code: '454',
    display: 'Stroke',
    definition: 'Stroke',
  ),

  /// Substance Abuse
  n455(
    code: '455',
    display: 'Substance Abuse',
    definition: 'Substance Abuse',
  ),

  /// Support
  n456(
    code: '456',
    display: 'Support',
    definition: 'Support',
  ),

  /// Syringes
  n457(
    code: '457',
    display: 'Syringes',
    definition: 'Syringes',
  ),

  /// Teeth
  n458(
    code: '458',
    display: 'Teeth',
    definition: 'Teeth',
  ),

  /// Tenancy Advice
  n459(
    code: '459',
    display: 'Tenancy Advice',
    definition: 'Tenancy Advice',
  ),

  /// Child protection/child abuse report
  n46(
    code: '46',
    display: 'Child Protection/Child Abuse Report',
    definition: 'Child protection/child abuse report',
  ),

  /// Terminal Illness
  n460(
    code: '460',
    display: 'Terminal Illness',
    definition: 'Terminal Illness',
  ),

  /// Therapy
  n461(
    code: '461',
    display: 'Therapy',
    definition: 'Therapy',
  ),

  /// Transcription
  n462(
    code: '462',
    display: 'Transcription',
    definition: 'Transcription',
  ),

  /// Translating Services
  n463(
    code: '463',
    display: 'Translating Services',
    definition: 'Translating Services',
  ),

  /// Translator
  n464(
    code: '464',
    display: 'Translator',
    definition: 'Translator',
  ),

  /// Transport
  n465(
    code: '465',
    display: 'Transport',
    definition: 'Transport',
  ),

  /// Vertebrae
  n466(
    code: '466',
    display: 'Vertebrae',
    definition: 'Vertebrae',
  ),

  /// Violence
  n467(
    code: '467',
    display: 'Violence',
    definition: 'Violence',
  ),

  /// Vocational Guidance
  n468(
    code: '468',
    display: 'Vocational Guidance',
    definition: 'Vocational Guidance',
  ),

  /// Weight
  n469(
    code: '469',
    display: 'Weight',
    definition: 'Weight',
  ),

  /// Foster care
  n47(
    code: '47',
    display: 'Foster Care',
    definition: 'Foster care',
  ),

  /// Welfare Assistance
  n470(
    code: '470',
    display: 'Welfare Assistance',
    definition: 'Welfare Assistance',
  ),

  /// Welfare Counselling
  n471(
    code: '471',
    display: 'Welfare Counselling',
    definition: 'Welfare Counselling',
  ),

  /// Wheelchairs
  n472(
    code: '472',
    display: 'Wheelchairs',
    definition: 'Wheelchairs',
  ),

  /// Wound Management
  n473(
    code: '473',
    display: 'Wound Management',
    definition: 'Wound Management',
  ),

  /// Young People At Risk
  n474(
    code: '474',
    display: 'Young People At Risk',
    definition: 'Young People At Risk',
  ),

  /// Further Description - Community Health Care
  n475(
    code: '475',
    display: 'Further Desc. - Community Health Care',
    definition: 'Further Description - Community Health Care',
  ),

  /// Library
  n476(
    code: '476',
    display: 'Library',
    definition: 'Library',
  ),

  /// Community Hours
  n477(
    code: '477',
    display: 'Community Hours',
    definition: 'Community Hours',
  ),

  /// Further Description - Specialist Medical
  n478(
    code: '478',
    display: 'Further Desc. - Specialist Medical',
    definition: 'Further Description - Specialist Medical',
  ),

  /// Hepatology
  n479(
    code: '479',
    display: 'Hepatology',
    definition: 'Hepatology',
  ),

  /// Residential/ out of home care
  n48(
    code: '48',
    display: 'Residential/Out-of-Home Care',
    definition: 'Residential/ out of home care',
  ),

  /// Gastroenterology
  n480(
    code: '480',
    display: 'Gastroenterology ',
    definition: 'Gastroenterology',
  ),

  /// Gynaecology
  n481(
    code: '481',
    display: 'Gynaecology',
    definition: 'Gynaecology',
  ),

  /// Obstetrics
  n482(
    code: '482',
    display: 'Obstetrics',
    definition: 'Obstetrics',
  ),

  /// Further Description - Specialist Surgical
  n483(
    code: '483',
    display: 'Further Desc. - Specialist Surgical',
    definition: 'Further Description - Specialist Surgical',
  ),

  /// Placement Protection
  n484(
    code: '484',
    display: 'Placement Protection',
    definition: 'Placement Protection',
  ),

  /// Family Violence
  n485(
    code: '485',
    display: 'Family Violence',
    definition: 'Family Violence',
  ),

  /// Integrated Family Services
  n486(
    code: '486',
    display: 'Integrated Family Services',
    definition: 'Integrated Family Services',
  ),

  /// Diabetes Educator
  n488(
    code: '488',
    display: 'Diabetes Educator',
    definition: 'Diabetes Educator',
  ),

  /// Kinship Care
  n489(
    code: '489',
    display: 'Kinship Care',
    definition: 'Kinship Care',
  ),

  /// Support for young people leaving care
  n49(
    code: '49',
    display: 'Support - Young People Leaving Care',
    definition: 'Support for young people leaving care',
  ),

  /// General Mental Health Services
  n490(
    code: '490',
    display: 'General Mental Health Services',
    definition: 'General Mental Health Services',
  ),

  /// Exercise Physiology
  n491(
    code: '491',
    display: 'Exercise Physiology',
    definition: 'Exercise Physiology',
  ),

  /// Medical Research
  n492(
    code: '492',
    display: 'Medical Research',
    definition: 'Medical Research',
  ),

  /// Youth
  n493(
    code: '493',
    display: 'Youth',
    definition: 'Youth',
  ),

  /// Youth Services
  n494(
    code: '494',
    display: 'Youth Services',
    definition: 'Youth Services',
  ),

  /// Youth Health
  n495(
    code: '495',
    display: 'Youth Health',
    definition: 'Youth Health',
  ),

  /// Child and Family Services
  n496(
    code: '496',
    display: 'Child and Family Ser',
    definition: 'Child and Family Services',
  ),

  /// Home Visits
  n497(
    code: '497',
    display: 'Home Visits',
    definition: 'Home Visits',
  ),

  /// Mobile Services
  n498(
    code: '498',
    display: 'Mobile Services',
    definition: 'Mobile Services',
  ),

  /// Case management for older persons
  n5(
    code: '5',
    display: 'Case Management for Older Persons',
    definition: 'Case management for older persons',
  ),

  /// Audiology
  n50(
    code: '50',
    display: 'Audiology',
    definition: 'Audiology',
  ),

  /// Before and/or After School Care
  n500(
    code: '500',
    display: 'Before and/or After ',
    definition: 'Before and/or After School Care',
  ),

  /// Cancer Services
  n501(
    code: '501',
    display: 'Cancer Services',
    definition: 'Cancer Services',
  ),

  /// Integrated Cancer Services
  n502(
    code: '502',
    display: 'Integrated Cancer Se',
    definition: 'Integrated Cancer Services',
  ),

  /// Multidisciplinary Services
  n503(
    code: '503',
    display: 'Multidisciplinary Se',
    definition: 'Multidisciplinary Services',
  ),

  /// Multidisciplinary Cancer Services
  n504(
    code: '504',
    display: 'Multidisciplinary Ca',
    definition: 'Multidisciplinary Cancer Services',
  ),

  /// Meetings
  n505(
    code: '505',
    display: 'Meetings',
    definition: 'Meetings',
  ),

  /// Blood pressure monitoring
  n506(
    code: '506',
    display: 'Blood pressure monit',
    definition: 'Blood pressure monitoring',
  ),

  /// Dose administration aid
  n507(
    code: '507',
    display: 'Dose administration ',
    definition: 'Dose administration aid',
  ),

  /// Medical Equipment Hire
  n508(
    code: '508',
    display: 'Medical Equipment Hi',
    definition: 'Medical Equipment Hire',
  ),

  /// Parenting & family support/education
  n509(
    code: '509',
    display: 'Parenting/Family Support/Education',
    definition: 'Parenting & family support/education',
  ),

  /// Blood donation
  n51(
    code: '51',
    display: 'Blood Donation',
    definition: 'Blood donation',
  ),

  /// Deputising Service
  n510(
    code: '510',
    display: 'Deputising Service',
    definition: 'Deputising Service',
  ),

  /// Cancer Support Groups
  n513(
    code: '513',
    display: 'Cancer Support Groups',
    definition: 'Cancer Support Groups',
  ),

  /// Community Cancer Services
  n514(
    code: '514',
    display: 'Community Cancer Services',
    definition: 'Community Cancer Services',
  ),

  /// Chiropractic
  n52(
    code: '52',
    display: 'Chiropractic',
    definition: 'Chiropractic',
  ),

  /// Dietetics
  n53(
    code: '53',
    display: 'Dietetics',
    definition: 'Dietetics',
  ),

  /// Disability Care Transport
  n530(
    code: '530',
    display: 'Disability Care Transport',
    definition: 'Disability Care Transport',
  ),

  /// Aged Care Transport
  n531(
    code: '531',
    display: 'Aged Care Transport',
    definition: 'Aged Care Transport',
  ),

  /// Diabetes Education service
  n532(
    code: '532',
    display: 'Diabetes Education s',
    definition: 'Diabetes Education service',
  ),

  /// Cardiac Rehabilitation Service
  n533(
    code: '533',
    display: 'Cardiac Rehabilitati',
    definition: 'Cardiac Rehabilitation Service ',
  ),

  /// Young Adult Diabetes services (YADS)
  n534(
    code: '534',
    display: 'Young Adult Diabetes',
    definition: 'Young Adult Diabetes services (YADS)',
  ),

  /// Pulmonary Rehabilitation Service
  n535(
    code: '535',
    display: 'Pulmonary Rehabilita',
    definition: 'Pulmonary Rehabilitation Service',
  ),

  /// Art therapy
  n536(
    code: '536',
    display: 'Art therapy ',
    definition: 'Art therapy',
  ),

  /// Medication Reviews
  n537(
    code: '537',
    display: 'Medication Reviews',
    definition: 'Medication Reviews',
  ),

  /// Telephone Counselling
  n538(
    code: '538',
    display: 'Telephone Counselling',
    definition: 'Telephone Counselling',
  ),

  /// Telephone Help Line
  n539(
    code: '539',
    display: 'Telephone Help Line',
    definition: 'Telephone Help Line',
  ),

  /// Family planning
  n54(
    code: '54',
    display: 'Family Planning',
    definition: 'Family planning',
  ),

  /// Online Service
  n540(
    code: '540',
    display: 'Online Service',
    definition: 'Online Service',
  ),

  /// Crisis - Mental Health
  n541(
    code: '541',
    display: 'Crisis - Mental Health',
    definition: 'Crisis - Mental Health',
  ),

  /// Youth Crisis
  n542(
    code: '542',
    display: 'Youth Crisis',
    definition: 'Youth Crisis',
  ),

  /// Sexual Assault
  n543(
    code: '543',
    display: 'Sexual Assault',
    definition: 'Sexual Assault',
  ),

  /// GPAH Other
  n544(
    code: '544',
    display: 'GPAH Other',
    definition: 'GPAH Other',
  ),

  /// Paediatric Dermatology
  n545(
    code: '545',
    display: 'Paediatric Dermatology',
    definition: 'Paediatric Dermatology',
  ),

  /// Veterans Services
  n546(
    code: '546',
    display: 'Veterans Services',
    definition: 'Veterans Services',
  ),

  /// Veterans
  n547(
    code: '547',
    display: 'Veterans',
    definition: 'Veterans',
  ),

  /// Food Relief/food/meals
  n548(
    code: '548',
    display: 'Food Relief/Food/Meals',
    definition: 'Food Relief/food/meals',
  ),

  /// Health advocacy/Liaison service
  n55(
    code: '55',
    display: 'Health Advocacy/Liaison Service',
    definition: 'Health advocacy/Liaison service',
  ),

  /// Dementia Care
  n550(
    code: '550',
    display: 'Dementia Care',
    definition: 'Dementia Care',
  ),

  /// Alzheimer
  n551(
    code: '551',
    display: 'Alzheimer',
    definition: 'Alzheimer',
  ),

  /// Drug and/or alcohol support groups
  n552(
    code: '552',
    display: 'Drug and/or Alcohol Support Groups',
    definition: 'Drug and/or alcohol support groups',
  ),

  /// One on One Support/Mentoring/Coaching
  n553(
    code: '553',
    display: '1-on-1 Support /Mentoring /Coaching',
    definition: 'One on One Support/Mentoring/Coaching',
  ),

  /// Chronic Disease Management
  n554(
    code: '554',
    display: 'Chronic Disease Management',
    definition: 'Chronic Disease Management',
  ),

  /// Liaison Services
  n555(
    code: '555',
    display: 'Liaison Services',
    definition: 'Liaison Services',
  ),

  /// Walk in Centre / non emergency
  n556(
    code: '556',
    display: 'Walk-in Centre /Non-Emergency',
    definition: 'Walk in Centre / non emergency',
  ),

  /// Inpatients
  n557(
    code: '557',
    display: 'Inpatients',
    definition: 'Inpatients',
  ),

  /// Spiritual Counselling
  n558(
    code: '558',
    display: 'Spiritual Counselling',
    definition: 'Spiritual Counselling',
  ),

  /// Women's Health
  n559(
    code: '559',
    display: "Women's Health",
    definition: "Women's Health",
  ),

  /// Health information/referral
  n56(
    code: '56',
    display: 'Health Information/Referral',
    definition: 'Health information/referral',
  ),

  /// Men's Health
  n560(
    code: '560',
    display: "Men's Health",
    definition: "Men's Health",
  ),

  /// Health education/Health awareness program
  n561(
    code: '561',
    display: 'Health Education/Awareness Program',
    definition: 'Health education/Health awareness program',
  ),

  /// Test Message
  n562(
    code: '562',
    display: 'Test Message',
    definition: 'Test Message',
  ),

  /// Remedial Massage
  n563(
    code: '563',
    display: 'Remedial Massage',
    definition: 'Remedial Massage',
  ),

  /// Adolescent Mental Health Services
  n564(
    code: '564',
    display: 'Adolescent Mental Health Services',
    definition: 'Adolescent Mental Health Services',
  ),

  /// Youth drop in/assistance/support
  n565(
    code: '565',
    display: 'Youth Drop In/Assistance/Support',
    definition: 'Youth drop in/assistance/support',
  ),

  /// Aboriginal Health Worker
  n566(
    code: '566',
    display: 'Aboriginal Health Worker',
    definition: 'Aboriginal Health Worker',
  ),

  /// Women's Health Clinic
  n567(
    code: '567',
    display: "Women's Health Clinic",
    definition: "Women's Health Clinic",
  ),

  /// Men's Health Clinic
  n568(
    code: '568',
    display: "Men's Health Clinic",
    definition: "Men's Health Clinic ",
  ),

  /// Migrant Health Clinic
  n569(
    code: '569',
    display: 'Migrant Health Clinic',
    definition: 'Migrant Health Clinic',
  ),

  /// Immunization
  n57(
    code: '57',
    display: 'Immunization',
    definition: 'Immunization',
  ),

  /// Refugee Health Clinic
  n570(
    code: '570',
    display: 'Refugee Health Clinic',
    definition: 'Refugee Health Clinic',
  ),

  /// Aboriginal Health Clinic
  n571(
    code: '571',
    display: 'Aboriginal Health Clinic',
    definition: 'Aboriginal Health Clinic',
  ),

  /// Nurse Practitioner lead Clinic/s
  n572(
    code: '572',
    display: 'Nurse Practitioner Lead Clinic/s',
    definition: 'Nurse Practitioner lead Clinic/s',
  ),

  /// Nurse lead Clinic/s
  n573(
    code: '573',
    display: 'Nurse Lead Clinic/s',
    definition: 'Nurse lead Clinic/s',
  ),

  /// Culturally tailored support groups
  n574(
    code: '574',
    display: 'Culturally Tailored Support Groups',
    definition: 'Culturally tailored support groups',
  ),

  /// Culturally tailored health promotion
  n575(
    code: '575',
    display: 'Culturally Tailored Health Promotion',
    definition: 'Culturally tailored health promotion',
  ),

  /// Rehabilitation
  n576(
    code: '576',
    display: 'Rehabilitation',
    definition: 'Rehabilitation',
  ),

  /// Education information/referral
  n577(
    code: '577',
    display: 'Education Information/Referral',
    definition: 'Education information/referral',
  ),

  /// Maternal & child health
  n58(
    code: '58',
    display: 'Maternal & Child Health',
    definition: 'Maternal & child health',
  ),

  /// Social Work
  n580(
    code: '580',
    display: 'Social Work',
    definition: 'Social Work',
  ),

  /// Haematology
  n581(
    code: '581',
    display: 'Haematology',
    definition: 'Haematology',
  ),

  /// Maternity Shared Care
  n582(
    code: '582',
    display: 'Maternity Shared Car',
    definition: 'Maternity Shared Care',
  ),

  /// Rehabilitation Service
  n583(
    code: '583',
    display: 'Rehabilitation Servi',
    definition: 'Rehabilitation Service',
  ),

  /// Cranio-Sacral Therapy
  n584(
    code: '584',
    display: 'Cranio-sacral Therapy',
    definition: 'Cranio-Sacral Therapy',
  ),

  /// Prosthetics & Orthotics
  n585(
    code: '585',
    display: 'Prosthetics & Orthotics',
    definition: 'Prosthetics & Orthotics',
  ),

  /// Home Medicine Review
  n589(
    code: '589',
    display: 'Home Medicine Review',
    definition: 'Home Medicine Review',
  ),

  /// Nursing
  n59(
    code: '59',
    display: 'Nursing',
    definition: 'Nursing',
  ),

  /// GPAH - Medical
  n590(
    code: '590',
    display: 'GPAH - Medical',
    definition: 'GPAH - Medical',
  ),

  /// Music Therapy
  n591(
    code: '591',
    display: 'Music Therapy',
    definition: 'Music Therapy',
  ),

  /// Falls Prevention
  n593(
    code: '593',
    display: 'Falls Prevention',
    definition: 'Falls Prevention',
  ),

  /// Accommodation/Tenancy
  n599(
    code: '599',
    display: 'Accommodation/Tenancy',
    definition: 'Accommodation/Tenancy',
  ),

  /// Delivered meals (meals on wheels)
  n6(
    code: '6',
    display: 'Delivered Meals (Meals On Wheels)',
    definition: 'Delivered meals (meals on wheels)',
  ),

  /// Nutrition
  n60(
    code: '60',
    display: 'Nutrition',
    definition: 'Nutrition',
  ),

  /// Assess-Skill, Ability, Needs
  n600(
    code: '600',
    display: 'Assess-Skill, Ability, Needs',
    definition: 'Assess-Skill, Ability, Needs',
  ),

  /// Assist Access/Maintain Employ
  n601(
    code: '601',
    display: 'Assist Access/Maintain Employ',
    definition: 'Assist Access/Maintain Employ',
  ),

  /// Assist Prod-Pers Care/Safety
  n602(
    code: '602',
    display: 'Assist Prod-Pers Care/Safety',
    definition: 'Assist Prod-Pers Care/Safety',
  ),

  /// Assist-Integrate School/Ed
  n603(
    code: '603',
    display: 'Assist-Integrate School/Ed',
    definition: 'Assist-Integrate School/Ed',
  ),

  /// Assist-Life Stage, Transition
  n604(
    code: '604',
    display: 'Assist-Life Stage, Transition',
    definition: 'Assist-Life Stage, Transition',
  ),

  /// Assist-Personal Activities
  n605(
    code: '605',
    display: 'Assist-Personal Activities',
    definition: 'Assist-Personal Activities',
  ),

  /// Assist-Travel/Transport
  n606(
    code: '606',
    display: 'Assist-Travel/Transport',
    definition: 'Assist-Travel/Transport',
  ),

  /// Assistive Equip-General Tasks
  n607(
    code: '607',
    display: 'Assistive Equip-General Tasks',
    definition: 'Assistive Equip-General Tasks',
  ),

  /// Assistive Equip-Recreation
  n608(
    code: '608',
    display: 'Assistive Equip-Recreation',
    definition: 'Assistive Equip-Recreation',
  ),

  /// Assistive Prod-Household Task
  n609(
    code: '609',
    display: 'Assistive Prod-Household Task',
    definition: 'Assistive Prod-Household Task',
  ),

  /// Occupational therapy
  n61(
    code: '61',
    display: 'Occupational Therapy',
    definition: 'Occupational therapy',
  ),

  /// Behavior Support
  n610(
    code: '610',
    display: 'Behavior Support',
    definition: 'Behavior Support',
  ),

  /// Comms & Info Equipment
  n611(
    code: '611',
    display: 'Comms & Info Equipment',
    definition: 'Comms & Info Equipment',
  ),

  /// Community Nursing Care
  n612(
    code: '612',
    display: 'Community Nursing Care',
    definition: 'Community Nursing Care',
  ),

  /// Daily Tasks/Shared Living
  n613(
    code: '613',
    display: 'Daily Tasks/Shared Living',
    definition: 'Daily Tasks/Shared Living',
  ),

  /// Development-Life Skills
  n614(
    code: '614',
    display: 'Development-Life Skills',
    definition: 'Development-Life Skills',
  ),

  /// Early Childhood Supports
  n615(
    code: '615',
    display: 'Early Childhood Supports',
    definition: 'Early Childhood Supports',
  ),

  /// Equipment Special Assess Setup
  n616(
    code: '616',
    display: 'Equipment Special Assess Setup',
    definition: 'Equipment Special Assess Setup',
  ),

  /// Hearing Equipment
  n617(
    code: '617',
    display: 'Hearing Equipment',
    definition: 'Hearing Equipment',
  ),

  /// Home Modification
  n618(
    code: '618',
    display: 'Home Modification',
    definition: 'Home Modification',
  ),

  /// Household Tasks
  n619(
    code: '619',
    display: 'Household Tasks',
    definition: 'Household Tasks',
  ),

  /// Optometry
  n62(
    code: '62',
    display: 'Optometry',
    definition: 'Optometry',
  ),

  /// Interpret/Translate
  n620(
    code: '620',
    display: 'Interpret/Translate',
    definition: 'Interpret/Translate',
  ),

  /// Other Innovative Supports
  n621(
    code: '621',
    display: 'Other Innovative Supports',
    definition: 'Other Innovative Supports',
  ),

  /// Participate Community
  n622(
    code: '622',
    display: 'Participate Community',
    definition: 'Participate Community',
  ),

  /// Personal Mobility Equipment
  n623(
    code: '623',
    display: 'Personal Mobility Equipment',
    definition: 'Personal Mobility Equipment',
  ),

  /// Physical Wellbeing
  n624(
    code: '624',
    display: 'Physical Wellbeing',
    definition: 'Physical Wellbeing',
  ),

  /// Plan Management
  n625(
    code: '625',
    display: 'Plan Management',
    definition: 'Plan Management',
  ),

  /// Therapeutic Supports
  n626(
    code: '626',
    display: 'Therapeutic Supports',
    definition: 'Therapeutic Supports',
  ),

  /// Training-Travel Independence
  n627(
    code: '627',
    display: 'Training-Travel Independence',
    definition: 'Training-Travel Independence',
  ),

  /// Vehicle modifications
  n628(
    code: '628',
    display: 'Vehicle modifications',
    definition: 'Vehicle modifications',
  ),

  /// Vision Equipment
  n629(
    code: '629',
    display: 'Vision Equipment',
    definition: 'Vision Equipment',
  ),

  /// Osteopathy
  n63(
    code: '63',
    display: 'Osteopathy',
    definition: 'Osteopathy',
  ),

  /// Pharmacy
  n64(
    code: '64',
    display: 'Pharmacy',
    definition: 'Pharmacy',
  ),

  /// Physiotherapy
  n65(
    code: '65',
    display: 'Physiotherapy',
    definition: 'Physiotherapy',
  ),

  /// Podiatry
  n66(
    code: '66',
    display: 'Podiatry',
    definition: 'Podiatry',
  ),

  /// Sexual health
  n67(
    code: '67',
    display: 'Sexual Health',
    definition: 'Sexual health',
  ),

  /// Speech pathology/therapy
  n68(
    code: '68',
    display: 'Speech Pathology/Therapy',
    definition: 'Speech pathology/therapy',
  ),

  /// Bereavement counselling
  n69(
    code: '69',
    display: 'Bereavement Counselling',
    definition: 'Bereavement counselling',
  ),

  /// Friendly visiting
  n7(
    code: '7',
    display: 'Friendly Visiting',
    definition: 'Friendly visiting',
  ),

  /// Crisis counselling
  n70(
    code: '70',
    display: 'Crisis Counselling',
    definition: 'Crisis counselling',
  ),

  /// Family counselling and/or family therapy
  n71(
    code: '71',
    display: 'Family Counselling/Therapy',
    definition: 'Family counselling and/or family therapy',
  ),

  /// Family violence counselling
  n72(
    code: '72',
    display: 'Family Violence Counselling',
    definition: 'Family violence counselling',
  ),

  /// Financial counselling
  n73(
    code: '73',
    display: 'Financial Counselling',
    definition: 'Financial counselling',
  ),

  /// Generalist counselling
  n74(
    code: '74',
    display: 'Generalist Counselling',
    definition: 'Generalist counselling',
  ),

  /// Genetic counselling
  n75(
    code: '75',
    display: 'Genetic Counselling',
    definition: 'Genetic counselling',
  ),

  /// Health counselling
  n76(
    code: '76',
    display: 'Health Counselling',
    definition: 'Health counselling',
  ),

  /// Mediation
  n77(
    code: '77',
    display: 'Mediation',
    definition: 'Mediation',
  ),

  /// Problem gambling counselling
  n78(
    code: '78',
    display: 'Problem Gambling Counselling',
    definition: 'Problem gambling counselling',
  ),

  /// Relationship counselling
  n79(
    code: '79',
    display: 'Relationship Counselling',
    definition: 'Relationship counselling',
  ),

  /// Home care/housekeeping assistance
  n8(
    code: '8',
    display: 'Home Care/Housekeeping Assistance',
    definition: 'Home care/housekeeping assistance',
  ),

  /// Sexual assault counselling
  n80(
    code: '80',
    display: 'Sexual Assault Counselling',
    definition: 'Sexual assault counselling',
  ),

  /// Trauma counselling
  n81(
    code: '81',
    display: 'Trauma Counselling',
    definition: 'Trauma counselling',
  ),

  /// Victims of crime counselling
  n82(
    code: '82',
    display: 'Victims of Crime Counselling',
    definition: 'Victims of crime counselling',
  ),

  /// Cemetery operation
  n83(
    code: '83',
    display: 'Cemetery Operation',
    definition: 'Cemetery operation',
  ),

  /// Cremation
  n84(
    code: '84',
    display: 'Cremation',
    definition: 'Cremation',
  ),

  /// Death service information
  n85(
    code: '85',
    display: 'Death Service Information',
    definition: 'Death service information',
  ),

  /// Funeral services
  n86(
    code: '86',
    display: 'Funeral Services',
    definition: 'Funeral services',
  ),

  /// Endodontic
  n87(
    code: '87',
    display: 'Endodontic',
    definition: 'Endodontic',
  ),

  /// General dental
  n88(
    code: '88',
    display: 'General Dental',
    definition: 'General dental',
  ),

  /// Oral medicine
  n89(
    code: '89',
    display: 'Oral Medicine',
    definition: 'Oral medicine',
  ),

  /// Home maintenance and repair
  n9(
    code: '9',
    display: 'Home Maintenance and Repair',
    definition: 'Home maintenance and repair',
  ),

  /// Oral surgery
  n90(
    code: '90',
    display: 'Oral Surgery',
    definition: 'Oral surgery',
  ),

  /// Orthodontic
  n91(
    code: '91',
    display: 'Orthodontic',
    definition: 'Orthodontic',
  ),

  /// Paediatric Dentistry
  n92(
    code: '92',
    display: 'Paediatric Dentistry',
    definition: 'Paediatric Dentistry',
  ),

  /// Periodontic
  n93(
    code: '93',
    display: 'Periodontic',
    definition: 'Periodontic',
  ),

  /// Prosthodontic
  n94(
    code: '94',
    display: 'Prosthodontic',
    definition: 'Prosthodontic',
  ),

  /// Acquired brain injury information/referral
  n95(
    code: '95',
    display: 'Acquired Brain Injury Info/Referral',
    definition: 'Acquired brain injury information/referral',
  ),

  /// Disability advocacy
  n96(
    code: '96',
    display: 'Disability Advocacy',
    definition: 'Disability advocacy',
  ),

  /// Disability aids & equipment
  n97(
    code: '97',
    display: 'Disability Aids & Equipment',
    definition: 'Disability aids & equipment',
  ),

  /// Disability case management
  n98(
    code: '98',
    display: 'Disability Case Management',
    definition: 'Disability case management',
  ),

  /// Disability day programs & activities
  n99(
    code: '99',
    display: 'Disability Day Programs/Activities',
    definition: 'Disability day programs & activities',
  );

  const ServiceType({
    required this.code,
    required this.display,
    required this.definition,
  });

  /// The property that represents the unique identifier
  /// for a specific concept within the value set.
  @override
  final String code;

  /// A human-readable string to display to the user.
  @override
  final String display;

  /// Provides a more detailed explanation or description of the concept
  @override
  final String definition;

  /// Returns the enum value based on the string code, and returns null if
  /// no match is found
  static ServiceType? fromCode(String code) => switch (code) {
        ('1') => ServiceType.n1,
        ('10') => ServiceType.n10,
        ('100') => ServiceType.n100,
        ('101') => ServiceType.n101,
        ('102') => ServiceType.n102,
        ('103') => ServiceType.n103,
        ('104') => ServiceType.n104,
        ('105') => ServiceType.n105,
        ('106') => ServiceType.n106,
        ('107') => ServiceType.n107,
        ('108') => ServiceType.n108,
        ('109') => ServiceType.n109,
        ('11') => ServiceType.n11,
        ('110') => ServiceType.n110,
        ('111') => ServiceType.n111,
        ('112') => ServiceType.n112,
        ('113') => ServiceType.n113,
        ('114') => ServiceType.n114,
        ('115') => ServiceType.n115,
        ('116') => ServiceType.n116,
        ('117') => ServiceType.n117,
        ('118') => ServiceType.n118,
        ('119') => ServiceType.n119,
        ('12') => ServiceType.n12,
        ('120') => ServiceType.n120,
        ('121') => ServiceType.n121,
        ('122') => ServiceType.n122,
        ('123') => ServiceType.n123,
        ('124') => ServiceType.n124,
        ('125') => ServiceType.n125,
        ('126') => ServiceType.n126,
        ('127') => ServiceType.n127,
        ('128') => ServiceType.n128,
        ('129') => ServiceType.n129,
        ('13') => ServiceType.n13,
        ('130') => ServiceType.n130,
        ('131') => ServiceType.n131,
        ('132') => ServiceType.n132,
        ('133') => ServiceType.n133,
        ('134') => ServiceType.n134,
        ('135') => ServiceType.n135,
        ('136') => ServiceType.n136,
        ('137') => ServiceType.n137,
        ('138') => ServiceType.n138,
        ('139') => ServiceType.n139,
        ('14') => ServiceType.n14,
        ('140') => ServiceType.n140,
        ('141') => ServiceType.n141,
        ('142') => ServiceType.n142,
        ('143') => ServiceType.n143,
        ('144') => ServiceType.n144,
        ('145') => ServiceType.n145,
        ('146') => ServiceType.n146,
        ('147') => ServiceType.n147,
        ('148') => ServiceType.n148,
        ('149') => ServiceType.n149,
        ('15') => ServiceType.n15,
        ('150') => ServiceType.n150,
        ('151') => ServiceType.n151,
        ('152') => ServiceType.n152,
        ('153') => ServiceType.n153,
        ('154') => ServiceType.n154,
        ('155') => ServiceType.n155,
        ('156') => ServiceType.n156,
        ('157') => ServiceType.n157,
        ('158') => ServiceType.n158,
        ('159') => ServiceType.n159,
        ('16') => ServiceType.n16,
        ('160') => ServiceType.n160,
        ('161') => ServiceType.n161,
        ('162') => ServiceType.n162,
        ('163') => ServiceType.n163,
        ('164') => ServiceType.n164,
        ('165') => ServiceType.n165,
        ('166') => ServiceType.n166,
        ('167') => ServiceType.n167,
        ('168') => ServiceType.n168,
        ('169') => ServiceType.n169,
        ('17') => ServiceType.n17,
        ('170') => ServiceType.n170,
        ('171') => ServiceType.n171,
        ('172') => ServiceType.n172,
        ('173') => ServiceType.n173,
        ('174') => ServiceType.n174,
        ('175') => ServiceType.n175,
        ('176') => ServiceType.n176,
        ('177') => ServiceType.n177,
        ('178') => ServiceType.n178,
        ('179') => ServiceType.n179,
        ('18') => ServiceType.n18,
        ('180') => ServiceType.n180,
        ('181') => ServiceType.n181,
        ('182') => ServiceType.n182,
        ('183') => ServiceType.n183,
        ('184') => ServiceType.n184,
        ('185') => ServiceType.n185,
        ('186') => ServiceType.n186,
        ('187') => ServiceType.n187,
        ('188') => ServiceType.n188,
        ('189') => ServiceType.n189,
        ('19') => ServiceType.n19,
        ('190') => ServiceType.n190,
        ('191') => ServiceType.n191,
        ('192') => ServiceType.n192,
        ('193') => ServiceType.n193,
        ('194') => ServiceType.n194,
        ('195') => ServiceType.n195,
        ('196') => ServiceType.n196,
        ('197') => ServiceType.n197,
        ('198') => ServiceType.n198,
        ('199') => ServiceType.n199,
        ('2') => ServiceType.n2,
        ('20') => ServiceType.n20,
        ('200') => ServiceType.n200,
        ('201') => ServiceType.n201,
        ('202') => ServiceType.n202,
        ('203') => ServiceType.n203,
        ('204') => ServiceType.n204,
        ('205') => ServiceType.n205,
        ('206') => ServiceType.n206,
        ('207') => ServiceType.n207,
        ('208') => ServiceType.n208,
        ('209') => ServiceType.n209,
        ('21') => ServiceType.n21,
        ('210') => ServiceType.n210,
        ('211') => ServiceType.n211,
        ('212') => ServiceType.n212,
        ('213') => ServiceType.n213,
        ('214') => ServiceType.n214,
        ('215') => ServiceType.n215,
        ('216') => ServiceType.n216,
        ('217') => ServiceType.n217,
        ('218') => ServiceType.n218,
        ('219') => ServiceType.n219,
        ('22') => ServiceType.n22,
        ('220') => ServiceType.n220,
        ('221') => ServiceType.n221,
        ('222') => ServiceType.n222,
        ('223') => ServiceType.n223,
        ('224') => ServiceType.n224,
        ('225') => ServiceType.n225,
        ('226') => ServiceType.n226,
        ('227') => ServiceType.n227,
        ('228') => ServiceType.n228,
        ('229') => ServiceType.n229,
        ('23') => ServiceType.n23,
        ('230') => ServiceType.n230,
        ('231') => ServiceType.n231,
        ('232') => ServiceType.n232,
        ('233') => ServiceType.n233,
        ('234') => ServiceType.n234,
        ('235') => ServiceType.n235,
        ('236') => ServiceType.n236,
        ('237') => ServiceType.n237,
        ('238') => ServiceType.n238,
        ('239') => ServiceType.n239,
        ('24') => ServiceType.n24,
        ('240') => ServiceType.n240,
        ('241') => ServiceType.n241,
        ('242') => ServiceType.n242,
        ('243') => ServiceType.n243,
        ('244') => ServiceType.n244,
        ('245') => ServiceType.n245,
        ('246') => ServiceType.n246,
        ('247') => ServiceType.n247,
        ('248') => ServiceType.n248,
        ('249') => ServiceType.n249,
        ('25') => ServiceType.n25,
        ('250') => ServiceType.n250,
        ('251') => ServiceType.n251,
        ('252') => ServiceType.n252,
        ('253') => ServiceType.n253,
        ('254') => ServiceType.n254,
        ('255') => ServiceType.n255,
        ('256') => ServiceType.n256,
        ('257') => ServiceType.n257,
        ('258') => ServiceType.n258,
        ('259') => ServiceType.n259,
        ('26') => ServiceType.n26,
        ('260') => ServiceType.n260,
        ('261') => ServiceType.n261,
        ('262') => ServiceType.n262,
        ('263') => ServiceType.n263,
        ('264') => ServiceType.n264,
        ('265') => ServiceType.n265,
        ('266') => ServiceType.n266,
        ('267') => ServiceType.n267,
        ('268') => ServiceType.n268,
        ('269') => ServiceType.n269,
        ('27') => ServiceType.n27,
        ('270') => ServiceType.n270,
        ('271') => ServiceType.n271,
        ('272') => ServiceType.n272,
        ('273') => ServiceType.n273,
        ('274') => ServiceType.n274,
        ('275') => ServiceType.n275,
        ('276') => ServiceType.n276,
        ('277') => ServiceType.n277,
        ('278') => ServiceType.n278,
        ('279') => ServiceType.n279,
        ('28') => ServiceType.n28,
        ('280') => ServiceType.n280,
        ('281') => ServiceType.n281,
        ('282') => ServiceType.n282,
        ('283') => ServiceType.n283,
        ('284') => ServiceType.n284,
        ('285') => ServiceType.n285,
        ('286') => ServiceType.n286,
        ('287') => ServiceType.n287,
        ('288') => ServiceType.n288,
        ('289') => ServiceType.n289,
        ('29') => ServiceType.n29,
        ('290') => ServiceType.n290,
        ('291') => ServiceType.n291,
        ('292') => ServiceType.n292,
        ('293') => ServiceType.n293,
        ('294') => ServiceType.n294,
        ('295') => ServiceType.n295,
        ('296') => ServiceType.n296,
        ('297') => ServiceType.n297,
        ('298') => ServiceType.n298,
        ('299') => ServiceType.n299,
        ('3') => ServiceType.n3,
        ('30') => ServiceType.n30,
        ('300') => ServiceType.n300,
        ('301') => ServiceType.n301,
        ('302') => ServiceType.n302,
        ('303') => ServiceType.n303,
        ('304') => ServiceType.n304,
        ('305') => ServiceType.n305,
        ('306') => ServiceType.n306,
        ('307') => ServiceType.n307,
        ('308') => ServiceType.n308,
        ('309') => ServiceType.n309,
        ('31') => ServiceType.n31,
        ('310') => ServiceType.n310,
        ('311') => ServiceType.n311,
        ('312') => ServiceType.n312,
        ('313') => ServiceType.n313,
        ('314') => ServiceType.n314,
        ('315') => ServiceType.n315,
        ('316') => ServiceType.n316,
        ('317') => ServiceType.n317,
        ('318') => ServiceType.n318,
        ('319') => ServiceType.n319,
        ('32') => ServiceType.n32,
        ('320') => ServiceType.n320,
        ('321') => ServiceType.n321,
        ('322') => ServiceType.n322,
        ('323') => ServiceType.n323,
        ('324') => ServiceType.n324,
        ('325') => ServiceType.n325,
        ('326') => ServiceType.n326,
        ('327') => ServiceType.n327,
        ('328') => ServiceType.n328,
        ('33') => ServiceType.n33,
        ('330') => ServiceType.n330,
        ('331') => ServiceType.n331,
        ('332') => ServiceType.n332,
        ('333') => ServiceType.n333,
        ('334') => ServiceType.n334,
        ('335') => ServiceType.n335,
        ('336') => ServiceType.n336,
        ('337') => ServiceType.n337,
        ('338') => ServiceType.n338,
        ('339') => ServiceType.n339,
        ('34') => ServiceType.n34,
        ('340') => ServiceType.n340,
        ('341') => ServiceType.n341,
        ('342') => ServiceType.n342,
        ('343') => ServiceType.n343,
        ('344') => ServiceType.n344,
        ('345') => ServiceType.n345,
        ('346') => ServiceType.n346,
        ('347') => ServiceType.n347,
        ('348') => ServiceType.n348,
        ('349') => ServiceType.n349,
        ('35') => ServiceType.n35,
        ('350') => ServiceType.n350,
        ('351') => ServiceType.n351,
        ('352') => ServiceType.n352,
        ('353') => ServiceType.n353,
        ('354') => ServiceType.n354,
        ('355') => ServiceType.n355,
        ('356') => ServiceType.n356,
        ('357') => ServiceType.n357,
        ('358') => ServiceType.n358,
        ('359') => ServiceType.n359,
        ('36') => ServiceType.n36,
        ('360') => ServiceType.n360,
        ('361') => ServiceType.n361,
        ('362') => ServiceType.n362,
        ('364') => ServiceType.n364,
        ('365') => ServiceType.n365,
        ('366') => ServiceType.n366,
        ('367') => ServiceType.n367,
        ('368') => ServiceType.n368,
        ('369') => ServiceType.n369,
        ('37') => ServiceType.n37,
        ('370') => ServiceType.n370,
        ('371') => ServiceType.n371,
        ('372') => ServiceType.n372,
        ('373') => ServiceType.n373,
        ('374') => ServiceType.n374,
        ('375') => ServiceType.n375,
        ('376') => ServiceType.n376,
        ('377') => ServiceType.n377,
        ('378') => ServiceType.n378,
        ('379') => ServiceType.n379,
        ('38') => ServiceType.n38,
        ('380') => ServiceType.n380,
        ('381') => ServiceType.n381,
        ('382') => ServiceType.n382,
        ('383') => ServiceType.n383,
        ('384') => ServiceType.n384,
        ('385') => ServiceType.n385,
        ('386') => ServiceType.n386,
        ('387') => ServiceType.n387,
        ('388') => ServiceType.n388,
        ('389') => ServiceType.n389,
        ('39') => ServiceType.n39,
        ('390') => ServiceType.n390,
        ('391') => ServiceType.n391,
        ('392') => ServiceType.n392,
        ('393') => ServiceType.n393,
        ('394') => ServiceType.n394,
        ('395') => ServiceType.n395,
        ('396') => ServiceType.n396,
        ('397') => ServiceType.n397,
        ('398') => ServiceType.n398,
        ('399') => ServiceType.n399,
        ('4') => ServiceType.n4,
        ('40') => ServiceType.n40,
        ('400') => ServiceType.n400,
        ('401') => ServiceType.n401,
        ('402') => ServiceType.n402,
        ('403') => ServiceType.n403,
        ('404') => ServiceType.n404,
        ('405') => ServiceType.n405,
        ('406') => ServiceType.n406,
        ('407') => ServiceType.n407,
        ('408') => ServiceType.n408,
        ('409') => ServiceType.n409,
        ('41') => ServiceType.n41,
        ('410') => ServiceType.n410,
        ('411') => ServiceType.n411,
        ('412') => ServiceType.n412,
        ('413') => ServiceType.n413,
        ('414') => ServiceType.n414,
        ('415') => ServiceType.n415,
        ('416') => ServiceType.n416,
        ('417') => ServiceType.n417,
        ('418') => ServiceType.n418,
        ('419') => ServiceType.n419,
        ('42') => ServiceType.n42,
        ('420') => ServiceType.n420,
        ('421') => ServiceType.n421,
        ('422') => ServiceType.n422,
        ('423') => ServiceType.n423,
        ('424') => ServiceType.n424,
        ('425') => ServiceType.n425,
        ('426') => ServiceType.n426,
        ('427') => ServiceType.n427,
        ('428') => ServiceType.n428,
        ('429') => ServiceType.n429,
        ('43') => ServiceType.n43,
        ('430') => ServiceType.n430,
        ('431') => ServiceType.n431,
        ('432') => ServiceType.n432,
        ('433') => ServiceType.n433,
        ('434') => ServiceType.n434,
        ('435') => ServiceType.n435,
        ('436') => ServiceType.n436,
        ('437') => ServiceType.n437,
        ('438') => ServiceType.n438,
        ('439') => ServiceType.n439,
        ('44') => ServiceType.n44,
        ('440') => ServiceType.n440,
        ('441') => ServiceType.n441,
        ('442') => ServiceType.n442,
        ('443') => ServiceType.n443,
        ('444') => ServiceType.n444,
        ('445') => ServiceType.n445,
        ('446') => ServiceType.n446,
        ('447') => ServiceType.n447,
        ('448') => ServiceType.n448,
        ('449') => ServiceType.n449,
        ('45') => ServiceType.n45,
        ('450') => ServiceType.n450,
        ('451') => ServiceType.n451,
        ('452') => ServiceType.n452,
        ('453') => ServiceType.n453,
        ('454') => ServiceType.n454,
        ('455') => ServiceType.n455,
        ('456') => ServiceType.n456,
        ('457') => ServiceType.n457,
        ('458') => ServiceType.n458,
        ('459') => ServiceType.n459,
        ('46') => ServiceType.n46,
        ('460') => ServiceType.n460,
        ('461') => ServiceType.n461,
        ('462') => ServiceType.n462,
        ('463') => ServiceType.n463,
        ('464') => ServiceType.n464,
        ('465') => ServiceType.n465,
        ('466') => ServiceType.n466,
        ('467') => ServiceType.n467,
        ('468') => ServiceType.n468,
        ('469') => ServiceType.n469,
        ('47') => ServiceType.n47,
        ('470') => ServiceType.n470,
        ('471') => ServiceType.n471,
        ('472') => ServiceType.n472,
        ('473') => ServiceType.n473,
        ('474') => ServiceType.n474,
        ('475') => ServiceType.n475,
        ('476') => ServiceType.n476,
        ('477') => ServiceType.n477,
        ('478') => ServiceType.n478,
        ('479') => ServiceType.n479,
        ('48') => ServiceType.n48,
        ('480') => ServiceType.n480,
        ('481') => ServiceType.n481,
        ('482') => ServiceType.n482,
        ('483') => ServiceType.n483,
        ('484') => ServiceType.n484,
        ('485') => ServiceType.n485,
        ('486') => ServiceType.n486,
        ('488') => ServiceType.n488,
        ('489') => ServiceType.n489,
        ('49') => ServiceType.n49,
        ('490') => ServiceType.n490,
        ('491') => ServiceType.n491,
        ('492') => ServiceType.n492,
        ('493') => ServiceType.n493,
        ('494') => ServiceType.n494,
        ('495') => ServiceType.n495,
        ('496') => ServiceType.n496,
        ('497') => ServiceType.n497,
        ('498') => ServiceType.n498,
        ('5') => ServiceType.n5,
        ('50') => ServiceType.n50,
        ('500') => ServiceType.n500,
        ('501') => ServiceType.n501,
        ('502') => ServiceType.n502,
        ('503') => ServiceType.n503,
        ('504') => ServiceType.n504,
        ('505') => ServiceType.n505,
        ('506') => ServiceType.n506,
        ('507') => ServiceType.n507,
        ('508') => ServiceType.n508,
        ('509') => ServiceType.n509,
        ('51') => ServiceType.n51,
        ('510') => ServiceType.n510,
        ('513') => ServiceType.n513,
        ('514') => ServiceType.n514,
        ('52') => ServiceType.n52,
        ('53') => ServiceType.n53,
        ('530') => ServiceType.n530,
        ('531') => ServiceType.n531,
        ('532') => ServiceType.n532,
        ('533') => ServiceType.n533,
        ('534') => ServiceType.n534,
        ('535') => ServiceType.n535,
        ('536') => ServiceType.n536,
        ('537') => ServiceType.n537,
        ('538') => ServiceType.n538,
        ('539') => ServiceType.n539,
        ('54') => ServiceType.n54,
        ('540') => ServiceType.n540,
        ('541') => ServiceType.n541,
        ('542') => ServiceType.n542,
        ('543') => ServiceType.n543,
        ('544') => ServiceType.n544,
        ('545') => ServiceType.n545,
        ('546') => ServiceType.n546,
        ('547') => ServiceType.n547,
        ('548') => ServiceType.n548,
        ('55') => ServiceType.n55,
        ('550') => ServiceType.n550,
        ('551') => ServiceType.n551,
        ('552') => ServiceType.n552,
        ('553') => ServiceType.n553,
        ('554') => ServiceType.n554,
        ('555') => ServiceType.n555,
        ('556') => ServiceType.n556,
        ('557') => ServiceType.n557,
        ('558') => ServiceType.n558,
        ('559') => ServiceType.n559,
        ('56') => ServiceType.n56,
        ('560') => ServiceType.n560,
        ('561') => ServiceType.n561,
        ('562') => ServiceType.n562,
        ('563') => ServiceType.n563,
        ('564') => ServiceType.n564,
        ('565') => ServiceType.n565,
        ('566') => ServiceType.n566,
        ('567') => ServiceType.n567,
        ('568') => ServiceType.n568,
        ('569') => ServiceType.n569,
        ('57') => ServiceType.n57,
        ('570') => ServiceType.n570,
        ('571') => ServiceType.n571,
        ('572') => ServiceType.n572,
        ('573') => ServiceType.n573,
        ('574') => ServiceType.n574,
        ('575') => ServiceType.n575,
        ('576') => ServiceType.n576,
        ('577') => ServiceType.n577,
        ('58') => ServiceType.n58,
        ('580') => ServiceType.n580,
        ('581') => ServiceType.n581,
        ('582') => ServiceType.n582,
        ('583') => ServiceType.n583,
        ('584') => ServiceType.n584,
        ('585') => ServiceType.n585,
        ('589') => ServiceType.n589,
        ('59') => ServiceType.n59,
        ('590') => ServiceType.n590,
        ('591') => ServiceType.n591,
        ('593') => ServiceType.n593,
        ('599') => ServiceType.n599,
        ('6') => ServiceType.n6,
        ('60') => ServiceType.n60,
        ('600') => ServiceType.n600,
        ('601') => ServiceType.n601,
        ('602') => ServiceType.n602,
        ('603') => ServiceType.n603,
        ('604') => ServiceType.n604,
        ('605') => ServiceType.n605,
        ('606') => ServiceType.n606,
        ('607') => ServiceType.n607,
        ('608') => ServiceType.n608,
        ('609') => ServiceType.n609,
        ('61') => ServiceType.n61,
        ('610') => ServiceType.n610,
        ('611') => ServiceType.n611,
        ('612') => ServiceType.n612,
        ('613') => ServiceType.n613,
        ('614') => ServiceType.n614,
        ('615') => ServiceType.n615,
        ('616') => ServiceType.n616,
        ('617') => ServiceType.n617,
        ('618') => ServiceType.n618,
        ('619') => ServiceType.n619,
        ('62') => ServiceType.n62,
        ('620') => ServiceType.n620,
        ('621') => ServiceType.n621,
        ('622') => ServiceType.n622,
        ('623') => ServiceType.n623,
        ('624') => ServiceType.n624,
        ('625') => ServiceType.n625,
        ('626') => ServiceType.n626,
        ('627') => ServiceType.n627,
        ('628') => ServiceType.n628,
        ('629') => ServiceType.n629,
        ('63') => ServiceType.n63,
        ('64') => ServiceType.n64,
        ('65') => ServiceType.n65,
        ('66') => ServiceType.n66,
        ('67') => ServiceType.n67,
        ('68') => ServiceType.n68,
        ('69') => ServiceType.n69,
        ('7') => ServiceType.n7,
        ('70') => ServiceType.n70,
        ('71') => ServiceType.n71,
        ('72') => ServiceType.n72,
        ('73') => ServiceType.n73,
        ('74') => ServiceType.n74,
        ('75') => ServiceType.n75,
        ('76') => ServiceType.n76,
        ('77') => ServiceType.n77,
        ('78') => ServiceType.n78,
        ('79') => ServiceType.n79,
        ('8') => ServiceType.n8,
        ('80') => ServiceType.n80,
        ('81') => ServiceType.n81,
        ('82') => ServiceType.n82,
        ('83') => ServiceType.n83,
        ('84') => ServiceType.n84,
        ('85') => ServiceType.n85,
        ('86') => ServiceType.n86,
        ('87') => ServiceType.n87,
        ('88') => ServiceType.n88,
        ('89') => ServiceType.n89,
        ('9') => ServiceType.n9,
        ('90') => ServiceType.n90,
        ('91') => ServiceType.n91,
        ('92') => ServiceType.n92,
        ('93') => ServiceType.n93,
        ('94') => ServiceType.n94,
        ('95') => ServiceType.n95,
        ('96') => ServiceType.n96,
        ('97') => ServiceType.n97,
        ('98') => ServiceType.n98,
        ('99') => ServiceType.n99,
        (_) => null,
      };
}
