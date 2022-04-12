import 'dart:developer';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/models/models.dart' as model;
import 'package:flutix/services/services.dart';
import 'package:flutix/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../bricks/my_widgets/gradient_button_1.dart';
import '../../bricks/my_widgets/text_field_with_label.dart';
import '../../models/registration_data.dart';

part 'main_page.dart';
part 'wrapper.dart';
part 'splash_page.dart';
part 'signup_page.dart';
part 'signin_page.dart';
part 'profiling_selected_page.dart';
part 'account_confirmation_page.dart';
part 'movie_page.dart';
