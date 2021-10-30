import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_reference/components/uitls_widget.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);
  static const String routeName = 'no_internet_connection_screen';
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading:
            theme.brightness == Brightness.light ? false : true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            UtilsWidget.defaultText(
              'No_Internet_Connection',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                height: 1.3,
              ),
            ).tr(),
            SizedBox(
              height: 4,
            ),
            UtilsWidget.defaultText('Your_device_is_not_connected_to_Internet')
                .tr(),
            SizedBox(
              height: 16,
            ),
            Divider(),
            SizedBox(
              height: 16,
            ),
            UtilsWidget.defaultText(
              'Please_do_the_following_to_establish_connection',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ).tr(),
            SizedBox(
              height: 8,
            ),
            UtilsWidget.defaultText(
                    'Go_to_the_WLAN_settings_on_your_device_and_check_if_there_are_available_WLAN_networks')
                .tr(),
            SizedBox(
              height: 4,
            ),
            UtilsWidget.defaultText(
                    'Check_your_device_if_it_is_enabled_cellular_data_network_and_confirm_that_it_is_in_service')
                .tr(),
            SizedBox(
              height: 4,
            ),
            UtilsWidget.defaultText(
                    'Check_whether_the_app_is_data_restricted_by_your_device_system_or_other_data_restricting_app')
                .tr(),
            SizedBox(
              height: 16,
            ),
            //WLAN Subtitle
            UtilsWidget.defaultText(
              'If_you_have_accessed_to_WLAN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ).tr(),
            SizedBox(
              height: 8,
            ),
            UtilsWidget.defaultText(
                    'Check_whether_the_WLAN_network_chosen_connects_to_internet_and_allows_your_device_to_access_internet')
                .tr(),
          ],
        ),
      ),
    );
  }
}
