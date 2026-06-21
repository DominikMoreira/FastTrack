import SwiftUI
import Playgrounds

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View{
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 200)),
    ]
    
    @AppStorage("searchText") var searchText = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search for a Song", text: $searchText)
                Button("Search") {
                    // action code
                }
            }
        }
        
        ScrollView {
            LazyVGrid(columns: gridItems) {
                ForEach(1..<100) { i in
                    Color.red
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
