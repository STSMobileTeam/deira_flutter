class HostCheckRQ {
  AgentDetails? agentDetails;
  SegmnetDetails? segmnetDetails;
  String? token1;
  String? isStudentFare;
  String? isArmyFare;
  String? isSnrCitizenFare;
  String? isroundtripspecial;
  String? token;

  HostCheckRQ(
      {this.agentDetails,
        this.segmnetDetails,
        this.token1,
        this.isStudentFare,
        this.isArmyFare,
        this.isSnrCitizenFare,
        this.isroundtripspecial,
        this.token});

  HostCheckRQ.fromJson(Map<String, dynamic> json) {
    agentDetails = json['AgentDetails'] != null
        ? new AgentDetails.fromJson(json['AgentDetails'])
        : null;
    segmnetDetails = json['SegmnetDetails'] != null
        ? new SegmnetDetails.fromJson(json['SegmnetDetails'])
        : null;
    token1 = json['Token1'];
    isStudentFare = json['isStudentFare'];
    isArmyFare = json['isArmyFare'];
    isSnrCitizenFare = json['isSnrCitizenFare'];
    isroundtripspecial = json['isroundtripspecial'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agentDetails != null) {
      data['AgentDetails'] = this.agentDetails!.toJson();
    }
    if (this.segmnetDetails != null) {
      data['SegmnetDetails'] = this.segmnetDetails!.toJson();
    }
    data['Token1'] = this.token1;
    data['isStudentFare'] = this.isStudentFare;
    data['isArmyFare'] = this.isArmyFare;
    data['isSnrCitizenFare'] = this.isSnrCitizenFare;
    data['isroundtripspecial'] = this.isroundtripspecial;
    data['Token'] = this.token;
    return data;
  }
}

class AgentDetails {
  String? cID;
  String? aPP;
  String? sID;
  String? eNV;
  String? uN;
  String? cORID;
  String? eMID;
  String? cTCTR;
  String? groupID;
  String? vER;
  String? bID;
  String? bTID;
  String? aGTYP;
  String? bRID;
  String? iBRID;
  String? platform;
  String? projectID;
  String? aPPCurrency;

  AgentDetails(
      {this.cID,
        this.aPP,
        this.sID,
        this.eNV,
        this.uN,
        this.cORID,
        this.eMID,
        this.cTCTR,
        this.groupID,
        this.vER,
        this.bID,
        this.bTID,
        this.aGTYP,
        this.bRID,
        this.iBRID,
        this.platform,
        this.projectID,
        this.aPPCurrency});

  AgentDetails.fromJson(Map<String, dynamic> json) {
    cID = json['CID'];
    aPP = json['APP'];
    sID = json['SID'];
    eNV = json['ENV'];
    uN = json['UN'];
    cORID = json['CORID'];
    eMID = json['EMID'];
    cTCTR = json['CTCTR'];
    groupID = json['Group_ID'];
    vER = json['VER'];
    bID = json['BID'];
    bTID = json['BTID'];
    aGTYP = json['AGTYP'];
    bRID = json['BRID'];
    iBRID = json['IBRID'];
    platform = json['Platform'];
    projectID = json['ProjectID'];
    aPPCurrency = json['APPCurrency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CID'] = this.cID;
    data['APP'] = this.aPP;
    data['SID'] = this.sID;
    data['ENV'] = this.eNV;
    data['UN'] = this.uN;
    data['CORID'] = this.cORID;
    data['EMID'] = this.eMID;
    data['CTCTR'] = this.cTCTR;
    data['Group_ID'] = this.groupID;
    data['VER'] = this.vER;
    data['BID'] = this.bID;
    data['BTID'] = this.bTID;
    data['AGTYP'] = this.aGTYP;
    data['BRID'] = this.bRID;
    data['IBRID'] = this.iBRID;
    data['Platform'] = this.platform;
    data['ProjectID'] = this.projectID;
    data['APPCurrency'] = this.aPPCurrency;
    return data;
  }
}

class SegmnetDetails {
  String? adult;
  String? child;
  String? infant;
  String? appType;
  String? baseDestination;
  String? baseOrigin;
  String? bookingType;
  String? classType;
  String? segmentType;
  String? rTSpecial;
  String? tripType;

