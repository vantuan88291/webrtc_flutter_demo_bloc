import 'package:webrtc_demo/models/model.dart';
import 'package:webrtc_demo/models/theme/theme_data.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webrtc_demo/services/socket.dart';

class AppBloc extends Disposable {
  final SocketCli socket;
  final theme = BehaviorSubject<ThemeModes>();
  final message = BehaviorSubject<String>();
  final loading = BehaviorSubject<bool>.seeded(false);
  final dataPush = BehaviorSubject<DataPush>();
  var deviceName = '';

  AppBloc(this.socket);

  //dispose will be called automatically by closing its streams
  Sink<ThemeModes> get setTheme => theme.sink;

  Stream<ThemeModes> get getTheme => theme.stream;

  Function(String) get setMessage => message.sink.add;

  Stream<String> get getMessage => message.stream;

  Function(bool) get setLoad => loading.sink.add;

  Stream<bool> get getLoad => loading.stream;

  Function(DataPush) get setPush => dataPush.sink.add;

  Stream<DataPush> get getPush => dataPush.stream;

  push(String title, String msg, String devicePeer) {
    DataPush item = DataPush(msg, title, devicePeer);
    setPush(item);
  }

  resetPush() {
    setPush(null);
  }

  Future changTheme(THEME_MODE themeMode) async {
    setTheme.add(getThemeMode(themeMode));
  }

  setDeviceName(String name) {
    deviceName = name;
    socket.connect(deviceName);
  }

  @override
  void dispose() {
    socket.disconnect();
    theme.close();
    message.close();
    loading.close();
    dataPush.close();
  }
}
