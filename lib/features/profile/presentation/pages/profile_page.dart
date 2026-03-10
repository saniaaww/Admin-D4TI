import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/core/constants/app_constants.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header dengan gradient
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppConstants.gradientPurple,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      // Avatar
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Icon(Icons.person, color: Colors.white, size: 50),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Admin D4TI',
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Administrator',
                        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            title: const Text('Profile'),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                children: [
                  // Info Card
                  _buildSectionCard(
                    context,
                    title: 'Informasi Akun',
                    children: [
                      _buildInfoTile(Icons.person_outline, 'Nama', 'Admin D4TI'),
                      _buildInfoTile(Icons.email_outlined, 'Email', 'admin@d4ti.ac.id'),
                      _buildInfoTile(Icons.phone_outlined, 'Telepon', '+62 812 3456 7890'),
                      _buildInfoTile(Icons.location_on_outlined, 'Instansi', 'D4 Teknik Informatika'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // App Info Card
                  _buildSectionCard(
                    context,
                    title: 'Informasi Aplikasi',
                    children: [
                      _buildInfoTile(Icons.apps_rounded, 'Nama App', AppConstants.appName),
                      _buildInfoTile(Icons.tag_rounded, 'Versi', AppConstants.appVersion),
                      _buildInfoTile(Icons.info_outline, 'Platform', 'Flutter'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Stats summary
                  _buildSectionCard(
                    context,
                    title: 'Ringkasan Data',
                    children: [
                      _buildStatRow(context, 'Total Mahasiswa', '1,200', AppConstants.gradientPurple),
                      _buildStatRow(context, 'Mahasiswa Aktif', '550', AppConstants.gradientBlue),
                      _buildStatRow(context, 'Total Dosen', '650', AppConstants.gradientGreen),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, {required String title, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, size: 20, color: Colors.grey[600]),
      title: Text(label, style: const TextStyle(fontSize: 13, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
      dense: true,
    );
  }

  Widget _buildStatRow(BuildContext context, String label, String value, List<Color> colors) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: colors),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 14))),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
