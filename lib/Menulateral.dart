import 'package:flutter/material.dart';
import 'Homereal.dart';
import 'notificaciones.dart';
import 'ajustes.dart';

void main() => runApp(MyApp3());

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    MyApp2(),
    PantallaCerrarSesion(),
    MyApp4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Image.asset('img/Edupaymenu.png'), // Replace with your logo
        title: Text('',), // Replace with your app's title
        actions: [
          IconButton(
            color:const Color.fromARGB(255, 228, 212, 254),
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PantallaCerrarSesion()),
              );
            },
          ),
        ],
        elevation: 4.0, // <- Add this line to add a shadow to the app bar
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 125, 84, 196),
        unselectedItemColor: Color.fromARGB(255, 33, 1, 90),
        selectedItemColor: const Color.fromARGB(255, 228, 212, 254),
        currentIndex: _currentIndex,
        onTap: (index) => _pageController.animateToPage(index,
            duration: Duration(milliseconds: 400), curve: Curves.ease),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pagos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
        ],
      ),
    );
  }
}
