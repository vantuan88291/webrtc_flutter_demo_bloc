import 'package:flutter/material.dart';
import 'package:webrtc_demo/app/modules/primary/primary_module.dart';
import 'package:webrtc_demo/generated/l10n.dart';
import 'package:webrtc_demo/models/model.dart';
import '../../app_bloc.dart';
import '../../app_module.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import 'chat_bloc.dart';
import 'widgets/item_peer.dart';
import 'widgets/item_user.dart';

class ChatPage extends StatefulWidget {
  final String title;

  const ChatPage({Key key, this.title = "Chat"}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatBloc chat = PrimaryModule.to.get<ChatBloc>();
  AppBloc app = AppModule.to.get<AppBloc>();
  var _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  onSendMessage() {
    if (_controller.text != "") {
      chat.onSendMessage(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: StreamBuilder(
                initialData: [],
                stream: chat.getData,
                builder: (c, d) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: d.data.length,
                    itemBuilder: (c, i) {
                      final DataUser item = d.data[i];
                      if (chat.getDevice() == item.name) {
                        return ItemUser(item, key: Key("$i"),);
                      }
                      return ItemPeer(item, key: GlobalKey(debugLabel: "$i"),);
                    }),
              )
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: TextFieldWidget(
                      controller: _controller,
                      maxLines: null,
                      keyBoard: TextInputType.multiline,
                      style: TextStyle(color: Theme.of(context).textSelectionColor),
                      hint: S.current.enter_msg,
                    ),
                    color: Theme.of(context).bottomAppBarColor,
                  )),
              ButtonWidget(
                color: Theme.of(context).backgroundColor,
                padding: EdgeInsets.symmetric(vertical: 10),
                radius: 0,
                onPress: onSendMessage,
                child: Icon(Icons.send, color: Theme.of(context).textSelectionColor, size: 30,),)
            ],
          )
        ]));
  }
}
