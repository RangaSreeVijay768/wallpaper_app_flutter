import 'package:basic/app/ads/widgets/ads_banner_ad_widget/ads_banner_ad_widget.dart';
import 'package:basic/app/ads/widgets/ads_native_ad/ads_native_ad.dart';
import 'package:basic/app/themes/app_colors.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '/app/themes/borders.dart';
import '/app/themes/edge_insets.dart';
import 'package:go_router/go_router.dart';

import 'wallpapers_privacy_policy_screen_controller.dart';
import 'wallpapers_privacy_policy_screen_cubit.dart';

import '/app/core/widgets/base_stateless_widget.dart';

class WallpapersPrivacyPolicyScreen
    extends BaseStatelessWidget<WallpapersPrivacyPolicyScreenController,
        WallpapersPrivacyPolicyScreenCubit,
        WallpapersPrivacyPolicyScreenState> {
  WallpapersPrivacyPolicyScreen(
      {Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final largeScreen = MediaQuery.sizeOf(context).width > 600;

    return BlocProvider<WallpapersPrivacyPolicyScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          WallpapersPrivacyPolicyScreenCubit,
          WallpapersPrivacyPolicyScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Scaffold(
            backgroundColor: AppColors.dark,
            appBar: AppBar(
              backgroundColor: AppColors.dark,
              title: Text("Privacy Policy", style: TextStyle(
                color: AppColors.grey3
              ),),
              centerTitle: true,
              leading: IconButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.grey3,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: SingleChildScrollView(
              padding: edge_insets_x_16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy\nLast updated: December 21, 2024\n',
                    style: TextStyle(color: AppColors.grey6, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\n\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator.\n\n',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  Text(
                    'Interpretation and Definitions\n\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or plural.\n\nDefinitions\nFor the purposes of this Privacy Policy:\n\n',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Account'),
                  Text(
                    'means a unique account created for You to access our Service or parts of our Service.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Affiliate'),
                  Text(
                    'means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Application'),
                  Text(
                    'refers to Wallpapers 2K25 (Auto changer), the software program provided by the Company.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Company'),
                  Text(
                    'referred to as either "the Company", "We", "Us" or "Our" in this Agreement refers to Wallpapers 2K25 (Auto changer).',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Country'),
                  Text(
                    'refers to: Andhra Pradesh, India',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Device'),
                  Text(
                    'means any device that can access the Service such as a computer, a cellphone or a digital tablet.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Personal Data'),
                  Text(
                    'is any information that relates to an identified or identifiable individual.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Service'),
                  Text(
                    'refers to the Application.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Service Provider'),
                  Text(
                    'means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Usage Data'),
                  Text(
                    'refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('You'),
                  Text(
                    'refers to the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Collecting and Using Your Personal Data'),
                  Text(
                    'Types of Data Collected\n\nPersonal Data\nWhile using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Usage Data'),
                  Text(
                    'Usage Data is collected automatically when using the Service.\n\nUsage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\n\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Use of Your Personal Data'),
                  Text(
                    'The Company may use Personal Data for the following purposes:\n\nTo provide and maintain our Service, including to monitor the usage of our Service.\n\nTo manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.\n\nFor the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.\n\nTo contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.\n\nTo provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.\n\nTo manage Your requests: To attend and manage Your requests to Us.\n\nFor business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.\n\nFor other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Sharing Your Personal Information'),
                  Text(
                    'We may share Your personal information in the following situations:\n\nWith Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.\n\nFor business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.\n\nWith Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.\n\nWith business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.\n\nWith other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside.\n\nWith Your consent: We may disclose Your personal information for any other purpose with Your consent.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Retention of Your Personal Data'),
                  Text(
                    'The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Transfer of Your Personal Data'),
                  Text(
                    'Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.\n\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\n\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Delete Your Personal Data'),
                  Text(
                    'You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.\n\nOur Service may give You the ability to delete certain information about You from within the Service.\n\nYou may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.\n\nPlease note, however, that We may need to retain certain information when we have a legal obligation to do so or where we have legitimate business interests to protect.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Security of Your Personal Data'),
                  Text(
                    'The security of Your Personal Data is important to Us, but please remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Children\'s Privacy'),
                  Text(
                    'Our Service is not intended for use by children under the age of 13. We do not knowingly collect personally identifiable information from children under 13. If We become aware that a child under 13 has provided Us with Personal Data, We take steps to remove such information from Our servers.\n\nIf You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us so that We can take necessary actions.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Changes to This Privacy Policy'),
                  Text(
                    'We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date at the top of this Privacy Policy.\n\nWe advise You to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  _buildSectionTitle('Contact Us'),
                  Text(
                    'If you have any questions about this Privacy Policy, please contact us:\nBy email: ranga.wallpaperapp@gmail.com',
                    style: TextStyle(color: AppColors.grey6, fontSize: 16),
                  ),
                  SizedBox(height: 24,),
                  Row(
                    children: [
                      Expanded(
                          child: AdsNativeAd(templateType: TemplateType.medium)
                      ),
                      largeScreen?
                      Expanded(
                          child: AdsNativeAd(templateType: TemplateType.medium)
                      ) : SizedBox.shrink()
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 65,
              child: AdsBannerAdWidget(),
            ),
          );
        },
      ),
    );
  }
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(color: AppColors.grey6, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  WallpapersPrivacyPolicyScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    WallpapersPrivacyPolicyScreenCubit cubit = WallpapersPrivacyPolicyScreenCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }
}
