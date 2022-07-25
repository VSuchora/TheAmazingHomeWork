//
//  ViewController.swift
//  TheAmazingHomeWork
//
//  Created by Владимир Сухора on 7.07.22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{
    var webView: WKWebView!
    var progressView: UIProgressView!
    let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Search or enter website name"
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(field)
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Search", style: .done, target: self, action: #selector(tapSearch))
        toolbar.items = [flexibleSpace, doneButton]
        toolbar.sizeToFit()
        field.inputAccessoryView = toolbar
        
        let url = URL (string: "https://teachmeskills.by/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresher = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        let stoper = UIBarButtonItem(barButtonSystemItem: .stop, target: webView, action: #selector(webView.stopLoading))
        let back = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(image: UIImage(systemName: "chevron.forward"), style: .plain, target: webView, action: #selector(webView.goForward))
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        toolbarItems = [back, spacer, forward, spacer, progressButton, spacer, refresher, spacer, stoper]
        navigationController?.isToolbarHidden = false
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    @objc private func tapSearch() {
        field.resignFirstResponder()
        let url = URL (string: "https://www.google.com/search?q=\(field.text!)")!
        let reqest = URLRequest(url: url)
        webView.load(reqest)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        field.frame = CGRect(x: 0, y: 0 + view.safeAreaInsets.top, width: view.frame.size.width, height: 50)
    }
}

// В общем, я поздно взялся и небыло времени сделать по красоте! Хотел сделать красиво как в браузере safari, чтобы всё было внизу и progressView отоброжался под textfield. Но там скорее всего не textfield был а searchbar. Короче знаний пока не хватило. Ну и соответственно есть проблема которая есть у всех. Когда делаешь поиск одним словом (Attack), то тип всё ок. Но когда хочешь написать несколько (Attack On Titan) сразу же fatal error. Клаву сделал через I/O -> Keyboard -> Toggle Software Keyboard. Это не правильно, но как и сказал криво ¯\_(ツ)_/¯.
