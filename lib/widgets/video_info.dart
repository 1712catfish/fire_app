import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter_youtube_ui/data.dart';

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
          ),
          // const SizedBox(height: 8.0),
          // Text(
          //   '${video.viewCount} views • ${timeago.format(video.timestamp)}',
          //   style:
          //       Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          // ),
          const Divider(),
          _ActionsRow(video: video),
          const Divider(),

          // const Divider(),
          // const Divider(thickness: 1,),
          _OperatorInfo(user: video.author, string: 'Hotline 1 • 01234567890',),
          _OperatorInfo(user: video.author, string: 'Hotline 2 • 09876543210',),
          _AuthorInfo(user: video.author),

        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final Video video;

  const _ActionsRow({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // _buildAction(context, Icons.add_alert_outlined, "Alert"),
        _buildAction(context, Icons.local_fire_department_outlined,
            video.sensor,
            checkSensor(video.sensor) ? Colors.red : Colors.white,
            "Sensor"),
        _buildAction(context, Icons.thermostat_outlined,
            video.temp,
            checkTemp(video.temp) ? Colors.red : Colors.white,
            "Temp"),
        _buildAction(context, Icons.remove_red_eye_outlined,
            video.visionAI,
            checkAI(video.visionAI) ? Colors.red : Colors.white,
            "Vision AI"),
        // _buildAction(context, Icons.thumb_down_outlined, video.dislikes, Colors.white),
        // _buildAction(context, Icons.reply_outlined, 'Share'),
        // _buildAction(context, Icons.download_outlined, 'Download'),
        // _buildAction(context, Icons.library_add_outlined, 'Save', Colors.white),
      ],
    );
  }

  Widget _buildAction(
      BuildContext context, IconData icon,
      String label, Color? color,
      String text) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(icon, color: color,),
              Text(text, style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: color, fontSize: 17.0),)
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
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Navigate to profile'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CircleAvatar(
          //   foregroundImage: NetworkImage(user.profileImageUrl),
          // ),
          // const SizedBox(width: 8.0),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Flexible(
          //         child: Text(
          //           user.username,
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodyText1!
          //               .copyWith(fontSize: 17.0),
          //         ),
          //       ),
          //       // Flexible(
          //       //   child: Text(
          //       //     '${user.subscribers} subscribers',
          //       //     maxLines: 2,
          //       //     overflow: TextOverflow.ellipsis,
          //       //     style: Theme.of(context)
          //       //         .textTheme
          //       //         .caption!
          //       //         .copyWith(fontSize: 14.0),
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.add_alert_outlined, color: Colors.red,),
                SizedBox(width: 5.0,),
                Text(
                  'REPORT',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.red, fontSize: 19.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OperatorInfo extends StatelessWidget {
  final User user;
  final String string;

  const _OperatorInfo({
    Key? key,
    required this.user,
    required this.string
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Navigate to profile'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // CircleAvatar(
          //   foregroundImage: NetworkImage(user.profileImageUrl),
          // ),
          // const SizedBox(width: 8.0),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Flexible(
          //         child: Text(
          //           user.username,
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //           style: Theme.of(context)
          //               .textTheme
          //               .bodyText1!
          //               .copyWith(fontSize: 17.0),
          //         ),
          //       ),
          //       // Flexible(
          //       //   child: Text(
          //       //     '${user.subscribers} subscribers',
          //       //     maxLines: 2,
          //       //     overflow: TextOverflow.ellipsis,
          //       //     style: Theme.of(context)
          //       //         .textTheme
          //       //         .caption!
          //       //         .copyWith(fontSize: 14.0),
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.phone_outlined, color: Colors.white,),
                SizedBox(width: 5.0,),
                Text(
                  string,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white, fontSize: 15.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
