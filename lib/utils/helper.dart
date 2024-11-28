import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:oak_haven_massage_app/utils/toast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class Helper {
  void launchURL(String val) async {
    if (await canLaunchUrl(Uri.parse(val))) {
      await launchUrl(Uri.parse(val));
    } else {
      throw 'Could not launch $val';
    }
  }


  snack(context, String message, Color color) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: color,
      content: Text(message),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Future<int> getFileSize(String filePath) async {
    try {
      File file = File(filePath);
      if (await file.exists()) {
        int fileSize = await file.length();
        return fileSize;
      } else {
        errorToast('File not found');
        return 0;
      }
    } catch (e) {
      errorToast('Error: $e');
      return 0;
    }
  }

  Future<File?> pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      XFile? pickedFile = await picker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        maxHeight: 1080,
        maxWidth: 1080,
        imageQuality: 50,
      );
      return pickedFile != null ? File(pickedFile.path) : null;
    } catch (e) {
      return null;
    }
  }

  uriParse(String path) {
    Uri uri = Uri.parse(path);
    String relativePath = uri.path;
    return relativePath.substring(1);
  }

  Future<bool> isNetworkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  bool isMobileValidation(String phoneNumber) {
    String regexPattern = r'^[6-9][0-9]{9}$';
    var regExp = RegExp(regexPattern);
    if (phoneNumber.isEmpty) {
      return false;
    } else if (regExp.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }

  bool isEmailValidation(String email) {
    String regexPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    var regExp = RegExp(regexPattern);
    if (email.isEmpty) {
      return false;
    } else if (regExp.hasMatch(email)) {
      return true;
    }
    return false;
  }


  String getFormattedFriendlyTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    int hours = duration.inHours, minutes = duration.inMinutes.remainder(60), seconds = duration.inSeconds.remainder(60);
    String period = hours >= 12 ? "PM" : "AM";
    if (hours > 0) {
      int adjustedHour = hours % 12 == 0 ? 12 : hours % 12;
      return "$adjustedHour hr ${twoDigits(minutes)} min ${twoDigits(seconds)} sec $period";
    } else if (minutes > 0) {
      return "$minutes min ${twoDigits(seconds)} sec $period";
    } else {
      return "$seconds sec $period";
    }
  }

  String getFormattedDate(String dtStr) {
    var dt = DateTime.parse(dtStr).toUtc().toLocal();
    return "${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}";
  }

  String getFormattedWeekDate(int value) {
    var sdt = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    var edt = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - value);
    String startDate = "${sdt.year}-${sdt.month.toString().padLeft(2, '0')}-${sdt.day.toString().padLeft(2, '0')}";
    String endDate = "${edt.year}-${edt.month.toString().padLeft(2, '0')}-${edt.day.toString().padLeft(2, '0')}";
    return jsonEncode({"startDate": startDate, "endDate": endDate});
  }

  String getFormattedTime(String dtStr) {
    var dt = DateFormat("hh:mm a").format(DateTime.parse(dtStr).toLocal());
    return dt;
  }

  String getFormattedDateTimer(String dtStr) {
    var date = DateFormat('dd MMM yyyy', 'en_US').format(DateTime.parse(dtStr)).toString();
    var time = DateFormat("hh:mm a").format(DateTime.parse(dtStr).toLocal());
    return "$date\t$time";
  }

  String getFormattedFilterDate(String dtStr) {
    return DateFormat('dd MMM yyyy', 'en_US').format(DateTime.parse(dtStr)).toString();
  }

  connectCall(String number) {
    String link = "tel:$number";
    launchURL(link);
  }

  connectAdmin() {
    String link = "tel:6357017016";
    launchURL(link);
  }

  connectEmail() {
    final Uri params = Uri(scheme: 'mailto', path: 'contact@fastwhistle.com');
    try {
      launchUrl(params);
    } catch (err) {
      throw "Cant launch";
    }
  }

  imageShow({required String uri, required BuildContext context}) {
    return showDialog(
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(2),
          title: SizedBox(
            height: Get.height / 2,
            width: Get.size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: InteractiveViewer(
                child: Image.network(
                  uri,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? value) {
                    if (value == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: value.expectedTotalBytes != null ? value.cumulativeBytesLoaded / value.expectedTotalBytes! : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(),
                ),
              ),
            ),
          ),
        );
      },
      context: context,
    );
  }


  Future convertFileToBase64(File imageFile) async {
    final Uint8List imageBytes = await imageFile.readAsBytes();
    final String base64EncodedImage = base64.encode(imageBytes);
    return base64EncodedImage;
  }

  Future<File> convertBase64ToImage(String base64String) async {
    final cacheDir = await getExternalStorageDirectory();
    String fileName = "${cacheDir!.path}/${const Uuid().v4()}.png";
    final decodedBytes = base64Decode(base64String);
    return File(fileName).writeAsBytes(decodedBytes);
  }

  Future<Uint8List> getBytesFromAsset(String path) async {
    double pixelRatio = MediaQuery.of(Get.context!).devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: pixelRatio.round() * 30);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  void showLoadingIndicator({String? txt, int? totalOrders}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    'Please wait …',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  txt ?? "Your offline orders are syncing!",
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget loadingWidget({Color? color, double? strokeWidth, double? size}) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size ?? 25,
            width: size ?? 25,
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth ?? 3,
              valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.black),
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  String timesStringConvert(String value) {
    return getFormattedDateTimer(DateTime.fromMillisecondsSinceEpoch(int.parse(value)).toString());
  }
}