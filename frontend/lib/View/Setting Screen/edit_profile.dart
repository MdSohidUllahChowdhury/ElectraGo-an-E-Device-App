import 'package:ElectraGo/Api/nodejs_path.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  // We pass the current userName so the field is pre-filled
  final String currentUserName;

  const EditProfileScreen({
    super.key,
    required this.currentUserName,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey     = GlobalKey<FormState>();
  final _userNameCtrl = TextEditingController();
  bool  _isLoading   = false;

  @override
  void initState() {
    super.initState();
    // Pre-fill the field with the current userName
    _userNameCtrl.text = widget.currentUserName;
  }

  @override
  void dispose() {
    _userNameCtrl.dispose();
    super.dispose();
  }

  // ── Save button tapped ──────────────────────────────────
  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    // Don't call API if name didn't change
    if (_userNameCtrl.text.trim() == widget.currentUserName) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No changes made')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final isSuccess = await API.updateProfile(_userNameCtrl.text.trim());

    if (mounted) {
      setState(() => _isLoading = false);

      if (isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:         Text('Profile updated! ✅'),
            backgroundColor: Colors.teal,
          ),
        );

        // Go back to Profile screen and tell it to refresh
        // true = means something changed
        Navigator.pop(context, true);

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:         Text('Update failed. Try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title:           const Text('Edit Profile'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // ── Avatar ──────────────────────────────────
              Center(
                child: CircleAvatar(
                  radius:          50,
                  backgroundColor: Colors.teal,
                  child: Text(
                    widget.currentUserName[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize:   40,
                      color:      Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // ── Username field ───────────────────────────
              const Text('Username',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _userNameCtrl,
                decoration: InputDecoration(
                  hintText:   'Enter new username',
                  prefixIcon: const Icon(Icons.person_outline),
                  filled:     true,
                  fillColor:  Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:   BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:   const BorderSide(color: Colors.teal, width: 1.5),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Username is required';
                  }
                  if (value.trim().length < 2) {
                    return 'Must be at least 2 characters';
                  }
                  if (value.trim().length > 30) {
                    return 'Must be less than 30 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // ── Save button ──────────────────────────────
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width:  22,
                          height: 22,
                          child:  CircularProgressIndicator(
                            color:       Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text('Save Changes',
                          style: TextStyle(
                            fontSize:   16,
                            fontWeight: FontWeight.bold,
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
