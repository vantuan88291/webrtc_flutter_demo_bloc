import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:webrtc_demo/app/pages/routes.dart';
import 'package:webrtc_demo/app/widgets/button_widget.dart';
import 'package:webrtc_demo/app/widgets/text_widget.dart';
import 'package:webrtc_demo/generated/l10n.dart';
import 'package:webrtc_demo/models/model.dart';

import '../app_bloc.dart';
import '../app_module.dart';

class PushWidget extends StatefulWidget {
  @override
  StatePushWidget createState() => StatePushWidget();
}
class StatePushWidget extends State<PushWidget> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animationPush;
  AppBloc app;
  @override
  void initState() {
    super.initState();
    app = AppModule.to.get<AppBloc>();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animationPush =
        Tween(begin: -100.0, end: 0.0).animate(animationController);
    app.getPush.listen((event) {
      if (event != null) {
        animationController.forward();
      } else {
        animationController.reverse();

      }
    });
  }
  onPress() {
    Map<String, dynamic> params = new Map<String, dynamic>();
    params["name"] = app.dataPush.value.title;
    params["isAnswer"] = true;
    app.resetPush();
    Modular.to.pushNamed(Routes.video, arguments: params);
  }
  Widget renderMessage() => Positioned(
    top: animationPush.value,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ButtonWidget(
        radius: 0,
        padding: EdgeInsets.only(top: 36, bottom: 18, left: 10, right: 10),
        color: Colors.green,
        onPress: onPress,
        child: Align(
          alignment: Alignment.topLeft,
          child: StreamBuilder<DataPush>(
            stream: app.getPush,
            builder: (c, v) => Row(
              children: [
                Icon(Icons.phone, size: 30,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(v.data?.title ?? S.current.comming_title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 6,),
                    TextWidget(v.data?.message ?? '', style: TextStyle(color: Colors.white))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (c, v) => renderMessage(),
    );
  }
}
