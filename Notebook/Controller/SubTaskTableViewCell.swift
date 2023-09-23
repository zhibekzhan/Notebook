//
//  SubTaskTableViewCell.swift
//  Notebook
//
//  Created by zhibekzhaan on 9/18/23.
//

import UIKit

class SubTaskTableViewCell: UITableViewCell {

    static var cellID = "SubTaskTableViewCellID"
    
    
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
        constraints()
    }
    
    private func constraints(){
        NSLayoutConstraint.activate([
            bgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            bgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            bgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            bgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            checkBoxImageView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 52),
            checkBoxImageView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 0),
            checkBoxImageView.widthAnchor.constraint(equalToConstant: 20),
            checkBoxImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: checkBoxImageView.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: checkBoxImageView.centerYAnchor, constant: 0)
        ])
    }
    func setupData(model: SubTask){
        titleLabel.text = model.title
        setupCheckBox(state: model.isCheck)
    }
    
    private func setupCheckBox(state: Bool){
        if state{
            checkBoxImageView.image = UIImage(systemName: "checkmark")
            
        } else{
            checkBoxImageView.image = UIImage(systemName: "")
        }
    }
}
