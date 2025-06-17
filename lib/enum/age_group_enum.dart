enum AgeRange {
  lessThan10,
  between10and20,
  between20and30,
  between30and40,
  between40and50,
  between50and60,
  between60and70,
  between70and80,
  between80and90,
  between90and100,
  moreThan100,
}

String textFromAgeRangeEnum(AgeRange ageRange) {
  switch (ageRange) {
    case AgeRange.lessThan10:
      return "0-10";
    case AgeRange.between10and20:
      return "10-20";
    case AgeRange.between20and30:
      return "20-30";
    case AgeRange.between30and40:
      return "30-40";
    case AgeRange.between40and50:
      return "40-50";
    case AgeRange.between50and60:
      return "50-60";
    case AgeRange.between60and70:
      return "60-70";
    case AgeRange.between70and80:
      return "70-80";
    case AgeRange.between80and90:
      return "80-90";
    case AgeRange.between90and100:
      return "90-100";
    default:
      return "100+";
  }
}

int valueFromAgeRangeEnum(AgeRange ageRange) {
  switch (ageRange) {
    case AgeRange.lessThan10:
      return 1;
    case AgeRange.between10and20:
      return 2;
    case AgeRange.between20and30:
      return 3;
    case AgeRange.between30and40:
      return 4;
    case AgeRange.between40and50:
      return 5;
    case AgeRange.between50and60:
      return 6;
    case AgeRange.between60and70:
      return 7;
    case AgeRange.between70and80:
      return 8;
    case AgeRange.between80and90:
      return 9;
    case AgeRange.between90and100:
      return 10;
    default:
      return 11;
  }
}

String textFromValue(int ageRangeInValue) {
  switch (ageRangeInValue) {
    case 1:
      return "0-10";
    case 2:
      return "10-20";
    case 3:
      return "20-30";
    case 4:
      return "30-40";
    case 5:
      return "40-50";
    case 6:
      return "50-60";
    case 7:
      return "60-70";
    case 8:
      return "70-80";
    case 9:
      return "80-90";
    case 10:
      return "90-100";
    default:
      return "100+";
  }
}
