import 'package:desafio_mobile/view/home/widget/location_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desafio_mobile/utils/color_util.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/view/splash/splash_screen.dart';
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    isWaiting = true;
    try {
      var data = await LocationData().getData();
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
      body: ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: listLocation!.length,
          itemBuilder: (BuildContext context, int index) {
            return LocationItem(location: listLocation?.elementAt(index));
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 1.0);
          },
        ),
    );
  }

}
