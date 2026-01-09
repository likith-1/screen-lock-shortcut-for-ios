import SwiftUI

@main
struct ScreenLockApp: App {
    init() {
        // Register the App Shortcuts when the app launches
        LockScreenShortcuts.updateAppShortcutParameters()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark) // Force dark mode for a sleek look
        }
    }
}
