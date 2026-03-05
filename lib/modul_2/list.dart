import 'dart:io';
void main() {
  List<String> names = ["Sany", "Nia", "Warda"];
  print('Names: $names');

//Menambah data dalam list
  names.add('Delta');
  print('Names setelah ditambahkan: $names');

  //mengambil data index tertentu
  print('Elemen pertama: ${names[0]}');
  print('Elemen kedua: ${names[1]}');

  //mengubah data pada index tertentu
  names[1] = 'Bravo';
  print('Names setelah diubah: $names');

  //Menghapus data dari list
  names.remove('Bravo');
  print('Names setelah dihapus: $names');

  //Menghitung jumlah data dalam list
  print('Jumlah data: ${names.length}');

  //looping data list
  print('Menampilkan setiap elemen:');
  for (String name in names) {
    print(name);
  }}
