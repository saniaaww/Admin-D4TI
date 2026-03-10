import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/core/constants/app_constants.dart';
import 'package:d4tivokasi/core/widgets/common_widgets.dart';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:d4tivokasi/features/mahasiswa/data/repositories/mahasiswa_repository.dart';
import 'package:d4tivokasi/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

// Provider khusus mahasiswa aktif
final mahasiswaAktifRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

class MahasiswaAktifNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;

  MahasiswaAktifNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    try {
      final all = await _repository.getMahasiswaList();
      // Filter hanya yang aktif
      final aktif = all.where((m) => m.status == 'aktif').toList();
      state = AsyncValue.data(aktif);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async => loadData();
}

final mahasiswaAktifNotifierProvider = StateNotifierProvider.autoDispose<
  MahasiswaAktifNotifier,
  AsyncValue<List<MahasiswaModel>>
>((ref) {
  final repository = ref.watch(mahasiswaAktifRepositoryProvider);
  return MahasiswaAktifNotifier(repository);
});

// ── Page ──────────────────────────────────────────────────────────────────────
class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Aktif'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaAktifNotifierProvider),
          ),
        ],
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data: ${error.toString()}',
          onRetry: () => ref.read(mahasiswaAktifNotifierProvider.notifier).refresh(),
        ),
        data: (list) {
          return Column(
            children: [
              // Summary banner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(AppConstants.paddingMedium),
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppConstants.gradientBlue,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.person_outline_rounded, color: Colors.white, size: 32),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${list.length} Mahasiswa',
                            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        const Text('Sedang Aktif', style: TextStyle(color: Colors.white70, fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => ref.invalidate(mahasiswaAktifNotifierProvider),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingMedium),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return MahasiswaCard(
                        mahasiswa: list[index],
                        gradientColors: AppConstants.dashboardGradients[index % AppConstants.dashboardGradients.length],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
