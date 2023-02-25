class AvailGrouping {
  String? departureTime;
  String? fare;
  List<Flights>? flights;
  List<Grouped>? grouped;
  String? journeyTime;

  AvailGrouping({this.departureTime, this.fare, this.flights, this.grouped, this.journeyTime});

  AvailGrouping.fromJson(Map<String, dynamic> json) {
    departureTime = json['DepartureTime'];
    fare = json['Fare'];
    if (json['Flights'] != null) {
      flights = <Flights>[];
      json['Flights'].forEach((v) { flights!.add(new Flights.fromJson(v)); });
    }
    if (json['Grouped'] != null) {
      grouped = <Grouped>[];
      json['Grouped'].forEach((v) { grouped!.add(new Grouped.fromJson(v)); });
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
    if (this.grouped != null) {
      data['Grouped'] = this.grouped!.map((v) => v.toJson()).toList();
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
  String? classes;
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

  Flights({this.airlineCategory, this.airlineName, this.arrivalDateTime, this.arrivalTime, this.availInfo, this.availSeat, this.baggage, this.baseFare, this.brakup, this.cNX, this.classes, this.comission, this.connectionFlag, this.departureDateTime, this.departureTime, this.destination, this.directFlight, this.endTerminal, this.error, this.fareBasisCode, this.fareType, this.fareTypeDescription, this.flightNumber, this.flyingTime, this.grossFare, this.itinRef, this.journeyTime, this.netFare, this.origin, this.pLB, this.paxType, this.platingCarrier, this.refNum, this.refundable, this.segRef, this.serviceCharge, this.startTerminal, this.stockType, this.stops, this.totalTax, this.via});

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

class Grouped {
  String? departureTime;
  String? fare;
  List<Flights>? flights;
  String? journeyTime;

  Grouped({this.departureTime, this.fare, this.flights, this.journeyTime});

  Grouped.fromJson(Map<String, dynamic> json) {
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