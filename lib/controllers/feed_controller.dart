import 'package:get/get.dart';
import 'package:oak_haven_massage_app/models/feed.dart';

import '../utils/app_assets.dart';

class FeedController extends GetxController {
  List<Feed> feedList = [
    Feed(
      comment: 200,
      like: 512,
      description:
          "📚 Just conquered algorithms & data structures! 🎉 Time for a breather. Suggestions for a binge-worthy show? 🍿\n#StudyBreak #NetflixTime",
      images: [],
      time: "10 min",
      user: User(
        name: "Alexander Cumins",
        occupation: "Massage Therapist",
        profileImage: "",
      ),
    ),
    Feed(
      comment: 200,
      like: 512,
      description: "💻 Need some desk setup inspo?\n\n👀 Check out my cozy study corner! Loving the minimalist vibes and natural lighting.",
      images: [AppAssets.img2, AppAssets.img1],
      time: "10 min",
      user: User(
        name: "Alexander Cumins",
        occupation: "Massage Therapist",
        profileImage: "",
      ),
    ),
    Feed(
      comment: 200,
      like: 512,
      description:
          "📝 Just wrapped up my final project presentation! 🎓💼 Feeling a mix of relief and excitement for what's next. \nCheers to the end of another semester! \n🥂#StudentLife #FinalsDone #NextChapter",
      images: [],
      time: "10 min",
      user: User(
        name: "Alexander Cumins",
        occupation: "Massage Therapist",
        profileImage: "",
      ),
    ),
  ];
}
