// import 'package:alan_voice/alan_callback.dart';
// import 'package:alan_voice/alan_voice.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_video_chat/screens/video_call_screen.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:progress_state_button/progress_button.dart' as pb;
// import 'dart:math';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:roslibdart/roslibdart.dart';
// import 'package:flutter_ripple/flutter_ripple.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:url_launcher/url_launcher.dart' as url;

// import 'patient_service.dart';

// // import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';
// // import 'package:wifi_info_flutter/wifi_info_flutter.dart' as inf;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
//   .then((_) {
//   runApp(const MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ORB ALPHA',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // Try running your application with "flutter run". You'll see the
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
//   late Ros ros;
//   late Topic display;
//   late Topic order;
//   late Topic name;
//   late Topic recognition;
//   late Topic facesTopic;
//   late Topic talk;
//   bool param = false;
//   String devicesIP = "192.168.124.235";
//   bool arja3 = false;
//   bool startedTV = false;
//   bool startedNotif = false;

//   bool begin = true;
//   bool canSay = false;
//   double height = 0;
//   double width = 0;
//   bool canChangeFace = false;
//   bool espActive = false;
//   _MyHomePageState() {
//     AlanVoice.addButton(
//       "4db70e7a40290c970f6bf03ce5bc092b2e956eca572e1d8b807a3e2338fdd0dc/prod",
//     );
//     AlanVoice.setLogLevel("all");
//   }

//   pb.ButtonState stateOnlyText = pb.ButtonState.idle;
//   pb.ButtonState stateOnlyCustomIndicatorText = pb.ButtonState.idle;
//   pb.ButtonState stateTextWithIcon = pb.ButtonState.idle;
//   pb.ButtonState stateTextWithIconMinWidthState = pb.ButtonState.idle;
//   var player = AudioPlayer();
//   int compteurPutMeDown = 0;
//   int compteurBehind = 0;
//   int compteurFront = 0;
//   bool eleminateOne = true;
//   int i = 6;
//   int screen = 1;
//   int level = 0;
//   int times = 0;
//   int statecap = 11;
//   bool password = true;
//   String rosUrl = 'ws://192.168.184.112:9090';
//   String cameraIP = "192.168.233.233";
//   bool tvState = false;
//   var dialog;
//   String CurrentFace = "unknown";
//   late int ir1, ir2, ir3, sharp1, sharp2, gyrox, gyroy, gyroz;
//   List<String> musics = [
//     "ArrDee - Oliver Twist.mp3",
//     "habaytak.mp3",
//     "JenJoon - Chkoun F_eddar.mp3",
//     "Rilès - BETTER DAYS.mp3",
//     "Die For You.mp3",
//     "Imagine Dragons - Bones.mp3",
//     "Jungle.mp3",
//     "SOFI TUKKER - Purple Hat.mp3",
//     "Freestyle.mp3",
//     "Imagine Dragons x J.I.D - Enemy.mp3",
//     "Macklemore x Ryan Lewis _WINGS.mp3"
//   ];
//   List<String> faces = [
//     "assets/images/orb_afraid.gif",
//     "assets/images/orb_dirty_face.gif",
//     "assets/images/orb_sad.gif",
//     "assets/images/orb_angry.gif",
//     "assets/images/orb_dirty_face_sad.gif",
//     "assets/images/orb_scream.gif",
//     "assets/images/orb_blinking.gif",
//     "assets/images/orb_dirty_face_wash.gif",
//     "assets/images/orb_showing_smile.gif",
//     "assets/images/orb_breathing.gif",
//     "assets/images/orb_dirty_teeth.gif",
//     "assets/images/orb_shy.gif",
//     "assets/images/orb_brushing_teeth.gif",
//     "assets/images/orb_disgusted.gif",
//     "assets/images/orb_sneezing.gif",
//     "assets/images/orb_calmind_down.gif",
//     "assets/images/orb_happy_blinking.gif",
//     "assets/images/orb_surprise.gif",
//     "assets/images/orb_cleaning_noise.gif",
//     "assets/images/orb_kiss.gif",
//     "assets/images/orb_talking_long.gif",
//     "assets/images/orb_cold.gif",
//     "assets/images/orb_normal.gif",
//     "assets/images/orb_yawn.gif",
//     "assets/images/orb_confused.gif",
//     "assets/images/orb_one_eye.gif",
//     "assets/images/orb_ykasha5.gif",
//     "assets/images/orb_cry.gif",
//     "assets/images/orb_puffing.gif",
//   ];
//   String CurrentTrack = "assets/music/SOFI TUKKER - Purple Hat.mp3";
//   PatientService ps = PatientService();
//   // late FirebaseFirestore db;
//   void active() {
//     if (AlanVoice.isActive() == false) {
//       AlanVoice.activate();
//     }
//     AlanVoice.activate();
//   }

