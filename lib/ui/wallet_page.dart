import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web3j_flutter/models/wallet_file.dart';
import 'package:web3j_flutter/services/net_service.dart';
import 'package:web3j_flutter/util/functions.dart';
import 'package:web3j_flutter/util/generic_functions.dart';
import 'package:web3j_flutter/util/prefs.dart';
import 'package:web3j_flutter/util/snack.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String? walletJSON;
  bool busy = false;

  static const mm = '🐷 🐷 🐷 WalletPage: 🐷 ';
  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  void _createWallet() async {
    pp('$mm Creating wallet ..........');
    setState(() {
      busy = true;
      walletJSON = null;
    });
    try {
      var resp = await netService.get(suffix: 'createWallet?password=kktiger3');
      walletJSON = '🌿 🌿 🌿 \n${resp.body.toString()} \n🌿 🌿 🌿 ';
      var wFile = WalletFile.fromJson(jsonDecode(resp.body.toString()));
      prefs.saveWalletFile(wFile);
      pp('$mm RESULT OF CALL: 🌿 🌿 🌿 wFile.toJson(): ${wFile.toJson()} 🌿 🌿 🌿 ');
      showToast(message: '🌿 🌿 🌿: We rolling, Boss! Cooking with Gas!',
          padding: 24, backgroundColor: Colors.yellow,
          context: context);
    } catch (e) {
      AppSnackBar.showErrorSnackBar(context: context, message: 'Fucked! $e');
    }
    setState(() {
      busy = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Wallet SkunkWorks',
            style: Styles.whiteSmall,
          ),
        ),
        backgroundColor: Colors.brown[100],
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    busy
                        ? Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.pink,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: _createWallet,
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text(
                                'Create Wallet',
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 24,
                    ),
                    walletJSON == null
                        ? Container(
                            child: Text(
                              'Waiting for Wally ...',
                              style: Styles.greyLabelMedium,
                            ),
                          )
                        : Container(
                            height: 400,
                            child: Card(
                              elevation: 4,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(walletJSON!),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
