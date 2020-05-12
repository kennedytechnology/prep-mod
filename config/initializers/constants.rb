USER_ROLES = ["Nurse", "Charge Nurse", "Supervisor"]
VENUE_CATEGORIES = ["University", "Doctor's Office", "Hospital"]
COUNTIES = %w(Washington Jefferson Franklin Jackson Grant Wayne Lake Lee Marshall Polk Marion Clay Union)

US_STATES = [["Alaska", "AK"], ["Alabama", "AL"], ["Arkansas", "AR"], ["American Samoa", "AS"], ["Arizona", "AZ"], ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["District of Columbia", "DC"], ["Delaware", "DE"], ["Florida", "FL"], ["Georgia", "GA"], ["Guam", "GU"], ["Hawaii", "HI"], ["Iowa", "IA"], ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Kansas", "KS"], ["Kentucky", "KY"], ["Louisiana", "LA"], ["Massachusetts", "MA"], ["Maryland", "MD"], ["Maine", "ME"], ["Michigan", "MI"], ["Minnesota", "MN"], ["Missouri", "MO"], ["Mississippi", "MS"], ["Montana", "MT"], ["North Carolina", "NC"], ["North Dakota", "ND"], ["Nebraska", "NE"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], ["New Mexico", "NM"], ["Nevada", "NV"], ["New York", "NY"], ["Ohio", "OH"], ["Oklahoma", "OK"], ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Puerto Rico", "PR"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Virginia", "VA"], ["Virgin Islands", "VI"], ["Vermont", "VT"], ["Washington", "WA"], ["Wisconsin", "WI"], ["West Virginia", "WV"], ["Wyoming", "WY"]]
US_RACES = ["---", "American Indian or Alaska Native", "Asian", "Black or African-American", "Native Hawaiian and Pacific Islander", "White", "Some Other Race"]
INSURANCE_TYPES = ["Private Insurance", "Medicaid/Medical Assistance", "No Insurance"]
RELATIONSHIP_TYPES = ["Self", "Spouse", "Other"]

CLINIC_EVENTS = [
  { name: "Tested",
    outcomes: %w(Pending Positive Negative Indeterminate)
  },
  { name: "No Show",
    outcomes: %w(Refused Cancelled)
  },
  { name: "Cancelled",
    outcomes: %w(Refused Cancelled)
  },
  { name: "Safety Kit",
    outcomes: %w(Pending Registered PickedUp Cancelled)
  },
  { name: "Screened",
    outcomes: %w(Pending Refused Cancelled Positive Negative Indeterminate)
  }
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

  INVENTORY_ITEM_TYPES = ["Test Kit-PCR", "Test Kit - Blood", "Safety Kit", "Supplies", "Influenza", "Tdap", 
    "MCV4", "HPV", "IPV", "Var", "MMR", "Hep B", "Hep A", "DTaP", "Hib", "Pnemococcal", "Zoster", "Other" ]
  INVENTORY_MANUFACTURERS = ["GlaxoSmithKline", "MedImmune", "Pfizer", "Sanofi Pasteur", "Seqiris"]
  INVENTORY_PACKAGINGS = ["Unit", "Box", "Case", "Other"]
  INVENTORY_SOURCES = ["Private Purchase", "VFC", "Borrowed", "Other"]
  INVENTORY_EVENT_TYPES = ["Community", "Health Department", "LTC", "School", "Loan", "Hospital", "Other"]
  PROFESSIONAL_LICENSES = %w(MD DO PharmaD/RPh NP PA DDS)
  MEDICAL_SPECIALTY = ["Family Medicine", "Pediatrics", "Internal Medicine", "Cardiology", "Endocrinology", "Podiatry", "Other"]
  PRACTICE_TYPE = ["Solo Practicioner", "Group Practice", "Hospital Practice", "Federally-Qualified Health Center (FQHC)",
    "Pharamacy", "Other"]

  Date::DATE_FORMATS[:default] = "%A %B %e, %Y"
