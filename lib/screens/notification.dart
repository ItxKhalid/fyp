import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(

        physics: BouncingScrollPhysics(),
        // padding: EdgeInsets.symmetric(vertical: 10),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              leading: Icon(
                Icons.notifications,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'New Notifications',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4,
              ),
              subtitle: Text('',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 15),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemCount: 1,
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
            itemBuilder: (context, index) {
              return Container(
                // margin: EdgeInsets.all(12),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.tealAccent.withOpacity(.2),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(child: Text(index.toString()))),
                        SizedBox(width: 10),
                        Container(
                            width: MediaQuery.of(context).size.width*.75,
                            child: Column(children: [Text('Your request has been accepted now you can chat with driver...')],))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
