import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  final String title;
  final String devicePeer;
  final bool isAnswer;
  const VideoPage({Key key, this.title = "Video", this.devicePeer, this.isAnswer}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("in video ${widget.devicePeer} --- ${widget.isAnswer}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
