---
layout: post
date: 2020-11-29 11:11:00 +0800
tags: iOS
categories: programming
title: "Apple reject new app's ipa commiting caused by UIWebView"
---

Yesterday, I archieve the treector app to App Store and receive the ipa rejection email.
If the email sent from Apple contains the words "We identified one or more issues with a recent delivery for your app, "xxx" x.x (xxx). Please correct the following issues, then upload again."

It means your ipa submitting is failed. If you do not correct the issues, your build ipa cannot be displayed in the itunesconnect.


<br>

`The issues of this time is mainly about the UIWebView`

References from the email content:
ITMS-90683: Missing Purpose String in Info.plist - Your app's code references one or more APIs that access sensitive user data. The app's Info.plist file should contain a NSPhotoLibraryUsageDescription key with a user-facing purpose string explaining clearly and completely why your app needs the data. Starting Spring 2019, all apps submitted to the App Store that access user data are required to include a purpose string. If you're using external libraries or SDKs, they may reference APIs that require a purpose string. While your app might not use these APIs, a purpose string is still required. You can contact the developer of the library or SDK and request they release a version of their code that doesn't contain the APIs. Learn more (https://developer.apple.com/documentation/uikit/core_app/protecting_the_user_s_privacy).


So use the following command to find the files contain `IUWebView` 
```
cd your_project_folder
grep -r UIWebView .
```

It turns out that the pod AFNetwroking and BlocksKit have the category of the UIWebView Which I did not reference any in my project.
I download the source code directly from github.Removed the `UIWebView+AFNetworking.h` and `UIWebView+BlocksKit.h` then rearchive my app, upload the ipa to Apple again:)

### After I removed the UIWebView related code and resubmited the ipa to Apple I received the email that indecated the ipa I submitted is successful.

As Apple replied

```
On average, 50 percent of apps are reviewed in 24 hours and over 90 percent are reviewed in 48 hours. Once we've completed the review, your app's status will be updated and you will be notified.
```


I will post more about the incoming rejection about the treector app in future.