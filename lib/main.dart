import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:random/sectionb.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Wecome To Quiz App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: const Icon(Icons.poll),
              title: const Text('Attempt Questions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculateQuizWithWave()),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: const Center(
          child: Text(
            'Go To Menu',
            style: TextStyle(fontSize: 30, color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
