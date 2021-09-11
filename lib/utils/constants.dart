import 'package:flutter/material.dart';

const String PROJECT_NAME = "Butter";

// Main page menu names
const String BUTTERS = "Butters";
const String MINE = "Mine";
const String PROFILE = "Profile";

const String ROOT_API_URL = "http://192.168.0.101:3000/api/";
const String BUTTERS_ALL_URL = "butters/all";
const String BUTTERS_BY_USER_URL = "butters/userId";
const String COMMENTS_BY_BUTTER_ID_URL = "butters/comments/butterId";
const String IMAGE_URL = "files";
const String USER_URL = "users";
const String AVATAR_URL = "avatars";
const String AVATAR_BY_USER_ID_URL = "avatars/userId";

const int CONNECTION_TIMEOUT = 3000;

const String MAIN_FONT_FAMILY = "VarelaRound";

const Color MAIN_THEME_COLOR = Colors.orange;
const Color BUTTON_GREY_COLOR = const Color.fromARGB(255, 210, 210, 210);
const Color BACKGROUND_GREY_COLOR = const Color.fromARGB(255, 230, 230, 230);