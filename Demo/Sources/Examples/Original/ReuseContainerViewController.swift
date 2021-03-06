//
//  ReuseContainerViewController.swift
//  PageKitDemo
//
//  Created by Jack on 4/14/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import Foundation
import PageKit
import SnapKit

class ReuseContainerViewController: BaseContainerViewController<ReuseContainer>, ReuseContainerDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configContainer() {
        super.configContainer()
        container.register(UIImageView.self)
        container.register(ActionViewController.self)
        container.dataSource = self
    }
    
    func numberOfPages() -> Int {
        return 10
    }
    
    func container(_ container: ReuseContainer, pageForIndexAt index: Int) -> Page {
        
        if index % 2 == 0, let page = container.dequeueReusablePage(withIdentifier: UIImageView.reuseIdentifier) as? UIImageView {
            page.image = #imageLiteral(resourceName: "origin_background0")
            return page
        } else if let page = container.dequeueReusablePage(withIdentifier: ActionViewController.reuseIdentifier) as? ActionViewController {
            return page
        } else {
            let view = UIImageView()
            view.backgroundColor = .red
            return view
        }
    }
}

class ActionViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "origin_background1"), for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func buttonClicked() {
        
    }
}
