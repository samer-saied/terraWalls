String formatHumanReadableDate(String isoDate) {
  final DateTime dateTime = DateTime.parse(isoDate);
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day);
  final DateTime yesterday = today.subtract(const Duration(days: 1));

  // Month names
  const monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  String formatTime(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  if (dateTime.isAfter(today)) {
    return 'Today at ${formatTime(dateTime)}';
  } else if (dateTime.isAfter(yesterday)) {
    return 'Yesterday at ${formatTime(dateTime)}';
  } else if (dateTime.year == now.year) {
    return '${monthNames[dateTime.month - 1]} ${dateTime.day}';
  } else {
    return '${monthNames[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year} AT ${formatTime(dateTime)}';
  }
}