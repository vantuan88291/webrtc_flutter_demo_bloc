import 'package:flutter/material.dart';
import 'package:webrtc_demo/app/modules/primary/primary_module.dart';
import '../../widgets/text_widget.dart';

import 'chat_bloc.dart';

class ChatPage extends StatefulWidget {
  final String title;

  const ChatPage({Key key, this.title = "Chat"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatBloc chat = PrimaryModule.to.get<ChatBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextWidget("ok nha"),
          Icon(Icons.call)
        ],
      ),
    );
  }
}
