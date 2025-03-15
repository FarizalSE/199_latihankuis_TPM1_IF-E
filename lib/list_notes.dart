import 'package:flutter/material.dart';

class MyNotes extends StatelessWidget {
  final String judul;
  final String catatan;
  const MyNotes({super.key, required this.judul, required this.catatan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyNotes"),
      ),
      body: Column(
        children: [
          Center(
            //buat card untuk tampilan list notes
            child: Card(
              child: ListTile(
                title: Text(" $judul"),
                subtitle: Text(" $catatan"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
