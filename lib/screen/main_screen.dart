import 'package:flutter/material.dart';
import 'package:MyApp/screen/home_screen.dart';
import 'package:MyApp/screen/notifications_screen.dart';
import 'package:MyApp/screen/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  final List<Widget> screens = const [
    HomeScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() => currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // allows floating nav bar effect
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      // Floating Nav Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: onTabTapped,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey[500],
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  currentIndex == 0 ? Icons.home : Icons.home_outlined,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  currentIndex == 1
                      ? Icons.notifications
                      : Icons.notifications_outlined,
                ),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  currentIndex == 2 ? Icons.settings : Icons.settings_outlined,
                ),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),

      // Example Floating Action Button in center (optional)
    );
  }
}
