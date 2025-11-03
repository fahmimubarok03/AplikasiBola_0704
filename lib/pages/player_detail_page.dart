import 'package:flutter/material.dart';
import 'home_page.dart';

class PlayerDetailPage extends StatelessWidget {
  final String nama;
  final String posisi;
  final String nomor;
  final String negara;
  final String usia;
  final String tinggi;

  const PlayerDetailPage({
    super.key,
    required this.nama,
    required this.posisi,
    required this.nomor,
    required this.negara,
    required this.usia,
    required this.tinggi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pemain'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Informasi Pemain:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            _infoRow('Nama', nama),
            _infoRow('Posisi', posisi),
            _infoRow('Nomor Punggung', nomor),
            _infoRow('Kewarganegaraan', negara),
            _infoRow('Usia', '$usia tahun'),
            _infoRow('Tinggi Badan', '$tinggi cm'),
            const SizedBox(height: 30),

            // Tombol kembali ke Home
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
