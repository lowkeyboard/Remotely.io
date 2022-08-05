//
//  PokemonTableCell.swift
//  remotely
//
//  Created by cagla copuroglu on 5.08.2022.
//

import UIKit
import AlamofireImage
import SnapKit

class PokemonTableCell: UITableViewCell {
    static let identifier: String = "pokemon_cell"
    var label: UILabel!
    private let customImage: UIImageView = UIImageView()

    private let randomImage: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }

    func configure() {
        self.backgroundColor = .RTGreyLight
        label = UILabel(frame: .zero)
        self.contentView.addSubview(label)
        self.contentView.addSubview(customImage)

        label.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        customImage.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }

        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func saveModel(pokemon: PokemonPresentation, index: Int) {
        label.text = pokemon.title
        customImage.af.setImage(withURL: URL(string: randomImage + "\(index+1).png" ) ?? URL(string: randomImage + "3.png")!)
    }


}
