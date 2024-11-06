//dates
const List<String> eventDates = [
  'All',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29'
];

//days
String todayDay(int date) {
  String day = "";
  switch (date) {
    case 23:
      day = "DAY 1";
      break;
    case 24:
      day = "DAY 2";
      break;
    case 25:
      day = "DAY 3";
      break;
    case 26:
      day = "DAY 4";
      break;
    case 27:
      day = "DAY 5";
      break;
    case 28:
      day = "DAY 6";
      break;
    case 29:
      day = "DAY 7";
      break;
  }

  return day;
}

const List<Map<int, String>> eventDays = [
  {
    23: "1",
  },
  {
    24: "2",
  },
  {
    25: "3",
  },
  {
    26: "4",
  },
  {
    27: "5",
  },
  {
    28: "6",
  },
  {
    29: "7",
  },
];

//image paths
const String ourLogoPath = "assets/images/logo.png";
