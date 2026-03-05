import 'dart:io';

void main() {
  Set<String> dataSet = {};

  // Input jumlah data
  stdout.write("Masukkan jumlah data: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  // Input data
  for (int i = 0; i < jumlah; i++) {
    stdout.write("Data ke-${i + 1}: ");
    String input = stdin.readLineSync()!;
    dataSet.add(input);
  }

  print("\n=== DATA SET ===");
  print(dataSet);

  // Tambah data
  stdout.write("\nMasukkan data yang ingin ditambahkan: ");
  String tambah = stdin.readLineSync()!;
  dataSet.add(tambah);

  // Hapus data
  stdout.write("Masukkan data yang ingin dihapus: ");
  String hapus = stdin.readLineSync()!;
  dataSet.remove(hapus);

  // Cek data
  stdout.write("Masukkan data yang ingin dicek: ");
  String cek = stdin.readLineSync()!;
  print("Apakah data ada? ${dataSet.contains(cek)}");

  // Hitung jumlah
  print("Jumlah data: ${dataSet.length}");

  // Tampilkan semua data
  print("\n=== HASIL AKHIR SET ===");
  for (var data in dataSet) {
    print(data);
  }
}