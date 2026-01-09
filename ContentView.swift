import SwiftUI

struct ContentView: View {
    @State private var showHelp = false
    @State private var isPressed = false
    
    // The URL structure to run a specific shortcut.
    // NOTE: This requires the user to have a Shortcut named "Lock Screen".
    private let shortcutUrl = URL(string: "shortcuts://run-shortcut?name=Lock%20Screen")!
    
    var body: some View {
        ZStack {
            // Background: Sleek dark gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color(red: 0.1, green: 0.1, blue: 0.15)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Main Power Button
                Button(action: {
                    triggerLockScreen()
                }) {
                    Image(systemName: "power.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.red, .orange],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .red.opacity(0.5), radius: 20, x: 0, y: 0)
                        .scaleEffect(isPressed ? 0.95 : 1.0)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
                }
                .buttonStyle(PressableButtonStyle(isPressed: $isPressed))
                
                Text("Tap to Lock")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.top, 20)
                
                Spacer()
                
                // Help / Setup Button
                Button(action: {
                    showHelp = true
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                        Text("Setup Instructions")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding()
                }
            }
        }
        .sheet(isPresented: $showHelp) {
            HelpView()
        }
    }
    
    private func triggerLockScreen() {
        // Haptic feedback
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        // Open the shortcuts URL
        if UIApplication.shared.canOpenURL(shortcutUrl) {
            UIApplication.shared.open(shortcutUrl)
        }
    }
}

// Custom button style to handle press state animation
struct PressableButtonStyle: ButtonStyle {
    @Binding var isPressed: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .onChange(of: configuration.isPressed) { pressed in
                isPressed = pressed
            }
    }
}

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Required Setup")) {
                    Text("1. Open the **Shortcuts** app on your iPhone.")
                    Text("2. Tap **+** to create a new shortcut.")
                    Text("3. Tap **Add Action** and search for **'Lock Screen'**.")
                    Text("4. Select the 'Lock Screen' scripting action.")
                    Text("5. Tap the arrow next to the shortcut name at the top, select **Rename**, and name it exactly:")
                        .fixedSize(horizontal: false, vertical: true)
                    Text("Lock Screen")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .listRowBackground(Color.blue.opacity(0.1))
                    Text("6. Tap **Done**.")
                }
                
                Section(header: Text("Add to Home Screen")) {
                    Text("You can also add this app to your Home Screen for quick access.")
                }
            }
            .navigationTitle("Setup Guide")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
