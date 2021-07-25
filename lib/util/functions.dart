import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> logs = [];
bool isBusy = false;

///Global key to help navigate from anywhere the app;
GlobalKey<NavigatorState> navigatorKey = GlobalKey();

List<Color> _colors = [];
Random _rand = Random(new DateTime.now().millisecondsSinceEpoch);

Color getRandomColor() {
  _colors.clear();
  _colors.add(Colors.blue[600]!);
  _colors.add(Colors.pink);
  _colors.add(Colors.teal);
  _colors.add(Colors.red);
  _colors.add(Colors.green);
  _colors.add(Colors.amber[600]!);
  _colors.add(Colors.indigo);
  _colors.add(Colors.lightBlue);
  _colors.add(Colors.lime[800]!);
  _colors.add(Colors.deepPurple);
  _colors.add(Colors.deepOrange);
  _colors.add(Colors.cyan);
  _colors.add(Colors.teal);
  _colors.add(Colors.red[700]!);
  _colors.add(Colors.green);
  _colors.add(Colors.blue);
  _colors.add(Colors.pink);
  _colors.add(Colors.teal);
  _colors.add(Colors.red);
  _colors.add(Colors.green);
  _colors.add(Colors.amber);
  _colors.add(Colors.indigo);
  _colors.add(Colors.lightBlue);
  _colors.add(Colors.lime);
  _colors.add(Colors.deepPurple);
  _colors.add(Colors.deepOrange);
  _colors.add(Colors.cyan);
  _colors.add(Colors.teal);
  _colors.add(Colors.red);
  _colors.add(Colors.green);

  _rand = Random(DateTime.now().millisecondsSinceEpoch * _rand.nextInt(10000));
  int index = _rand.nextInt(_colors.length - 1);
  sleep(const Duration(milliseconds: 2));
  return _colors.elementAt(index);
}

Color getRandomPastelColor() {
  _colors.clear();
  _colors.add(Colors.blue.shade50);
  _colors.add(Colors.grey.shade50);
  _colors.add(Colors.pink.shade50);
  _colors.add(Colors.teal.shade50);
  _colors.add(Colors.red.shade50);
  _colors.add(Colors.green.shade50);
  _colors.add(Colors.amber.shade50);
  _colors.add(Colors.indigo.shade50);
  _colors.add(Colors.lightBlue.shade50);
  _colors.add(Colors.lime.shade50);
  _colors.add(Colors.deepPurple.shade50);
  _colors.add(Colors.deepOrange.shade50);
  _colors.add(Colors.brown.shade50);
  _colors.add(Colors.cyan.shade50);

  _rand = Random(new DateTime.now().millisecondsSinceEpoch * _rand.nextInt(10000));
  int index = _rand.nextInt(_colors.length - 1);
  return _colors.elementAt(index);
}

class Styles {
  static const tiny = 12.0;
  static const small = 14.0;
  static const medium = 20.0;
  static const mediumLarge = 26.0;
  static const large = 32.0;
  static const reallyLarge = 52.0;

