import 'package:webrtc_demo/app/pages/chat/chat_bloc.dart';
import 'package:webrtc_demo/app/pages/chat/chat_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:webrtc_demo/app/pages/loading/loading_page.dart';
import 'package:webrtc_demo/app/pages/routes.dart';

class PrimaryModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((_) => ChatBloc(), lazy: true),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => LoadingPage()),
    ModularRouter(Routes.chat, child: (_, args) => ChatPage()),
  ];

  static Inject get to => Inject<PrimaryModule>.of();
}
