import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/generic_widgets/main_button.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:ferpo/core/theme/app_text_style.dart';
import 'package:ferpo/features/cart/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cubit/change_payment_cubit.dart';
import 'cubit/state.dart';
import 'my_text_field.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = ["CalmShirt", "CalmShirt"];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 14.r),
                  child: Slidable(
                    key: ValueKey(items[index]),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      extentRatio: 0.25,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.deleteBack,
                          ),
                          margin: EdgeInsetsDirectional.only(start: 15.r),
                          height: 127.h,
                          width: 50.w,
                          padding: EdgeInsets.all(8.r),
                          child: SvgPicture.asset(
                            AppImages.delete,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.backCart),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.r),
                            child: SvgPicture.asset(
                              AppImages.maleSvg,
                              width: 50.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                              Text(
                                "Best T-shirt",
                                style: AppTextStyle.f14W400grey,
                              ),
                              Text(
                                '590\$',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.remove),
                          ),
                          Text("1"),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Services",
                      style: AppTextStyle.f16W700gray,
                    ),
                    Text(
                      "20.00\$",
                      style: AppTextStyle.f16W700SecondColor,
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: AppTextStyle.f14W400gray,
                        ),
                        Text(
                          "1200.00\$",
                          style: AppTextStyle.f20W700Black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    MaterialButton(
                      onPressed: () => _showBottomSheet(context),
                      color: AppColors.secondaryColor,
                      height: 40.h,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Text(
                        "Check Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
          top: 50.r,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              // fit: BoxFit.,
              // height: MediaQuery.of(context).size.height*0.5,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Payment Method',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    BlocBuilder<PaymentCubit, AbstractState>(
                      builder: (BuildContext context, AbstractState state) {
                        return SizedBox(
                          height: 40.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    context
                                        .read<PaymentCubit>()
                                        .togglePayment(index);
                                  },
                                  child: PaymentMethod(
                                    index: index,
                                    isSelected: context
                                        .read<PaymentCubit>()
                                        .selected[index],
                                  ));
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    MyTextField(title: 'Card Number'),
                    SizedBox(height: 16),
                    MyTextField(title: 'Card Name'),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: MyTextField(title: 'Expire Date')),
                        SizedBox(width: 16),
                        Expanded(
                          child: MyTextField(title: 'CVV'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            MainButton(
              onPressed: () => Navigator.pop(context),
              text: 'Buy',
            ),
          ],
        ),
      ),
    );
  }
}