  SegmnetDetails(
      {this.adult,
        this.child,
        this.infant,
        this.appType,
        this.baseDestination,
        this.baseOrigin,
        this.bookingType,
        this.classType,
        this.segmentType,
        this.rTSpecial,
        this.tripType});

  SegmnetDetails.fromJson(Map<String, dynamic> json) {
    adult = json['Adult'];
    child = json['Child'];
    infant = json['Infant'];
    appType = json['AppType'];
    baseDestination = json['BaseDestination'];
    baseOrigin = json['BaseOrigin'];
    bookingType = json['BookingType'];
    classType = json['ClassType'];
    segmentType = json['SegmentType'];
    rTSpecial = json['RTSpecial'];
    tripType = json['TripType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Adult'] = this.adult;
    data['Child'] = this.child;
    data['Infant'] = this.infant;
    data['AppType'] = this.appType;
    data['BaseDestination'] = this.baseDestination;
    data['BaseOrigin'] = this.baseOrigin;
    data['BookingType'] = this.bookingType;
    data['ClassType'] = this.classType;
    data['SegmentType'] = this.segmentType;
    data['RTSpecial'] = this.rTSpecial;
    data['TripType'] = this.tripType;
    return data;
  }
}


class HostCheckRS {
  String? alertMessage;
  List<Baggage>? baggage;
  String? dOBMandatory;
  String? dOBMandatory1;
  String? error;
  String? error1;
  String? gSTMandatory;
  List<Meals>? meals;
  String? passportMandatory;
  String? passportMandatory1;
  String? resultCode;
  Null? sEQ;
  String? segmentType;
  String? token;
  String? token1;
  Null? totalBreakup;
  Null? totalGrossfare;
  Null? totalServicecharge;
  Null? totalTaxamt;
  List<MFlights>? lMFlights;

  HostCheckRS({this.alertMessage, this.baggage, this.dOBMandatory, this.dOBMandatory1, this.error, this.error1, this.gSTMandatory, this.meals, this.passportMandatory, this.passportMandatory1, this.resultCode, this.sEQ, this.segmentType, this.token, this.token1, this.totalBreakup, this.totalGrossfare, this.totalServicecharge, this.totalTaxamt, this.lMFlights});