  static const TextStyle greyLabelTiny = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: tiny,
    color: Colors.grey,
  );
  static const TextStyle greyLabelSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.grey,
  );
  static const TextStyle greyLabelMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.grey,
  );
  static const TextStyle greyLabelLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: large,
    color: Colors.grey,
  );
  static const TextStyle yellowBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.yellow,
  );
  static const TextStyle yellowBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.yellow,
  );
  static const TextStyle yellowMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.yellow,
  );
  static const TextStyle yellowBoldLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: large,
    color: Colors.yellow,
  );
  static const TextStyle yellowBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.yellow,
  );
  static const TextStyle yellowLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.yellow,
  );
  static const TextStyle yellowReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.yellow,
  );

  /////
  static const TextStyle blackBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.black,
  );
  static const TextStyle blackSmall = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: small,
    color: Colors.black,
  );
  static const TextStyle blackTiny = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: tiny,
    color: Colors.black,
  );
  static const TextStyle blackBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.black,
  );
  static const TextStyle blackMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.black,
  );
  static const TextStyle blackBoldLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: large,
    color: Colors.black,
  );
  static const TextStyle blackBoldMediumLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: mediumLarge,
    color: Colors.black,
  );
  static const TextStyle blackBoldDash = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 48,
    color: Colors.black,
  );
  static const TextStyle blackBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.black,
  );
  static const TextStyle blackLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.black,
  );
  static const TextStyle blackReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.black,
  );

  ////////
  static const TextStyle pinkBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.pink,
  );
  static const TextStyle pinkBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.pink,
  );
  static const TextStyle pinkMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.pink,
  );
  static const TextStyle pinkBoldLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: large,
    color: Colors.pink,
  );
  static const TextStyle pinkBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.pink,
  );
  static const TextStyle pinkLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.pink,
  );
  static const TextStyle pinkReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.pink,
  );

  /////////
  static const TextStyle purpleBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.purple,
  );
  static const TextStyle purpleBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.purple,
  );
  static const TextStyle purpleMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.purple,
  );
  static const TextStyle purpleSmall = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: small,
    color: Colors.purple,
  );
  static const TextStyle purpleBoldLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: large,
    color: Colors.purple,
  );
  static const TextStyle purpleBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.purple,
  );
  static const TextStyle purpleLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.purple,
  );
  static const TextStyle purpleReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.purple,
  );

  ///////
  static const TextStyle blueBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.blue,
  );
  static const TextStyle blueSmall = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: small,
    color: Colors.blue,
  );
  static const TextStyle blueBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.blue,
  );
  static const TextStyle blueMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.blue,
  );
  static const TextStyle blueBoldLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: large,
    color: Colors.blue,
  );
  static const TextStyle blueBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.blue,
  );
  static const TextStyle blueLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.blue,
  );
  static const TextStyle blueReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.blue,
  );

  ////
  static const TextStyle brownBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.brown,
  );
  static const TextStyle brownBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.brown,
  );
  static const TextStyle brownMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.brown,
  );
  static const TextStyle brownBoldLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: large,
    color: Colors.brown,
  );
  static const TextStyle brownBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.brown,
  );
  static const TextStyle brownLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.brown,
  );
  static const TextStyle brownReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.brown,
  );

  static const TextStyle whiteBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.white,
  );

  static const TextStyle whiteBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.white,
  );
  static const TextStyle whiteMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.white,
  );
  static const TextStyle whiteSmall = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: small,
    color: Colors.white,
  );
  static const TextStyle whiteBoldLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: large,
    color: Colors.white,
  );
  static const TextStyle whiteBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.white,
  );
  static const TextStyle whiteLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.white,
  );
  static const TextStyle whiteReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.white,
  );

  /////
  static const TextStyle tealBoldSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: small,
    color: Colors.teal,
  );
  static const TextStyle tealBoldMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: medium,
    color: Colors.teal,
  );
  static const TextStyle tealMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: medium,
    color: Colors.teal,
  );
  static const TextStyle tealBoldLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: large,
    color: Colors.teal,
  );
  static const TextStyle tealBoldReallyLarge = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: reallyLarge,
    color: Colors.teal,
  );
  static const TextStyle tealLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: large,
    color: Colors.teal,
  );
  static const TextStyle tealReallyLarge = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: reallyLarge,
    color: Colors.teal,
  );

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color yellow = Colors.yellow;
  static Color lightGreen = Colors.lightGreen;
  static Color lightBlue = Colors.lightBlue;
  static Color brown = Colors.brown;
  static Color pink = Colors.pink;
  static Color teal = Colors.teal;
  static Color purple = Colors.purple;
  static Color blue = Colors.blue;
}

