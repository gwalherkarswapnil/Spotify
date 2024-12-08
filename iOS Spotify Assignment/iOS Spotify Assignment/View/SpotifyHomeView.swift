import SwiftUI

struct SpotifyHomeView: View {
    @StateObject private var viewModel = SpotifyHomeViewModel()
    @State private var showAddPlaylistView = false

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Text("Your Library")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        showAddPlaylistView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
                .padding()
                
                // Filter/Search Bar
                HStack {
                    TextField("Search playlists", text: $viewModel.searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        viewModel.isGridView.toggle()
                    }) {
                        Image(systemName: viewModel.isGridView ? "square.grid.2x2" : "list.bullet")
                            .font(.title2)
                    }
                    .padding(.trailing)
                }
                
                // Playlists Grid/List
                ScrollView {
                    if viewModel.isGridView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                            ForEach(viewModel.filteredPlaylists) { playlist in
                                PlaylistGridItem(playlist: playlist)
                            }
                        }
                        .padding()
                    } else {
                        VStack {
                            ForEach(viewModel.filteredPlaylists) { playlist in
                                PlaylistListItem(playlist: playlist)
                            }
                        }
                        .padding()
                    }
                    
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddPlaylistView) {
                AddPlaylistView(viewModel: viewModel)
            }
            .onAppear {
                viewModel.loadPlaylists()
            }
        }
    }
}

// Playlist Grid Item
struct PlaylistGridItem: View {
    let playlist: Playlist

    var body: some View {
        VStack {
            ZStack {
                ForEach(playlist.coverImages.prefix(4), id: \.self) { imageName in
                    Image("image_playlist")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(8)
                }
            }
            .frame(width: 120, height: 120)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8)
            
            Text(playlist.title)
                .fontWeight(.bold)
                .lineLimit(1)
                .padding(.top, 4)
            
            Text(playlist.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

// Playlist List Item
struct PlaylistListItem: View {
    let playlist: Playlist

    var body: some View {
        HStack {
            ZStack {
                ForEach(playlist.coverImages.prefix(4), id: \.self) { imageName in
                    Image(systemName: "music.note")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                        .cornerRadius(8)
                }
            }
            .frame(width: 80, height: 80)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(playlist.title)
                    .fontWeight(.bold)
                
                Text(playlist.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    SpotifyHomeView()
}

struct BottomTabBarView: View {
    var body: some View {
        TabView {
            SpotifyHomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Text("Search View")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            SpotifyHomeView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical")
                }
        }
    }
}


