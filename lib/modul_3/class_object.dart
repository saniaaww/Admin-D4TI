import 'dart:io';

class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}
void main() {
  Mahasiswa mahasiswa = Mahasiswa();
  print("Masukkan Nama Mahasiswa:");

  mahasiswa.nama = stdin.readLineSync();
  print("Masukkan NIM Mahasiswa:");

  mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '');
  print("Masukkan Jurusan Mahasiswa:");

  mahasiswa.jurusan = stdin.readLineSync();
  print("\n=== DATA MAHASISWA ===");

  mahasiswa.tampilkanData();
}

class MahasiswaAktif extends Mahasiswa {
  int? semester;

  MahasiswaAktif(Mahasiswa mhs, this.semester) {
    nama = mhs.nama;
    nim = mhs.nim;
    jurusan = mhs.jurusan;
  }

  void tampilkanStatus() {
    print("Status: Mahasiswa Aktif");
    print("Semester: ${semester ?? '-'}");
  }
}

class MahasiswaAlumni extends Mahasiswa {
  int? tahunLulus;

  MahasiswaAlumni(Mahasiswa mhs, this.tahunLulus) {
    nama = mhs.nama;
    nim = mhs.nim;
    jurusan = mhs.jurusan;
  }

  void tampilkanStatus() {
    print("Status: Mahasiswa Alumni");
    print("Tahun Lulus: ${tahunLulus ?? '-'}");
  }
}

mixin Mengajar {
  void mengajar() {
    print("Sedang mengajar mahasiswa");
  }
}

mixin Penelitian {
  void meneliti() {
    print("Sedang melakukan penelitian");
  }
}

mixin Administrasi {
  void kelolaAdministrasi() {
    print("Mengelola administrasi kampus");
  }
}