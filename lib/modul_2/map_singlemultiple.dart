import 'dart:io';

void main() {

  //=== INPUT DATA MAHASISWA ===
  print("=== INPUT DATA MAHASISWA ===");

  stdout.write("Masukkan NIM: ");
  String nim = stdin.readLineSync()!;

  stdout.write("Masukkan Nama: ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan Jurusan: ");
  String jurusan = stdin.readLineSync()!;

  stdout.write("Masukkan IPK: ");
  String ipk = stdin.readLineSync()!;

  Map<String, String> mahasiswa = {
    "nim": nim,
    "nama": nama,
    "jurusan": jurusan,
    "ipk": ipk
  };
  print("\nData Mahasiswa: $mahasiswa");

  //=== INPUT MULTIPLE MAHASISWA ===
  print("\n=== INPUT MULTIPLE MAHASISWA ===");

  stdout.write("Masukkan jumlah mahasiswa: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= jumlah; i++) {

    print("\n--- Mahasiswa ke-$i ---");

    stdout.write("Masukkan NIM: ");
    String nimM = stdin.readLineSync()!;

    stdout.write("Masukkan Nama: ");
    String namaM = stdin.readLineSync()!;

    stdout.write("Masukkan Jurusan: ");
    String jurusanM = stdin.readLineSync()!;

    stdout.write("Masukkan IPK: ");
    String ipkM = stdin.readLineSync()!;

    Map<String, String> dataMahasiswa = {
      "nim": nimM,
      "nama": namaM,
      "jurusan": jurusanM,
      "ipk": ipkM
    };

    print("Data Mahasiswa: $dataMahasiswa");
  }
}