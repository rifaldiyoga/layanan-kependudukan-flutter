import 'package:rxdart/rxdart.dart';

class LocalNotification {
  final String type;
  final Map data;

  LocalNotification(this.type, this.data);
}

class NotificationsHelper {
  NotificationsHelper._internal();

  static final NotificationsHelper instance = NotificationsHelper._internal();

  final BehaviorSubject<LocalNotification> _notificationsStreamController =
      BehaviorSubject<LocalNotification>();

  Stream<LocalNotification> get notificationsStream {
    return _notificationsStreamController;
  }

  void newNotification(LocalNotification notification) {
    _notificationsStreamController.sink.add(notification);
  }

  void dispose() {
    _notificationsStreamController.close();
  }
}
