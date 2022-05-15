//
//  HomeView.swift
//  Mobillium Project
//
//  Created Çağatay Eğilmez on 15.05.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit
import PullToRefresh

protocol HomeViewDelegate: AnyObject {
    func redirectionMoviewDetail(movieId: Int!)
    func refreshTable()
}

final class HomeView: UIView {

	// MARK: - Properties
    private(set) lazy var carouselView: CarouselView = {
        let view = CarouselView()
        view.delegate = self
        return view
    }()
    
    private lazy var refresher: PullToRefresh = {
        let refresher = PullToRefresh()
        refresher.position = .top
        refresher.shouldBeVisibleWhileScrolling = false
        return refresher
    }()
    
    private lazy var tableHeaderView: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.register(cell: HomeTableViewCell.self)
        view.separatorStyle = .none
        view.addPullToRefresh(refresher) { [weak self] in
            self?.delegate?.refreshTable()
        }
        return view
    }()

    let screenSize = UIScreen.main.bounds
    weak var delegate: HomeViewDelegate?
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        arrangeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Arrange Views
    private func arrangeViews() {
        self.backgroundColor = .gray
        addSubview(tableView)
        tableHeaderView.addSubview(carouselView)
        
        tableView.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor, topPadding: -75)
        
        tableHeaderView.frame = CGRect(x: 0, y: 0, width: self.screenSize.width, height: screenSize.height/2.7)
        tableView.tableHeaderView = tableHeaderView
        
        carouselView.fillSuperview()
    }
}

//MARK: - CarouselView Delegate
extension HomeView: CarouselViewDelegate {
    func redirectionMoviewDetail(movieId: Int!) {
        self.delegate?.redirectionMoviewDetail(movieId: movieId)
    }
}
