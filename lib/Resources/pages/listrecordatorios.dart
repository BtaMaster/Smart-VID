import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smartvid/Resources/pages/menurecordatorios.dart';

import '../services/notification_api.dart';
import '../util/colors.dart';

class ListRecordatorios extends StatefulWidget {
  const ListRecordatorios({Key? key}) : super(key: key);

  @override
  State<ListRecordatorios> createState() => _ListRecordatoriosState();
}

class _ListRecordatoriosState extends State<ListRecordatorios> {
  late Future<List<PendingNotificationRequest>?> notifications;

  @override
  void initState() {
    NotificationApi.init();
    notifications = NotificationApi.getAllNotifications();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listado de Recordatorios"),
          centerTitle: true,
        ),
        backgroundColor: HexColor.getColorfromHex(interfaceColor),
        body: FutureBuilder<List<PendingNotificationRequest>?>(
            future: notifications,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return NotificationItem(notification: snapshot.data![index]);
                    }
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        )
    );
  }
}

class NotificationItem extends StatefulWidget {
  final PendingNotificationRequest notification;
  const NotificationItem({Key? key, required this.notification}) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),
      child: Card(
        child: ListTile(
          title: Text(widget.notification.title.toString()),
          subtitle: Text(widget.notification.body.toString()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(onPressed: () {
                NotificationApi.cancelNotification(widget.notification.id);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const MenuRecordatorios()));
              }, icon: Icon(Icons.delete))
            ],
          ),
        ),
        color: Colors.white,
      ),
    );
  }
}