String getFormattedDateLongWithTime(String date, BuildContext context) {
  Locale myLocale = Localizations.localeOf(context);

  var format = new DateFormat('EEEE, MMMM dd, yyyy - HH:mm', myLocale.toString());
  try {
    if (date.contains('GMT')) {
      var mDate = getLocalDateFromGMT(date, context);
      return format.format(mDate.toLocal());
    } else {
      var mDate = DateTime.parse(date);
      return format.format(mDate.toLocal());
    }
  } catch (e) {
    print(e);
    return 'NoDate';
  }
}

String getFormattedDateShortWithTime(String date, BuildContext context) {
  Locale myLocale = Localizations.localeOf(context);

  var format = new DateFormat('dd MMMM yyyy HH:mm:ss', myLocale.toString());
  try {
    if (date.contains('GMT')) {
      var mDate = getLocalDateFromGMT(date, context);
      return format.format(mDate.toLocal());
    } else {
      var mDate = DateTime.parse(date);
      return format.format(mDate.toLocal());
    }
  } catch (e) {
    print(e);
    return 'NoDate';
  }
}

String getFormattedDateLong(String date, BuildContext context) {
//  print('\getFormattedDateLong $date'); //Sun, 28 Oct 2018 23:59:49 GMT
  Locale myLocale = Localizations.localeOf(context);

  var format = new DateFormat('EEEE, dd MMMM yyyy', myLocale.toString());
  try {
    if (date.contains('GMT')) {
      var mDate = getLocalDateFromGMT(date, context);
      print('++++++++++++++ Formatted date with locale == ${format.format(mDate.toLocal())}');
      return format.format(mDate.toLocal());
    } else {
      var mDate = DateTime.parse(date);
      return format.format(mDate.toLocal());
    }
  } catch (e) {
    print(e);
    return 'NoDate';
  }
}

String getFormattedDateShort(String date, BuildContext context) {
  Locale myLocale = Localizations.localeOf(context);

  var format = new DateFormat('dd MMMM yyyy', myLocale.toString());
  try {
    if (date.contains('GMT')) {
      var mDate = getLocalDateFromGMT(date, context);
      print('++++++++++++++ Formatted date with locale == ${format.format(mDate)}');
      return format.format(mDate);
    } else {
      var mDate = DateTime.parse(date);
      return format.format(mDate.toLocal());
    }
  } catch (e) {
    print(e);
    return 'NoDate';
  }
}

String getFormattedDateShortest(String date, BuildContext context) {
  Locale myLocale = Localizations.localeOf(context);

  var format = new DateFormat('dd-MM-yyyy', myLocale.toString());
  try {
    if (date.contains('GMT')) {
      var mDate = getLocalDateFromGMT(date, context);
      print('++++++++++++++ Formatted date with locale == ${format.format(mDate)}');
      return format.format(mDate);
    } else {
      var mDate = DateTime.parse(date);
      return format.format(mDate.toLocal());
    }
  } catch (e) {
    print(e);
    return 'NoDate';
  }
}

int getIntDate(String date, BuildContext context) {
  print('\n---------------> getIntDate $date'); //Sun, 28 Oct 2018 23:59:49 GMT

  try {
    if (date.contains('GMT')) {
      var mDate = getLocalDateFromGMT(date, context);
      return mDate.millisecondsSinceEpoch;
    } else {
      var mDate = DateTime.parse(date);
      return mDate.millisecondsSinceEpoch;
    }
  } catch (e) {
    print(e);
    return 0;
  }
}

String getFormattedDateHourMinute({required DateTime date, required BuildContext context}) {
  try {
    if (context == null) {
      var dateFormat = DateFormat('HH:mm');
      return dateFormat.format(date);
    } else {
      Locale myLocale = Localizations.localeOf(context);
      var dateFormat = DateFormat('HH:mm', myLocale.toString());
      return dateFormat.format(date);
    }
  } catch (e) {
    print(e);
    return 'NoDate';
  }
}

