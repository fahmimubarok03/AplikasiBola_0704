import 'package:flutter/material.dart';
import 'player_detail_page.dart';

class AddPlayerPage extends StatefulWidget {
  const AddPlayerPage({super.key});

  @override
  State<AddPlayerPage> createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final posisiController = TextEditingController();
  final nomorController = TextEditingController();
  final negaraController = TextEditingController();
  final usiaController = TextEditingController();
  final tinggiController = TextEditingController();

  String? gender; // Laki-laki / Perempuan
  bool genderError = false; // untuk pesan error jenis kelamin

  void _tambahPemain() {
    setState(() {
      genderError = gender == null; // tandai error jika belum pilih gender
    });

    if (_formKey.currentState!.validate() && gender != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayerDetailPage(
            nama: namaController.text,
            posisi: posisiController.text,
            nomor: nomorController.text,
            negara: negaraController.text,
            usia: usiaController.text,
            tinggi: tinggiController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pemain Baru'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Form untuk menambahkan pemain baru akan ditempatkan di sini.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Nama Pemain
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama Pemain'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter player name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Posisi Pemain
              TextFormField(
                controller: posisiController,
                decoration: const InputDecoration(labelText: 'Posisi Pemain'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter player position';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Nomor Punggung
              TextFormField(
                controller: nomorController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Punggung',
                  hintText: 'Masukkan nomor punggung pemain',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter player number';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Nomor harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Kewarganegaraan
              TextFormField(
                controller: negaraController,
                decoration:
                    const InputDecoration(labelText: 'Kewarganegaraan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter player nationality';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Usia Pemain
              TextFormField(
                controller: usiaController,
                decoration: const InputDecoration(labelText: 'Usia Pemain'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter player age';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age < 10 || age > 50) {
                    return 'Usia harus antara 10 - 50 tahun';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Tinggi Pemain
              TextFormField(
                controller: tinggiController,
                decoration:
                    const InputDecoration(labelText: 'Tinggi Pemain (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter player height';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Tinggi harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Jenis Kelamin
              const Text('Jenis Kelamin'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                          genderError = false;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                          genderError = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              if (genderError)
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    'Please select player gender',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              const SizedBox(height: 20),

              // Tombol Tambah Pemain
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _tambahPemain,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Tambah Pemain'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
