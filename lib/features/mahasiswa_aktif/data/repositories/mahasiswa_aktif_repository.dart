import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:d4tivokasi/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final Dio _dio = Dio();

  // default method
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    return getMahasiswaAktifHttp();
  }

  // Menggunakan http
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifHttp() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // debug
      return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data: ${response.statusCode}');
    }
  }

  // Menggunakan dio
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifDio() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // debug
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('Gagal memuat data: ${e.message}');
    }
  }
}