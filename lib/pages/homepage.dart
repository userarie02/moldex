import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomePageState();
}

class HomePageState extends State<Homepage> {
  int currentIndex = 0;

  // SWITH FOR TOGGLES
  bool isAntiMoldEjectorOn = false;
  bool isDehumidifierOn = false;
  bool isPowerOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(158, 158, 158, 1),
                blurRadius: 6.0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF73a942),
            title: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/mainlogo.png',
                        height: 50,
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        "Mold Shield",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: currentIndex == 0
            ? _buildHomePage()
            : currentIndex == 1
                ? _buildAnalyticsPage()
                : _buildSettingsPage(),
      ),
      bottomNavigationBar: Container(
        height: 63.0,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
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
          selectedItemColor: const Color(0xFF008000),
          unselectedItemColor: const Color.fromARGB(255, 138, 135, 135),
        ),
      ),
    );
  }

  //HOME
  Widget _buildHomePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Mold Shield Activity',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        //POWER BUTTON
        GestureDetector(
          onTap: () {
            setState(() {
              isPowerOn = !isPowerOn;
            });
          },
          child: Container(
            width: 340,
            height: 70,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isPowerOn
                  ? const Color(0xFFbc4b51)
                  : const Color.fromARGB(255, 127, 129, 125),
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(158, 158, 158, 1),
                  blurRadius: 6.0,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.power_settings_new,
                  size: 50,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),

        //ANTI-MOLD EJECTOR
        Container(
          width: 350,
          height: 320,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color:
                const Color.fromARGB(255, 231, 229, 229), //COMBINED CONTAINER
            borderRadius: BorderRadius.circular(34),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(158, 158, 158, 1),
                blurRadius: 4.5,
                offset: Offset(3.5, 5),
              ),
            ],
            border: const Border(
              top: BorderSide(color: Colors.black, width: 1.3),
              bottom: BorderSide(color: Colors.black, width: 1.3),
              left: BorderSide(color: Colors.black, width: 1.3),
              right: BorderSide(color: Colors.black, width: 1.3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ANTI-MOLD EJECTOR
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAntiMoldEjectorOn = !isAntiMoldEjectorOn;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 90,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: isAntiMoldEjectorOn
                        ? Colors.green
                        : const Color(0xFF8fb996),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(158, 158, 158, 1),
                        blurRadius: 6.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: isAntiMoldEjectorOn
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    children: [
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 230),
                        alignment: isAntiMoldEjectorOn
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: const Icon(
                          Icons.shield,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Anti-Mold Ejector',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // DEHUMIDIFIER
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDehumidifierOn = !isDehumidifierOn;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 90,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: isDehumidifierOn
                        ? const Color(0xFF348aa7)
                        : const Color(0xFF68b0ab),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(158, 158, 158, 1),
                        blurRadius: 6.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: isDehumidifierOn
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    children: [
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 230),
                        alignment: isDehumidifierOn
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: const Icon(
                          Icons.water_drop,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Dehumidifier',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnalyticsPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Particulate Matter Sensor Container
        Container(
          width: 370,
          height: 110,
          padding: const EdgeInsets.all(13),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(158, 158, 158, 1),
                blurRadius: 4.5,
                offset: Offset(3.5, 3),
              ),
            ],
            border: const Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0),
              left: BorderSide(color: Colors.black, width: 1.0),
              right: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Particulate Matter Sensor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '25 µg/m³', // SAMPLE VALUE
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Humidity Container
        Container(
          width: 370,
          height: 110,
          padding: const EdgeInsets.all(13),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(158, 158, 158, 1),
                blurRadius: 4.5,
                offset: Offset(3.5, 3),
              ),
            ],
            border: const Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0),
              left: BorderSide(color: Colors.black, width: 1.0),
              right: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Humidity',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '60%', // SAMPLE VALUE
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // VOC Sensor Container
        Container(
          width: 370,
          height: 110,
          padding: const EdgeInsets.all(13),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(158, 158, 158, 1),
                blurRadius: 4.5,
                offset: Offset(3.5, 3),
              ),
            ],
            border: const Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0),
              left: BorderSide(color: Colors.black, width: 1.0),
              right: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'VOC Sensor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '1.2 ppm', // SAMPLE VALUE
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Temperature Container
        Container(
          width: 370,
          height: 110,
          padding: const EdgeInsets.all(13),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(158, 158, 158, 1),
                blurRadius: 4.5,
                offset: Offset(3.5, 3),
              ),
            ],
            border: const Border(
              top: BorderSide(color: Colors.black, width: 1.0),
              bottom: BorderSide(color: Colors.black, width: 1.0),
              left: BorderSide(color: Colors.black, width: 1.0),
              right: BorderSide(color: Colors.black, width: 1.0),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Temperature',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '34.5°C', // SAMPLE VALUE
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
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
            // Directly navigate to LoginPage on Log Out
            Navigator.pushReplacementNamed(
                context, '/'); // Navigates to the LoginPage
          },
          child: const Text('Log Out'),
        ),
      ],
    );
  }
}
