import 'package:flutter/material.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';
import '../../widgets/text_widget.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key key, this.title = "Chat"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  AppBloc appBloc = AppModule.to.get<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextWidget("ok nha ${appBloc.deviceName}"),
          Icon(Icons.call)
        ],
      ),
    );
  }
}
