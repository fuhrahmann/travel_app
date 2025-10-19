import '../models/destination.dart';

class DataService {
  static List<Destination> getDestinations() {
    return [
      Destination(
        id: '1',
        name: 'Bali',
        country: 'Indonesia',
        description:
            'Experience the magic of Bali with its stunning beaches, ancient temples, and vibrant culture. From the rice terraces of Ubud to the beaches of Seminyak, Bali offers a perfect blend of relaxation and adventure.',
        imageUrl: 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800',
        rating: 4.8,
        reviews: 2456,
        price: 1299,
        duration: '7 Days',
        activities: ['Beach', 'Temple Tours', 'Surfing', 'Yoga', 'Spa'],
      ),
      Destination(
        id: '2',
        name: 'Paris',
        country: 'France',
        description:
            'The City of Light beckons with its iconic landmarks, world-class museums, and romantic atmosphere. Stroll along the Seine, visit the Eiffel Tower, and indulge in exquisite French cuisine.',
        imageUrl: 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800',
        rating: 4.9,
        reviews: 3891,
        price: 1899,
        duration: '5 Days',
        activities: ['Museums', 'Architecture', 'Fine Dining', 'Shopping', 'Wine Tasting'],
      ),
      Destination(
        id: '3',
        name: 'Tokyo',
        country: 'Japan',
        description:
            'Discover the perfect harmony of ancient traditions and cutting-edge technology. From serene temples to bustling street markets, Tokyo offers an unforgettable cultural experience.',
        imageUrl: 'https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800',
        rating: 4.7,
        reviews: 2103,
        price: 2199,
        duration: '6 Days',
        activities: ['Temple Tours', 'Street Food', 'Shopping', 'Anime Culture', 'Cherry Blossoms'],
      ),
      Destination(
        id: '4',
        name: 'Santorini',
        country: 'Greece',
        description:
            'Famous for its stunning sunsets, white-washed buildings, and crystal-clear waters. This Greek island paradise is perfect for romance and relaxation with breathtaking views at every turn.',
        imageUrl: 'https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?w=800',
        rating: 4.9,
        reviews: 1876,
        price: 1699,
        duration: '5 Days',
        activities: ['Beach', 'Wine Tours', 'Sailing', 'Photography', 'Sunset Views'],
      ),
      Destination(
        id: '5',
        name: 'New York',
        country: 'USA',
        description:
            'The city that never sleeps offers world-famous attractions, Broadway shows, diverse cuisine, and an energy unlike anywhere else. From Central Park to Times Square, NYC is a must-visit destination.',
        imageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=800',
        rating: 4.6,
        reviews: 4521,
        price: 1599,
        duration: '5 Days',
        activities: ['Broadway', 'Museums', 'Shopping', 'Fine Dining', 'City Tours'],
      ),
      Destination(
        id: '6',
        name: 'Dubai',
        country: 'UAE',
        description:
            'A futuristic city in the desert featuring the world\'s tallest building, luxury shopping, and incredible architecture. Dubai combines traditional Arabian culture with modern opulence.',
        imageUrl: 'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800',
        rating: 4.8,
        reviews: 2934,
        price: 1799,
        duration: '4 Days',
        activities: ['Desert Safari', 'Shopping', 'Skydiving', 'Beach Clubs', 'Fine Dining'],
      ),
      Destination(
        id: '7',
        name: 'Machu Picchu',
        country: 'Peru',
        description:
            'Ancient Incan citadel set high in the Andes Mountains. This archaeological wonder offers stunning views and a journey through fascinating history and culture.',
        imageUrl: 'https://images.unsplash.com/photo-1587595431973-160d0d94add1?w=800',
        rating: 4.9,
        reviews: 1654,
        price: 1499,
        duration: '6 Days',
        activities: ['Hiking', 'History Tours', 'Photography', 'Local Culture', 'Adventure'],
      ),
      Destination(
        id: '8',
        name: 'Maldives',
        country: 'Maldives',
        description:
            'Tropical paradise featuring overwater bungalows, pristine beaches, and incredible marine life. Perfect for honeymoons, diving, and ultimate relaxation in luxury.',
        imageUrl: 'https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=800',
        rating: 4.9,
        reviews: 2187,
        price: 2499,
        duration: '7 Days',
        activities: ['Diving', 'Snorkeling', 'Spa', 'Water Sports', 'Beach Relaxation'],
      ),
    ];
  }
}
