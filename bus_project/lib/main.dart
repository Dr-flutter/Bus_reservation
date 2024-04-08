import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Principale'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Navigator.of(context).push(_createRoute()),
        ),
      ),
      body: Center(
        child: Text('Contenu de la page principale'),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SideBarPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}

class SideBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAGES'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _createDrawerItem(
            icon: Icons.home,
            text: 'Starting',
            onTap: () => _openNewPage(context, StartingPage()),
          ),
          _createDrawerItem(
            text: 'Homepage',
            onTap: () => _openNewPage(context, HomePage()),
          ),
          _createDrawerItem(
            text: 'Book Ticket',
            onTap: () => _openNewPage(context, BookTicketPage()),
          ),
          _createDrawerItem(
            text: 'Trajets populaires',
            onTap: () => _openNewPage(context, PopularRoutesPage()),
          ),
          _createDrawerItem(
            text: 'Cancel Ticket',
            onTap: () => _openNewPage(context, CancelTicketPage()),
          ),
          _createDrawerItem(
            text: 'Contact Us',
            onTap: () => _openNewPage(context, ContactUsPage()),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    IconData? icon,
    required String text,
    required VoidCallback onTap,
    Color? tileColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(text,
          style: textColor != null ? TextStyle(color: textColor) : null),
      onTap: onTap,
      tileColor: tileColor,
    );
  }

  void _openNewPage(BuildContext context, Widget page) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => page));
  }
}

class StartingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Starting Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Welcome to the Starting Page'),
      ])),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(child: Text('Welcome to the Home Page')),
    );
  }
}

class BookTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Ticket Page')),
      body: Center(child: Text('Welcome to the Book Ticket Page')),
    );
  }
}

class PopularRoutesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Routes Page')),
      body: Center(child: Text('Welcome to the Popular Routes Page')),
    );
  }
}

class CancelTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cancel Ticket Page')),
      body: Center(child: Text('Welcome to the Cancel Ticket Page')),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us Page')),
      body: Center(child: Text('Welcome to the Contact Us Page')),
    );
  }
}
