//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by TROJAN on 2025/6/11.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    
    init(titleFilter: String = "") {
        // use predicates（查询谓词）to describe conditions for SwiftData to filter data.
        // A Query applies its predicate to each of the items in the data store.
        let predicate = #Predicate<Movie> { movie in
            // Returning true from a predicate indicates that you want to see the item.
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        // 以 _ 开头的属性是 Query 在底层创建的属性，通常不需要与它交互，但是需要创建一个自定义的 query 时，就得访问它
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    var body: some View {
        Group {
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(movie.title) {
                            MovieDetail(movie: movie)
                        }
                    }
                    .onDelete(perform: deleteMovies(indexes:)) // deleteMovies(indexes:) 这种写法表示带外部参数名的函数引用
                }
            } else {
                ContentUnavailableView("Add Movie", systemImage: "film.stack")
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem {
                Button("Add movie", systemImage: "plus", action: addMovie)
            }
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        .sheet(item: $newMovie) { movie in
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    
    private func addMovie() {
        let newMovie = Movie(title: "New Movie", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes: IndexSet) {
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(for: Movie.self, inMemory: true)
    }
}
