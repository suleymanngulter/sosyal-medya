import 'package:timeago/timeago.dart' as timeago;

class TrMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'önce';
  @override
  String suffixFromNow() => 'sonra';
  @override
  String lessThanOneMinute(int seconds) => 'az önce';
  @override
  String aboutAMinute(int minutes) => '1 dakika';
  @override
  String minutes(int minutes) => '$minutes dakika';
  @override
  String aboutAnHour(int minutes) => 'yaklaşık 1 saat';
  @override
  String hours(int hours) => '$hours saat';
  @override
  String aDay(int hours) => '1 gün';
  @override
  String days(int days) => '$days gün';
  @override
  String aboutAMonth(int days) => 'yaklaşık 1 ay';
  @override
  String months(int months) => '$months ay';
  @override
  String aboutAYear(int year) => 'yaklaşık 1 yıl';
  @override
  String years(int years) => '$years yıl';
  @override
  String wordSeparator() => ' ';
}
