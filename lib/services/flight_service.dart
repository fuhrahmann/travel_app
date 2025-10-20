import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/flight.dart';

class FlightService {
  // Mock data for domestic flights (Indonesian cities)
  static List<Flight> getDomesticFlights() {
    final now = DateTime.now();
    final today = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    return [
      Flight(
        flightNumber: 'GA 101',
        airline: 'Garuda Indonesia',
        origin: 'CGK',
        destination: 'DPS',
        departureTime: '06:00',
        arrivalTime: '09:00',
        departureDate: today,
        arrivalDate: today,
        price: 1250000,
        status: 'On Time',
        aircraftType: 'Boeing 737-800',
        terminal: '3',
        gate: 'A1',
      ),
      Flight(
        flightNumber: 'ID 6178',
        airline: 'Batik Air',
        origin: 'CGK',
        destination: 'SUB',
        departureTime: '07:30',
        arrivalTime: '09:15',
        departureDate: today,
        arrivalDate: today,
        price: 850000,
        status: 'Boarding',
        aircraftType: 'Airbus A320',
        terminal: '2',
        gate: 'B5',
      ),
      Flight(
        flightNumber: 'QG 803',
        airline: 'Citilink',
        origin: 'CGK',
        destination: 'JOG',
        departureTime: '08:45',
        arrivalTime: '10:00',
        departureDate: today,
        arrivalDate: today,
        price: 650000,
        status: 'On Time',
        aircraftType: 'Airbus A320',
        terminal: '2',
        gate: 'C3',
      ),
      Flight(
        flightNumber: 'GA 230',
        airline: 'Garuda Indonesia',
        origin: 'CGK',
        destination: 'UPG',
        departureTime: '10:00',
        arrivalTime: '13:30',
        departureDate: today,
        arrivalDate: today,
        price: 1850000,
        status: 'On Time',
        aircraftType: 'Boeing 737-800',
        terminal: '3',
        gate: 'A8',
      ),
      Flight(
        flightNumber: 'JT 610',
        airline: 'Lion Air',
        origin: 'CGK',
        destination: 'BDO',
        departureTime: '11:30',
        arrivalTime: '13:15',
        departureDate: today,
        arrivalDate: today,
        price: 720000,
        status: 'On Time',
        aircraftType: 'Boeing 737-900ER',
        terminal: '1',
        gate: 'D2',
      ),
      Flight(
        flightNumber: 'SJ 230',
        airline: 'Sriwijaya Air',
        origin: 'CGK',
        destination: 'PLM',
        departureTime: '13:00',
        arrivalTime: '14:15',
        departureDate: today,
        arrivalDate: today,
        price: 580000,
        status: 'On Time',
        aircraftType: 'Boeing 737-500',
        terminal: '1',
        gate: 'E1',
      ),
      Flight(
        flightNumber: 'GA 650',
        airline: 'Garuda Indonesia',
        origin: 'DPS',
        destination: 'CGK',
        departureTime: '14:30',
        arrivalTime: '17:30',
        departureDate: today,
        arrivalDate: today,
        price: 1300000,
        status: 'On Time',
        aircraftType: 'Boeing 737-800',
        terminal: 'International',
        gate: 'I5',
      ),
      Flight(
        flightNumber: 'QZ 7510',
        airline: 'AirAsia',
        origin: 'CGK',
        destination: 'BTH',
        departureTime: '15:45',
        arrivalTime: '16:45',
        departureDate: today,
        arrivalDate: today,
        price: 450000,
        status: 'On Time',
        aircraftType: 'Airbus A320',
        terminal: '2',
        gate: 'F3',
      ),
      Flight(
        flightNumber: 'GA 410',
        airline: 'Garuda Indonesia',
        origin: 'SUB',
        destination: 'CGK',
        departureTime: '16:00',
        arrivalTime: '17:45',
        departureDate: today,
        arrivalDate: today,
        price: 900000,
        status: 'On Time',
        aircraftType: 'Boeing 737-800',
        terminal: '3',
        gate: 'A12',
      ),
      Flight(
        flightNumber: 'JT 291',
        airline: 'Lion Air',
        origin: 'CGK',
        destination: 'PDG',
        departureTime: '17:30',
        arrivalTime: '19:15',
        departureDate: today,
        arrivalDate: today,
        price: 890000,
        status: 'On Time',
        aircraftType: 'Boeing 737-900ER',
        terminal: '1',
        gate: 'D8',
      ),
    ];
  }

