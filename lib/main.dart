import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Mahasiswa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Daftar Mahasiswa'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const List<Map<String, String>> mahasiswa = [
      {'nama': 'SATNA SETIYANA', 'nim': 'STI202102386'},
      {'nama': 'mahasiswa tidak terdaftar PDDikti', 'nim': 'STI202102387'},
      {'nama': 'ADI LUKMAN NURHAKIM', 'nim': 'STI202102388'},
      {'nama': 'DESTA MUTIARA KARDIANSYAH', 'nim': 'STI202102389'},
      {'nama': 'YUSUF JAUHAR ALIF FAQIH', 'nim': 'STI202102390'},
      {'nama': 'FEBRY ADI PRATAMA', 'nim': 'STI202102391'},
      {'nama': 'RANDI PANGESTU', 'nim': 'STI202102392'},
      {'nama': 'SEPTIASIH NUR INAYAH', 'nim': 'STI202102393'},
      {'nama': 'WILSYA NURALISA', 'nim': 'STI202102394'},
    ];

    const int nomorAbsenSaya = 4; 

    int getAbsen(int currentIndex, int offset) {
      return (currentIndex + offset + mahasiswa.length) % mahasiswa.length;
    }

    final List<int> nomorAbsenTampil = [
      getAbsen(nomorAbsenSaya, -2),
      getAbsen(nomorAbsenSaya, -1),
      nomorAbsenSaya,
      getAbsen(nomorAbsenSaya, 1),
      getAbsen(nomorAbsenSaya, 2),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: nomorAbsenTampil.map((index) {
            bool isSaya = index == nomorAbsenSaya;
            return Container(
              color: isSaya ? Colors.green : Colors.transparent,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                children: [
                  Text(
                    mahasiswa[index]['nama']!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: isSaya ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  Text(
                    'NIM: ${mahasiswa[index]['nim']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
