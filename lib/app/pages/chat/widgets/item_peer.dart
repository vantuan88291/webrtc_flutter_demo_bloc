import 'package:webrtc_demo/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/text_widget.dart';
class ItemPeer extends StatelessWidget {
  const ItemPeer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topLeft,
      child: ButtonWidget(
        onPress: () {},
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              "Device",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Theme.of(context).textSelectionColor),
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(10),
              child: TextWidget('Nội dung comment', color: Theme.of(context).textSelectionColor,),
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
