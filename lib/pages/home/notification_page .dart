import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layanan_kependudukan/controllers/pengajuan_controller.dart';
import 'package:layanan_kependudukan/helpers/notifications_helper.dart';
import 'package:layanan_kependudukan/theme.dart';
import 'package:layanan_kependudukan/widgets/notification_item.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Stream<LocalNotification> _notificationsStream = const Stream.empty();
  @override
  void initState() {
    super.initState();
    _notificationsStream = NotificationsHelper.instance.notificationsStream;
    _notificationsStream.listen((notification) {
      print('Notification: $notification');
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.find<PengajuanController>().getPengajuan();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Notifikasi",
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16),
        ),
        backgroundColor: backgroundColor1,
        shadowColor: const Color.fromARGB(100, 255, 255, 255),
      ),
      body: GetBuilder<PengajuanController>(builder: (articleController) {
        return RefreshIndicator(
            child: !articleController.isLoading
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        children: articleController.pengajuanList
                            .map((e) => NotificationItem(
                                  pengajuanModel: e,
                                ))
                            .toList()),
                  )
                : Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            onRefresh: () => Get.find<PengajuanController>().getPengajuan());
      }),
    );
  }
}
