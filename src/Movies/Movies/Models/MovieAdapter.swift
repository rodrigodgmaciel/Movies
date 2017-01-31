//
//  MovieAdapter.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 16/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit
import SwiftyJSON

extension Movie {
    
    struct Keys {
        
        static let title = "Title"
        static let year = "Year"
        static let rated = "Rated"
        static let released = "Released"
        static let runtime = "Runtime"
        static let genre = "Genre"
        static let director = "Director"
        static let writer = "Writer"
        static let actors = "Actors"
        static let plot = "Plot"
        static let language = "Language"
        static let country = "Country"
        static let awards = "Awards"
        static let poster = "Poster"
        static let metascore = "Metascore"
        static let imdbRating = "imdbRating"
        static let imdbVotes = "imdbVotes"
        static let imdbID = "imdbID"
        static let type = "Type"
        static let response = "Response"
    }
}

final class MovieAdapter {
    
    var json: JSON
    
    init(json: JSON){
        self.json = json
    }
    
    func adapt() -> Movie {
        
        let movie = Movie(title: json[Movie.Keys.title].stringValue,
                          year: json[Movie.Keys.title].stringValue,
                          rated: json[Movie.Keys.title].stringValue,
                          released: json[Movie.Keys.released].stringValue,
                          runtime: json[Movie.Keys.runtime].stringValue,
                          genre: json[Movie.Keys.genre].stringValue,
                          director: json[Movie.Keys.director].stringValue,
                          writer: json[Movie.Keys.writer].stringValue,
                          actors: json[Movie.Keys.actors].stringValue,
                          plot: json[Movie.Keys.plot].stringValue,
                          language: json[Movie.Keys.language].stringValue,
                          country: json[Movie.Keys.country].stringValue,
                          awards: json[Movie.Keys.awards].stringValue,
                          poster: json[Movie.Keys.poster].stringValue,
                          metascore: json[Movie.Keys.metascore].stringValue,
                          imdbRating: json[Movie.Keys.imdbRating].stringValue,
                          imdbVotes: json[Movie.Keys.imdbVotes].stringValue,
                          imdbID: json[Movie.Keys.imdbID].stringValue,
                          type: json[Movie.Keys.type].stringValue,
                          response: json[Movie.Keys.response].boolValue)
        
        return movie
    }
}
