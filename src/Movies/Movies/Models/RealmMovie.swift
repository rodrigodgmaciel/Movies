//
//  RealmMovie.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMovie: Object {
    
    dynamic var imdbID = ""
    dynamic var response = false
    
    dynamic var title: String?
    dynamic var year: String?
    dynamic var rated: String?
    dynamic var released: String?
    dynamic var runtime: String?
    dynamic var genre: String?
    dynamic var director: String?
    dynamic var writer: String?
    dynamic var actors: String?
    dynamic var plot: String?
    dynamic var language: String?
    dynamic var country: String?
    dynamic var awards: String?
    dynamic var poster: String?
    dynamic var metascore: String?
    dynamic var imdbRating: String?
    dynamic var imdbVotes: String?
    dynamic var type: String?
    
    
    override static func primaryKey() -> String? {
        return "imdbID"
    }
}

extension RealmMovie {
    
    convenience init(movie: Movie) {
        
        self.init()
        
        self.imdbID = movie.imdbID!
        self.response = movie.response!
        self.title = movie.title
        self.year = movie.year
        self.rated = movie.rated
        self.released = movie.released
        self.runtime = movie.runtime
        self.genre = movie.genre
        self.director = movie.director
        self.writer = movie.writer
        self.actors = movie.actors
        self.plot = movie.plot
        self.language = movie.language
        self.country = movie.country
        self.awards = movie.awards
        self.poster = movie.poster
        self.metascore = movie.metascore
        self.imdbRating = movie.imdbRating
        self.imdbVotes = movie.imdbVotes
        self.type = movie.type
        
    }
    
    var movie: Movie {
        return Movie(title: title,
                     year: year,
                     rated: rated,
                     released: released,
                     runtime: runtime,
                     genre: genre,
                     director: director,
                     writer: writer, actors: actors,
                     plot: plot,
                     language: language,
                     country: country,
                     awards: awards,
                     poster: poster,
                     metascore: metascore,
                     imdbRating: imdbRating,
                     imdbVotes: imdbVotes,
                     imdbID: imdbID,
                     type: type,
                     response: response
        )
    }
}
