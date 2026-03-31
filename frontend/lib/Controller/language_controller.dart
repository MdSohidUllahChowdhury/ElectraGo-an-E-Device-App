import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'Eng': {
          'Wel': 'ElectraGo',
          'Sub': "Let's start shopping",
          'Categoris': 'Top Categoris',
          'See': 'See All'
        },
        'Ban': {
          'Wel': 'ইলেক্ট্রাগো',
          'Sub': "কেনাকাটা শুরু করা যাক",
          'Categoris': 'শীর্ষ বিভাগ',
          'See': 'সব দেখুন'
        }
      };
}
