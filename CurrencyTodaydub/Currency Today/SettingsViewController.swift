//
//  SettingsViewController.swift
//  Currency Today
//
//  Created by Student on 18.07.25.
//

import UIKit

class SettingsOption{
    var name: String
    var backgroundColor: UIColor
    var backgroundImage: UIImage
    
    init(name: String, backgroundColor: UIColor, BackgroundImage: UIImage) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.backgroundImage = BackgroundImage
        
    }
}
class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var models = [SettingsOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        configure()
    }
    func configure(){
        models.append(contentsOf: [
            SettingsOption(name: "About program", backgroundColor: .lightGray, BackgroundImage: UIImage(systemName: "info.circle")!),
            SettingsOption(name: "Share", backgroundColor: .lightGray, BackgroundImage: UIImage(systemName: "square.and.arrow.up")!),
            SettingsOption(name: "Author", backgroundColor: .lightGray, BackgroundImage: UIImage(systemName: "person.crop.circle")!),
            SettingsOption(name: "Contact", backgroundColor: .lightGray, BackgroundImage: UIImage(systemName: "person.and.background.striped.horizontal")!),
            
        ])
    }
    
    @IBAction func home(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as?  HomeViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
    
    @IBAction func change(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ChangeViewController") as? ChangeViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if models[indexPath.item].name == "About program"{
            let alert = UIAlertController(title: "About", message: "This program has been created for people and it will help them to know the course of different values.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(alert, animated: true)
        }
        else if models[indexPath.item].name == "Share"{
//            let alert = UIAlertController(title: "Share", message: "", preferredStyle: .actionSheet)
//            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
//            self.present(alert, animated: true)
            let activityVC = UIActivityViewController(activityItems: [""], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true)
            
        }
        else if models[indexPath.item].name == "Author"{
            let alert = UIAlertController(title: "Author", message: "By Edmon Antonyan", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(alert, animated: true)
        }
       else if models[indexPath.item].name == "Contact"{
            let alert = UIAlertController(title: "Contact", message: "", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Facebook", style: .destructive, handler: { (action) in
                UIApplication.shared.open(URL(string: "https://www.facebook.com/") as! URL)
            }))
            alert.addAction(UIAlertAction(title: "Instagram", style: .destructive, handler: { (action) in
                UIApplication.shared.open(URL(string: "https://www.instagram.com/") as! URL)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style:  .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
