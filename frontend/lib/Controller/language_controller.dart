import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map< String, Map<String, String> > get keys => {
        'Eng': {
          'Wel': 'Hello Sohid!👋',
          'Sub': "Let's start shopping",
          'Categoris': 'Top Categoris',
          'See': 'See All'
        },

        'Ban': {
          'Wel': 'হ্যালো Sohid!👋',
          'Sub': "কেনাকাটা শুরু করা যাক",
          'Categoris': 'শীর্ষ বিভাগ',
          'See': 'সব দেখুন'
        }
      };
}
