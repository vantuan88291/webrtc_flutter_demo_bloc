import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';
import '../routes.dart';

class LoadingPage extends StatefulWidget {
  final String title;

  const LoadingPage({Key key, this.title = "Loading"}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  AppBloc appBloc = AppModule.to.get<AppBloc>();

  @override
  void initState() {
    super.initState();
    remember();
  }

  remember() async {
    String deviceData;
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceData = androidInfo.model;
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceData = iosInfo.name;
      }
      appBloc.setDeviceName(deviceData);
    } on PlatformException {}
    Modular.to.pushReplacementNamed(Routes.chat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}
