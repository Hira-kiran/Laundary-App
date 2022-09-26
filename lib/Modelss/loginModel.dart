// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, file_names

class FormModel {
  String? userId;
  String? username;
  String? email;
  String? password;
  String? address;
  String? phone;
  String? userRole;
  String? commission;
  String? addedUserId;
  String? status;
  String? adddatetime;

  FormModel(
      {this.userId,
      this.username,
      this.email,
      this.password,
      this.address,
      this.phone,
      this.userRole,
      this.commission,
      this.addedUserId,
      this.status,
      this.adddatetime});

  FormModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
    phone = json['phone'];
    userRole = json['user_role'];
    commission = json['commission'];
    addedUserId = json['added_user_id'];
    status = json['status'];
    adddatetime = json['adddatetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['user_role'] = this.userRole;
    data['commission'] = this.commission;
    data['added_user_id'] = this.addedUserId;
    data['status'] = this.status;
    data['adddatetime'] = this.adddatetime;
    return data;
  }
}
