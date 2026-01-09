import AppIntents
import SwiftUI

struct LockScreenShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: LockScreenIntent(),
            phrases: [
                "Lock screen with \(.applicationName)",
                "Turn off screen with \(.applicationName)",
                "Power off \(.applicationName)"
            ],
            shortTitle: "Lock Screen",
            systemImageName: "power.circle.fill"
        )
    }
    
    static var shortcutTileColor: ShortcutTileColor = .gray
}
