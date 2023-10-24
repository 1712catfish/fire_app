class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Marcus Ng',
  profileImageUrl:
      'https://yt3.ggpht.com/ytc/AAUvwniE2k5PgFu9yr4sBVEs9jdpdILdMc7ruiPw59DpS0k=s88-c-k-c0x00ffffff-no-rj',
  subscribers: '100K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;
  final String sensor;
  final String temp;
  final String visionAI;
  final bool isLive;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
    required this.sensor,
    required this.temp,
    required this.visionAI,
    required this.isLive,
  });
}

final List<Video> videos = [

  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title:
        // 'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture',
    'Cam 1 • Basement B1 ',
    thumbnailUrl: 'https://patch.com/img/cdn20/users/23145371/20210429/014503/styles/patch_image/public/71stbodycam___29131347348.png',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
    sensor: '233',
    temp: '20°C',
    visionAI: '51%',
    isLive: true,

  ),
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Cam 2 • Floor 1 - East Hallway',
    thumbnailUrl: 'https://i.dailymail.co.uk/1s/2020/06/18/16/29782430-8436269-image-a-25_1592493405651.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
    sensor: 'N/A',
    temp: 'N/A',
    visionAI: '19%',
    isLive: true,
  ),
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Cam 3 • Floor 1 - West Hallway',
    thumbnailUrl: 'https://content.api.news/v3/images/bin/868be8fcce116bf9b593a423802dbbea',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
      sensor: 'N/A',
      temp: 'N/A',
      visionAI: '81%',
    isLive: false,

  ),
// ];
//
// final List<Video> suggestedVideos = [

  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Cam 4 • Floor 2 - East Hallway',
    thumbnailUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/01/80/02/44/brightly-lit-hallway.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
      sensor: 'N/A',
      temp: 'N/A',
      visionAI: '5%',
    isLive: false,

  ),

  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Cam 5 • Floor 2 - West Hallway',
    thumbnailUrl: 'https://res.cloudinary.com/fireandrescuensw/image/upload/t_opengraph/Updates/recBzM8VXtoDIgoJX.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
    sensor: 'N/A',
    temp: 'N/A',
    visionAI: '98%',
    isLive: false,

  ),

  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Cam 6 • Floor 3 - East Hallway',
    thumbnailUrl: 'https://i.ytimg.com/vi/Q0YHZ8emG6Q/maxresdefault.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
      sensor: 'N/A',
      temp: 'N/A',
      visionAI: '10%',
    isLive: false,

  ),
];

bool checkSensor(String data) {
  if (data == 'N/A')
    return false;
  if (double.parse(data) > 250)
    return true;
  return false;
}

bool checkTemp(String data) {
  if (data == 'N/A')
    return false;
  if (double.parse(data.substring(0, data.length - 2)) > 200)
    return true;
  return false;
}

bool checkAI(String data) {
  if (data == 'N/A')
    return false;
  if (double.parse(data.substring(0, data.length - 1)) > 50)
    return true;
  return false;
}

bool checkFire(Video video) {
  if (checkSensor(video.sensor))
    return true;
  if (checkTemp(video.temp))
    return true;
  if (checkAI(video.visionAI))
    return true;
  return false;
}
