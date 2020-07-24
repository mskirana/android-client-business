/// Get timestamp associated with a mongoose id
DateTime getTimeStampFromId(String id) {
  int ms = int.parse(id.substring(0, 8), radix: 16);
  return DateTime.fromMillisecondsSinceEpoch(ms * 1000);
}
