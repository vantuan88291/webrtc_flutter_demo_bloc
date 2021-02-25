import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webrtc_demo/models/model.dart';
import 'package:webrtc_demo/services/socket.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';

class ChatBloc extends Disposable {
  final SocketCli socket;
  AppBloc appBloc = AppModule.to.get<AppBloc>();
  final data = BehaviorSubject<List<DataUser>>.seeded([]);
  ChatBloc(this.socket);


  Function(List<DataUser>) get setData => data.sink.add;

  Stream<List<DataUser>> get getData => data.stream;


  @override
  void dispose() {
    data.close();
  }
}
