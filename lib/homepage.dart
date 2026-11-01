import 'package:flutter/material.dart';
import 'package:tugas5mobile/detail_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static const List<Map<String, Object>> makanan = [
    {
      'nama': 'Nasi Goreng ',
      'harga': 13000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaewAFj9KWHPrFFMAM53z7VRoVSQpequc6hSXnQn3UNA&s=10',
      'deskripsi': 'Nasi goreng dengan ayam, telur ceplok, kerupuk, dan bumbu yang diracik oleh saya sendiri.',
    },
    {
      'nama': 'bakso',
      'harga': 15000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKNudw3FDbHHRIsK-mKebl_GC6sWO5Cl7SENh-VmsGhw&s=10',
      'deskripsi': 'Bakso dengan campuran urat atau tetelan sapi, memberikan tekstur berserat dan lebih juicy.',
    },
    {
      'nama': 'Mie Ayam ',
      'harga': 13000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG5AkNfD5I7H7e9lGjol8K-4BsCNDyET1bo_2DIGSVdA&s=10',
      'deskripsi': 'Mi yang kenyal berpadu dengan kelembutan potongan daging ayam kecap serta kerenyahan sawi hijau dan bawang goreng.',
    },
    {
      'nama': 'Ayam geprek',
      'harga': 10000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHCsvNEyPBqRdpvqgAHulGs4yd5MTYqaIjBFhYF3GTww&s=10',
      'deskripsi': 'ayam goreng tepung krispi yang dihancurkan sampai remuk dan menyatu dengan sambal dengan selada , tomat , dan timun',
    },
    {
      'nama': 'seblak',
      'harga': 10000,
      'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVdHdjRDgH9WYkYaEZr7jqgElA6G--RzMYUNOQRBLN4g&s=10',
      'deskripsi': 'Kombinasi unik antara kenyal-lentur dari kerupuk basah, kelembutan kocokan telur, serta kerenyahan renyah-empuk dari kondimen pendamping',
    },
  ];

  static String _formatRupiah(int harga) {
    final angka = harga.toString();
    var hasil = '';

    for (var i = 0; i < angka.length; i++) {
      hasil += angka[i];
      final digitTersisa = angka.length - i - 1;

      if (digitTersisa > 0 && digitTersisa % 3 == 0) {
        hasil += '.';
      }
    }

    return 'Rp $hasil';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.restaurant),
        title: const Text('Rumah Makan Rendi'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: makanan.length,
        itemBuilder: (context, index) {
          final item = makanan[index];
          final nama = item['nama'] as String;
          final harga = item['harga'] as int;
          final img = item['img'] as String;
          final deskripsi = item['deskripsi'] as String;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  img,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 70,
                    color: Colors.amber.shade100,
                    child: const Icon(Icons.restaurant),
                  ),
                ),
              ),
              title: Text(
                nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '${_formatRupiah(harga)}\n$deskripsi',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      nama: nama,
                      harga: _formatRupiah(harga),
                      img: img,
                      deskripsi: deskripsi,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
