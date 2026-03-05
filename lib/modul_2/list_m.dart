import 'dart:io';

void main() {
  List<String> dataList = [];

  // Input jumlah data
  stdout.write('Masukkan jumlah data: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  // Input isi list
  for (int i = 0; i < jumlah; i++) {
    stdout.write('Data ke-${i + 1}: ');
    String data = stdin.readLineSync()!;
    dataList.add(data);
  }

  // TAMPIL BERDASARKAN INDEX
  stdout.write('\nMasukkan index yang ingin ditampilkan: ');
  int indexTampil = int.parse(stdin.readLineSync()!);

  if (indexTampil >= 0 && indexTampil < dataList.length) {
    print('Data pada index $indexTampil: ${dataList[indexTampil]}');
  } else {
    print('Index tidak valid!');
  }

  // UBAH BERDASARKAN INDEX
  stdout.write('\nMasukkan index yang ingin diubah: ');
  int indexUbah = int.parse(stdin.readLineSync()!);

  if (indexUbah >= 0 && indexUbah < dataList.length) {
    stdout.write('Masukkan data baru: ');
    String dataBaru = stdin.readLineSync()!;
    dataList[indexUbah] = dataBaru;
  } else {
    print('Index tidak valid!');
  }

  // HAPUS BERDASARKAN INDEX
  stdout.write('\nMasukkan index yang ingin dihapus: ');
  int indexHapus = int.parse(stdin.readLineSync()!);

  if (indexHapus >= 0 && indexHapus < dataList.length) {
    dataList.removeAt(indexHapus);
  } else {
    print('Index tidak valid!');
  }

  // HASIL AKHIR
  print('\n=== SEMUA DATA ===');
  for (int i = 0; i < dataList.length; i++) {
    print('Index $i: ${dataList[i]}');
  }
}