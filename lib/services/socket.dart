import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../tool/common.dart';

typedef dynamic EventHandler<T>(T data);
class SocketCli {
  IO.Socket socket;

  connect(String deviceName) {
    final Map<String, dynamic> query = new Map<String, dynamic>();
    query['model'] = deviceName;
    socket = IO.io(Common.DOMAIN,
        OptionBuilder().setTransports(['websocket']).setQuery(query).build());
    socket.onConnect((_) {
      print('connected');
    });
    socket.onConnectError((data) => {print(data)});
    socket.onConnectTimeout((data) => print(data));
  }

  disconnect() {
    print('disconnect');
    socket.disconnect();
  }

  listen(String event, EventHandler callBack) {
    socket.on(event, callBack);
  }

  emit(String event, [data]) {
    socket.emit(event, data);
  }
}
