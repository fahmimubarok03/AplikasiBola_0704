import 'package:flutter/material.dart';
import 'add_player_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persela App'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Jadwal Pertandingan ---
              const Text(
                'Jadwal Pertandingan Persela Lamongan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.lightBlue),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Persela Lamongan  VS  Persebaya',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Tanggal: 1 November 2025'),
                    Text('Waktu: 15:00 WIB'),
                    Text('Lokasi: Stadion Surajaya Lamongan'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // --- Menu ---
              const Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _menuItem(
                    icon: Icons.people,
                    label: 'Player',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPlayerPage()),
                      );
                    },
                  ),
                  _menuItem(icon: Icons.schedule, label: 'Jadwal', onTap: () {}),
                  _menuItem(
                      icon: Icons.bar_chart, label: 'Klasemen', onTap: () {}),
                  _menuItem(
                      icon: Icons.shopping_bag,
                      label: 'Merchandise',
                      onTap: () {}),
                ],
              ),

              const SizedBox(height: 20),

              // --- Berita ---
              const Text(
                'Berita Terbaru Persela Lamongan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),

              // Daftar berita (3 kotak contoh)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(3, (index) {
                  return Container(
                    width: (MediaQuery.of(context).size.width / 2) - 25,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.tealAccent[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.lightBlue),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Persela Lamongan Resmi Rekrut Pemain Baru',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Persela Lamongan telah resmi merekrut pemain baru untuk memperkuat tim mereka kedepannya.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.lightBlue, size: 30),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
