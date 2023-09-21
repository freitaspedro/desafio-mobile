import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desafio_mobile/utils/color_util.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/view/splash/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void handleOnSelected(String value) {
    switch (value) {
      case 'Logout':
        logout();
        break;
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    navigateToLogin();
  }

  void navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(context, SplashScreen.route, ModalRoute.withName("/home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorUtil.blue),
        title: const Text(
          "Locais",
          style: TextStyleUtil.textAppBar,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return {'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            onSelected: handleOnSelected,
          ),
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
      ),
      body: Container(),
    );
  }

}
