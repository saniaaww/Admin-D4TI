import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      MahasiswaModel(nama: 'Andi Wijaya', nim: '2021001', email: 'andi@example.com', jurusan: 'Teknik Informatika', angkatan: '2021', status: 'aktif'),
      MahasiswaModel(nama: 'Budi Pratama', nim: '2021002', email: 'budi@example.com', jurusan: 'Teknik Informatika', angkatan: '2021', status: 'aktif'),
      MahasiswaModel(nama: 'Citra Lestari', nim: '2020001', email: 'citra@example.com', jurusan: 'Teknik Informatika', angkatan: '2020', status: 'aktif'),
      MahasiswaModel(nama: 'Dina Marlina', nim: '2020002', email: 'dina@example.com', jurusan: 'Sistem Informasi', angkatan: '2020', status: 'aktif'),
      MahasiswaModel(nama: 'Eko Prasetyo', nim: '2019001', email: 'eko@example.com', jurusan: 'Teknik Informatika', angkatan: '2019', status: 'lulus'),
      MahasiswaModel(nama: 'Fani Susanti', nim: '2019002', email: 'fani@example.com', jurusan: 'Teknik Informatika', angkatan: '2019', status: 'lulus'),
      MahasiswaModel(nama: 'Gita Purnama', nim: '2022001', email: 'gita@example.com', jurusan: 'Teknik Informatika', angkatan: '2022', status: 'aktif'),
      MahasiswaModel(nama: 'Hendra Kurnia', nim: '2022002', email: 'hendra@example.com', jurusan: 'Sistem Informasi', angkatan: '2022', status: 'aktif'),
    ];
  }
}
