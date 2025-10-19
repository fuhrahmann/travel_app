class Flight {
  final String flightNumber;
  final String airline;
  final String origin;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final String departureDate;
  final String arrivalDate;
  final double price;
  final String status;
  final String? aircraftType;
  final String? terminal;
  final String? gate;

  Flight({
    required this.flightNumber,
    required this.airline,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.departureDate,
    required this.arrivalDate,
    required this.price,
    this.status = 'Scheduled',
    this.aircraftType,
    this.terminal,
    this.gate,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      flightNumber: json['flight_number'] ?? '',
      airline: json['airline'] ?? '',
      origin: json['origin'] ?? '',
      destination: json['destination'] ?? '',
      departureTime: json['departure_time'] ?? '',
      arrivalTime: json['arrival_time'] ?? '',
      departureDate: json['departure_date'] ?? '',
      arrivalDate: json['arrival_date'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      status: json['status'] ?? 'Scheduled',
      aircraftType: json['aircraft_type'],
      terminal: json['terminal'],
      gate: json['gate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flight_number': flightNumber,
      'airline': airline,
      'origin': origin,
      'destination': destination,
      'departure_time': departureTime,
      'arrival_time': arrivalTime,
      'departure_date': departureDate,
      'arrival_date': arrivalDate,
      'price': price,
      'status': status,
      'aircraft_type': aircraftType,
      'terminal': terminal,
      'gate': gate,
    };
  }
}
