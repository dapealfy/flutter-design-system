class CalendarUtils {
  static final List<String> monthName = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  static String getMonthName(int month) => monthName[month - 1];
}
