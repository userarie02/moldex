import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomePageState();
}

class HomePageState extends State<Homepage> {
  int currentIndex = 0;

  // Switch states for toggles
  bool isAntiMoldEjectorOn = false;
  bool isDehumidifierOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mold Shield"),
      ),
      body: Center(
        child: currentIndex == 0
            ? _buildHomePage()
            : currentIndex == 1
                ? _buildAnalyticsPage()
                : _buildSettingsPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Analytics",
            icon: Icon(Icons.analytics),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildHomePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Mold Shield Activity',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Anti-Mold Ejector'),
            Switch(
              value: isAntiMoldEjectorOn,
              onChanged: (value) {
                setState(() {
                  isAntiMoldEjectorOn = value;
                  // Add Firebase update code here
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dehumidifier'),
            Switch(
              value: isDehumidifierOn,
              onChanged: (value) {
                setState(() {
                  isDehumidifierOn = value;
                  // Add Firebase update code here
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnalyticsPage() {
    // Placeholder for Analytics Page with Firebase-based data for graphs
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Analytics Page',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Text('Graphical data for:'),
        SizedBox(height: 10),
        Text('• Particulate Matter Sensor'),
        Text('• Humidity'),
        Text('• VOC Sensor'),
        Text('• Temperature'),
        // Firebase data graphs go here
      ],
    );
  }

  Widget _buildSettingsPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Settings',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Add "About Us" functionality
          },
          child: const Text('About Us'),
        ),
        ElevatedButton(
          onPressed: () {
            // Add "Log Out" functionality
          },
          child: const Text('Log Out'),
        ),
      ],
    );
  }
}
