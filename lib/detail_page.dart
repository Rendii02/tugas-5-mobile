import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String nama;
  final String harga;
  final String img;
  final String deskripsi;

  const DetailPage({
    super.key,
    required this.nama,
    required this.harga,
    required this.img,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nama)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              img,
              width: double.infinity,
              height: 220,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 220,
                child: Center(child: Icon(Icons.image_not_supported)),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              harga,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(deskripsi, style: const TextStyle(fontSize: 16, height: 1.5)),
          ],
        ),
      ),
    );
  }
}