  // Fetch real-time international flights from AviationStack API
  static Future<List<Flight>> getInternationalFlights() async {
    try {
      // Using AviationStack API for real-time flight data
      final apiKey = 'a5c8b848ab51c73629acb8c133e047f1';
      final url = Uri.parse(
        'http://api.aviationstack.com/v1/flights?access_key=$apiKey&limit=20'
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List flightsData = data['data'] ?? [];

        return flightsData.map((flightJson) {
          final departure = flightJson['departure'] ?? {};
          final arrival = flightJson['arrival'] ?? {};
          final airline = flightJson['airline'] ?? {};
          final flight = flightJson['flight'] ?? {};

          return Flight(
            flightNumber: flight['iata'] ?? 'N/A',
            airline: airline['name'] ?? 'Unknown',
            origin: departure['iata'] ?? 'N/A',
            destination: arrival['iata'] ?? 'N/A',
            departureTime: _formatTime(departure['scheduled']),
            arrivalTime: _formatTime(arrival['scheduled']),
            departureDate: _formatDate(departure['scheduled']),
            arrivalDate: _formatDate(arrival['scheduled']),
            price: _generateRandomPrice(),
            status: flightJson['flight_status'] ?? 'scheduled',
            aircraftType: flightJson['aircraft']?['registration'],
            terminal: departure['terminal'],
            gate: departure['gate'],
          );
        }).toList();
      } else {
        // If API fails, return mock international flights
        return _getMockInternationalFlights();
      }
    } catch (e) {
      print('Error fetching flights: $e');
      // Return mock data if API call fails
      return _getMockInternationalFlights();
    }
  }

