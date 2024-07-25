import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/buttons/x_button.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/input_secure.dart';
import 'package:mvvm_getx_pattern/app/commons/ui/inputs/x_input.dart';
import 'package:mvvm_getx_pattern/app/modules/auth/controllers/auth_controller.dart';

class FormRegisterWidget extends GetView<AuthController> {
  const FormRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeyRegister,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        constraints: const BoxConstraints(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Register',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Register to your account',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            XInput(
              prefixIcon: Icon(MdiIcons.account),
              label: 'username',
              hintText: 'ahmad',
              onSaved: (val) {
                controller.user.value.username = val!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            // phone
            const SizedBox(
              height: 10,
            ),
            XInput(
                prefixIcon: Icon(MdiIcons.phone),
                label: 'phone',
                hintText: '08xxxxxxxx',
                onSaved: (val) {
                  controller.user.value.phone = val!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                }),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),

            SecureInput(
              onSaved: (val) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                if (value != controller.user.value.password) {
                  return 'Password does not match';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            XButton(
              fixedSize: Size(Get.width, 40),
              onPressed: () {
                if (controller.formKeyRegister.currentState!.validate()) {
                  controller.login();
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(
              height: 10,
            ),
            //already have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have account?',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    controller.tabController.animateTo(0);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