//   void playUrl(url) async {
//     var duration = await player.setUrl('https://foo.com/bar.mp3');
//     await player.play();
//   }

//   void playLocal(String localPath) async {
//     var duration = await player.setAsset(localPath);
//     // print(localPath);
//     await player.play();
//   }

//   void pausePlayer() async {
//     await player.pause();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     switch (state) {
//       case AppLifecycleState.resumed:
//         ps.toggleOnlieStatus(true);
//         // print("app in resumed");
//         active();
//         // print("Please say your password");
//         // AlanVoice.playText("Please say your password");

//         // dialog..show();
//         break;
//       case AppLifecycleState.inactive:
//         ps.toggleOnlieStatus(false);

//         // print("app in inactive");
//         break;
//       case AppLifecycleState.paused:
//         // print("app in paused");
//         break;

//       case AppLifecycleState.detached:
//         ps.toggleOnlieStatus(false);

//         // TODO: Handle this case.
//         break;
//     }
//   }

//   void checkIR(double code) {
//     if (code == statecap) {
//       switch (statecap) {
//         case 11:
//           statecap = 101;
//           break;
//         case 101:
//           statecap = 110;
//           break;
//         case 110:
//           statecap = 11;
//           times = times + 1;
//           break;
//       }
//     } else if (code == 11 && statecap == 101) {
//       times = times;
//     } else if (code == 101 && statecap == 110) {
//       times = times;
//     } else if (code == 110 && statecap == 11) {
//       times = times;
//     } else if (code != 111) {
//       statecap = 11;
//       times = 0;
//     }

//     // print(code.toString() +
//     // " state is : " +
//     // statecap.toString() +
//     // "  times is : " +
//     // times.toString());
//     // print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee" + times.toString());
//     if (times == 3) {
//       times = 0;

//       active();
//       setState(() {
//         i = 20;
//         publishOrder(110);
//       });
//       AlanVoice.playText("yayyy this is very relaxing");
//       arja3 = true;
//       //sleep(Duration(seconds: 2));
//       // setState(() {
//       //   i = 11;
//       // });
//     }
//   }

//   Future<void> call(int phoneNumber) async {
//     final Uri launchUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber.toString(),
//     );
//     await url.launchUrl(launchUri);
//   }

//   void checkSharp(double front, double back) {
//     // print("front =  " +
//     //     front.toInt().toString() +
//     //     " back = " +
//     //     back.toInt().toString());
//     if (front.toInt() > 11) {
//       compteurFront++;
//       if (compteurFront > 50) {
//         active();
//         AlanVoice.playText("i'm falling from front");
//         compteurFront = 0;
//       }
//     }
//     // if (back.toInt() > 15) {
//     //   compteurBehind++;
//     //   if (compteurBehind > 300) {
//     //     active();
//     //     AlanVoice.playText("i'm falling from behind");
//     //     compteurBehind = 0;
//     //   }
//     // }
//   }

