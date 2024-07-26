import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_secure.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/modules/auth/controllers/auth_controller.dart';

class FormLoginWidget extends GetView<AuthController> {
  const FormLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Login to your account',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            XInput(
              prefixIcon: Icon(MdiIcons.phoneOutline),
              label: 'phone',
              hintText: '0XXXXXXXXX',
              onSaved: (val) {
                controller.user.value.phone = val!;
              },
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            SecureInput(
              onSaved: (val) {
                controller.user.value.password = val!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            XButton(
              fixedSize: Size(Get.width, 40),
              onPressed: () {
                final form = controller.formKey.currentState;
                if (form!.validate()) {
                  form.save();
                  controller.login();
                }
              },
              child: const Text('login'),
            ),
            //dont have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have account?',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    controller.tabController.animateTo(1);
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
