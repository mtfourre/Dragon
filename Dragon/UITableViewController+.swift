//
//  UITableViewController+.swift
//  Dragon
//
//  Created by Michael Fourre on 2/20/17.
//  Copyright © 2017 MealSloth. All rights reserved.
//

import UIKit

extension UITableViewController {
    func registerNib(withName name: String) {
        self.tableView.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}

extension UITableViewController {
    fileprivate func reload(at rows: [IndexPath], animated: Bool = true) {
        MainQueue.async({ () -> Void in
            self.tableView.reloadRows(at: rows, with: animated ? .automatic : .none)
        })
    }
    
    fileprivate func reload(in sections: IndexSet, animated: Bool = true) {
        MainQueue.async({ () -> Void in
            self.tableView.reloadSections(sections, with: animated ? .automatic : .none)
        })
    }
    
    fileprivate func reloadData() {
        MainQueue.async({ () -> Void in
            self.tableView.reloadData()
        })
    }
    
    func reloadRows(between lower: Int, and upper: Int, in section: Int = 0, animated: Bool = true) {
        let range = stride(from: lower, to: upper, by: 1)
        let rows = range.map({ IndexPath(row: $0, section: section) })
        self.reload(at: rows, animated: animated)
    }
    
    func reloadSections(between lower: Int, and upper: Int, animated: Bool = true) {
        self.reload(in: IndexSet(lower...upper), animated: animated)
    }
    
    func reload(animated: Bool = true) {
        let upper = self.numberOfSections(in: self.tableView) - 1
        animated ? self.reloadSections(between: 0, and: upper) : self.reloadData()
    }
}
