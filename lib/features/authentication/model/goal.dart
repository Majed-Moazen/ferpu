import '../../../core/constants/app_images.dart';

class GoalModel {
  String image;
  String title;
  String subTitle;
  bool isSelected;

  GoalModel(
      {required this.title,
      required this.image,
      required this.subTitle,
      this.isSelected = false});

  static List<GoalModel> data = [
    GoalModel(
      title: 'Loss Weight',
      subTitle: 'Burn calories & get ideal body',
      image: AppImages.fireSvg,
    ),
    GoalModel(
      title: 'Gain Muscle',
      subTitle: 'Build mass and power',
      image: AppImages.dambleSvg,
    ),
    GoalModel(
      title: 'Get Better',
      subTitle: 'Healthier than ever',
      image: AppImages.relaxSvg,
    ),
  ];
}
