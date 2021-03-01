import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:webrtc_demo/generated/l10n.dart';
import 'package:webrtc_demo/models/model.dart';
import 'package:webrtc_demo/services/socket.dart';
import 'package:webrtc_demo/tool/common.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';

class ChatBloc extends Disposable {
  final SocketCli socket;
  AppBloc appBloc = AppModule.to.get<AppBloc>();
  final data = BehaviorSubject<List<DataUser>>.seeded([]);

  ChatBloc(this.socket) {
    socket.listen(Common.EVENT.newmsg, onNewMsg);
    socket.listen(Common.EVENT.allData, onAllMsg);
    socket.listen(Common.EVENT.inComing, onInComming);
    socket.listen(Common.EVENT.onEndCall, onEndCall);
    socket.emit(Common.EVENT.getAllData);
  }

  String getDevice() {
    return appBloc.deviceName;
  }

  onNewMsg(data) {
    print("in data1 $data");
    setData([
      ...this.data.value,
      ...[DataUser.fromJson(data)]
    ]);
  }

  onAllMsg(data) {
    List<DataUser> listUser = new List<DataUser>();
    data.forEach((v) {
      listUser.add(new DataUser.fromJson(v));
    });
    setData(listUser);
  }

  onInComming(data) {
    print("onInComming $data");
    appBloc.push(S.current.comming_title, S.current.in_comming(data), data);
  }

  onEndCall(_) {
    print("in end call");
    appBloc.resetPush();
  }
  
  onSendMessage(String message) {
    if (message != "") {
      Map<String, dynamic> params = new Map<String, dynamic>();
      params['id'] = 1;
      params['name'] = getDevice();
      params['message'] = message;
      socket.emit(Common.EVENT.sendmsg, params);
    }
  }

  Function(List<DataUser>) get setData => data.sink.add;

  Stream<List<DataUser>> get getData => data.stream;

  @override
  void dispose() {
    data.close();
  }
}
