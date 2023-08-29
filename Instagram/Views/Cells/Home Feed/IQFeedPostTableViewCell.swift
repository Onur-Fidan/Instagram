//
//  IQFeedPostTableViewCell.swift
//  Instagram
//
//  Created by Onur Fidan on 29.08.2023.
//

import UIKit

final class IQFeedPostTableViewCell: UITableViewCell {

    static let identifer = "IQFeedPostTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        //Configure the cell
    }

}
