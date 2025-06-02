import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:get/get.dart';

class AuthCheckbox extends StatelessWidget {
  final RxBool value;
  final ValueChanged<bool>? onChanged;
  final double size;

  const AuthCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: onChanged != null ? () => onChanged!(!value.value) : null,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: value.value ? AppColors.primaryGreen : Colors.white,
              border: value.value ? null : Border.all(
                color: const Color(0xFFC8C9CC),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(size),
            ),
            child: value.value
                ? const Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white,
                  )
                : null,
          ),
        ));
  }
} 