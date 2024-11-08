import SwiftUI
import WidgetKit

struct DemoEntry: TimelineEntry {
    let date: Date
    let info: String
}

struct DemoProvider: TimelineProvider {
    typealias Entry = DemoEntry

    func placeholder(in context: Context) -> Entry {
        .init(
            date: .init(),
            info: "Placeholder"
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        completion(
            .init(
                date: .init(),
                info: "Snapshot"
            )
        )
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let entries: [DemoEntry] = [
            .init(date: .init(), info: "Hello"),
        ]

        let timeline = Timeline(
            entries: entries,
            policy: .never
        )

        completion(timeline)
    }
}

struct DemoEntryView: View {
    let entry: DemoProvider.Entry

    init(entry: DemoProvider.Entry) {
        self.entry = entry
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: .init(colors: [.red, .orange, .yellow]),
                        startPoint: .init(x: 0.45, y: 0),
                        endPoint: .init(x: 0.55, y: 1)
                    )
                )

            VStack {
                Text(entry.info)
                    .bold()
                    .foregroundColor(.white)

                Image("battery_icon")
            }
        }
    }
}

struct DemoWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "Demo",
            provider: DemoProvider()
        ) {
            DemoEntryView(entry: $0)
        }
        .configurationDisplayName("Demo")
        .description("Demo")
        .supportedFamilies([.systemSmall, .systemMedium])
        .contentMarginsDisabled()
    }
}