//   void checkGyro(double x, double y, double z) {
//     // print("Roll =  " +
//     //     x.toString() +
//     //     "  Pitch = " +
//     //     y.toString() +
//     //     "  Yaw = " +
//     //     z.toString());
//     if (x.toInt() > 60 || x.toInt() < -60) {
//       compteurPutMeDown++;
//       if (compteurPutMeDown > 200) {
//         setState(() {
//           i = 0;
//         });
//         active();
//         AlanVoice.playText("Hey put me down");
//         compteurPutMeDown = 0;
//         // setState(() {

//         //       i=10;
//         //     });
//       }
//     }
//   }

//   Future<void> talkSub(Map<String, dynamic> msg) async {
//     // var sentnece = json.encode(msg);
//     // print(sentnece);
//     String toSay = msg["data"];
//     // print("I 'm Saying " + toSay);
//     active();
//     AlanVoice.playText(toSay);
//   }

//   Future<void> facesSub(Map<String, dynamic> msg) async {
//     // var face = json.encode(msg);
//     // print(face);
//     CurrentFace = msg["data"];
//     // print(CurrentFace + "rrrrrrrrrr");
//     if (canSay == true && CurrentFace != "unknown") {
//       AlanVoice.playText("you are " + CurrentFace + " right?");
//       canSay = false;
//     }
//   }

//   void sendDeviceOrder(String device, String order) async {
//     String dev = "0";
//     if (device.contains("TV")) {
//       dev = "0";
//     } else if (device.contains("lights")) {
//       dev = "1";
//     } else {
//       dev = "3";
//     }

//     String url =
//         "http://" + devicesIP + "/orb?device=" + dev + "&order=" + order;
//     // print(url);
// //  print(res.body);
//     var res;
//     try {
//       res = await http.get(Uri.parse(url));
//       if (espActive == false) {
//         setState(() {
//           espActive = true;
//         });
//       }
//     } catch (e) {
//       // ps.toggleDevice(device, false);
//       AlanVoice.activate();
//       AlanVoice.playText(
//           "I can not do that.Please check the ip address of your the ESP");
//       setState(() {
//         espActive = false;
//       });
//     }

//     // var x = json.decode(res.body);
//     // // print(x);
//     // if (x["state"] == "done") {
//     //   AlanVoice.activate();
//     //   AlanVoice.playText("You order is done");
//     // } else {
//     //   AlanVoice.activate();
//     //   AlanVoice.playText("I can not do that there is a problem");
//     // }
//   }

//   Future<void> subscribeHandler(Map<String, dynamic> msg) async {
//     // var sensors = json.encode(msg);

//     double code = msg["ixx"] * 100 + msg["ixy"] * 10 + msg["ixz"];
//     ir1 = msg["ixx"].toInt();
//     ir2 = msg["ixy"].toInt();
//     ir3 = msg["ixz"].toInt();
//     sharp1 = msg["iyy"].toInt();
//     sharp2 = msg["iyz"].toInt();
//     gyrox = msg["com"]["x"].toInt();
//     gyroy = msg["com"]["y"].toInt();
//     gyroz = msg["com"]["z"].toInt();
//     // print(code.toString());

//     checkIR(code);
//     checkSharp(msg["iyy"], msg["iyz"]);
//     // checkGyro(msg["com"]["x"], msg["com"]["y"], msg["com"]["z"]);
//   }

//   _handleCommand(Map<String, dynamic> response) {
//     // print("aaaaaaaaaaaaaaaaaaa");
//     if (eleminateOne == true) {
//       eleminateOne = false;
//     } else {
//       eleminateOne = true;
//       print(response);
//       if (response["command"] == "password") {
//         if (response["password"] == "open the door") {
//           dialog..dismiss();
//           AlanVoice.playText("it's correct congratulations");
//         } else {
//           AlanVoice.playText("but it's incorrect");
//         }
//       } else if (response["command"] == "order") {
//         if (response["order"].toString() == "forward") {
//           publishOrder(1);
//           // print("done forwarding");
//         } else if (response["order"].toString() == "backward") {
//           publishOrder(2);
//           // print("done backwarding");
//         } else if (response["order"].toString() == "to the right") {
//           publishOrder(3);
//           // print("done moving right");
//         } else if (response["order"].toString() == "to the left") {
//           publishOrder(4);
//           // print("done moving left");
//         }
//       } else if (response["command"] == "sensors") {
//         if (response["sensors"].toString() == "the first laser") {
//           active();
//           AlanVoice.playText(ir1.toInt().toString());
//         } else if (response["sensors"].toString() == "the second laser") {
//           active();

