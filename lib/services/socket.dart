import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../tool/common.dart';

class SocketCli {
  IO.Socket socket;

  connect(String deviceName) {
    final Map<String, dynamic> query = new Map<String, dynamic>();
    query['model'] = deviceName;
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
  disconnect() {
    socket.disconnect();
  }
}
