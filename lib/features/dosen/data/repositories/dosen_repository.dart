import 'package:dio/dio.dart';
// sesuaikan nama package kamu
import 'package:d4tivokasi/features/dosen/data/models/dosen_models.dart';

class DosenRepository {
  final Dio _dio = Dio();

  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // debug
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data dosen: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioError: ${e.message}');
      throw Exception('Gagal memuat data dosen: ${e.message}');
    }
  }
}