//           AlanVoice.playText(ir2.toInt().toString());
//         } else if (response["sensors"].toString() == "the third laser") {
//           active();

//           AlanVoice.playText(ir3.toInt().toString());
//         } else if (response["sensors"].toString() == "the first Sharp") {
//           active();

//           AlanVoice.playText(sharp1.toInt().toString());
//         } else if (response["sensors"].toString() == "the second Sharp") {
//           active();

//           AlanVoice.playText(sharp2.toInt().toString());
//         } else if (response["sensors"].toString() == "the gyro") {
//           active();
//           // AlanVoice.playText("gyrooo yes");
//           String ch = "on x axis we have " +
//               gyrox.toInt().toString() +
//               "on y axis we have " +
//               gyroy.toInt().toString() +
//               "and on z axis we have " +
//               gyroz.toInt().toString();
//           AlanVoice.playText(ch.toString());
//         } else {
//           active();

//           AlanVoice.playText("please select a sensor");
//         }
//       } else if (response["command"] == "saveFace") {
//         publishName(response["Face"]);
//       } else if (response["command"] == "removeFace") {
//         publishName("remove_" + response["Face"]);
//       } else if (response["command"] == "recognition") {
//         if (response["recognition"] == "start") {
//           canSay = true;
//         } else if (response["recognition"] == "stop") {
//           CurrentFace = "unknown";
//         }
//         publishRecognition(response["recognition"]);
//       } else if (response["command"] == "music") {
//         if (response["music"] == "play") {
//           // publishOrder(200);

//           CurrentTrack =
//               "assets/music/" + musics[Random().nextInt(musics.length)];
//           playLocal(CurrentTrack);
//         } else if (response["music"] == "resume") {
//           // publishOrder(200);

//           playLocal(CurrentTrack);
//         } else if (response["music"] == "pause") {
//           // publishOrder(201);

//           pausePlayer();
//         }
//       } else if (response["command"] == "settings") {
//         if (response["settings"] == "show") {
//           setState(() {
//             param = true;
//           });
//         } else if (response["settings"] == "hide") {
//           setState(() {
//             param = false;
//           });
//         }
//       } else if (response["command"] == "ros") {
//         if (response["ros"] == "connect") {
//           initializeTopics();
//           setState(() {});
//         } else if (response["ros"] == "disconnect") {
//           ros.close();
//           setState(() {});
//         }
//       } else if (response["command"] == "rosIP") {
//         List<String> x;
//         x = response["rosIP"].toString().split('/');
//         print(x);

//         rosUrl = "ws://" +
//             x[0].trim() +
//             "." +
//             x[1].trim() +
//             "." +
//             x[2].trim() +
//             "." +
//             x[3].trim() +
//             ":9090";
//         initializeTopics();
//         setState(() {});
//       } else if (response["command"] == "devicesIP") {
//         List<String> x;
//         x = response["IP"].toString().split('/');
//         print(x);

//         devicesIP = x[0].trim() +
//             "." +
//             x[1].trim() +
//             "." +
//             x[2].trim() +
//             "." +
//             x[3].trim();
//         setState(() {});
//       } else if (response["command"] == "deviceOrder") {
//         String device;
//         device = response["device"].toString();
//         print("device number: " + device.toString());
//         String order = "";
//         order = response["order"].toString();
//         print("order: " + order.toString());
//         sendDeviceOrder(device, order);
//         setState(() {});
//       } else if (response["command"] == "expression") {
//         String expression = response["expression"];
//         switch (expression) {
//           case "another":
//             canChangeFace = true;

