import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Map<String, String>> notifications = [
    {"title": "New message from John", "time": "2m ago", "type": "message"},
    {"title": "Order #12345 shipped", "time": "1h ago", "type": "order"},
    {"title": "Meeting at 3 PM", "time": "3h ago", "type": "reminder"},
    {"title": "App Update available", "time": "Yesterday", "type": "update"},
    {"title": "Promotion: 20% off!", "time": "Earlier", "type": "promo"},
  ];

  Color getIconColor(String type) {
    switch (type) {
      case "message":
        return Colors.blue;
      case "order":
        return Colors.orange;
      case "reminder":
        return Colors.green;
      case "update":
        return Colors.purple;
      case "promo":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData getIcon(String type) {
    switch (type) {
      case "message":
        return Icons.message;
      case "order":
        return Icons.local_shipping;
      case "reminder":
        return Icons.event;
      case "update":
        return Icons.system_update_alt;
      case "promo":
        return Icons.local_offer;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'Notifications',
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
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                "No Notifications",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notif = notifications[index];
                return Dismissible(
                  key: Key(notif["title"]! + index.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      notifications.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Deleted: ${notif["title"]}")),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        // Timeline indicator
                        Column(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: getIconColor(notif["type"]!),
                                shape: BoxShape.circle,
                              ),
                            ),
                            if (index != notifications.length - 1)
                              Container(
                                width: 2,
                                height: 60,
                                color: Colors.grey[300],
                              ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        // Notification content
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  getIcon(notif["type"]!),
                                  color: getIconColor(notif["type"]!),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notif["title"]!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        notif["time"]!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
