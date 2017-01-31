//
//  MoviesViewController.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

import RealmSwift

class MoviesViewController: UIViewController {
    
    let realm = try! Realm()
    let disposeBag = DisposeBag()
    var tableViewDataSource: MoviesViewDataSource!
    var repositoryModel: RepositoryModel!
    
    private static let estimatedCellHeight: CGFloat = 160

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = MoviesViewController.estimatedCellHeight
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.barTintColor = Constants.colorDefault
        search.dimsBackgroundDuringPresentation = false
        return search
    }()
    
    var movies = [MovieViewModel]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
}

     //MARK: - LifeCycle
extension MoviesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        definesPresentationContext = true
        setupTableView()
        setupSearch()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

    //MARK: - Setup
extension MoviesViewController {
    
    func setupTableView() {
        
        self.tableView.register(MovieViewCell.self)
        self.tableViewDataSource = MoviesViewDataSource()
        self.tableViewDataSource.moviesViewController = self
        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self.tableViewDataSource
        
        self.tableView.tableHeaderView = searchController.searchBar
        self.tableView.backgroundColor = Constants.colorDefault
        self.tableView.hideEmptyCells()
    }
    
    func setupSearch(){
        
        let searchObservable = self.searchController.searchBar.rx.text.debounce(0.5, scheduler: MainScheduler.instance).flatMap { (text: String?) -> Observable<[RealmMovie]> in
            if let query = text, query.characters.count > 2 {
                    let str = Observable<String>.just(query)
                    self.repositoryModel = RepositoryModel(withNameObservable: str)
                    return self.repositoryModel.searchMovies(with: query)
            } else {
                return Observable<[RealmMovie]>.just([])
            }
        }
    
        searchObservable.subscribe { event in
            switch event {
            case .next(let movie):
                self.movies = movie.map({MovieViewModel(movie: $0.movie)})
            default: break
            }
        }.addDisposableTo(self.disposeBag)
    }
}

    //MARK: - Navigation
extension MoviesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MovieDetailsViewController"{
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            let pushViewController = segue.destination as? MovieDetailsViewController
            pushViewController?.movie = self.movies[indexPath.row]
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

