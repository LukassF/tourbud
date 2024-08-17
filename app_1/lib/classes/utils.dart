class GeneralUtils {
  static String formatTripDuration(int daysDuration) {
    if (daysDuration == 1) {
      return '1 day';
    }

    if (daysDuration < 7) {
      return '$daysDuration days';
    }
    final int fullWeeks = (daysDuration / 7).floor();

    if (daysDuration % 7 == 0) {
      return '$fullWeeks week${fullWeeks == 1 ? '' : 's'}';
    }
    if (daysDuration % 7 <= 3) {
      return 'Over ${fullWeeks} week${fullWeeks == 1 ? '' : 's'}';
    }

    if (daysDuration % 7 > 3) {
      return 'Almost ${fullWeeks + 1} week${fullWeeks == 1 ? '' : 's'}';
    }

    return 'Unknown';
  }

  static String formatNumberOfPeople(int numberOfPeople) {
    if (numberOfPeople == 1) {
      return '1 person';
    } else {
      return '$numberOfPeople people';
    }
  }
}
