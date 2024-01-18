import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:layanan_kependudukan/helpers/date_formaters.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/badge_status.dart';
import 'package:timelines/timelines.dart';

import '../models/pengajuan_response_model.dart';

class RiwayatStatusPage extends StatelessWidget {
  final PengajuanModel pengajuanModel;
  const RiwayatStatusPage({super.key, required this.pengajuanModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          pengajuanModel.layanan ?? "",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: Container(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: _Title(
                  pengajuanModel: pengajuanModel,
                ),
              ),
              const Divider(height: 1.0),
              _DeliveryProcesses(
                  details: pengajuanModel.detail!.sorted((a, b) {
                var adate = a.createdAt!;
                var bdate = b.createdAt!;
                return bdate.compareTo(adate);
              })),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.pengajuanModel,
  }) : super(key: key);

  final PengajuanModel pengajuanModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BadgeStatus(
          status: pengajuanModel.status ?? "",
        ),
        const Spacer(),
        Text(
            DateFormater.dateTimeToString(
                pengajuanModel.createdAt!, DateFormater.DATE_DAY_FORMAT),
            style: secondaryTextStyle.copyWith(fontSize: 12)),
      ],
    );
  }
}

class _DeliveryProcesses extends StatelessWidget {
  const _DeliveryProcesses({Key? key, required this.details}) : super(key: key);

  final List<DetailPengajuanModel> details;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: const Color(0xff989898),
          indicatorTheme: const IndicatorThemeData(
            position: 0.3,
            size: 16.0,
          ),
          connectorTheme: const ConnectorThemeData(
            thickness: 2.5,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: details.length,
          contentsBuilder: (_, index) {
            // if (details[index].isCompleted) return null;

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    details[index].note ?? "",
                    style: primaryTextStyle.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    DateFormater.dateTimeToString(details[index].createdAt!,
                        DateFormater.DATE_DAY_FORMAT),
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            );
          },
          indicatorBuilder: (_, index) {
            if (index == 0) {
              return const DotIndicator(
                color: Color(0xff66c97f),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12.0,
                ),
              );
            } else {
              return const DotIndicator(
                color: secondaryTextColor,
              );
            }
          },
          connectorBuilder: (_, index, ___) => SolidLineConnector(
            color: 1 == index ? const Color(0xff66c97f) : secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
