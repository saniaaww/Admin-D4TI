import 'dart:io';

void main() {
  List<String> dataList = [];
  print('Data list kosong: $dataList');

  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();

    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print('Input tidak valid! Masukkan angka yang benar.');
    }
  }
  for (int i = 0; i < count; i++) {
    stdout.write('Data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  print('Data list:');
  print(dataList);
}