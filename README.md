# Screen Lock Utility for iOS 🔒

A minimalist SwiftUI application that provides a quick and accessible way to lock your iPhone screen. 

Start locking your screen with a single tap on a large power button, or ask Siri!

## 🚀 Features

*   **One-Tap Locking**: Large, accessible "Power" button to immediately lock the device.
*   **Siri Integration**: "Hey Siri, Lock Screen with ScreenLock".
*   **Minimalist Design**: Sleek dark mode interface with haptic feedback.
*   **Home Screen Ready**: Designed to be added to your Home Screen for quick access.

## ⚠️ Important Logic

iOS does not provide a public API for third-party apps to directly lock the screen due to sandboxing restrictions. 

**This app acts as a bridge:**
1.  It uses **App Intents** and **URL Schemes** (`shortcuts://`).
2.  It triggers a standard iOS **Shortcut** that performs the actual system lock.

## 🛠 Prerequisites

*   **Mac** with **Xcode 14+** (for App Intents support).
*   **iPhone** running **iOS 16.0+**.

## ⚙️ Setup Instructions (Crucial Step)

Before the app can work, you must create a simple Shortcut on your iPhone. This is a **one-time setup**.

1.  Open the **Shortcuts** app on your iPhone.
2.  Tap the **+** (plus) icon to create a new shortcut.
3.  Tap **Add Action**.
4.  Search for **Lock Screen** (under Scripting) and select it.
5.  Tap the arrow next to the shortcut name (top of screen) and select **Rename**.
6.  Name it exactly: `Lock Screen` (Case sensitive).
7.  Tap **Done**.

> **Note**: If you name it something else, you must update the URL in `ContentView.swift` and `LockScreenIntent.swift` to match (e.g., `shortcuts://run-shortcut?name=YourName`).

## 📲 How to Build & Install

1.  **Clone this repository**:
    ```bash
    git clone https://github.com/likith-1/screen-lock-shortcut-for-ios.git
    ```
2.  **Open in Xcode**:
    *   Transfer the files to your Mac if you haven't already.
    *   Create a new iOS App project in Xcode.
    *   Replace the default files (`ScreenLockApp.swift`, `ContentView.swift`) with the files from this repo.
    *   Add `LockScreenIntent.swift` and `LockScreenShortcuts.swift` to the project.
3.  **Run**:
    *   Connect your iPhone.
    *   Select your device in Xcode and hit **Run (Cmd+R)**.
    *   **Permission**: The first time you tap the button, iOS will ask permission to open Shortcuts. Tap **Allow**.

## 🤖 Siri Commands

Once installed, the App Shortcuts are automatically registered. You can say:
*   *"Lock screen with [App Name]"*
*   *"Turn off screen with [App Name]"*

## 📄 License

This project is open source and available under the MIT License.
