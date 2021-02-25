import 'package:webrtc_demo/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/text_widget.dart';
class ItemUser extends StatelessWidget {
  const ItemUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topRight,
      child: ButtonWidget(
        onPress: () {},
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextWidget('Nội dung comment', color: Theme.of(context).textSelectionHandleColor,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