  HostCheckRS.fromJson(Map<String, dynamic> json) {
    alertMessage = json['AlertMessage'];
    if (json['Baggage'] != null) {
      baggage = <Baggage>[];
      json['Baggage'].forEach((v) { baggage!.add(new Baggage.fromJson(v)); });
    }
    dOBMandatory = json['DOBMandatory'];
    dOBMandatory1 = json['DOBMandatory1'];
    error = json['Error'];
    error1 = json['Error1'];
    gSTMandatory = json['GSTMandatory'];
    if (json['Meals'] != null) {
      meals = <Meals>[];
      json['Meals'].forEach((v) { meals!.add(new Meals.fromJson(v)); });
    }
    passportMandatory = json['PassportMandatory'];
    passportMandatory1 = json['PassportMandatory1'];
    resultCode = json['ResultCode'];
    sEQ = json['SEQ'];
    segmentType = json['SegmentType'];
    token = json['Token'];
    token1 = json['Token1'];
    totalBreakup = json['TotalBreakup'];
    totalGrossfare = json['TotalGrossfare'];
    totalServicecharge = json['TotalServicecharge'];
    totalTaxamt = json['TotalTaxamt'];
    if (json['_MFlights'] != null) {
      lMFlights = <MFlights>[];
      json['_MFlights'].forEach((v) { lMFlights!.add(new MFlights.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AlertMessage'] = this.alertMessage;
    if (this.baggage != null) {
      data['Baggage'] = this.baggage!.map((v) => v.toJson()).toList();
    }
    data['DOBMandatory'] = this.dOBMandatory;
    data['DOBMandatory1'] = this.dOBMandatory1;
    data['Error'] = this.error;
    data['Error1'] = this.error1;
    data['GSTMandatory'] = this.gSTMandatory;
    if (this.meals != null) {
      data['Meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    data['PassportMandatory'] = this.passportMandatory;
    data['PassportMandatory1'] = this.passportMandatory1;
    data['ResultCode'] = this.resultCode;
    data['SEQ'] = this.sEQ;
    data['SegmentType'] = this.segmentType;
    data['Token'] = this.token;
    data['Token1'] = this.token1;
    data['TotalBreakup'] = this.totalBreakup;
    data['TotalGrossfare'] = this.totalGrossfare;
    data['TotalServicecharge'] = this.totalServicecharge;
    data['TotalTaxamt'] = this.totalTaxamt;
    if (this.lMFlights != null) {
      data['_MFlights'] = this.lMFlights!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Baggage {
  String? bDS;
  String? bGA;
  String? bGC;
  String? bGD;
  String? bGS;
  String? bITN;
  String? bOG;
  String? bTXT;

  Baggage({this.bDS, this.bGA, this.bGC, this.bGD, this.bGS, this.bITN, this.bOG, this.bTXT});

  Baggage.fromJson(Map<String, dynamic> json) {
    bDS = json['BDS'];
    bGA = json['BGA'];
    bGC = json['BGC'];
    bGD = json['BGD'];
    bGS = json['BGS'];
    bITN = json['BITN'];
    bOG = json['BOG'];
    bTXT = json['BTXT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BDS'] = this.bDS;
    data['BGA'] = this.bGA;
    data['BGC'] = this.bGC;
    data['BGD'] = this.bGD;
    data['BGS'] = this.bGS;
    data['BITN'] = this.bITN;
    data['BOG'] = this.bOG;
    data['BTXT'] = this.bTXT;
    return data;
  }
}

class Meals {
  String? cGY;
  String? mDS;
  bool? mIBS;
  String? mITN;
  String? mLA;
  String? mLC;
  String? mLD;
  String? mLS;
  String? mOG;
  String? uRL;

  Meals({this.cGY, this.mDS, this.mIBS, this.mITN, this.mLA, this.mLC, this.mLD, this.mLS, this.mOG, this.uRL});

  Meals.fromJson(Map<String, dynamic> json) {
    cGY = json['CGY'];
    mDS = json['MDS'];
    mIBS = json['MIBS'];
    mITN = json['MITN'];
    mLA = json['MLA'];
    mLC = json['MLC'];
    mLD = json['MLD'];
    mLS = json['MLS'];
    mOG = json['MOG'];
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CGY'] = this.cGY;
    data['MDS'] = this.mDS;
    data['MIBS'] = this.mIBS;
    data['MITN'] = this.mITN;
    data['MLA'] = this.mLA;
    data['MLC'] = this.mLC;
    data['MLD'] = this.mLD;
    data['MLS'] = this.mLS;
    data['MOG'] = this.mOG;
    data['URL'] = this.uRL;
    return data;
  }
}

class MFlights {
  String? airlineCategory;
  String? airlineName;
  String? arrivalDateTime;
  Null? arrivalTime;
  Null? availInfo;
  String? availSeat;
  Null? baggage;
  String? baseFare;
  String? brakup;
  String? cNX;
  String? classes;
  String? comission;
  String? connectionFlag;
  String? departureDateTime;
  Null? departureTime;
  String? destination;
  Null? directFlight;
  Null? endTerminal;
  Null? error;
  String? fareBasisCode;
  String? fareType;
  Null? fareTypeDescription;
  String? flightNumber;
  String? flyingTime;
  String? grossFare;
  String? itinRef;
  String? journeyTime;
  Null? netFare;
  String? origin;
  Null? pLB;
  Null? paxType;
  String? platingCarrier;
  String? refNum;
  String? refundable;
  String? segRef;
  String? serviceCharge;
  Null? startTerminal;
  Null? stockType;
  Null? stops;
  String? totalTax;
  String? via;

  MFlights({this.airlineCategory, this.airlineName, this.arrivalDateTime, this.arrivalTime, this.availInfo, this.availSeat, this.baggage, this.baseFare, this.brakup, this.cNX, this.classes, this.comission, this.connectionFlag, this.departureDateTime, this.departureTime, this.destination, this.directFlight, this.endTerminal, this.error, this.fareBasisCode, this.fareType, this.fareTypeDescription, this.flightNumber, this.flyingTime, this.grossFare, this.itinRef, this.journeyTime, this.netFare, this.origin, this.pLB, this.paxType, this.platingCarrier, this.refNum, this.refundable, this.segRef, this.serviceCharge, this.startTerminal, this.stockType, this.stops, this.totalTax, this.via});

  MFlights.fromJson(Map<String, dynamic> json) {
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
  classes = json['Class'];
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
  data['Class'] = this.classes;
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