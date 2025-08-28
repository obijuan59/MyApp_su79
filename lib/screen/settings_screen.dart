import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          // --- Profile Header ---
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Text(
                    "A", // Replace with initials or profile image
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Alice Nguyen",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "alice@example.com",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // --- General Section ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "General",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFFEDE7F6),
                          child: Icon(
                            Icons.dark_mode,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text("Dark Mode"),
                      ],
                    ),
                    Switch(
                      activeColor: Colors.deepPurple,
                      value: darkMode,
                      onChanged: (val) {
                        setState(() {
                          darkMode = val;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFFEDE7F6),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text("Notifications"),
                      ],
                    ),
                    Switch(
                      activeColor: Colors.deepPurple,
                      value: notificationsEnabled,
                      onChanged: (val) {
                        setState(() {
                          notificationsEnabled = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // --- Account Section ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Account",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 12),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.deepPurple),
                  title: const Text("Profile"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.lock, color: Colors.deepPurple),
                  title: const Text("Change Password"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // --- Others Section ---
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.deepPurple),
                  title: const Text("About App"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  onTap: () {},
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
