import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:desafio_mobile/utils/color_util.dart';
import 'package:desafio_mobile/utils/text_style_util.dart';
import 'package:desafio_mobile/view/splash/splash_screen.dart';
import 'package:desafio_mobile/view/commons/widget/progress.dart';
import 'package:desafio_mobile/view/home/widget/empty_list.dart';
import 'package:desafio_mobile/view/home/widget/location_list.dart';
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
  late List<Location> _listLocation;
  int _limit = 10;
  bool _loading = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _listLocation = [];
    _loading = true;
    _error = false;
    getData();
  }

  void getData() async {
    _loading = true;
    try {
      List<Location>? data = await LocationData().getData(_limit);
      if (data != null) {
        _onSuccess(data);
      } else {
        _onError();
      }
    } catch (e) {
      _onError();
    }
  }

  _onSuccess(List<Location> data) {
    setState(() {
      _loading = false;
      _listLocation = _listLocation + data;
    });
  }

  _onError() {
    setState(() {
      _loading = false;
      _error = true;
    });
  }

  _onTryAgain() {
    setState(() {
      _loading = true;
      _error = false;
      getData();
    });
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
      body: _listLocation.isEmpty ?
          (_loading ? const Progress() : EmptyList(onTryAgain: _onTryAgain))
          : LocationList(
                listLocation: _listLocation,
                error: _error,
                onTryAgain: _onTryAgain
            )
    );
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
