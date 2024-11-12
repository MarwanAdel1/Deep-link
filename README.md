# Deep link for Flutter
Deep linking allows users to open specific content or pages in an app directly through URLs, instead of navigating manually.
Deep linking is useful for marketing campaigns, user retention strategies, and improving overall user experience by providing easy access to targeted content. This PoC shows how deep linking can be integrated into both iOS and Android platforms, with the added benefit of fallback behavior for users who don’t have the app installed.

This project demonstrates the integration of deep linking in a mobile application. Deep linking allows users to navigate directly to specific content or pages within the app using URLs, enhancing user experience by simplifying navigation and improving engagement. The app supports both Universal Links (iOS) and App Links (Android),

<br>

## Prerequisites
To run this app locally, the following tools are required:
- Android Studio for Android development
- Xcode for iOS development

Make sure you have these tools installed. You’ll also need an actual Android device or iOS device to test deep links, as emulators/simulators might not always fully support deep linking behaviors.

<br>

## Installation

- ### For iOS (Universal Link):
  1. <b>Clone the repository:</b>
     ```rb
     git clone https://github.com/MarwanAdel1/Deep-link.git
     ```
  2. <b>Open the project in Xcode.</b>.
  3. <b>Configure Associated Domains:</b>
      - In Xcode, navigate to the <b>Capabilities</b> tab.
      - Turn on Associated Domains and add your domain with the following format:
        ```
        applinks:yourdomain.com
        ```
      - This will enable your app to handle Universal Links.
  4. Build and run the app on your iOS device or simulator.


- ### For Android (App Links):
  1. Clone the repository:
     ```rb
     git clone https://github.com/MarwanAdel1/Deep-link.git
     ```
  3. <b>Open the project in Android Studio</b>.
  4. <b>Configure App Links:</b>
      - In ``` AndroidManifest.xml ```, make sure the deep link ``` <intent-filter> ``` is correctly set up for App Links:
        ```rb
        <intent-filter>
          <action android:name="android.intent.action.VIEW" />
          <category android:name="android.intent.category.DEFAULT" />
          <category android:name="android.intent.category.BROWSABLE" />
          <data android:scheme="myapp" android:host="product" />
        </intent-filter>
        ```
      - This will ensure the app handles deep links in the format
        ```rb
        myapp://product/{product_id}.
        ```
  5. Build and run the app on your android device or emulator.

<br>

## Deep Link Configuration:
Deep links are URLs that open specific content or pages inside your app.
- There is two type of deep linking:
  1. <b>Universal Links (iOS) and App Links (Android):</b> These work across both the web and the app. If the app is installed, the deep link opens the app directly. If the app is not installed, the link will open a webpage or direct the user to the app store to install the app.
  2. Custom URL Scheme: This is a custom scheme (myapp://) used to open the app to a specific page, like a product page or a user profile. These links will work even if the app is not installed (they will fall back to the web or app store).

<br>

## Deep Link Example:

- Home page deep link:- https://deeplink-testing.com
- Products list page deep link:- https://deeplink-testing.com?screen=product-list
- Product details page deep link:- https://deeplink-testing.com?screen=product-details&id=5

  - ### How to add new deep links:
    - For iOS, update the app's <b>Associated Domains</b>.
    - For Android, modify the ``` AndroidManifest.xml ``` to include a new ``` <intent-filter> ``` for each link scheme.

<br>

## Server Configuration
For deep links to work correctly, you need to configure your <b>server</b> to handle the <b>Universal Links</b> (for iOS) and <b>App Links</b> (for Android) properly, and provide fallback pages if the app is not installed. Below are the necessary configurations for your server.

  - ### Universal Links (iOS)
    Universal Links allow you to open your app if it’s installed and fallback to a webpage if it’s not. To handle Universal Links, you need to configure the <b>Apple App Site Association (AASA)</b> file on your server.
    - <b>Apple App Site Association (AASA) File:</b>
        1. <b>Create the AASA file:</b> The AASA file should include your app's bundle identifier and the paths that your app will handle.
            - Example:
            ```rb
            {
                applinks": {
                  "details": [
                    {
                      "appID": "TeamID.BundleIdentifier",
                      "paths": [
                        "/product/*",
                        "/offer/*",
                        "/user/*"
                      ]
                    }
                  ]
                }
              }
              ```
         2. <b>Host the AASA file:</b> The file must be hosted at a specific location:
            ```
            https://yourdomain.com/.well-known/apple-app-site-association
            ```
         3. <b>Configure the server to serve the AASA file:</b>
            - <b>Nginx</b> configuration:
              ```rb
              location /.well-known/apple-app-site-association {
                default_type application/json;
                root /path/to/your/server/root;
              }
              ```
            - <b>Apache</b> configuration:
              ```rb
              <Files ".well-known/apple-app-site-association">
                ForceType application/json
              </Files>
              ```
  - ### App Links (Android)
    App Links work similarly to Universal Links but are specific to Android. You need to configure the <b>assetlinks.json</b> file to allow Android devices to open the app via deep links.
    - <b>assetlinks.json File:</b>
      1. <b>Create the assetlinks.json file:</b> The file should include your app's package name and the SHA256 fingerprint of your app's certificate.
         - Example:
           ```rb
           [
             {
               "relation": ["delegate_permission/common.handle_all_urls"],
               "target": {
                 "namespace": "android_app",
                 "package_name": "com.example.app",
                 "sha256_cert_fingerprints": [
                   "A1:B2:C3:D4:E5:F6:G7:H8:I9:J0:K1:L2:M3:N4:O5:P6:Q7:R8:S9:T0:U1"
                 ]
               }
             }
           ]
           ```
      2. <b>Host the assetlinks.json file:</b> The file must be hosted at the following location:
         ```
         https://yourdomain.com/.well-known/assetlinks.json
         ```
      3. <b>Configure the server to serve the assetlinks.json file:</b>
          - <b>Nginx</b> configuration:
            ```rb
            location /.well-known/assetlinks.json {
              default_type application/json;
              root /path/to/your/server/root;
            }
            ```
          - <b>Apache</b> configuration:
              ```rb
              <Files ".well-known/assetlinks.json">
                ForceType application/json
              </Files>
              ```

  - ### Fallback Web Pages
    If the user doesn't have the app installed, deep links should fallback to a <b>web page</b> (e.g., a product page or user profile). Ensure your server routes URLs correctly for such fallback behavior.
    1. <b>Set up dynamic routing on your server:</b> Configure your web server to serve dynamic content based on the deep link parameters, such as product or user IDs.
    2. <b>HTTPS:</b> Ensure your server uses HTTPS (SSL/TLS) for security and to meet the requirements of Universal and App Links.
        
<br>

## How to use the App
- Open the app on your iOS or Android device.
- Test deep links by clicking on links like myapp://product/12345 or myapp://user/67890 from an email, a website, or any external source.
- If the app is installed, the deep link will open the app directly to the specified content.
- If the app is not installed, the link will fallback to a webpage or prompt the user to install the app.   


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
3. [Deep Link Configuration](#deep-link-configuration)
4. [Deep Link Example](#deep-link-example)
5. [Server Configuration](#server-configuration)
6. [How to use the App](#how-to-use-the-app)
7. [Usage](#usage)
8. [Testing](#testing)
9. [Known Issues](#known-issues)
