import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Google'),
              onTap: () {
                Navigator.pushNamed(context, '/page1');
              },
            ),
            ListTile(
              title: Text('Youtube'),
              onTap: () {
                Navigator.pushNamed(context, '/page2');
              },
            ),
            ListTile(
              title: Text('Facebook'),
              onTap: () {
                Navigator.pushNamed(context, '/page3');
              },
            ),
            ListTile(
              title: Text('Yahoo'),
              onTap: () {
                Navigator.pushNamed(context, '/page4');
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) {
                Navigator.pushNamed(context, '/search', arguments: value);
              },
            ),
          ),
          Expanded(child: Center(child: Text('Home Page Content'))),
        ],
      ),
    );
  }
}
