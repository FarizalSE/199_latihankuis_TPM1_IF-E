import 'package:flutter/material.dart';
import 'package:latihan_kuis/add_notes.dart';
import 'package:latihan_kuis/login_page.dart';

class HomePage extends StatelessWidget {
  final String user;
  final String judul;
  final String catatan;

  const HomePage(
      {super.key,
      required this.user,
      required this.judul,
      required this.catatan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyNotes"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang $user!, di Aplikasi MyNotes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.note, color: Colors.blue),
                title:
                    Text(judul, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(catatan),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotes(users: user)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
