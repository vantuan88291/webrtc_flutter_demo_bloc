import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:webrtc_demo/models/model.dart';
import 'package:webrtc_demo/tool/common.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';

class ChatBloc extends Disposable {
  AppBloc appBloc = AppModule.to.get<AppBloc>();
  IO.Socket socket;
  final data = BehaviorSubject<List<DataUser>>.seeded([]);


  ChatBloc() {
    final Map<String, dynamic> query = new Map<String, dynamic>();
    query['model'] = appBloc.deviceName;
    socket = IO.io(Common.DOMAIN, OptionBuilder()
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

  Function(List<DataUser>) get setData => data.sink.add;

  Stream<List<DataUser>> get getData => data.stream;


  @override
  void dispose() {
    socket.disconnect();
    data.close();
  }
}
