import 'dart:async';

import 'package:flutter_e_commerce_app/domain/entities/user_data.dart';
import 'package:flutter_e_commerce_app/domain/repositories/auth_repository.dart';
import 'package:flutter_e_commerce_app/domain/repositories/user_repository.dart';
import 'package:flutter_e_commerce_app/infrastructure/models/user_data_model.dart';
import 'package:flutter_e_commerce_app/utils/constants/enums.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:flutter_e_commerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDataController extends GetxController {
  static UserDataController get instance => Get.find();

  final UserRepository userRepository;
  final AuthRepository authRepository;

  UserDataController(
      {required this.userRepository, required this.authRepository});

  /// -- Variables
  Rx<UserData> userData = UserData.empty().obs;
  final userDataLoading = false.obs;
  final imageUploading = false.obs;
  late StreamSubscription<AuthState> _authStreamSubscription;

  @override
  void onInit() {
    onAuthStateChangedListener();
    super.onInit();
  }

  @override
  void onClose() {
    _authStreamSubscription.cancel();
    super.onClose();
  }

  void onAuthStateChangedListener() {
    _authStreamSubscription =
        authRepository.authStateChangeListener.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      print('auth state changed in userDataUsecases: $event , $session');
      if (event == AuthChangeEvent.signedIn ||
          event == AuthChangeEvent.initialSession) {
        print("signed in...");
        // handle sign in event
        fetchUser();
      } else if (event == AuthChangeEvent.signedOut) {
        // handle sign out event
        print("signed out...");
        userData(UserData.empty());
      }
    });
  }

  Future<void> fetchUser() async {
    try {
      userDataLoading.value = true;
      final userData = await userRepository.fetchUser(
          userId: authRepository.currentUser?.id);
      this.userData(userData);
    } catch (e) {
      print('sth went wrong fetching the user: $e');
      userData(UserData.empty());
    } finally {
      userDataLoading.value = false;
    }
  }

  Future<void> updateFirstAndLastName(
      {String? firstName, String? lastName}) async {
    await userRepository.updateUser(
        userDataModel: UserDataModel(
            id: authRepository.currentUser?.id ?? '',
            firstName: firstName,
            lastName: lastName));
  }

  String getImageUrlOrDefault() {
    final networkImage = userData.value.profilePicture;
    return networkImage.isNotEmpty ? networkImage : DImages.user;
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);

      if (image != null) {
        imageUploading.value = true;
        // Upload Iamge
        final imageUrl = await userRepository.uploadImage(
            bucket: StorageBucket.avatars,
            path: authRepository.currentUser?.id ?? '',
            imageFile: image);
        // Update User Image record
        await userRepository.updateUser(
            userDataModel: UserDataModel(
                id: authRepository.currentUser?.id ?? '',
                profilePicture: imageUrl));

        // update userData
        userData.value = userData.value.copyWith(profilePicture: imageUrl);

        DLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      print(e);
      DLoaders.errorSnackBar(
          title: 'Oh Snap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
