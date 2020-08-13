USER_ROLES = ["Nurse", "Charge Nurse", "Supervisor", "Regional Administrator"]
VENUE_CATEGORIES = ["University", "Doctor's Office", "Hospital"]
VENUE_TYPES = [
  "Local Health Department", "Provider Office", "Hospital", "Church", 
  "College/University", "Primary School", "Business/Workplace",
  "Community Center", "Residential/Housing Building", "Senior Center",
  "Long Term Care Facility", "Government", "Retail", "Pharmacy", "Other"
]
COUNTIES = ["Allegany", "Anne Arundel", "Baltimore", "Baltimore City", "Calvert", "Caroline", "Carroll", "Cecil", "Charles", "Dorchester", "Frederick", 
"Garrett", "Harford", "Howard", "Kent", "Montgomery", "Prince George", "Queen Anne", "Somerset", "St. Mary", "Talbot", "Washington", "Wicomico", "Worcester"]

US_STATES = [["Alaska", "AK"], ["Alabama", "AL"], ["Arkansas", "AR"], ["American Samoa", "AS"], ["Arizona", "AZ"], ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["District of Columbia", "DC"], ["Delaware", "DE"], ["Florida", "FL"], ["Georgia", "GA"], ["Guam", "GU"], ["Hawaii", "HI"], ["Iowa", "IA"], ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Kansas", "KS"], ["Kentucky", "KY"], ["Louisiana", "LA"], ["Massachusetts", "MA"], ["Maryland", "MD"], ["Maine", "ME"], ["Michigan", "MI"], ["Minnesota", "MN"], ["Missouri", "MO"], ["Mississippi", "MS"], ["Montana", "MT"], ["North Carolina", "NC"], ["North Dakota", "ND"], ["Nebraska", "NE"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["Nevada", "NV"], ["New York", "NY"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Puerto Rico", "PR"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Virginia", "VA"], ["Virgin Islands", "VI"], ["Vermont", "VT"], ["Washington", "WA"], ["Wisconsin", "WI"], ["West Virginia", "WV"], ["Wyoming", "WY"]]
US_RACES = ["American Indian or Alaska Native", "Asian", "Black or African-American", "Native Hawaiian and Pacific Islander", "White", "Some Other Race"]
INSURANCE_TYPES = ["Private Insurance", "Medicaid/Medical Assistance", "Medicare", "No Insurance"]
RELATIONSHIP_TYPES = ["Self", "Spouse", "Other"]

CLINIC_APPOINTMENT_INTERVALS = [1, 2, 3, 5, 7, 10, 12, 15, 20, 30, 45, 60]

# CLINIC_EVENTS = [
#   { name: "Tested",
#     outcomes: %w(Pending Positive Negative Normal Elevated FollowUp Needed PickedUp Refused)
#   },
#   { name: "No Show",
#     outcomes: %w()
#   },
#   { name: "Cancelled",
#     outcomes: %w()
#   },
#   { name: "Safety Kit",
#     outcomes: %w()
#   },
#   { name: "Screened",
#     outcomes: %w()
#   },
#   { name: "Vaccinated",
#     outcomes: %w()
#   },
#   { name: "Refused",
#     outcomes: %w()
#   },
#   { name: "Sick",
#     outcomes: %w()
#   },
#   { name: "Absent",
#     outcomes: %w()
#   },
#   ]

CLINIC_EVENTS = [
  { name: "Vaccinated",
    outcomes: %w()
  },
  { name: "Refused",
    outcomes: %w()
  },
  { name: "Sick",
    outcomes: %w()
  },
  { name: "Absent",
    outcomes: %w()
  },
  ]


  PATIENT_OCCUPATIONS = [
    "Construction, Landscaping, Other Trades",
    "First Responder - Fire, Police, EMT",
    "Healthcare - Direct Patient Contact",
    "Healthcare - NO Direct Patient Contact",
    "Office Worker - Manager, Supervisor, Employee, Clerical",
    "Plant Worker, Manufacturing, and Machine Operators, and Assemblers",
    "School Employee or Contractor",
    "Service - Restaurants, Bars, Catering, Food Service, Fast Food",
    "Service - Retail, Cosmetology, Massage, Elective Services",
    "Service - Transportation",
    "Service - Entertainment, Performance",
    "Skilled agricultural, forestry and fishery workers",
    "Other"
  ]

  if ENV['SCHOOL_VACCINATION_MODE']
    VACCINE_ITEM_TYPES = ["Tdap", "DTaP", "Meningococcal Meningitis (MCV4)", "HPV", "Measles, Mumps, Rubella", "Varicella (chickenpox)", "Polio", "Hepatitis B", "MenB"]
  else
    VACCINE_ITEM_TYPES = ["Safety Kit", "Supplies", "Influenza", "Tdap", 
      "MCV4", "HPV", "IPV", "Var", "MMR", "Hep B", "Hep A", "DTaP", "Hib", "Pnemococcal", "Zoster", "Other" ]  
  end
  TEST_ITEM_TYPES = ["Serological", "PCR"]
  INVENTORY_MANUFACTURERS = ["GlaxoSmithKline", "MedImmune", "Pfizer", "Sanofi Pasteur", "Seqiris"]
  INVENTORY_PACKAGINGS = ["Unit", "Box", "Case", "Other"]
  INVENTORY_SOURCES = ["Private Purchase", "VFC", "Borrowed", "Other"]
  INVENTORY_EVENT_TYPES = ["Community/Outreach Event", "Mass Clinic", "Health Department Clinic", "Hospital", "Loan", "Other"]
  PROFESSIONAL_LICENSES = %w(MD DO PharmaD/RPh NP PA DDS Other)
  MEDICAL_SPECIALTY = ["Family Medicine", "Pediatrics", "Internal Medicine", "Cardiology", "Endocrinology", "Podiatry", "Other"]
  PRACTICE_TYPES = ["Solo Practicioner", "Group Practice", "Hospital Practice", "Federally-Qualified Health Center (FQHC)",
    "Pharamacy", "Other"]

  BUSINESS_LOCATIONS = ["Health Care - Medical Practice", "Health Care - Hospital", 
    "Health Care - Outpatient Procedures and Services", "Pharmacy", "Local Health Department",
    "Social Services", "Long Term Care Facility", "Assisted Living", "Office/Professional",
    "Factory/Manufacturing - Food Products", "Factory/Manufacturing - Non-Food Products",
    "Office Professional AND Factory", "Hotel, Motel, Resort", "Casino", "Restaurant - Dine-In and Carry-Out",
    "Restaurant - Carry Out-Only", "Nightclub", "Bar", "Food Delivery Service", "Catering/Hospitality",
    "Grocery Store", "Retail", "Childcare Provider/Center", "Grade School (Public)", "Grade School (Private)",
    "College or University", "Trade School", "Recreation Venue", 
    "Sport/Entertainment Venue (eg. stadium, concert, theater, movie theater)",
    "Utilities - Field Work", "Health Club/Fitness Center",
    "Hair Salon/Barbershop", "Salon and Spa Services (eg. massage, facials, nails, waxing)",
    "Pet Care (eg. Veterinarian, grooming, boarding)", "Banking/Financial", "Taxi/Ride Share",
    "Public Transportation", "General Services (eg. automotive, utilities, etc.)", 
    "Miscellaneous Services", "Other"]

  Date::DATE_FORMATS[:default] = "%A %B %e, %Y"

  NEWS_TOPICS = ["COVID-19 Testing", "Flu Vaccinations", "Back-to-School Vaccinations", "COVID-19 Vaccine Development"]