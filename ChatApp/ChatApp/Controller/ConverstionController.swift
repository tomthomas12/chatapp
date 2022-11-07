//
//  ConverstionController.swift
//  ChatApp
//
//  Created by ARM 097 on 03/11/22.
//

import UIKit

private let reuseIdentifer = "ConversationCell"
class ConversationController: ViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        ConfigureUI()
        
    }
    @objc func showProfile(){
        print("123")
    }
    
    func ConfigureUI() {
        view.backgroundColor  = .white
        configureNavigationBar()
        configurTableView()
        let image = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(showProfile))
}
    func configurTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: reuseIdentifer)
        tableView.tableFooterView = UIView()
        tableView.delegate=self
        tableView.dataSource=self
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    func  configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor :UIColor.white]
        appearance.backgroundColor = .systemPurple
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath )
        cell.textLabel?.text = "Test Cell"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
