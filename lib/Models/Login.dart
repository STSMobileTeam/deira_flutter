
class LoginReq {
  String? strUsername;
  String? strPassword;
  String? strTerminalType;

  LoginReq({this.strUsername, this.strPassword, this.strTerminalType});

  LoginReq.fromJson(Map<String, dynamic> json) {
    strUsername = json['strUsername'];
    strPassword = json['strPassword'];
    strTerminalType = json['strTerminalType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strUsername'] = this.strUsername;
    data['strPassword'] = this.strPassword;
    data['strTerminalType'] = this.strTerminalType;
    return data;
  }
}

class LoginRes {
  bool? b2CMobileGetDetailsResult;
  String? strErrorMsg;
  String? strResult;

  LoginRes({this.b2CMobileGetDetailsResult, this.strErrorMsg, this.strResult});

  LoginRes.fromJson(Map<String, dynamic> json) {
    b2CMobileGetDetailsResult = json['B2CMobileGetDetailsResult'];
    strErrorMsg = json['strErrorMsg'];
    strResult = json['strResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['B2CMobileGetDetailsResult'] = this.b2CMobileGetDetailsResult;
    data['strErrorMsg'] = this.strErrorMsg;
    data['strResult'] = this.strResult;
    return data;
  }
}