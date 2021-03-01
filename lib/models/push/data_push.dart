class DataPush {
  String message;
  String title;
  String devicePeer;

  DataPush(
      this.message,
      this.title,
      this.devicePeer
      );

  DataPush.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    title = json['title'];
    devicePeer = json['devicePeer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['title'] = this.title;
    data['devicePeer'] = this.devicePeer;
    return data;
  }
}