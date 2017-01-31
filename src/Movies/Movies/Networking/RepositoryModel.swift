//
//  RepositoryModel.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 22/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import RxAlamofire
import RxCocoa
import RxSwift
import SwiftyJSON

import RealmSwift

class RepositoryModel {
    
    private let disposeBag = DisposeBag()
    
    var repositoryName: Observable<String>
    private let realm = try! Realm()
    
    init(withNameObservable nameObservable: Observable<String>) {
        self.repositoryName = nameObservable
    }
    
    private func fetchRepositories() -> Observable<[RealmMovie]>{
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        return repositoryName
            .subscribeOn(MainScheduler.instance)
            .do(onNext: { response in
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            })
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMapLatest { text in
                return RxAlamofire
                    .requestJSON(.get, Constants.baseUrl + "t=\(text)")
                    .debug()
                    .catchError { error in
                        return Observable.never()
                }
            }
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .map { (response, json) -> [RealmMovie] in
                
                let items = JSON(json)
                let movie = MovieAdapter(json: items).adapt()
                return [RealmMovie(movie: movie)]
            }
            .observeOn(MainScheduler.instance)
            .do(onNext: {movie in
                let realm = try! Realm()
                try! realm.write {
                    realm.add(movie, update: true)
                }
            })
            .observeOn(MainScheduler.instance) 
            .do(onNext: { response in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            })
    }

    
    func searchMovies(with query: String?) -> Observable<[RealmMovie]> {
    
        let movies = self.realm.objects(RealmMovie.self).filter("title CONTAINS[c] '\(query!)'")
        
        if  !movies.isEmpty {
            return Observable.from(movies).map { realmMovies in
                return [realmMovies]
            }
        } else {
            return self.fetchRepositories()
        }
    }
}
