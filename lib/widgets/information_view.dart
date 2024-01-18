import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/theme.dart';

class InformationView extends StatelessWidget {
  final String info;

  const InformationView({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
          decoration: BoxDecoration(
            color: lightYellowColor.withAlpha(90),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                color: yellowColor,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Text(
                info.isEmpty
                    ? "Harap lengkapi form dan isi dengan sebenar-benarnya\n"
                        "Panduan pengisian : \n"
                        "1. Lengkapi Form Dibawah ini"
                    : info,
                style: TextStyle(height: 1.5, fontSize: 12),
              ))
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
