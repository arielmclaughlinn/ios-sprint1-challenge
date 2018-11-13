import Foundation
import UIKit

class Model {
    //Singleton
    static let shared = Model()
    private init() {}
    
    //Setting up an empty array of movies
    private var movies: [String] = []
    
    //Adding our movies
    func addMovie(_ movie: String) {
        movies.append(movie)
        saveData()
    }
    //Allowing user to remove a movie
    func removeMovie(at index: Int) {
        movies.remove(at: index)
        saveData()
    }
    
    func movieCount() -> Int {
        return movies.count
    }
    
    //Removes from index in the cell
    func moveMovie(at index: Int, to destinationIndex: Int) {
        let movie = movies.remove(at: index)
        movies.insert(movie, at: destinationIndex)
        saveData()
    }
    
    
    func movie(at index: Int) -> String {
        return movies[index]
    }
    
    let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Library")
        .appendingPathComponent("Films")
        .appendingPathExtension("plist")
    
    
    func saveData() {
        try! (movies as NSArray).write(to: fileURL)
        
        
    }
    
    func loadData() {
        if let movies = NSArray(contentsOf: fileURL) as? [String] {
            self.movies = movies
        }
    }
}

