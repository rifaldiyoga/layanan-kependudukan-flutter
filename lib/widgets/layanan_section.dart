import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/models/layanan_response_model.dart';

import '../routes/route_helper.dart';
import '../theme.dart';
import 'layanan_item.dart';

class LayananSection extends StatelessWidget {
  final TypeModel typeModel;

  const LayananSection({super.key, required this.typeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            typeModel.type,
            style: primaryTextStyle.copyWith(fontWeight: bold),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
                spacing: 29,
                runSpacing: 16,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                children: [
                  for (int x = 0; x < typeModel.data.length; x++) ...[
                    SizedBox(
                      height: 120,
                      child: LayananItem(
                        index: x,
                        title: typeModel.data[x].name,
                        callback: () => Get.toNamed(
                            RouteHelper.getPengajuan(typeModel.data[x])),
                        code: typeModel.data[x].code,
                      ),
                    ),
                  ],
                ]),
          )
        ],
      ),
    );
  }
}
