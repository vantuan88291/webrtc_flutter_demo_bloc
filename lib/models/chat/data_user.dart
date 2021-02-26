class DataUser {
  String name;
  String message;

  DataUser(
      this.name,
      this.message
      );

  DataUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['message'] = this.message;
    return data;
  }
}