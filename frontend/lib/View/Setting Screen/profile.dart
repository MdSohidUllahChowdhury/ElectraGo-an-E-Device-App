import 'package:ElectraGo/Api/nodejs_path.dart';
import 'package:ElectraGo/View/Intro%20Screen/login.dart';
import 'package:flutter/material.dart';

class ProfileSet extends StatefulWidget {
  const ProfileSet({super.key});

  @override
  State<ProfileSet> createState() => _ProfileSetState();
}

class _ProfileSetState extends State<ProfileSet> {
  // Holds user data from MySQL
  Map<String, dynamic>? _user;
  bool _isLoading = true; // shows spinner while fetching

  @override
  void initState() {
    super.initState();
    _loadProfile(); // fetch as soon as screen opens
  }

  // ── Fetch profile from server ─────────────────────────
  Future<void> _loadProfile() async {
    final user = await API.getProfile();

    if (mounted) {
      setState(() {
        _user = user;
        _isLoading = false;
      });

      // If null → token expired → go back to login
      if (user == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const Login()),
          (route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Session expired. Please login again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: _isLoading

          // ── Loading state ──────────────────────────────
          ? const Center(
              child: CircularProgressIndicator(color: Colors.teal),
            )

          // ── Loaded state ───────────────────────────────
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Avatar circle with first letter of name
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.teal,
                    child: Text(
                      _user?['userName']?[0].toUpperCase() ?? '?',
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // User info card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.teal.shade200),
                    ),
                    child: Column(
                      children: [
                        // Username row
                        _infoRow(
                          icon: Icons.person_outline,
                          label: 'Username',
                          value: _user?['userName'] ?? '-',
                        ),
                        const Divider(height: 24),

                        // Email row
                        _infoRow(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          value: _user?['email'] ?? '-',
                        ),
                        const Divider(height: 24),

                        // Member since row
                        _infoRow(
                          icon: Icons.calendar_today_outlined,
                          label: 'Member Since',
                          value: _user?['created_at']
                                  ?.toString()
                                  .substring(0, 10) ??
                              '-',
                          // substring(0,10) gets just the date part
                          // e.g. "2024-01-15 10:30:00" → "2024-01-15"
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // ── Helper widget for each info row ──────────────────────
  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal, size: 22),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
