# Deep link for Flutter
This project demonstrates the integration of deep linking in a mobile application. Deep linking allows users to navigate directly to specific content or pages within the app using URLs, enhancing user experience by simplifying navigation and improving engagement. The app supports both Universal Links (iOS) and App Links (Android),

<br>

## Prerequisites
To run this app locally, the following tools are required:
- Android Studio for Android development
- Xcode for iOS development

<br>

## Installation

- ### For iOS (Universal Link):
  1. Clone the repository:
     
     ```rb
      git clone https://github.com/MarwanAdel1/Deep-link.git
     ```
  2. Open the project in <b>Xcode</b>.
  3. In the <b>Capabilities</b> tab, enable <b>Associated Domains</b>.
      - Add ``` applinks:yourdomain.com ``` to the <b>Domains</b> list.
  4. Run the app on your iOS device or simulator.


 - ### For Android (App Links):
   1. Clone the repository:
     
      ```rb
       git clone https://github.com/MarwanAdel1/Deep-link.git
      ```
   2. Open the project in <b>Android Studio</b>.
   3. In the AndroidManifest.xml, ensure the ``` <intent-filter> ``` for deep links is configured correctly.

<br>

## Deep Link Example:

- Home page deep link:- https://deeplink-testing.com
- Products list page deep link:- https://deeplink-testing.com?screen=product-list
- Product details page deep link:- https://deeplink-testing.com?screen=product-details&id=5

  - ### How to add new deep links:
    - For iOS, update the app's <b>Associated Domains</b>.
    - For Android, modify the ``` AndroidManifest.xml ``` to include a new ``` <intent-filter> ``` for each link scheme.

<br>

 ## Usage

To test the deep linking functionality:
1. <b>Run the app</b> on either an iOS or Android device.
2. Use a deep link URL in any external editing app (e.g., notes).
   - Example for iOS/Android:
      ```rb
      https://deeplink-testing.com?screen=product-details&id=5
      ```
3. The app should open directly to the product details page corresponding to the ID 5.
 
<br>

## Testing

- <b>Before testing</b>, install the Flutter app
  - Using adb command:
    - For iOS
      ```rb
       xcrun simctl openurl booted "https://deeplink-testing.com"
      ```
    - For Android
      ```rb
       adb shell am start -W -a android.intent.action.VIEW -d "https://deeplink-testing.com" com.example.deep_links_poc
      ```

  - To test the deep linking features, follow these steps:
    - <b>Test Case 1: Deep Link with App Installed:</b>
      1. Open a deep link in any external app (e.g., note,...).
      2. The app should open and navigate directly to the specific content, such as a product details page.
    - <b>Test Case 2: Deep Link with App Not Installed:</b>
      1. Open a deep link in any external app when the app is not installed.
      2. The app should redirect to a web page displaying relevant content.
    - <b>Test Case 3: Share Deep Link:</b>
      1. Share a deep link with another user (e.g., via message or email).
      2. The recipient should open the app directly to the specific content or be redirected to the web if the app is not installed.

<br>

## Known Issues
1. <b>Android 12+ Compatibility:</b> Some issues may arise with App Links in Android 12 and above due to strict app verification policies.
2. <b>Universal Link Fallback:</b> In rare cases, Universal Links may not work on older iOS versions. Ensure your users are on iOS 9 or later.
3. <b>Custom URL Scheme Handling:</b> If other apps are registered to handle the same custom scheme (myapp://), conflicts may arise. Ensure your scheme is unique to your app.

<br>

## 📙 Table of Contents

1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Deep Link Example](#deep-link-example)
4. [Usage](#usage)
5. [Testing](#testing)
6. [Known Issues](#known-issues)
