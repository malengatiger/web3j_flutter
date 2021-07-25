import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3j_flutter/util/prefs.dart';

import 'generic_functions.dart';

final ThemeBloc themeBloc = ThemeBloc();

class ThemeBloc {
  ThemeBloc() {
    pp('$mm ThemeBloc constructor about to initialize current theme');
    initialize();
  }
  static const mm = '📌 📌 📌 📌️ 📌 📌 📌 📌️ 🔵 ThemeBloc: 🔵 ';

  final StreamController<int> _themeController = StreamController.broadcast();
  final _rand = Random(DateTime.now().millisecondsSinceEpoch);

  int _themeIndex = 0;

  int get themeIndex => _themeIndex;

  initialize() async {
    _themeIndex = await prefs.getThemeIndex();
    pp('$mm initialize:: adding index from localDB to stream .... theme index returned:  🚹 $_themeIndex  🚹 ');
    _themeController.sink.add(_themeIndex);
    return _themeIndex;
  }

  changeToTheme(int index) {
    pp('$mm changeToTheme: adding index to stream ....');
    _themeController.sink.add(index);
  }

  changeToRandomTheme() async {
    _themeIndex = _rand.nextInt(ThemeUtil.getThemeCount() - 1);
    pp('$mm ......... changeToRandomTheme:  🚹  🚹 themeIndex: $_themeIndex , will add to prefs ...');
    prefs.setThemeIndex(_themeIndex);
    _themeController.sink.add(_themeIndex);
  }

  closeStream() {
    _themeController.close();
  }

  Stream<int> get newThemeStream => _themeController.stream;
}

class ThemeUtil {
  static List<ThemeData> _themes = [];
  static const mm = '📌 📌 📌 📌️ 📌 📌 📌 📌️ ThemeUtil: 🔵 ';
  static int index = 0;

  static ThemeData getTheme({required int themeIndex}) {
    pp('$mm 🌈 🌈 🌈 🌈 .......... getting theme with index: 🌈 $themeIndex');
    if (_themes.isEmpty) {
      _setThemes();
    }
    if (themeIndex >= _themes.length) {
      index = 0;
    } else {
      index = themeIndex;
    }

    return _themes.elementAt(index);
  }

  static int getThemeCount() {
    _setThemes();
    return _themes.length;
  }

  static var _rand = Random(DateTime.now().millisecondsSinceEpoch);

  static Future<ThemeData> getRandomTheme() async {
    if (_themes.isEmpty) _setThemes();
    var index = _rand.nextInt(_themes.length - 1);
    prefs.setThemeIndex(index);
    pp('$mm return random theme from index : $index');
    return _themes.elementAt(index);
  }

  static ThemeData getThemeByIndex(int index) {
    if (index >= _themes.length || index < 0) index = 0;
    return _themes.elementAt(index);
  }

  static void _setThemes() {
    _themes.clear();

    //index = 0
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.black,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.grey.shade200,
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.black,
        ), //
        elevation: MaterialStateProperty.all(4.0), // button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ), //text (and icon)
      )),
      appBarTheme:
          AppBarTheme(color: Colors.white, brightness: Brightness.dark),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.black),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));
//
    //index = 1
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.pink.shade400,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.pink[50],
      scaffoldBackgroundColor: Colors.pink[50],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.pink,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,

          colorScheme: ColorScheme.light(),
          buttonColor: Colors.pink),
      textTheme: GoogleFonts.ralewayTextTheme(),
      appBarTheme: AppBarTheme(color: Colors.pink[400]),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 2
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.teal,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      scaffoldBackgroundColor: Colors.teal[50],
      textTheme: GoogleFonts.josefinSansTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.teal,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.teal),
      appBarTheme: AppBarTheme(color: Colors.teal.shade400),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 3
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.teal.shade700,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      textTheme: GoogleFonts.robotoTextTheme(),
      scaffoldBackgroundColor: Colors.brown[50],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.teal,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.brown),
      appBarTheme: AppBarTheme(color: Colors.brown.shade300),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 4
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.pink.shade500,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.pink.shade100,
      scaffoldBackgroundColor: Colors.pink[50],
      appBarTheme: AppBarTheme(color: Colors.pink.shade400),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.pink,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.pink),
      textTheme: GoogleFonts.robotoTextTheme(),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 5
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.brown.shade700,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      scaffoldBackgroundColor: Colors.brown[50],
      appBarTheme: AppBarTheme(color: Colors.brown.shade400),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.brown,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.brown),
      textTheme: GoogleFonts.pattayaTextTheme(),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 6
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.lime.shade800,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.lime.shade100,
      scaffoldBackgroundColor: Colors.lime[50],
      appBarTheme: AppBarTheme(color: Colors.lime.shade400),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.lime.shade600,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.lime[700]),
      textTheme: GoogleFonts.notoSansTextTheme(),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 7
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.blue.shade800,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.blue.shade100,
      scaffoldBackgroundColor: Colors.blue[50],
      textTheme: GoogleFonts.ralewayTextTheme(),
      appBarTheme: AppBarTheme(color: Colors.blue.shade400),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.blue,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.blue),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 8
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.pink.shade700,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      scaffoldBackgroundColor: Colors.blueGrey[50],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.pink,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.pink),
      appBarTheme: AppBarTheme(color: Colors.blueGrey.shade300),
      textTheme: GoogleFonts.notoSerifTextTheme(),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 9
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.purple,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      scaffoldBackgroundColor: Colors.purple[50],
      appBarTheme: AppBarTheme(color: Colors.purple.shade400),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.purple,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.purple),
      textTheme: GoogleFonts.josefinSansTextTheme(),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 10
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.amber.shade900,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      scaffoldBackgroundColor: Colors.amber[50],
      appBarTheme: AppBarTheme(color: Colors.amber.shade400),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),

        //button color
        //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.brown.shade400),
      textTheme: GoogleFonts.lobsterTextTheme(),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 11
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.deepOrange,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      scaffoldBackgroundColor: Colors.deepOrange[50],
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.deepOrange.shade400,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.deepOrange.shade600),
      appBarTheme: AppBarTheme(color: Colors.deepOrange.shade300),
      textTheme: GoogleFonts.ralewayTextTheme(),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));

    //index = 12
    _themes.add(ThemeData(
      fontFamily: 'SFPro',
      primaryColor: Colors.indigo,
      colorScheme: ColorScheme.light(),
      cardColor: Colors.white,
      backgroundColor: Colors.brown.shade100,
      scaffoldBackgroundColor: Colors.orange[50],
      textTheme: GoogleFonts.ralewayTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.indigo.shade600,
        ), //button color
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xffffffff),
        ), //text (and icon)
      )),
      buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          colorScheme: ColorScheme.light(),
          buttonColor: Colors.orange.shade600),
      appBarTheme: AppBarTheme(color: Colors.orange.shade300),
    ).copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder()
        })));
  }
}
