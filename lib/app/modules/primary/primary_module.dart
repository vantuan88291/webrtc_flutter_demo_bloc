import 'package:webrtc_demo/app/blocs/chat_bloc.dart';
import 'package:webrtc_demo/app/pages/chat/chat_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:webrtc_demo/app/pages/loading/loading_page.dart';
import 'package:webrtc_demo/app/pages/routes.dart';
import 'package:webrtc_demo/app/pages/video/video_page.dart';

class PrimaryModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => ChatBloc(i()), lazy: true),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => LoadingPage()),
    ModularRouter(Routes.chat, child: (_, args) => ChatPage()),
    ModularRouter(Routes.video, child: (_, args) => VideoPage(devicePeer: args.data["name"], isAnswer: args.data["isAnswer"],)),
  ];

  static Inject get to => Inject<PrimaryModule>.of();
}
