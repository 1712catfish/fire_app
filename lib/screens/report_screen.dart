import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  var sensor = 'N/A';
  var temp = 'N/A';
  var visionAI = '54%';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          // child: Image.asset('assets/yt_logo_dark.png'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  'https://i.pinimg.com/originals/3a/72/36/3a723682ae125412aaa05987c6fcd949.png',
                  height: 40.0,
                  width: 40.0,
                ),
              ),
              Text(
                'FIREAPP',
                style: TextStyle(fontSize: 25, fontFamily: 'Youtube'),
              )
            ],
          ),
        ),
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.cast),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: const Icon(Icons.notifications_outlined),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   iconSize: 40.0,
          //   icon: CircleAvatar(
          //     foregroundImage: NetworkImage(currentUser.profileImageUrl),
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                  child: Transform.rotate(
                    angle: 90 * pi/180,
                    child: Container(
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.red.shade700, width: 2.0),
                      // ),
                      child: Image.network(
                        'https://hackster.imgix.net/uploads/attachments/1474293/_RexdUClYz7.blob?auto=compress&w=900&h=675&fit=min&fm=jpg'
                        // 'https://images.unsplash.com/photo-1589843727810-b405d7ce278e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGxpZ2h0ZXJ8ZW58MHx8MHx8fDA%3D&w=1000&q=80'
                      ),
                    ),
                  )),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // _buildAction(context, Icons.add_alert_outlined, "Alert"),
                // _buildAction(
                //     context,
                //     Icons.local_fire_department_outlined,
                //     sensor,
                //     checkSensor(sensor) ? Colors.red : Colors.white,
                //     "Sensor"),
                // _buildAction(context, Icons.thermostat_outlined, temp,
                //     checkTemp(temp) ? Colors.red : Colors.white, "Temp"),
                _buildAction(context, Icons.remove_red_eye_outlined, visionAI,
                    checkAI(visionAI) ? Colors.red : Colors.white, "Vision AI"),
                // _buildAction(context, Icons.thumb_down_outlined, video.dislikes, Colors.white),
                // _buildAction(context, Icons.reply_outlined, 'Share'),
                // _buildAction(context, Icons.download_outlined, 'Download'),
                // _buildAction(context, Icons.library_add_outlined, 'Save', Colors.white),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.upload_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'UPLOAD',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white, fontSize: 19.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_alert_outlined,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'REPORT',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.red, fontSize: 19.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return Container(
      child: Image.network(
          'https://is.zobj.net/image-server/v1/images?r=WS_rP20RMiNPQXzSZ_LaGwpAjmDeM6o04PiioeilRRkFPyj_l77nQmR22uYOv_i1epgZoObGR1QYM68DAuA7kunbe9EWiH2Mzkiu3Ap3_7CLDFjEtYAr9-P4ST8H4ihCfw3R0L70984kqEJ_r6L777pOvVu6cno7w-WUi0Jg7YHx-HGMofZlh1rxVVjIhXPodAAhRgbUUFG_cXbSnTXMO539F52_fJCenvVGBJfma93DmmElfnAyFH51hKg'),
    );
  }
}

Widget _buildAction(BuildContext context, IconData icon, String label,
    Color? color, String text) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: color, fontSize: 17.0),
            )
          ],
        ),
        const SizedBox(height: 6.0),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: color, fontSize: 17.0),
        ),
      ],
    ),
  );
}
