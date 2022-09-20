import 'package:flutter/material.dart';

import '../../../config/theme.dart';

class ProfilePageItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;
  final Color color;
  const ProfilePageItem({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: lighterBlack),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          const SizedBox(width: 12),
          Text(text, style: extraLargeText.copyWith(color: color)),
          const Spacer(),
          InkWell(
              onTap: onTap,
              child: Icon(Icons.chevron_right_outlined, color: color)),
        ],
      ),
    );
  }
}
