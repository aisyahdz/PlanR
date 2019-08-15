//
//  TaskTableViewCell.swift
//  PlanR
//
//  Created by Aisyah Dzulqaidah on 09/08/19.
//  Copyright © 2019 Aisyah Dzulqaidah. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell{
    
    var task: String? {
        didSet{
            taskView.text = task
        }
    }
    
    var taskView: UITextView = {
        var textView = UITextView(frame: CGRect(x: 5, y: 0, width: 300, height: 25))
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(taskView)
        taskView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TaskTableViewCell : UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        taskList[textView.tag] = textView.text
        taskView.reloadInputViews()
    }
}
