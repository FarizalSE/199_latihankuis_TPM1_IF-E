import 'package:flutter/material.dart';
import 'package:latihan_kuis/home_page.dart';

class AddNotes extends StatefulWidget {
  final String users;

  const AddNotes({super.key, required this.users});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  String judul = "";
  String catatan = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Catatan"),
      ),
      body: Column(
        children: [
          _formInput(
              label: "Masukan Judul",
              hint: "Judul",
              setStateInput: (value) {
                judul = value;
              }),
          _formInput(
              label: "Catatan",
              hint: "Catatan",
              setStateInput: (value) {
                catatan = value;
              }),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (contex) => HomePage(
                              user: widget.users,
                              judul: judul,
                              catatan: catatan)),
                      (Route<dynamic> route) => false);
                },
                child: Text("Simpan")),
          )
        ],
      ),
    );
  }

  Widget _formInput({
    required String label,
    required String hint,
    required Function(String value) setStateInput,
    int maxLines = 1,
  }) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hint, labelText: label),
      onChanged: setStateInput,
    );
  }
}
