//
//  ViewController.swift
//  Notebook
//
//  Created by zhibekzhaan on 9/18/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    private let topView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.6319069266, blue: 0.5048946738, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let bottomView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.6319069266, blue: 0.5048946738, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var taskTableView : UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.cellID)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.dataSource = self
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        view.separatorStyle = .none
        view.delegate = self
        return view
    }()
    private var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        initUI()
    }
    
    private func setData(){
        tasks = [.init(title: "Swimming", subTask: []),
                 .init(title: "Read books ", subTask: [
                    .init(title: "a poem"),
                    .init(title: "a romantic story"),
                    .init(title: "science")]),
                 .init(title: "Dancing", subTask: [
                    .init(title: "Hip-Hop"),
                    .init(title: "Bacata"),
                    .init(title: "popping")])
                    ]
        taskTableView.reloadData()
        
        
    }
   
    private func initUI(){
        setData()
        addSubView()
        NSConstraints()
       
        view.backgroundColor = .white
        
    }
    private func addSubView(){
        view.addSubview(taskTableView)
        view.addSubview(topView)
        view.addSubview(bottomView)
        
    }
    
    private func NSConstraints(){
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 194),
            
            bottomView.heightAnchor.constraint(equalToConstant: 65),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 97)
        ])
    }
    
    private func switchRegisterTable(_ state: Bool) {
        if state {
            taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.cellID)
        } else {
            taskTableView.register(SubTaskTableViewCell.self, forCellReuseIdentifier: SubTaskTableViewCell.cellID)
        }
    }


}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tasks[section].isOpen {
            return tasks[section].subTask.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            switchRegisterTable(true)
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TaskTableViewCell.cellID, for: indexPath
            ) as? TaskTableViewCell else { return UITableViewCell() }
            cell.setupData(model: tasks[indexPath.section])
            return cell
        } else {
            switchRegisterTable(false)
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SubTaskTableViewCell.cellID, for: indexPath
            ) as? SubTaskTableViewCell else { return UITableViewCell() }
            cell.setupData(model: tasks[indexPath.section].subTask[indexPath.row - 1] )
            
            return cell
        }
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tasks[indexPath.section].subTask.isEmpty {
                tasks[indexPath.row].isCheck = !tasks[indexPath.row].isCheck
                tableView.reloadData()
            } else {
                tasks[indexPath.section].isOpen = !tasks[indexPath.section].isOpen
                tableView.reloadData()
            }
        } else{
            tasks[indexPath.section].subTask[indexPath.row - 1].isCheck = !tasks[indexPath.section].subTask[indexPath.row - 1].isCheck
            var result  = true
            for index in tasks[indexPath.section].subTask {
                if !index.isCheck {
                    result = false
                }
            }
            if result {
                tasks[indexPath.section].isCheck = true
            } else {
                tasks[indexPath.section].isCheck = false
            }
            tableView.reloadData()
        }
    }
}
