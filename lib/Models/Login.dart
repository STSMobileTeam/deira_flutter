
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

class LoginRS {
  List<Tables>? table;

  LoginRS({this.table});

  LoginRS.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = <Tables>[];
      json['Table'].forEach((v) {
        table!.add(new Tables.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.table != null) {
      data['Table'] = this.table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tables {
  String? lGNTERMINALID;
  String? lGNAGENTID;
  String? uSDUSERTITLE;
  String? uSDNAME;
  String? uSDLASTNAME;
  String? uSDMOBILENO;
  String? cLTADDRESS1;
  String? cLTCITYID;
  String? cLTCOUNTRYID;
  String? cLTBRANCHID;
  String? uSDPASSWORD;
  Null? uSDPASSPORTNO;
  String? dOB;
  String? column1;
  Null? uSDISSUEDCOUNTRY;
  Null? cLTZIPCODE;
  String? uSDCOMPANYCODE;
  String? uSDCODE;
  String? cLTCLIENTNAME;
  String? uSDCOMPANYCODE1;
  String? cLTCLIENTNAME1;
  String? cLTBRANCHID1;
  String? cLTCORPTYPE;
  String? thread;
  String? thread1;
  String? thread2;
  String? thread3;
  String? thread4;
  String? lCCThread;
  String? fSCThread;
  String? fULLTHREAD;
  String? aIRLINEURL;
  String? bANNERURL;

  Tables(
      {this.lGNTERMINALID,
        this.lGNAGENTID,
        this.uSDUSERTITLE,
        this.uSDNAME,
        this.uSDLASTNAME,
        this.uSDMOBILENO,
        this.cLTADDRESS1,
        this.cLTCITYID,
        this.cLTCOUNTRYID,
        this.cLTBRANCHID,
        this.uSDPASSWORD,
        this.uSDPASSPORTNO,
        this.dOB,
        this.column1,
        this.uSDISSUEDCOUNTRY,
        this.cLTZIPCODE,
        this.uSDCOMPANYCODE,
        this.uSDCODE,
        this.cLTCLIENTNAME,
        this.uSDCOMPANYCODE1,
        this.cLTCLIENTNAME1,
        this.cLTBRANCHID1,
        this.cLTCORPTYPE,
        this.thread,
        this.thread1,
        this.thread2,
        this.thread3,
        this.thread4,
        this.lCCThread,
        this.fSCThread,
        this.fULLTHREAD,
        this.aIRLINEURL,
        this.bANNERURL});

  Tables.fromJson(Map<String, dynamic> json) {
    lGNTERMINALID = json['LGN_TERMINAL_ID'];
    lGNAGENTID = json['LGN_AGENT_ID'];
    uSDUSERTITLE = json['USD_USER_TITLE'];
    uSDNAME = json['USD_NAME'];
    uSDLASTNAME = json['USD_LAST_NAME'];
    uSDMOBILENO = json['USD_MOBILENO'];
    cLTADDRESS1 = json['CLT_ADDRESS1'];
    cLTCITYID = json['CLT_CITY_ID'];
    cLTCOUNTRYID = json['CLT_COUNTRY_ID'];
    cLTBRANCHID = json['CLT_BRANCH_ID'];
    uSDPASSWORD = json['USD_PASSWORD'];
    uSDPASSPORTNO = json['USD_PASSPORT_NO'];
    dOB = json['DOB'];
    column1 = json['Column1'];
    uSDISSUEDCOUNTRY = json['USD_ISSUED_COUNTRY'];
    cLTZIPCODE = json['CLT_ZIP_CODE'];
    uSDCOMPANYCODE = json['USD_COMPANY_CODE'];
    uSDCODE = json['USD_CODE'];
    cLTCLIENTNAME = json['CLT_CLIENT_NAME'];
    uSDCOMPANYCODE1 = json['USD_COMPANY_CODE1'];
    cLTCLIENTNAME1 = json['CLT_CLIENT_NAME1'];
    cLTBRANCHID1 = json['CLT_BRANCH_ID1'];
    cLTCORPTYPE = json['CLT_CORP_TYPE'];
    thread = json['Thread'];
    thread1 = json['Thread1'];
    thread2 = json['Thread2'];
    thread3 = json['Thread3'];
    thread4 = json['Thread4'];
    lCCThread = json['LCCThread'];
    fSCThread = json['FSCThread'];
    fULLTHREAD = json['FULL_THREAD'];
    aIRLINEURL = json['AIRLINE_URL'];
    bANNERURL = json['BANNER_URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LGN_TERMINAL_ID'] = this.lGNTERMINALID;
    data['LGN_AGENT_ID'] = this.lGNAGENTID;
    data['USD_USER_TITLE'] = this.uSDUSERTITLE;
    data['USD_NAME'] = this.uSDNAME;
    data['USD_LAST_NAME'] = this.uSDLASTNAME;
    data['USD_MOBILENO'] = this.uSDMOBILENO;
    data['CLT_ADDRESS1'] = this.cLTADDRESS1;
    data['CLT_CITY_ID'] = this.cLTCITYID;
    data['CLT_COUNTRY_ID'] = this.cLTCOUNTRYID;
    data['CLT_BRANCH_ID'] = this.cLTBRANCHID;
    data['USD_PASSWORD'] = this.uSDPASSWORD;
    data['USD_PASSPORT_NO'] = this.uSDPASSPORTNO;
    data['DOB'] = this.dOB;
    data['Column1'] = this.column1;
    data['USD_ISSUED_COUNTRY'] = this.uSDISSUEDCOUNTRY;
    data['CLT_ZIP_CODE'] = this.cLTZIPCODE;
    data['USD_COMPANY_CODE'] = this.uSDCOMPANYCODE;
    data['USD_CODE'] = this.uSDCODE;
    data['CLT_CLIENT_NAME'] = this.cLTCLIENTNAME;
    data['USD_COMPANY_CODE1'] = this.uSDCOMPANYCODE1;
    data['CLT_CLIENT_NAME1'] = this.cLTCLIENTNAME1;
    data['CLT_BRANCH_ID1'] = this.cLTBRANCHID1;
    data['CLT_CORP_TYPE'] = this.cLTCORPTYPE;
    data['Thread'] = this.thread;
    data['Thread1'] = this.thread1;
    data['Thread2'] = this.thread2;
    data['Thread3'] = this.thread3;
    data['Thread4'] = this.thread4;
    data['LCCThread'] = this.lCCThread;
    data['FSCThread'] = this.fSCThread;
    data['FULL_THREAD'] = this.fULLTHREAD;
    data['AIRLINE_URL'] = this.aIRLINEURL;
    data['BANNER_URL'] = this.bANNERURL;
    return data;
  }
}