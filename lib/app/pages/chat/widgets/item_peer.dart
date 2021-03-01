import 'package:flutter_modular/flutter_modular.dart';
import 'package:webrtc_demo/generated/l10n.dart';
import 'package:webrtc_demo/models/model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/text_widget.dart';
import '../../routes.dart';
class ItemPeer extends StatelessWidget {
  final DataUser item;
  final GlobalKey key;
  const ItemPeer(this.item, {this.key}) : super(key: key);
  showDropDown(BuildContext context, double x, double y) async {
    var route = PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.8,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
            ),
            alignment: Alignment.centerLeft,
            child: child,
          );
        },
        pageBuilder: (context, v1, v2) {
          return GestureDetector(
            onTap: () {
              Modular.to.pop();
            },
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    top: y + 10,
                    right: MediaQuery.of(context).size.width - 120,
                    child: GestureDetector(
                      onTap: () {
                        Modular.to.pop();
                      },
                      child: Container(
                        width: 100,
                        child: Material(
                          color: Colors.white,
                          child: ButtonWidget(
                            onPress: () {
                              Modular.to.pop();
                              Map<String, dynamic> params = new Map<String, dynamic>();
                              params["name"] = this.item.name;
                              params["isAnswer"] = false;
                              Modular.to.pushNamed(Routes.video, arguments: params);
                            },
                            text: S.current.call_video,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          elevation: 5,
                          shadowColor: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        opaque: false);
    Modular.to.push(route);
  }
  onShowDrop(context) {
    RenderBox box = key.currentContext.findRenderObject();
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    double x = position.dx;
    showDropDown(context, x, y + 38);
  }
  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topLeft,
      child: ButtonWidget(
        onPress: () => onShowDrop(context),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              item?.name ?? '',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Theme.of(context).textSelectionColor),
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(10),
              child: TextWidget(item?.message ?? '', color: Theme.of(context).textSelectionColor,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Theme.of(context).accentColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
