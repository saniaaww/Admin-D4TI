import 'dart:io';

void main() {
  //Membuat Map dengan data awal
  Map<String, String> data = {
    'Sany': '081234567890',
    'Nia': '082345678901',
    'Bravo': '083456789012',
  };
  print('Data awal: $data');

  //Menambah data ke Map
  data['Warda'] = '084567890123';
  print('Data setelah ditambahkan: $data');

  //Mengakses data berdasarkan key
  print('Nomor Nia: ${data['Nia']}');

  //Mengubah data berdasarkan key
    data['Sany'] = '080000000000';
    print('Data setelah diubah: $data');

  //Menghapus data berdasarkan key
    data.remove('Bravo');
    print('Data setelah dihapus: $data');

  //Cek apakah key tertentu ada
    print('Apakah key Nia ada? ${data.containsKey('Nia')}');

  //Hitung jumlah data
    print('Jumlah data: ${data.length}');

  //Menampilkan semua key
    print('Semua key: ${data.keys}');

  //Menampilkan semua value
    print('Semua value: ${data.values}');
}