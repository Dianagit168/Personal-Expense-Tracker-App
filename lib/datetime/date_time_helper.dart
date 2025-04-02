// convert datetime obj to the string yyymmdd
String convertDateTimeToString(DateTime dateTime) {
  // year in the format to yyyy
  String year = dateTime.year.toString();
  // month in the format to mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month'; // 1 => 01
  }
  // day in the format to dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }
  // final format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
