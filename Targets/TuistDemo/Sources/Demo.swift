import SwiftUI

@main
struct Demo: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        Image("battery_icon")
    }
}