DateTime getLocalDateFromGMT(String date, BuildContext context) {
  //print('getLocalDateFromGMT string: $date'); //Sun, 28 Oct 2018 23:59:49 GMT
  Locale myLocale = Localizations.localeOf(context);

  //print('+++++++++++++++ locale: ${myLocale.toString()}');

  try {
    var mDate = translateGMTString(date);
    return mDate.toLocal();
  } catch (e) {
    print(e);
    throw e;
  }
}

DateTime translateGMTString(String date) {
  var strings = date.split(' ');
  var day = int.parse(strings[1]);
  var mth = strings[2];
  var year = int.parse(strings[3]);
  var time = strings[4].split(':');
  var hour = int.parse(time[0]);
  var min = int.parse(time[1]);
  var sec = int.parse(time[2]);
  var cc = DateTime.utc(year, getMonth(mth), day, hour, min, sec);

  //print('##### translated date: ${cc.toIso8601String()}');
  //print('##### translated local: ${cc.toLocal().toIso8601String()}');

  return cc;
}

int getMonth(String mth) {
  switch (mth) {
    case 'Jan':
      return 1;
    case 'Feb':
      return 2;
    case 'Mar':
      return 3;
    case 'Apr':
      return 4;
    case 'Jun':
      return 6;
    case 'Jul':
      return 7;
    case 'Aug':
      return 8;
    case 'Sep':
      return 9;
    case 'Oct':
      return 10;
    case 'Nov':
      return 11;
    case 'Dec':
      return 12;
  }
  return 0;
}

String getUTCDate() {
  String now = new DateTime.now().toUtc().toIso8601String();
  return now;
}

String getUTC(DateTime date) {
  String now = date.toUtc().toIso8601String();
  return now;
}

String getFormattedDate(String date) {
  try {
    DateTime d = DateTime.parse(date);
    var format = new DateFormat.yMMMd();
    return format.format(d);
  } catch (e) {
    return date;
  }
}

String getFormattedDateHour(String date) {
  try {
    DateTime d = DateTime.parse(date);
    var format = new DateFormat.Hm();
    return format.format(d.toLocal());
  } catch (e) {
    DateTime d = DateTime.now();
    var format = new DateFormat.Hm();
    return format.format(d.toLocal());
  }
}

String getFormattedDateHourMinSec(String date) {
  try {
    DateTime d = DateTime.parse(date);
    var format = new DateFormat.Hms();
    return format.format(d.toLocal());
  } catch (e) {
    DateTime d = DateTime.now();
    var format = new DateFormat.Hm();
    return format.format(d.toLocal());
  }
}

String getFormattedDateHourMinuteSecond() {
  var format = new DateFormat.Hms();
  try {
    DateTime d = DateTime.now();
    return format.format(d.toLocal());
  } catch (e) {
    return DateTime.now().toIso8601String();
  }
}

String getFormattedNumber(int number, BuildContext context) {
  Locale myLocale = Localizations.localeOf(context);
  var val = myLocale.languageCode + '_' + myLocale.countryCode!;
  final oCcy = new NumberFormat("###,###,###,###,##0", val);

  return oCcy.format(number);
}

String getFormattedDouble(double number, BuildContext context) {
  Locale myLocale = Localizations.localeOf(context);
  var val = myLocale.languageCode + '_' + myLocale.countryCode!;
  final oCcy = new NumberFormat("###,###,###,###,##0.0", val);

  return oCcy.format(number);
}

String getFormattedAmount(String amount, BuildContext context) {
  Locale myLocale = Localizations.localeOf(context);
  var val = myLocale.languageCode + '_' + myLocale.countryCode!;
  //print('getFormattedAmount ----------- locale is  $val');
  final oCcy = new NumberFormat("###,###,###,###,##0.00", val);
  try {
    double m = double.parse(amount);
    return oCcy.format(m);
  } catch (e) {
    return amount;
  }
}

