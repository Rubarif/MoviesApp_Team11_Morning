import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Image(systemName: "film")
                    .imageScale(.large)
                    .font(.system(size: 48))
                Text("Movies App")
                    .font(.title).bold()
                Text("Welcome!")
                    .foregroundStyle(.secondary)

                NavigationLink("Go to Details") {
                    MovieDetailsView()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