  static List<Flight> _getMockInternationalFlights() {
    final now = DateTime.now();
    final today = '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    return [
      Flight(
        flightNumber: 'GA 865',
        airline: 'Garuda Indonesia',
        origin: 'CGK',
        destination: 'SIN',
        departureTime: '08:00',
        arrivalTime: '10:45',
        departureDate: today,
        arrivalDate: today,
        price: 2500000,
        status: 'On Time',
        aircraftType: 'Boeing 737-800',
        terminal: '3',
        gate: 'I1',
      ),
      Flight(
        flightNumber: 'SQ 956',
        airline: 'Singapore Airlines',
        origin: 'CGK',
        destination: 'SIN',
        departureTime: '09:30',
        arrivalTime: '12:15',
        departureDate: today,
        arrivalDate: today,
        price: 3200000,
        status: 'Boarding',
        aircraftType: 'Airbus A330',
        terminal: '3',
        gate: 'I3',
      ),
      Flight(
        flightNumber: 'QZ 251',
        airline: 'AirAsia',
        origin: 'CGK',
        destination: 'KUL',
        departureTime: '11:00',
        arrivalTime: '14:00',
        departureDate: today,
        arrivalDate: today,
        price: 1800000,
        status: 'On Time',
        aircraftType: 'Airbus A320',
        terminal: '2',
        gate: 'I5',
      ),
      Flight(
        flightNumber: 'GA 875',
        airline: 'Garuda Indonesia',
        origin: 'CGK',
        destination: 'BKK',
        departureTime: '12:30',
        arrivalTime: '15:45',
        departureDate: today,
        arrivalDate: today,
        price: 4200000,
        status: 'On Time',
        aircraftType: 'Boeing 777-300ER',
        terminal: '3',
        gate: 'I8',
      ),
      Flight(
        flightNumber: 'CX 776',
        airline: 'Cathay Pacific',
        origin: 'CGK',
        destination: 'HKG',
        departureTime: '14:00',
        arrivalTime: '19:30',
        departureDate: today,
        arrivalDate: today,
        price: 5500000,
        status: 'On Time',
        aircraftType: 'Airbus A350-900',
        terminal: '3',
        gate: 'I10',
      ),
      Flight(
        flightNumber: 'GA 88',
        airline: 'Garuda Indonesia',
        origin: 'CGK',
        destination: 'NRT',
        departureTime: '15:30',
        arrivalTime: '00:45',
        departureDate: today,
        arrivalDate: _getNextDay(today),
        price: 7800000,
        status: 'On Time',
        aircraftType: 'Boeing 777-300ER',
        terminal: '3',
        gate: 'I12',
      ),
      Flight(
        flightNumber: 'EK 359',
        airline: 'Emirates',
        origin: 'CGK',
        destination: 'DXB',
        departureTime: '17:00',
        arrivalTime: '22:30',
        departureDate: today,
        arrivalDate: today,
        price: 8500000,
        status: 'On Time',
        aircraftType: 'Boeing 777-300ER',
        terminal: '3',
        gate: 'I15',
      ),
      Flight(
        flightNumber: 'QR 959',
        airline: 'Qatar Airways',
        origin: 'CGK',
        destination: 'DOH',
        departureTime: '18:30',
        arrivalTime: '23:45',
        departureDate: today,
        arrivalDate: today,
        price: 7200000,
        status: 'On Time',
        aircraftType: 'Boeing 777-300ER',
        terminal: '3',
        gate: 'I18',
      ),
      Flight(
        flightNumber: 'TG 435',
        airline: 'Thai Airways',
        origin: 'CGK',
        destination: 'BKK',
        departureTime: '19:00',
        arrivalTime: '22:15',
        departureDate: today,
        arrivalDate: today,
        price: 3900000,
        status: 'Delayed',
        aircraftType: 'Airbus A330-300',
        terminal: '3',
        gate: 'I20',
      ),
      Flight(
        flightNumber: 'MH 725',
        airline: 'Malaysia Airlines',
        origin: 'CGK',
        destination: 'KUL',
        departureTime: '20:00',
        arrivalTime: '23:00',
        departureDate: today,
        arrivalDate: today,
        price: 2200000,
        status: 'On Time',
        aircraftType: 'Boeing 737-800',
        terminal: '3',
        gate: 'I22',
      ),
    ];
  }

  static String _formatTime(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateTimeString);
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'N/A';
    }
  }

  static String _formatDate(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) return 'N/A';
    try {
      final dateTime = DateTime.parse(dateTimeString);
      return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return 'N/A';
    }
  }

  static double _generateRandomPrice() {
    // Generate random price between 2M - 10M IDR for international flights
    return 2000000 + (8000000 * (DateTime.now().millisecondsSinceEpoch % 100) / 100);
  }

  static String _getNextDay(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final nextDay = date.add(Duration(days: 1));
      return '${nextDay.year}-${nextDay.month.toString().padLeft(2, '0')}-${nextDay.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return dateString;
    }
  }

  // Get city name from airport code
  static String getCityName(String airportCode) {
    final Map<String, String> airports = {
      'CGK': 'Jakarta',
      'DPS': 'Bali',
      'SUB': 'Surabaya',
      'JOG': 'Yogyakarta',
      'UPG': 'Makassar',
      'BDO': 'Bandung',
      'PLM': 'Palembang',
      'BTH': 'Batam',
      'PDG': 'Padang',
      'SIN': 'Singapore',
      'KUL': 'Kuala Lumpur',
      'BKK': 'Bangkok',
      'HKG': 'Hong Kong',
      'NRT': 'Tokyo',
      'DXB': 'Dubai',
      'DOH': 'Doha',
    };
    return airports[airportCode] ?? airportCode;
  }
}
