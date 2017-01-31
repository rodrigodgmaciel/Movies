//
//  MovieViewModel.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation

final class MovieViewModel {
    
    let movie: Movie

    var titleText: String? {
        return movie.title
    }
    var year: String? {
        return movie.year
    }
    var rated: String? {
        return movie.rated
    }
    var released: String? {
        return movie.released
    }
    var runtime: String? {
        return movie.runtime
    }
    var genre: String? {
        return movie.genre
    }
    var director: String? {
        return movie.director
    }
    var writer: String? {
        return movie.writer
    }
    var actors: String? {
        return movie.actors
    }
    var plot: String? {
        return movie.plot
    }
    var language: String? {
        return movie.language
    }
    var country: String? {
        return movie.country
    }
    var awards: String? {
        return movie.awards
    }
    var poster: URL? {
        return URL(string: movie.poster!)
    }
    var metascore: String? {
        return movie.metascore
    }
    var imdbRating: String? {
        return movie.imdbRating
    }
    var imdbVotes: String? {
        return movie.imdbVotes
    }
    var imdbID: String? {
        return movie.imdbID
    }
    var type: String? {
        return movie.type
    }
    var response: Bool? {
        return movie.response
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