//             i = Random().nextInt(faces.length);
//             break;

//           case "angry":
//             canChangeFace = true;

//             i = 3;
//             break;
//           default:
//             bool find = false;
//             for (int x = 0; x < faces.length; x++) {
//               if (faces[x].contains(expression)) {
//                 canChangeFace = true;

//                 find = true;
//                 i = x;
//                 break;
//               }
//             }
//             if (find == false) {
//               AlanVoice.activate();
//               AlanVoice.playText("Sorry i can not do this expression");
//             }
//             break;
//         }
//         setState(() {});
//       } else if (response["command"] == "servo") {
//         int degree = 90;
//         degree = int.parse(response["command"]);
//         publishOrder(degree);
//       } else if (response["command"] == "call") {
//         int number = 90;
//         number = int.parse(response["number"]);
//         print(number);
//         call(number);
//         print(number);
//       } else if (response["command"] == "notification") {
//         print(response["notification"].toString());
//         ps.sendNotification('from orb', response["notification"].toString());
//       } else if (response["command"] == "video") {
//         setState(() {
//           screen = 2;
//         });
//       }
//     }
//   }

// // void updateFace() async{
// //   int x=0;
// //   while(true){
// //     print(x++);
// //     if(x==50000) break;
// //   }
// // }
//   @override
//   void initState() {
//     // updateFace();
//     // height=MediaQuery.of(context).size.height;
//     // width=MediaQuery.ofR(context).size.width;

//     initializeTopics();
//     AlanVoice.callbacks.add((command) => _handleCommand(command.data));
//     AlanVoice.onButtonState.add((event) {
//       ButtonState x;

//       print("-----------------------------------------------------");
//       print(event.name.toString());
//       if (event.name.toString() == "REPLY") {
//         canChangeFace = false;
//         setState(() {
//           i = 20;
//         });
//       } else {
//         if (canChangeFace == false) {
//           setState(() {
//             i = 6;
//           });
//         }
//         if (arja3 == true) {
//           arja3 = true;
//           publishOrder(90);
//         }
//       }
//     });
//     super.initState();

//     // Firebase.initializeApp().whenComplete(() {
//     //   print("completed");
//     //   setState(() {});
//     // });
//     // db = FirebaseFirestore.instance;
//     //print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");

//     WidgetsBinding.instance?.addObserver(this);
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       AlanVoice.activate();
//       AlanVoice.playText("Please say your password");
//       ps.toggleOnlieStatus(true);

//       // Firebase.initializeApp();

//       //dialog.show();
//     });
//     final docRef = FirebaseFirestore.instance
//         .collection("patients")
//         .doc(PatientService.userId);
//     docRef.snapshots().listen(
//       (event) {
//         if (startedTV == true) {
//           // print("current data: ${event.data()}");
//           //print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
//           print("devices:" + event.data()!["devices"]);
//           bool tv = (event.data()!["devices"]["tv"]);
//           // bool lights = (event.data()!["devices"]["lights"]);

//           if (tv == true) {
//             if (tvState == true) {
//               AlanVoice.activate();
//               AlanVoice.playText("the TV is already on");
//             } else {
//               AlanVoice.activate();
//               AlanVoice.playText("i am activating the tv");
//             }
//             sendDeviceOrder("TV", "on");
//             tvState = true;
//           } else if (tv == false) {
//             if (tvState == false) {
//               AlanVoice.activate();
//               AlanVoice.playText("the TV is already off");
//             } else {
//               AlanVoice.activate();
//               AlanVoice.playText("i am shutting down the tv");
//             }

//             sendDeviceOrder("TV", "off");
//             tvState = false;
//           }
//           //else if (lights == true) {
//           //   sendDeviceOrder("lights", "on");
//           // } else if (lights == false) {
//           //   sendDeviceOrder("lights", "off");
//           // }
//         } else {
//           startedTV = true;
//         }
//       },
//       onError: (error) => print("Listen failed: $error"),
//     );

