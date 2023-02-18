class AvailibiltyRQ {
  AGD? aGD;
  PSG? pSG;
  String? cYC;
  String? tRP;
  String? sEG;
  String? hOS;
  String? mRF;
  String? stock;
  String? wTL;
  String? dSC;
  String? dCF;
  String? cMF;
  bool? paxfare;
  bool? dFT;
  String? cAT;
  List<AVR>? aVR;
  List<String>? fLO;

  AvailibiltyRQ(
      {this.aGD,
        this.pSG,
        this.cYC,
        this.tRP,
        this.sEG,
        this.hOS,
        this.mRF,
        this.stock,
        this.wTL,
        this.dSC,
        this.dCF,
        this.cMF,
        this.paxfare,
        this.dFT,
        this.cAT,
        this.aVR,
        this.fLO});

  AvailibiltyRQ.fromJson(Map<String, dynamic> json) {
    aGD = json['AGD'] != null ? new AGD.fromJson(json['AGD']) : null;
    pSG = json['PSG'] != null ? new PSG.fromJson(json['PSG']) : null;
    cYC = json['CYC'];
    tRP = json['TRP'];
    sEG = json['SEG'];
    hOS = json['HOS'];
    mRF = json['MRF'];
    stock = json['Stock'];
    wTL = json['WTL'];
    dSC = json['DSC'];
    dCF = json['DCF'];
    cMF = json['CMF'];
    paxfare = json['Paxfare'];
    dFT = json['DFT'];
    cAT = json['CAT'];
    if (json['AVR'] != null) {
      aVR = <AVR>[];
      json['AVR'].forEach((v) {
        aVR!.add(new AVR.fromJson(v));
      });
    }
    fLO = json['FLO'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aGD != null) {
      data['AGD'] = this.aGD!.toJson();
    }
    if (this.pSG != null) {
      data['PSG'] = this.pSG!.toJson();
    }
    data['CYC'] = this.cYC;
    data['TRP'] = this.tRP;
    data['SEG'] = this.sEG;
    data['HOS'] = this.hOS;
    data['MRF'] = this.mRF;
    data['Stock'] = this.stock;
    data['WTL'] = this.wTL;
    data['DSC'] = this.dSC;
    data['DCF'] = this.dCF;
    data['CMF'] = this.cMF;
    data['Paxfare'] = this.paxfare;
    data['DFT'] = this.dFT;
    data['CAT'] = this.cAT;
    if (this.aVR != null) {
      data['AVR'] = this.aVR!.map((v) => v.toJson()).toList();
    }
    data['FLO'] = this.fLO;
    return data;
  }
}

class AGD {
  String? cID;
  String? uN;
  String? aPP;
  String? sID;
  String? vER;
  String? eNV;
  String? bID;
  String? bTID;
  String? aGTYP;
  String? cORID;
  String? bRID;
  String? iBRID;
  String? eMID;
  String? cTCTR;
  String? platform;
  String? projectID;
  String? groupID;
  String? aPPCurrency;

  AGD(
      {this.cID,
        this.uN,
        this.aPP,
        this.sID,
        this.vER,
        this.eNV,
        this.bID,
        this.bTID,
        this.aGTYP,
        this.cORID,
        this.bRID,
        this.iBRID,
        this.eMID,
        this.cTCTR,
        this.platform,
        this.projectID,
        this.groupID,
        this.aPPCurrency});

  AGD.fromJson(Map<String, dynamic> json) {
    cID = json['CID'];
    uN = json['UN'];
    aPP = json['APP'];
    sID = json['SID'];
    vER = json['VER'];
    eNV = json['ENV'];
    bID = json['BID'];
    bTID = json['BTID'];
    aGTYP = json['AGTYP'];
    cORID = json['CORID'];
    bRID = json['BRID'];
    iBRID = json['IBRID'];
    eMID = json['EMID'];
    cTCTR = json['CTCTR'];
    platform = json['Platform'];
    projectID = json['ProjectID'];
    groupID = json['Group_ID'];
    aPPCurrency = json['APPCurrency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CID'] = this.cID;
    data['UN'] = this.uN;
    data['APP'] = this.aPP;
    data['SID'] = this.sID;
    data['VER'] = this.vER;
    data['ENV'] = this.eNV;
    data['BID'] = this.bID;
    data['BTID'] = this.bTID;
    data['AGTYP'] = this.aGTYP;
    data['CORID'] = this.cORID;
    data['BRID'] = this.bRID;
    data['IBRID'] = this.iBRID;
    data['EMID'] = this.eMID;
    data['CTCTR'] = this.cTCTR;
    data['Platform'] = this.platform;
    data['ProjectID'] = this.projectID;
    data['Group_ID'] = this.groupID;
    data['APPCurrency'] = this.aPPCurrency;
    return data;
  }
}

class PSG {
  int? pXC;
  List<PXR>? pXR;

  PSG({this.pXC, this.pXR});

  PSG.fromJson(Map<String, dynamic> json) {
    pXC = json['PXC'];
    if (json['PXR'] != null) {
      pXR = <PXR>[];
      json['PXR'].forEach((v) {
        pXR!.add(new PXR.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PXC'] = this.pXC;
    if (this.pXR != null) {
      data['PXR'] = this.pXR!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PXR {
  String? pXT;
  String? pXQ;

  PXR({this.pXT, this.pXQ});

  PXR.fromJson(Map<String, dynamic> json) {
    pXT = json['PXT'];
    pXQ = json['PXQ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PXT'] = this.pXT;
    data['PXQ'] = this.pXQ;
    return data;
  }
}

class AVR {
  String? dSN;
  String? aSN;
  String? fLD;
  String? fCO;
  String? fTE;
  String? isStudentFare;
  String? isArmyFare;
  String? isSnrCitizenFare;
  String? isLabourFare;

  AVR(
      {this.dSN,
        this.aSN,
        this.fLD,
        this.fCO,
        this.fTE,
        this.isStudentFare,
        this.isArmyFare,
        this.isSnrCitizenFare,
        this.isLabourFare});

  AVR.fromJson(Map<String, dynamic> json) {
    dSN = json['DSN'];
    aSN = json['ASN'];
    fLD = json['FLD'];
    fCO = json['FCO'];
    fTE = json['FTE'];
    isStudentFare = json['isStudentFare'];
    isArmyFare = json['isArmyFare'];
    isSnrCitizenFare = json['isSnrCitizenFare'];
    isLabourFare = json['isLabourFare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DSN'] = this.dSN;
    data['ASN'] = this.aSN;
    data['FLD'] = this.fLD;
    data['FCO'] = this.fCO;
    data['FTE'] = this.fTE;
    data['isStudentFare'] = this.isStudentFare;
    data['isArmyFare'] = this.isArmyFare;
    data['isSnrCitizenFare'] = this.isSnrCitizenFare;
    data['isLabourFare'] = this.isLabourFare;
    return data;
  }
}