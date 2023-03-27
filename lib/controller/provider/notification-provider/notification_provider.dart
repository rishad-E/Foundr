import 'package:flutter/cupertino.dart';
import 'package:founder_app/model/notification/get_notification_model.dart';
import 'package:founder_app/services/notification/notification_service.dart';

class NotificationProvider with ChangeNotifier {
 List<NotificationElement>? notificationData;

  Future<void> getallNotificationProvider(BuildContext context) async {
    await NotificationService().getallNotificationService().then((value) {
          notificationData =value;
    });
  }
}