//     final notfRef = FirebaseFirestore.instance
//         .collection("patients")
//         .doc(PatientService.userId)
//         .collection('notifications')
//         .orderBy("date", descending: true)
//         .limit(1);
//     notfRef.snapshots().listen((event) {
//       if (startedNotif == true) {
//         final notif = event.docs[0].data()["text"];
//         if (event.docs[0].data()["type"] != 'from orb') {
//           print("notif" + notif);
//           AlanVoice.activate();
//           AlanVoice.playText("you have a message. It is " + notif);
//         }
//         // for (var doc in event.docs) {
//         //   notifs.add(doc.data()["text"]);
//         // }
//         // print(" ${notifs.join(", ")}");
//       } else {
//         startedNotif = true;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     print('dispose');
//     ps.toggleOnlieStatus(false);
//     WidgetsBinding.instance?.removeObserver(this);
//     super.dispose();
//   }

//   Future<void> initializeTopics() async {
//     ros = Ros(url: rosUrl);
//     display = Topic(
//         ros: ros,
//         name: '/sensors',
//         type: "geometry_msgs/Inertia",
//         reconnectOnClose: true,
//         queueLength: 1000,
//         queueSize: 1000);
//     order = Topic(
//         ros: ros,
//         name: '/order',
//         type: "std_msgs/Int32",
//         reconnectOnClose: true,
//         queueLength: 10,
//         queueSize: 10);
//     name = Topic(
//         ros: ros,
//         name: '/name',
//         type: "std_msgs/String",
//         reconnectOnClose: true,
//         queueLength: 10,
//         queueSize: 10);
//     recognition = Topic(
//         ros: ros,
//         name: '/recognition',
//         type: "std_msgs/String",
//         reconnectOnClose: true,
//         queueLength: 10,
//         queueSize: 10);
//     facesTopic = Topic(
//         ros: ros,
//         name: '/faces',
//         type: "std_msgs/String",
//         reconnectOnClose: true,
//         queueLength: 10,
//         queueSize: 10);
//     talk = Topic(
//         ros: ros,
//         name: '/talk',
//         type: "std_msgs/String",
//         reconnectOnClose: true,
//         queueLength: 10,
//         queueSize: 10);
//     ros.connect();
//     await name.advertise();
//     await recognition.advertise();
//     await order.advertise();
//     await display.subscribe(subscribeHandler);
//     await facesTopic.subscribe(facesSub);
//     await talk.subscribe(talkSub);
//   }

//   void publishOrder(int x) async {
//     var msg = {'data': x};
//     await order.publish(msg);
//     print('done publihsed');
//   }

//   void publishName(String n) async {
//     var msg = {'data': n};
//     await name.publish(msg);
//     print('done publihsing face name');
//   }

//   void publishRecognition(String b) async {
//     var msg = {'data': b};
//     await recognition.publish(msg);
//     print('done publihsing in recognition');
//   }

//   void _incrementCounter() async {
//     // call(28705546);
//     // String? ip = await inf.WifiInfo().getWifiName();
//     // // getWifiIP(); // WifiFlutte ().getWifiIP();
//     // print(ip);
//     // print("eeeeeeeeeeeeeeeeeeeeee");

//     // String subnet = ip!.substring(0, ip.lastIndexOf('.'));
//     // int port = 80;
//     // print(ip);
//     // final stream = NetworkAnalyzer.discover2(subnet, port);
//     // stream.listen((NetworkAddress addr) {
//     //   if (addr.exists) {
//     //     print('Found device: ${addr.ip}');
//     //   }
//     // });
//     AlanVoice.showButton();
//     setState(() {
//       i = (i + 1) % faces.length;
//     });
//     // dialog..show();
//   }

//   void _decrementCounter() {
//     // AlanVoice.showButton();
//     // publishOrder(i % 5);
//     // active();
//     // AlanVoice.playText("previous");
//     setState(() {
//       i = max((i - 1) % faces.length, 0);
//     });
//     canSay = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.

