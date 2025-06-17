import 'package:flutter/material.dart';
import 'package:flutter_template_getx/app/core/base/view/base_view.dart';
import 'package:flutter_template_getx/app/core/translations/translation_keys.dart';
import 'package:flutter_template_getx/app/core/utils/screen_adapter.dart';
import 'package:flutter_template_getx/app/core/values/app_colors.dart';
import 'package:flutter_template_getx/app/core/values/text_styles.dart';
import 'package:flutter_template_getx/app/core/widgets/custom_appbar.dart';
import 'package:flutter_template_getx/app/core/widgets/image_wrapper.dart';
import 'package:flutter_template_getx/app/core/widgets/svg_wrapper.dart';
import 'package:flutter_template_getx/app/modules/auth/widgets/auth_checkbox.dart';
import 'package:flutter_template_getx/app/modules/auth/widgets/auth_text_field.dart';
import 'package:flutter_template_getx/gen/assets.gen.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/auth_register_controller.dart';

class AuthRegisterView extends BaseView<AuthRegisterController> {
  AuthRegisterView({Key? key})
      : super(
          bgColor: AppColors.pageBackground,
        );

  @override
  Widget appBar(BuildContext context) {
    return const CustomAppBar(
      title: Text(""),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(16)),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _header(),
            _inputBoxs(),
            _agreementGroup(),
            _registerButton(),
            _toLogin(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Gap(ScreenAdapter.height(32)),
        Text(
          T.register.tr,
          style: TextStyle(
              fontSize: ScreenAdapter.fontSize(32),
              fontWeight: FontWeight.w500,
              color: AppColors.color000,
              height: 45.0 / 32),
        ),
        Gap(ScreenAdapter.height(10)),
        Text(
          T.registerPrompt.tr,
          style: TextStyle(
              fontSize: ScreenAdapter.fontSize(13),
              fontWeight: FontWeight.w400,
              color: AppColors.color666,
              height: 18.0 / 13),
        ),
        Gap(ScreenAdapter.height(32)),
      ],
    );
  }

  Widget _inputBoxs() {
    return Column(
      children: [
        AuthTextField(
          hintText: T.pleaseInputUsername.tr,
          svgPath: Assets.images.phone,
          svgSize: ScreenAdapter.height(24),
          controller: controller.usernameController,
        ),
        Gap(ScreenAdapter.height(16)),
        AuthTextField(
          hintText: T.pleaseInputPassword.tr,
          svgPath: Assets.images.passwordLock,
          svgSize: ScreenAdapter.height(24),
          isPassword: true,
          keyboardType: TextInputType.visiblePassword,
          controller: controller.passwordController,
        ),
        Gap(ScreenAdapter.height(12)),
      ],
    );
  }


  Widget _agreementGroup() {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(24)),
      child: Row(
        children: [
          AuthCheckbox(
            value: controller.agreement,
            onChanged: (value) => controller.agreement.value = value,
            size: ScreenAdapter.height(20),
          ),
          Gap(ScreenAdapter.width(8)),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: T.agreementPrefix.tr,
                style: F13H20C333.copyWith(color: const Color(0xFF323232)),
                children: [
                  TextSpan(
                    text: T.userAgreement.tr,
                    style: F13H20CBlue,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri url = Uri.parse('https://www.baidu.com');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                  ),
                  TextSpan(
                    text: T.and.tr,
                  ),
                  TextSpan(
                    text: T.privacyPolicy.tr,
                    style: F13H20CBlue,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri url = Uri.parse('https://www.baidu.com');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerButton() {
    return Obx(() => InkWell(
        onTap: () {
          logger.d("开始注册");

          if(controller.agreement.value){
            logger.d("走到了这里");
            controller.register();
          }
          
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              top: ScreenAdapter.height(64), bottom: ScreenAdapter.height(24)),
          height: ScreenAdapter.height(44),
          decoration: BoxDecoration(
            color:
                 controller.agreement.value
                    ? AppColors.primaryGreen
                    : AppColors.primaryGreen.withAlpha(128),
            borderRadius: BorderRadius.circular(999),
          ),
          alignment: Alignment.center,
          child: Text(T.login.tr,
              style: F13H20C333.copyWith(
                  color: Colors.white, fontSize: ScreenAdapter.fontSize(14))),
        )));
  }

  Widget _toLogin() {
    return InkWell(
      onTap: (){
        Get.back();
      },
      child: Text(T.toLogin.tr,
        style: F13H20C333.copyWith(
            color: AppColors.primaryGreen,
            fontSize: ScreenAdapter.fontSize(14)))
    );
  }

}
