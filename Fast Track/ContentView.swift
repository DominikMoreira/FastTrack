import SwiftUI
import Playgrounds

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 200)),
    ]
    
    @State private var tracks = [Track]()
    
    @AppStorage("searchText") var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for a Song", text: $searchText)
                    .onSubmit { startSearch() }
                Button("Search", action: startSearch)
            }
        }
        
        ScrollView {
            LazyVGrid(columns: gridItems) {
                ForEach(tracks) { track in
                    Text(track.trackName)
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
    
    func performSearch() async throws {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchText)&limit=100&entity=song") else { return }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        
        tracks = searchResult.results
    }

    func startSearch() {
        Task {
            try await performSearch()
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
