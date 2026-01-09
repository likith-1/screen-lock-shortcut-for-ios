import AppIntents
import SwiftUI

struct LockScreenIntent: AppIntent {
    static var title: LocalizedStringResource = "Lock Screen"
    static var description = IntentDescription("Locks the device screen by triggering a system shortcut.")
    
    // Typically AppIntents run in the background, but since we might need to open a URL scheme
    // to trigger another shortcut, we might need to bring the app to foreground or just rely on the system.
    // However, for "Lock Screen" specifically, Apple doesn't provide a direct API.
    // The most reliable way for a utility app is to ask the user to run a Shortcut or use this Intent 
    // to trigger a Shortcut via deep link if direct execution isn't possible.
    
    // "openAppWhenRun" is true to ensure we can launch the URL scheme if needed.
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        // Attempt to run the "Lock Screen" shortcut users might have, 
        // or a system command if available in future iOS versions.
        // For now, we utilize the URL scheme to run a shortcut named "Lock Screen".
        // The URL format is: shortcuts://run-shortcut?name=Lock%20Screen
        
        if let url = URL(string: "shortcuts://run-shortcut?name=Lock%20Screen") {
            await UIApplication.shared.open(url)
        }
        
        return .result()
    }
}
