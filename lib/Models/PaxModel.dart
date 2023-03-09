class PaxModel {
  String? sNO;
  String? paxRefNumber;
  String? title;
  String? firstName;
  String? lastName;
  String? age;
  String? dOB;
  String? gender;
  String? paxType;
  String? passportNo;
  String? passportExpiry;
  String? placeOfBirth;
  String? infantRef;
  String? isSelected;
  String? issuedContry;

  PaxModel(
      {this.sNO,
        this.paxRefNumber,
        this.title,
        this.firstName,
        this.lastName,
        this.age,
        this.dOB,
        this.gender,
        this.paxType,
        this.passportNo,
        this.passportExpiry,
        this.placeOfBirth,
        this.infantRef,
        this.isSelected,
        this.issuedContry});

  PaxModel.fromJson(Map<String, dynamic> json) {
    sNO = json['SNO'];
    paxRefNumber = json['PaxRefNumber'];
    title = json['Title'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    age = json['Age'];
    dOB = json['DOB'];
    gender = json['Gender'];
    paxType = json['PaxType'];
    passportNo = json['PassportNo'];
    passportExpiry = json['PassportExpiry'];
    placeOfBirth = json['PlaceOfBirth'];
    infantRef = json['InfantRef'];
    isSelected = json['IsSelected'];
    issuedContry = json['IssuedContry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SNO'] = this.sNO;
    data['PaxRefNumber'] = this.paxRefNumber;
    data['Title'] = this.title;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Age'] = this.age;
    data['DOB'] = this.dOB;
    data['Gender'] = this.gender;
    data['PaxType'] = this.paxType;
    data['PassportNo'] = this.passportNo;
    data['PassportExpiry'] = this.passportExpiry;
    data['PlaceOfBirth'] = this.placeOfBirth;
    data['InfantRef'] = this.infantRef;
    data['IsSelected'] = this.isSelected;
    data['IssuedContry'] = this.issuedContry;
    return data;
  }
}