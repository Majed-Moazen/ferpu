import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import '../model/goal.dart';
import 'age.dart';
import 'my_widget/goal_list.dart';
import 'my_widget/logo_title.dart';

class GoalScreen extends StatelessWidget {
  int chooseGoal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoTitle(
                        top: 10,
                        title: 'What is your goals?',
                        subTitle:
                            'Let’s define your goals and will help you to achieve it'),
                    SizedBox(
                      height: 30.h,
                    ),
                    BlocBuilder<CubitAuth, SuperState>(
                      buildWhen: (previous, current) =>
                          current is ChangedGoalState,
                      builder: (context, state) => ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.read<CubitAuth>().toggleGoal(index);
                                chooseGoal = index;
                              },
                              child: GoalList(
                                goalModel: GoalModel.data[index],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 16.h,
                            );
                          },
                          itemCount: GoalModel.data.length),
                    ),
                  ],
                ),
              ),
            ),
            MainButton(
                color: AppColors.enableButton,
                text: AppStrings.continuee.tr(),
                onPressed: () {
                  context.read<CubitAuth>().user.goal = chooseGoal;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgeScreen(),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
