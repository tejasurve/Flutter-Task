/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'package:flutter_task/config/network/network_config.dart';
import 'package:flutter_task/service_locator/service_locator.dart';

class Endpoints {
  static final isMock = serviceLocator<NetworkConfig>().isMock;
  static String get getContentData => isMock
      ? 'get_mobile_offering_configuration'
      : '/bytes/all?page={pageNo}&limit=10&country=United+States';
}
