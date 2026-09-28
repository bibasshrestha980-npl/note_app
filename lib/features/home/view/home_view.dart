import 'package:flutter/material.dart';

import '../../../common/common_colors.dart';
import '../../../common/custom_snackbar.dart';
import '../../auth/controller/auth_controller.dart';
import '../../auth/view/login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AuthController _authController = AuthController();
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex = 0;

  final List<String> _categories = ['All Notes', 'Personal', 'Work', 'Ideas'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _handleLogout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Log Out',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          'Are you sure you want to log out of your account?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: CommonColors.primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Log Out',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _authController.signOut();
      if (mounted) {
        CustomSnackBar.showSuccess(context, 'Logged out successfully');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _authController.currentUser;
    final displayName =
        user?.displayName ?? user?.email?.split('@').first ?? 'User';
    final email = user?.email ?? 'No email';

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 20,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $displayName 👋',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            Text(
              email,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Log Out',
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.logout_rounded,
                size: 20,
                color: Colors.red.shade600,
              ),
            ),
            onPressed: _handleLogout,
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search notes...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Categories horizontal list
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final isSelected = _selectedCategoryIndex == index;
                  return InkWell(
                    onTap: () => setState(() => _selectedCategoryIndex = index),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? CommonColors.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? CommonColors.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Text(
                        _categories[index],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // Empty State Illustration & Message
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: CommonColors.primaryColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.note_alt_outlined,
                      size: 50,
                      color: CommonColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'No notes yet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create your first note by tapping the button below',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      CustomSnackBar.showInfo(
                        context,
                        'Note creation feature coming up next!',
                      );
                    },
                    icon: const Icon(Icons.add, color: Colors.white, size: 20),
                    label: const Text(
                      'Create Note',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CommonColors.primaryColor,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CommonColors.primaryColor,
        elevation: 2,
        onPressed: () {
          CustomSnackBar.showInfo(
            context,
            'Note creation feature coming up next!',
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
