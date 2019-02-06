class DateFormatter {
  DateFormatter._();

  static String format(String dateString) {
    final date = DateTime.parse(dateString).toLocal();

    if (_isToday(date)) {
      return "Today ${_formatDigit(date.hour)}:${_formatDigit(date.minute)}";
    } else {
      return "${date.year}-${_formatDigit(date.month)}-${_formatDigit(date.day)}";
    }
  }

  static bool _isToday(DateTime date) {
    final now = DateTime.now();
    return now.year == date.year && now.month == date.month && now.day == date.day;
  }

  static String _formatDigit(int digit) {
    return digit.toString().padLeft(2, "0");
  }
}
