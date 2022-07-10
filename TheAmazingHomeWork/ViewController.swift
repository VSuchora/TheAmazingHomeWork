//
//  ViewController.swift
//  TheAmazingHomeWork
//
//  Created by Владимир Сухора on 7.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    private let screen = UIScreen.main.bounds
    private var menu = false
    private var home = CGAffineTransform()
    struct option {
        var title = String()
        var segue = String()
    }
    var options: [option] = [option(title: "Recommended",
                                    segue: "RecomenndedSegue"),
                             option(title: "Hottest",
                                    segue: "HottestSegue"),
                             option(title: "Most Viewed",
                                    segue: "MostViewedSegue"),
                             option(title: "Top Rated",
                                    segue: "TopRatedSegue"),
                             option(title: "Popular Homemade",
                                    segue: "PopularHomemadeSegue"),
                             option(title: "Recommended",
                                    segue: "RecomenndedSegue"),
                             option(title: "Explore",
                                    segue: "ExploreSegue"),
                             option(title: "Playlists",
                                    segue: "PlaylistsSegue"),
                             option(title: "Channels",
                                    segue: "ChannelsSegue"),
                             option(title: "Random",
                                    segue: "RandomSegue"),
                             option(title: "Pornhub Premium",
                                    segue: "PornhubPremiumSegue"),
                             option(title: "Newest",
                                    segue: "NewestSegue"),
                             option(title: "Viewers` Choice",
                                    segue: "ViewersChoiceSegue")]
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
        home = self.containerView.transform
    }
    private func showMenu() {
        self.containerView.layer.cornerRadius = 40
        let x = screen.width * 0.8
        let originalTransform = self.containerView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
        UIView.animate(withDuration: 0.7, animations: {
        self.containerView.transform = scaledAndTranslatedTransform
        })
    }
    private func hideMenu() {
        UIView.animate(withDuration: 0.7, animations: {
        self.containerView.transform = self.home
        self.containerView.layer.cornerRadius = 0
        })
    }
    @IBAction func menuButton(_ sender: Any) {
        if menu == false {
            showMenu()
            view.addBlur(style: .light)
            view.bringSubviewToFront(containerView)
            menu = true
        } else if menu == true {
            view.deleteBlur()
            hideMenu()
            menu = false
        }
    }
    @IBAction func settingsButton(_ sender: Any) {
        let alert = UIAlertController(title: "Welcome To The Club Buddy", message: "What do you want to do?", preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Buy Premium", style: .default) { action in
        }
        alert.addAction(firstAction)
        let secondAction = UIAlertAction(title: "Be a Gay", style: .destructive) { _ in
        }
        alert.addAction(secondAction)
        let thirdAction = UIAlertAction(title: "Log In", style: .cancel) { _ in
            let alert = UIAlertController(title: "Sign In", message: "Please sign in to your account to continue!", preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Continue", style: .default) { _ in
            }
            alert.addAction(action1)
            let action2 = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            }
            alert.addAction(action2)
            alert.addTextField { field in
                field.placeholder = "Username (6+ characters) or Email"
                field.returnKeyType = .next
                field.keyboardType = .emailAddress
            }
            alert.addTextField { field in
                field.placeholder = "Password (6+ characters)"
                field.returnKeyType = .next
                field.isSecureTextEntry = true
            }
            self.present(alert, animated: true)
        }
        alert.addAction(thirdAction)
        present(alert, animated: true)
    }
    @IBAction func EscapeWindow(_ sender: Any) {
        extensionFirstAlert(alertTitle: "This Is Not Exit", alertMessage: "Probably Yes?", alertStyle: .alert, actionTitle: "Yes", actionStyle: .destructive)
    }
    @IBAction func SmokeWeedEveryDay(_ sender: Any) {
        extensionSecondAlert(alertTitle: "Are You Smoke Weed?", alertMessage: "Case I, Yes!", alertStyle: .actionSheet, first1ActionTitle: "No", first1ActionStyle: .destructive, second2ActionTitle: "Sometimes", second2ActionStyle: .default, third3ActionTitle: "Of Course", third3ActionStyle: .cancel)
    }
}
class tableViewCell: UITableViewCell {
    @IBOutlet weak var descriprionLabel: UILabel!
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        cell.backgroundColor = .clear
        cell.descriprionLabel.text = options[indexPath.row].title
        cell.descriprionLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let currentCell = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
            currentCell.alpha = 0.5
            UIView.animate(withDuration: 1, animations: {
                currentCell.alpha = 1
            })
            //            self.parent?.performSegue(withIdentifier: options[indexPath.row].segue, sender: self)
        }
    }
}
extension UIViewController {
    func extensionFirstAlert(alertTitle: String?, alertMessage: String?, alertStyle: UIAlertController.Style, actionTitle: String?, actionStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let firstAction = UIAlertAction(title: actionTitle, style: actionStyle) { action in
        }
        alert.addAction(firstAction)
        present(alert, animated: true)
    }
    func extensionSecondAlert(alertTitle: String?, alertMessage: String?, alertStyle: UIAlertController.Style, first1ActionTitle: String?, first1ActionStyle: UIAlertAction.Style, second2ActionTitle: String?, second2ActionStyle: UIAlertAction.Style, third3ActionTitle: String?, third3ActionStyle: UIAlertAction.Style) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: alertStyle)
        let first1Action = UIAlertAction(title: first1ActionTitle, style: first1ActionStyle) { action in
        }
        alert.addAction(first1Action)
        let second2Action = UIAlertAction(title: second2ActionTitle, style: second2ActionStyle) { _ in
        }
        alert.addAction(second2Action)
        let third3Action = UIAlertAction(title: third3ActionTitle, style: third3ActionStyle) { _ in
        }
        alert.addAction(third3Action)
        present(alert, animated: true)
    }
}
extension UIView {
    func addBlur(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        addSubview(blurEffectView)
    }
    func deleteBlur() {
        for view in self.subviews {
        if let view = view as? UIVisualEffectView {
        view.removeFromSuperview()
            }
        }
    }
}


