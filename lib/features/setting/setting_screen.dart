import 'package:flutter/material.dart';
import '../../core/theme/theme_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pinLoginEnabled = false;
  bool _pushNotifications = true;
  bool _bookingReminders = true;
  String _language = 'English';

  static const Color _primary = Color(0xFF4ADE80); // Brighter green for navy background
  static const double _cardRadius = 16;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? const Color(0xFF4ADE80) : const Color(0xFF1F4D2C);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : const Color(0xFF1F4D2C),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionLabel(context, 'Appearance'),
                const SizedBox(height: 10),
                _buildSettingsCard(context, [
                  _buildToggleRow(
                    context: context,
                    icon: Icons.dark_mode_outlined,
                    label: 'Dark mode',
                    subtitle: 'Switch between light and dark theme',
                    value: ThemeManager.themeMode.value == ThemeMode.dark,
                    onChanged: (value) {
                      setState(() {
                        ThemeManager.toggleTheme(value);
                      });
                    },
                  ),
                  _divider(context),
                  _buildLinkRow(
                    context: context,
                    icon: Icons.language_outlined,
                    label: 'Language',
                    trailingText: _language,
                    onTap: () => _showLanguagePicker(context),
                  ),
                ]),
                const SizedBox(height: 24),
                _sectionLabel(context, 'Notifications'),
                const SizedBox(height: 10),
                _buildSettingsCard(context, [
                  _buildToggleRow(
                    context: context,
                    icon: Icons.notifications_none,
                    label: 'Push notifications',
                    subtitle: 'Offers, updates, and service alerts',
                    value: _pushNotifications,
                    onChanged: (value) =>
                        setState(() => _pushNotifications = value),
                  ),
                  _divider(context),
                  _buildToggleRow(
                    context: context,
                    icon: Icons.notifications_active_outlined,
                    label: 'Booking reminders',
                    subtitle: 'Reminders before a scheduled service',
                    value: _bookingReminders,
                    onChanged: (value) =>
                        setState(() => _bookingReminders = value),
                  ),
                ]),
                const SizedBox(height: 24),
                _sectionLabel(context, 'Security'),
                const SizedBox(height: 10),
                _buildSettingsCard(context, [
                  _buildToggleRow(
                    context: context,
                    icon: Icons.pin_outlined,
                    label: 'PIN login',
                    subtitle: 'Unlock the app with a PIN instead of a password',
                    value: _pinLoginEnabled,
                    onChanged: (value) {
                      setState(() => _pinLoginEnabled = value);
                      // TODO: persist preference and route through PIN setup
                      // flow when turning this on for the first time.
                    },
                  ),
                  if (_pinLoginEnabled) ...[
                    _divider(context),
                    _buildLinkRow(
                      context: context,
                      icon: Icons.password_outlined,
                      label: 'Change PIN',
                      onTap: () {
                        // TODO: navigate to change PIN screen
                      },
                    ),
                  ],
                ]),
                const SizedBox(height: 24),
                _sectionLabel(context, 'Help & support'),
                const SizedBox(height: 10),
                _buildSettingsCard(context, [
                  _buildLinkRow(
                    context: context,
                    icon: Icons.groups_outlined,
                    label: 'About the team',
                    onTap: () {
                      // TODO: navigate to about-the-team screen
                    },
                  ),
                  _divider(context),
                  _buildLinkRow(
                    context: context,
                    icon: Icons.support_agent_outlined,
                    label: 'Contact support',
                    onTap: () {
                      // TODO: open support chat/email
                    },
                  ),
                  _divider(context),
                  _buildLinkRow(
                    context: context,
                    icon: Icons.flag_outlined,
                    label: 'Report a problem',
                    onTap: () {
                      // TODO: navigate to report/feedback form
                    },
                  ),
                ]),
                const SizedBox(height: 24),
                _sectionLabel(context, 'About'),
                const SizedBox(height: 10),
                _buildSettingsCard(context, [
                  _buildLinkRow(
                    context: context,
                    icon: Icons.description_outlined,
                    label: 'Terms & privacy policy',
                    onTap: () {
                      // TODO: navigate to terms/privacy webview
                    },
                  ),
                  _divider(context),
                  _buildLinkRow(
                    context: context,
                    icon: Icons.star_outline,
                    label: 'Rate the app',
                    onTap: () {
                      // TODO: open app store listing
                    },
                  ),
                  _divider(context),
                  _buildLinkRow(
                    context: context,
                    icon: Icons.info_outline,
                    label: 'App version',
                    trailingText: '1.0.0',
                    onTap: null,
                  ),
                ]),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // TODO: navigate to delete-account confirmation flow
                    },
                    child: Text(
                      'Delete account',
                      style: TextStyle(
                        color: isDark ? Colors.white54 : Colors.grey,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(BuildContext context, String text) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: isDark ? Colors.white : Colors.grey,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildSettingsCard(BuildContext context, List<Widget> children) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF16243D) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(_cardRadius),
        border: Border.all(color: isDark ? Colors.white10 : const Color(0xFFE5E7EB)),
      ),
      child: Column(children: children),
    );
  }

  Widget _divider(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Divider(height: 1, thickness: 1, color: isDark ? Colors.white10 : const Color(0xFFE5E7EB));
  }

  Widget _buildToggleRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? const Color(0xFF4ADE80) : const Color(0xFF1F4D2C);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: primary, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isDark ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: primary,
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    VoidCallback? onTap,
    String? trailingText,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? const Color(0xFF4ADE80) : const Color(0xFF1F4D2C);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: primary, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.grey,
                ),
              ),
            if (onTap != null) ...[
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, color: isDark ? Colors.white : Colors.grey, size: 20),
            ],
          ],
        ),
      ),
    );
  }

  void _showLanguagePicker(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? const Color(0xFF4ADE80) : const Color(0xFF1F4D2C);

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF16243D) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(_cardRadius)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: ['English', 'Urdu'].map((lang) {
              return ListTile(
                title: Text(
                  lang,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black87),
                ),
                trailing: _language == lang
                    ? Icon(Icons.check, color: primary)
                    : null,
                onTap: () {
                  setState(() => _language = lang);
                  Navigator.pop(sheetContext);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}