//     dialog = AwesomeDialog(
//       context: context,
//       dialogType: DialogType.ERROR,
//       borderSide: BorderSide(color: Colors.red, width: 5),
//       // width: 280,
//       buttonsBorderRadius: BorderRadius.all(Radius.circular(10)),
//       animType: AnimType.SCALE,
//       title: 'Authentification',
//       desc: 'Voice Authentification',
//       btnOk: Container(),
//       dialogBackgroundColor: Colors.white,
//       dismissOnBackKeyPress: false,
//       dismissOnTouchOutside: false,

//       body: Center(
//           child: Column(children: [
//         Text(
//           "Please Say your Secret Word :)",
//           style: TextStyle(
//             fontStyle: FontStyle.italic,
//             color: Colors.red,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(
//           child: FlutterRipple(
//             radius: 70,
//             child: IconButton(
//                 onPressed: () {
//                   print("pressed");
//                 },
//                 icon: Icon(Icons.multitrack_audio_rounded)),
//             rippleColor: Color.fromARGB(255, 164, 7, 7),
//             duration: Duration(milliseconds: 1500),
//             onTap: () {
//               print("hello");
//             },
//           ),
//           width: 200,
//           height: 200,
//         )
//       ])),
//     );
//     return Scaffold(
//       // appBar: AppBar(
//       //   // Here we take the value from the MyHomePage object that was created by
//       //   // the App.build method, and use it to set our appbar title.
//       //   title: Text(widget.title),
//       // ),

//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: screen == 2
//             ? VideoCallScreen(
//                 callback: () {
//                   setState(() {
//                     screen = 1;
//                   });
//                 },
//               )
//             : GestureDetector(
//                 child: RotatedBox(
//                     quarterTurns: 3,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Image.asset(
//                           faces[i],
//                           fit: BoxFit.fill,
//                           height: double.infinity,
//                           width: double.infinity,
//                           alignment: Alignment.center,
//                         ),
//                         if (param == true)
//                           Card(
//                               elevation: 50,
//                               //margin: EdgeInsets.all(50),
//                               color: Colors.grey,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         "RosBridge IP :" + this.ros.url,
//                                       ),
//                                       Icon(
//                                         Icons.camera,
//                                         color:
//                                             this.ros.status == Status.connected
//                                                 ? Colors.green
//                                                 : Colors.redAccent,
//                                       ),
//                                     ],
//                                   ),
//                                   TextField(
//                                     onChanged: (value) {
//                                       setState(() {
//                                         rosUrl =
//                                             rosUrl = "ws://" + value + ":9090";
//                                         initializeTopics();
//                                       });
//                                     },
//                                   ),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         "Camera IP :" + cameraIP,
//                                       ),
//                                       Icon(
//                                         Icons.settings,
//                                         color:
//                                             this.ros.status == Status.connected
//                                                 ? Colors.green
//                                                 : Colors.redAccent,
//                                       ),
//                                     ],
//                                   ),
//                                   TextField(onSubmitted: (value) {
//                                     setState(() {
//                                       cameraIP = value.trim();
//                                     });
//                                   }),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         "Devices IP:" + devicesIP,
//                                       ),
//                                       Icon(
//                                         Icons.devices_rounded,
//                                         color: espActive == true
//                                             ? Colors.green
//                                             : Colors.redAccent,
//                                       ),
//                                     ],
//                                   ),
//                                   TextField(
//                                     onSubmitted: (value) {
//                                       setState(() {
//                                         devicesIP = value.trim();
//                                       });
//                                     },
//                                   )
//                                 ],
//                               ))
//                       ],
//                     )),
//                 onTap: _incrementCounter,
//                 onDoubleTap: _decrementCounter,
//                 onLongPress: () {
//                   AlanVoice.hideButton();
//                 },
//               ),
//         // floatingActionButton: FloatingActionButton(
//         //   onPressed: _incrementCounter,
//         //   tooltip: 'Increment',
//         //   child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
