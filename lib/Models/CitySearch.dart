class CityRQ {
  Agent? agent;
  String? name;
  String? type;
  String? category;

  CityRQ({this.agent, this.name, this.type, this.category});

  CityRQ.fromJson(Map<String, dynamic> json) {
    agent = json['Agent'] != null ? new Agent.fromJson(json['Agent']) : null;
    name = json['Name'];
    type = json['Type'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agent != null) {
      data['Agent'] = this.agent!.toJson();
    }
    data['Name'] = this.name;
    data['Type'] = this.type;
    data['Category'] = this.category;
    return data;
  }
}

class Agent {
  String? agentID;
  String? terminalId;
  String? posId;
  String? postId;
  String? userName;
  String? appType;
  String? version;
  String? branchId;
  String? environment;
  String? clientId;
  String? winyatraId;
  String? agentType;
  String? issuingPosId;
  String? issuingPosTId;
  String? issuingBranchId;
  String? userTrackId;

  Agent(
      {this.agentID,
        this.terminalId,
        this.posId,
        this.postId,
        this.userName,
        this.appType,
        this.version,
        this.branchId,
        this.environment,
        this.clientId,
        this.winyatraId,
        this.agentType,
        this.issuingPosId,
        this.issuingPosTId,
        this.issuingBranchId,
        this.userTrackId});

  Agent.fromJson(Map<String, dynamic> json) {
    agentID = json['AgentID'];
    terminalId = json['TerminalId'];
    posId = json['PosId'];
    postId = json['PostId'];
    userName = json['UserName'];
    appType = json['AppType'];
    version = json['Version'];
    branchId = json['BranchId'];
    environment = json['Environment'];
    clientId = json['ClientId'];
    winyatraId = json['WinyatraId'];
    agentType = json['AgentType'];
    issuingPosId = json['IssuingPosId'];
    issuingPosTId = json['IssuingPosTId'];
    issuingBranchId = json['IssuingBranchId'];
    userTrackId = json['UserTrackId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AgentID'] = this.agentID;
    data['TerminalId'] = this.terminalId;
    data['PosId'] = this.posId;
    data['PostId'] = this.postId;
    data['UserName'] = this.userName;
    data['AppType'] = this.appType;
    data['Version'] = this.version;
    data['BranchId'] = this.branchId;
    data['Environment'] = this.environment;
    data['ClientId'] = this.clientId;
    data['WinyatraId'] = this.winyatraId;
    data['AgentType'] = this.agentType;
    data['IssuingPosId'] = this.issuingPosId;
    data['IssuingPosTId'] = this.issuingPosTId;
    data['IssuingBranchId'] = this.issuingBranchId;
    data['UserTrackId'] = this.userTrackId;
    return data;
  }
}


class CityRS {
  String? error;
  String? oUT;
  String? resultCode;

  CityRS({this.error, this.oUT, this.resultCode});

  CityRS.fromJson(Map<String, dynamic> json) {
    error = json['Error'];
    oUT = json['OUT'];
    resultCode = json['ResultCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Error'] = this.error;
    data['OUT'] = this.oUT;
    data['ResultCode'] = this.resultCode;
    return data;
  }
}


class AirCodeRS {
  String? cityCode;
  String? citySEARCHNAME;
  String? cityName;

  AirCodeRS({this.cityCode, this.citySEARCHNAME, this.cityName});

  AirCodeRS.fromJson(Map<String, dynamic> json) {
    cityCode = json['CityCode'];
    citySEARCHNAME = json['CitySEARCHNAME'];
    cityName = json['CityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CityCode'] = this.cityCode;
    data['CitySEARCHNAME'] = this.citySEARCHNAME;
    data['CityName'] = this.cityName;
    return data;
  }
}