//
//  ShimmerDataSource.swift
//  NewsStar
//
//  Created by Ravi Mishra on 06/12/20.
//

import UIKit
class ShimmerDataSource: GenericDataSource<Int>, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShimmerTVCell.description(), for: indexPath) as! ShimmerTVCell
        return cell
    }
}
