class ModeRegister {
  var status = false;
  var token = "";
  Data? data;

  ModeRegister(this.status, this.token, this.data);

  ModeRegister.fromJson(Map<String, dynamic> json) {
    status = json['status'] == null ? false : json['status'];
    token = json['token'] == null ? '' : json['token'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  var email;
  var name;
  var updatedAt;
  var createdAt;
  var id;
  var profilePic;

  Data(
      {this.email,
      this.name,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.profilePic});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'] == null ? '' : json['email'];
    name = json['name'] == null ? '' : json['name'];
    updatedAt = json['updated_at'] == null ? '' : json['updated_at'];
    createdAt = json['created_at'] == null ? '' : json['created_at'];
    id = json['id'] == null ? '' : json['id'];
    profilePic = json['profile_pic'] == null ? '' : json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}
