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



class AvailabilityRS {
  String? currency;
  String? error;
  String? paxType;
  String? resultCode;
  Null? sEQ;
  String? token;
  List<FAvail>? lFAvail;

  AvailabilityRS({this.currency, this.error, this.paxType, this.resultCode, this.sEQ, this.token, this.lFAvail});

  AvailabilityRS.fromJson(Map<String, dynamic> json) {
    currency = json['Currency'];
    error = json['Error'];
    paxType = json['PaxType'];
    resultCode = json['ResultCode'];
    sEQ = json['SEQ'];
    token = json['Token'];
    if (json['_FAvail'] != null) {
      lFAvail = <FAvail>[];
      json['_FAvail'].forEach((v) { lFAvail!.add(new FAvail.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Currency'] = this.currency;
    data['Error'] = this.error;
    data['PaxType'] = this.paxType;
    data['ResultCode'] = this.resultCode;
    data['SEQ'] = this.sEQ;
    data['Token'] = this.token;
    if (this.lFAvail != null) {
      data['_FAvail'] = this.lFAvail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FAvail {
  String? departureTime;
  String? fare;
  List<Flights>? flights;
  String? journeyTime;

  FAvail({this.departureTime, this.fare, this.flights, this.journeyTime});

  FAvail.fromJson(Map<String, dynamic> json) {
    departureTime = json['DepartureTime'];
    fare = json['Fare'];
    if (json['Flights'] != null) {
      flights = <Flights>[];
      json['Flights'].forEach((v) { flights!.add(new Flights.fromJson(v)); });
    }
    journeyTime = json['JourneyTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DepartureTime'] = this.departureTime;
    data['Fare'] = this.fare;
    if (this.flights != null) {
      data['Flights'] = this.flights!.map((v) => v.toJson()).toList();
    }
    data['JourneyTime'] = this.journeyTime;
    return data;
  }
}

class Flights {
  String? airlineCategory;
  String? airlineName;
  String? arrivalDateTime;
  String? arrivalTime;
  String? availInfo;
  String? availSeat;
  String? baggage;
  String? baseFare;
  String? brakup;
  String? cNX;
  String? classFly;
  String? comission;
  String? connectionFlag;
  String? departureDateTime;
  String? departureTime;
  String? destination;
  String? directFlight;
  String? endTerminal;
  Null? error;
  String? fareBasisCode;
  String? fareType;
  String? fareTypeDescription;
  String? flightNumber;
  String? flyingTime;
  String? grossFare;
  Null? itinRef;
  String? journeyTime;
  String? netFare;
  String? origin;
  String? pLB;
  String? paxType;
  String? platingCarrier;
  String? refNum;
  String? refundable;
  Null? segRef;
  String? serviceCharge;
  String? startTerminal;
  String? stockType;
  String? stops;
  String? totalTax;
  String? via;

  Flights({this.airlineCategory, this.airlineName, this.arrivalDateTime, this.arrivalTime, this.availInfo, this.availSeat, this.baggage, this.baseFare, this.brakup, this.cNX, this.classFly, this.comission, this.connectionFlag, this.departureDateTime, this.departureTime, this.destination, this.directFlight, this.endTerminal, this.error, this.fareBasisCode, this.fareType, this.fareTypeDescription, this.flightNumber, this.flyingTime, this.grossFare, this.itinRef, this.journeyTime, this.netFare, this.origin, this.pLB, this.paxType, this.platingCarrier, this.refNum, this.refundable, this.segRef, this.serviceCharge, this.startTerminal, this.stockType, this.stops, this.totalTax, this.via});

  Flights.fromJson(Map<String, dynamic> json) {
  airlineCategory = json['AirlineCategory'];
  airlineName = json['AirlineName'];
  arrivalDateTime = json['ArrivalDateTime'];
  arrivalTime = json['ArrivalTime'];
  availInfo = json['AvailInfo'];
  availSeat = json['AvailSeat'];
  baggage = json['Baggage'];
  baseFare = json['BaseFare'];
  brakup = json['Brakup'];
  cNX = json['CNX'];
classFly = json['Class'];
  comission = json['Comission'];
  connectionFlag = json['ConnectionFlag'];
  departureDateTime = json['DepartureDateTime'];
  departureTime = json['DepartureTime'];
  destination = json['Destination'];
  directFlight = json['DirectFlight'];
  endTerminal = json['EndTerminal'];
  error = json['Error'];
  fareBasisCode = json['FareBasisCode'];
  fareType = json['FareType'];
  fareTypeDescription = json['FareTypeDescription'];
  flightNumber = json['FlightNumber'];
  flyingTime = json['FlyingTime'];
  grossFare = json['GrossFare'];
  itinRef = json['ItinRef'];
  journeyTime = json['JourneyTime'];
  netFare = json['NetFare'];
  origin = json['Origin'];
  pLB = json['PLB'];
  paxType = json['PaxType'];
  platingCarrier = json['PlatingCarrier'];
  refNum = json['RefNum'];
  refundable = json['Refundable'];
  segRef = json['SegRef'];
  serviceCharge = json['ServiceCharge'];
  startTerminal = json['StartTerminal'];
  stockType = json['StockType'];
  stops = json['Stops'];
  totalTax = json['TotalTax'];
  via = json['Via'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['AirlineCategory'] = this.airlineCategory;
  data['AirlineName'] = this.airlineName;
  data['ArrivalDateTime'] = this.arrivalDateTime;
  data['ArrivalTime'] = this.arrivalTime;
  data['AvailInfo'] = this.availInfo;
  data['AvailSeat'] = this.availSeat;
  data['Baggage'] = this.baggage;
  data['BaseFare'] = this.baseFare;
  data['Brakup'] = this.brakup;
  data['CNX'] = this.cNX;
  data['Class'] = this.classFly;
  data['Comission'] = this.comission;
  data['ConnectionFlag'] = this.connectionFlag;
  data['DepartureDateTime'] = this.departureDateTime;
  data['DepartureTime'] = this.departureTime;
  data['Destination'] = this.destination;
  data['DirectFlight'] = this.directFlight;
  data['EndTerminal'] = this.endTerminal;
  data['Error'] = this.error;
  data['FareBasisCode'] = this.fareBasisCode;
  data['FareType'] = this.fareType;
  data['FareTypeDescription'] = this.fareTypeDescription;
  data['FlightNumber'] = this.flightNumber;
  data['FlyingTime'] = this.flyingTime;
  data['GrossFare'] = this.grossFare;
  data['ItinRef'] = this.itinRef;
  data['JourneyTime'] = this.journeyTime;
  data['NetFare'] = this.netFare;
  data['Origin'] = this.origin;
  data['PLB'] = this.pLB;
  data['PaxType'] = this.paxType;
  data['PlatingCarrier'] = this.platingCarrier;
  data['RefNum'] = this.refNum;
  data['Refundable'] = this.refundable;
  data['SegRef'] = this.segRef;
  data['ServiceCharge'] = this.serviceCharge;
  data['StartTerminal'] = this.startTerminal;
  data['StockType'] = this.stockType;
  data['Stops'] = this.stops;
  data['TotalTax'] = this.totalTax;
  data['Via'] = this.via;
  return data;
  }
}