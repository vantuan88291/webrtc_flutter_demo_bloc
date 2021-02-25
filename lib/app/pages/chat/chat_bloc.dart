import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';

class ChatBloc extends Disposable {
  AppBloc appBloc = AppModule.to.get<AppBloc>();
  IO.Socket socket;

  ChatBloc() {
    final Map<String, dynamic> query = new Map<String, dynamic>();
    query['model'] = appBloc.deviceName;
    socket = IO.io('http://10.0.10.53:3000', OptionBuilder()
        .setTransports(['websocket'])
        .setQuery(query).build());
    socket.onConnect((_) {
      print('connected');
    });
    socket.onConnectError((data) => {
      print(data)
    });
    socket.onConnectTimeout((data) => print(data));
  }

  @override
  void dispose() {
    socket.disconnect();
  }
}
