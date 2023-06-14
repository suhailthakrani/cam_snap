// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  String? subtitle;
  final Widget leading;
  Widget trailing;
  VoidCallback? onTap;

  CustomListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.leading,
    this.trailing = const Icon(
      Icons.arrow_forward_ios,
      size: 16,
    ),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white54,
              ),
            )
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
