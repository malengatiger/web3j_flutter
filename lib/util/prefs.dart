import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3j_flutter/models/wallet_file.dart';

import 'generic_functions.dart';

Prefs prefs = Prefs();
class Prefs {

 SharedPreferences? prefs;

  Future _init() async {
    pp('SharedPreferences.getInstance() .... 🐊🐊🐊');
    prefs = await SharedPreferences.getInstance();
    pp('SharedPreferences; 🍀 🍀 🍀 we good, Senor!');
  }

  Future<int> getThemeIndex()  async {
    if (prefs == null) {
      await _init();
    }
    var m = prefs!.getInt('themeIndex');
    if (m == null) {
      return 0;
    } else {
      return m;
    }
  }

 Future<void> setThemeIndex(int index)  async {
   if (prefs == null) {
     await _init();
   }
   prefs!.setInt('themeIndex', index);
 }

 void saveWalletFile(WalletFile walletFile) async  {
    if (prefs == null) {
      await _init();
    }
    prefs!.setString('walletFile', jsonEncode(walletFile.toJson()));
    pp('🦚 🦚 🦚 WalletFile saved in cache: 💦  ${walletFile.address}');
 }
 Future<WalletFile?> getWalletFile() async {
   if (prefs == null) {
     await _init();
   }
   var walletString = prefs!.getString('walletFile');
   if (walletString == null) {
     return null;
   }
   var file = WalletFile.fromJson(jsonDecode(walletString));
   pp('🦚 🦚 🦚 WalletFile retrieved from cache: 💦  ${file.address}');
   return file;
 }
}