import 'package:desafio_mobile/view/home/widget/location_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desafio_mobile/utils/color_util.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/view/splash/splash_screen.dart';
import 'package:desafio_mobile/view/home/widget/empty_list.dart';
import 'package:desafio_mobile/view/commons/widget/progress.dart';
import 'package:desafio_mobile/model/location.dart';
import 'package:desafio_mobile/service/location_data.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Location>? listLocation;
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> _getData() async {
    setState(() {
      getData();
    });
  }

  void getData() async {
    isWaiting = true;
    try {
      List<Location>? data = await LocationData().getData();
      isWaiting = false;
      setState(() {
        listLocation = data;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorUtil.green),
        title: const Text(
          "Locais",
          style: TextStyleUtil.textAppBar,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              logout();
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: '/logout',
                  child: Text("Logout")
                ),
              ];
            },
          ),
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0.0,
      ),
      body: !isWaiting ? RefreshIndicator(
          onRefresh: _getData,
          child: (isNotNullAndNotEmpty(listLocation)) ?
              LocationList(listLocation: listLocation!) : const EmptyList()
      ) : const Progress(),
    );
  }

  bool isNotNullAndNotEmpty<T>(List<T>? list) {
    return list != null && list.isNotEmpty;
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    navigateToLogin();
  }

  void navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(
        context,
        SplashScreen.route,
        ModalRoute.withName("/home")
    );
  }

}
