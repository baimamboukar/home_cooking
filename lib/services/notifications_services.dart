import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationService {
  final _awesomeNotif = AwesomeNotifications();
  final Reader _read;
  NotificationService(
    this._read,
  );
  void send() {
    _awesomeNotif.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'default notiff',
            title: 'Notification Test',
            body:
                'A graphic representation of data abstracted from the Chinese program’s thrust, a worrying impression of solid fluidity.'));
  }
}
