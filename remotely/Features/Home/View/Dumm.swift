//
//  Dumm.swift
//  remotely
//
//  Created by cagla copuroglu on 5.08.2022.
//

import UIKit
import SnapKit

class TestCellOriginal: UITableViewCell {
    static let identifier: String = "test_cell_identifier"

    var label: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }

    func configure() {
        label = UILabel(frame: .zero)
        self.contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(50)
            $0.bottom.equalToSuperview().offset(-50)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DumViewController: UIViewController {
    var data: [String] = [
        "Test1",
        "Test2",
        "Test3"
    ]

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.register(TestCellOriginal.self, forCellReuseIdentifier: TestCellOriginal.identifier)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.estimatedRowHeight = 100
    }
}

extension DumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestCellOriginal.identifier, for: indexPath) as! TestCellOriginal
        cell.label.text = data[indexPath.item]
        return cell
    }
}
