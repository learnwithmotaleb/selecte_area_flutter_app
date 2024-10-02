import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Add your image asset
            ),
            SizedBox(height: 16),

            // Name
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            // Email
            Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            SizedBox(height: 16),

            // Phone
            ListTile(
              leading: Icon(Icons.phone, color: Colors.teal),
              title: Text('Phone'),
              subtitle: Text('+1 234 567 890'),
            ),

            // Email
            ListTile(
              leading: Icon(Icons.email, color: Colors.teal),
              title: Text('Email'),
              subtitle: Text('johndoe@example.com'),
            ),

            // Address
            ListTile(
              leading: Icon(Icons.home, color: Colors.teal),
              title: Text('Address'),
              subtitle: Text('123 Main Street, City, Country'),
            ),

            // Date of Birth
            ListTile(
              leading: Icon(Icons.cake, color: Colors.teal),
              title: Text('Date of Birth'),
              subtitle: Text('January 1, 1990'),
            ),

            // Other information
            ListTile(
              leading: Icon(Icons.info, color: Colors.teal),
              title: Text('Other Info'),
              subtitle: Text('Additional information can be shown here.'),
            ),
          ],
        ),
      ),
    );
  }
}
