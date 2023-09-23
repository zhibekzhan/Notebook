//
//  TaskTableViewCell.swift
//  Notebook
//
//  Created by zhibekzhaan on 9/18/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    static var cellID = "TaskTableViewCellID"
    
    
    private var bgView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.7333333333, blue: 0.568627451, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = #colorLiteral(red: 0.391687572, green: 0.3922866583, blue: 0.5145338774, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var checkBoxImageView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var openCloseImageView : UIImageView = {
        let view = UIImageView()
        view.widthAnchor.constraint(equalToConstant: 17).isActive = true
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI(){
        contentView.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        contentView.addSubview(bgView)
        bgView.addSubview(titleLabel)
        bgView.addSubview(checkBoxImageView)
        bgView.addSubview(openCloseImageView)
        constraints()
    }
    
    private func constraints(){
        NSLayoutConstraint.activate([
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            bgView.heightAnchor.constraint(equalToConstant: 63),
            
            openCloseImageView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 6),
            openCloseImageView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 32),
            openCloseImageView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -32),
            openCloseImageView.widthAnchor.constraint(equalToConstant: 17),
            openCloseImageView.heightAnchor.constraint(equalToConstant: 10),

            checkBoxImageView.leadingAnchor.constraint(equalTo: openCloseImageView.trailingAnchor, constant: 3),
            checkBoxImageView.centerYAnchor.constraint(equalTo: openCloseImageView.centerYAnchor, constant: 0),
            checkBoxImageView.widthAnchor.constraint(equalToConstant: 20),
            checkBoxImageView.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.leadingAnchor.constraint(equalTo: checkBoxImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: checkBoxImageView.centerYAnchor, constant: 0)
        ])
    }
    func setupData(model: Task){
        titleLabel.text = model.title
        setupOpenClose(state: model)
        setupCheckBox(state: model.isCheck)
   
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        openCloseImageView.image = nil
    }
    
    private func setupCheckBox(state: Bool){
        if state{
            checkBoxImageView.image = UIImage(systemName: "checkmark")
            
        } else{
            checkBoxImageView.image = UIImage(systemName: "")
        }
    }
    private func setupOpenClose(state: Task){
        guard !state.subTask.isEmpty else {return}

        if state.isOpen {
            openCloseImageView.image = UIImage(named: "open")
            
        } else {
            openCloseImageView.image = UIImage(named: "close")
        }
    }


}
