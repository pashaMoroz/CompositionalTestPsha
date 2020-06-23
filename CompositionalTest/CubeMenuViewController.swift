//
//  CubeMenuViewController.swift
//  CompositionalTest
//
//  Created by Pavel Moroz on 22.06.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class CubeMenuViewController: UIViewController {

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigationBar()
    }

    func setupTableView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)


        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(MainTableCell.self, forCellReuseIdentifier: MainTableCell.reuseId)
        tableView.register(ImageTableCell.self, forCellReuseIdentifier: ImageTableCell.reuseId)

        tableView.delegate = self
        tableView.dataSource = self

        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none

    }

    func setupNavigationBar() {

        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Button Back Light Mode Icon"), style: .plain, target: self, action: #selector(back))

    }
}

extension CubeMenuViewController {

    @objc func back() {
          navigationController?.popViewController(animated: true)
          dismiss(animated: true, completion: nil)
      }
}

extension CubeMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableCell.reuseId, for: indexPath) as! ImageTableCell
            cell.setupCell(image: #imageLiteral(resourceName: "Block 4"))
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainTableCell.reuseId, for: indexPath) as! MainTableCell

            switch indexPath.row {
            case 0:

                if UIDevice.current.userInterfaceIdiom != .pad {
                    cell.setupCell(mainLabel: "ADD TO WHATSAPP",
                                   description: "To add this Sticker Pack to WhatsApp push the button and follow instructions.",
                                   buttonName: "Add Stickers to WhatsApp", color: #colorLiteral(red: 0.6039215686, green: 1, blue: 0.5803921569, alpha: 1), buttonColor: .systemGreen, userInterfaceIdiomIpad: false)
                } else {
                    cell.setupCell(mainLabel: "OPS", description: "WhatsApp не имеет версии для iPad. Если вы хотите добавть стикеры в WhatsApp Вы можете сделать это на Вашем iPhone.", buttonName: "", color: #colorLiteral(red: 0.6039215686, green: 1, blue: 0.5803921569, alpha: 1), buttonColor: .green, userInterfaceIdiomIpad: true)
                }
            case 1:
                cell.setupCell(mainLabel: "CHECK OUT SOME MORE",
                               description: "We’ve made lots of awesome apps and stickers. Feel free to try it out!",
                               buttonName: "Go to Developer Account", color: #colorLiteral(red: 0.8705882353, green: 0.6196078431, blue: 1, alpha: 1), buttonColor: .systemPurple, userInterfaceIdiomIpad: false)

            case 2:
                cell.setupCell(mainLabel: "REVIEW",
                               description: "Rate us please! 5 stars review is what cheer us up! Thank you!",
                               buttonName: "Rate 5 ★", color: #colorLiteral(red: 1, green: 0.831372549, blue: 0, alpha: 1), buttonColor: .systemOrange, userInterfaceIdiomIpad: false)
                
            default:
                break
            }
            //cell.backgroundColor = .orange
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 184
    }
}
