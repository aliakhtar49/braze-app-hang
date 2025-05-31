# Braze App Hang Example

This repository provides a minimal reproducible example of an app hang observed when integrating the [Braze Swift SDK](https://github.com/braze-inc/braze-swift-sdk) into an iOS app.

## 🔍 Problem Summary

The original issue is reported here:  
👉 [Braze Swift SDK Issue #163](https://github.com/braze-inc/braze-swift-sdk/issues/163)

In this example app, the following call causes a noticeable delay during launch: It blocked the main thread
<img width="1443" alt="Screenshot 2025-05-31 at 6 02 17 PM" src="https://github.com/user-attachments/assets/bea486a0-d666-4006-b8b2-2b8a16d9e44a" />
```swift
BrazeViewStore.enabled = true


