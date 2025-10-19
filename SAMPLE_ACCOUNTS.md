# Sample Login Accounts

This travel app includes pre-configured sample accounts for testing purposes. You can use any of the following credentials to log in:

## Available Sample Accounts

### Account 1
- **Email:** `john@example.com`
- **Password:** `password123`
- **Name:** John Doe
- **Trips Completed:** 15
- **Reviews Written:** 23

### Account 2
- **Email:** `jane@example.com`
- **Password:** `password123`
- **Name:** Jane Smith
- **Trips Completed:** 8
- **Reviews Written:** 12

### Account 3
- **Email:** `mike@example.com`
- **Password:** `password123`
- **Name:** Mike Wilson
- **Trips Completed:** 22
- **Reviews Written:** 35

### Account 4
- **Email:** `sarah@example.com`
- **Password:** `password123`
- **Name:** Sarah Johnson
- **Trips Completed:** 12
- **Reviews Written:** 18

### Account 5 (Demo Account)
- **Email:** `demo@travel.com`
- **Password:** `demo123`
- **Name:** Demo User
- **Trips Completed:** 5
- **Reviews Written:** 8

## Features

- All sample accounts are stored locally in `lib/services/auth_service.dart`
- Login validation checks credentials against the sample user list
- Registration creates new accounts dynamically
- Profile screen displays the logged-in user's information
- Logout functionality clears the current session

## Testing

1. Launch the app
2. Click "Login" on the welcome screen
3. Enter any of the sample account credentials above
4. Explore the app with the logged-in user profile
5. View your profile by navigating to the Profile tab
6. Test logout functionality from the Profile screen

## Note

These accounts are for development and testing purposes only. In a production environment, you should implement proper authentication with a backend API and secure password storage.
