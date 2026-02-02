import 'package:flutter/material.dart';

import 'screens/role_select_screen.dart';
import 'screens/onboarding/consent_screen.dart';
import 'screens/onboarding/credentials_screen.dart';
import 'screens/onboarding/identity_screen.dart';
import 'screens/onboarding/address_screen.dart';
import 'screens/onboarding/emergency_contact_screen.dart';
import 'screens/onboarding/optional_identifiers_screen.dart';
import 'screens/onboarding/data_access_defaults_screen.dart';
import 'screens/onboarding/all_set_screen.dart';
import 'screens/main_shell.dart';

class AppRoutes {
  static const role = "/";
  static const consent = "/consent";
  static const credentials = "/credentials";
  static const identity = "/identity";
  static const address = "/address";
  static const emergency = "/emergency";
  static const optionalIds = "/optional_ids";
  static const dataAccess = "/data_access";
  static const allSet = "/all_set";
  static const shell = "/shell";

  static Map<String, WidgetBuilder> routes = {
    role: (_) => const RoleSelectScreen(),
    consent: (_) => const ConsentScreen(),
    credentials: (_) => const CredentialsScreen(),
    identity: (_) => const IdentityScreen(),
    address: (_) => const AddressScreen(),
    emergency: (_) => const EmergencyContactScreen(),
    optionalIds: (_) => const OptionalIdentifiersScreen(),
    dataAccess: (_) => const DataAccessDefaultsScreen(),
    allSet: (_) => const AllSetScreen(),
    shell: (_) => const MainShell(),
  };
}
