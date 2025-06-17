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
import 'package:flutter_template_getx/app/routes/app_pages.dart';
import 'package:flutter_template_getx/gen/assets.gen.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/auth_login_controller.dart';

class AuthLoginView extends BaseView<AuthLoginController> {
  AuthLoginView({Key? key})
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
            _passwordOptions(),
            _agreementGroup(),
            _loginButton(),
            _toRegister(),
            _otherLogin(),
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
          T.loginWithAccount.tr,
          style: TextStyle(
              fontSize: ScreenAdapter.fontSize(32),
              fontWeight: FontWeight.w500,
              color: AppColors.color000,
              height: 45.0 / 32),
        ),
        Gap(ScreenAdapter.height(10)),
        Text(
          T.loginPrompt.tr,
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

  Widget _passwordOptions() {
    return Row(
      children: [
        AuthCheckbox(
          value: controller.rememberPassword,
          onChanged: (value) => controller.rememberPassword.value = value,
          size: ScreenAdapter.height(20),
        ),
        Gap(ScreenAdapter.width(8)),
        Text(
          T.rememberPassword.tr,
          style: F13H20C333.copyWith(color: const Color(0xFF323232)),
        ),
        Expanded(child: const SizedBox()),
        Text(
          T.forgetPassword.tr,
          style: F13H20CBlue,
        ),
      ],
    );
  }

  Widget _agreementGroup() {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(56)),
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

  Widget _loginButton() {
    return Obx(() => InkWell(
        onTap: () {
          controller.login();
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              top: ScreenAdapter.height(10), bottom: ScreenAdapter.height(24)),
          height: ScreenAdapter.height(44),
          decoration: BoxDecoration(
            color:
                controller.rememberPassword.value && controller.agreement.value
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

  Widget _toRegister() {
    return InkWell(
        onTap: () {
          Get.toNamed(Routes.AUTH_REGISTER);
        },
        child: Text(T.toRegister.tr,
            style: F13H20C333.copyWith(
                color: AppColors.primaryGreen,
                fontSize: ScreenAdapter.fontSize(14))));
  }

  Widget _otherLogin() {
    return Container(
        height: ScreenAdapter.height(108),
        width: double.infinity,
        margin: EdgeInsets.only(
            top: ScreenAdapter.height(115), bottom: ScreenAdapter.height(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenAdapter.height(0.5),
                  width: ScreenAdapter.width(52),
                  color: const Color(0xFFEBEDF0),
                ),
                Gap(ScreenAdapter.width(12)),
                Text(T.otherLogin.tr,
                    style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(12),
                        color: const Color(0xFF969799),
                        height: 24.0 / 12)),
                Gap(ScreenAdapter.width(12)),
                Container(
                  height: ScreenAdapter.height(0.5),
                  width: ScreenAdapter.width(52),
                  color: const Color(0xFFEBEDF0),
                ),
              ],
            ),
            Gap(ScreenAdapter.height(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgWrapper(
                    svgPath: Assets.images.iconWechart,
                    size: ScreenAdapter.height(40)),
                Gap(ScreenAdapter.width(24)),
                SvgWrapper(
                    svgPath: Assets.images.iconQq,
                    size: ScreenAdapter.height(40)),
                Gap(ScreenAdapter.width(24)),
                SvgWrapper(
                    svgPath: Assets.images.iconApple,
                    size: ScreenAdapter.height(40)),
              ],
            )
          ],
        ));
  }
}
