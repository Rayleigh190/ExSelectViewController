//
//  SelectViewController.swift
//  ExSelectViewController
//
//  Created by 우진 on 1/10/24.
//

import UIKit

class SelectViewController: UIViewController {
    var selectView: SelectView!
    var titleText: String
    var style: UIStyle
    var sender: UIButton
    var elements: [String]
    var previousSelectedElements: [Int]
    var delegate: SelectViewControllerDelegate?
    
    init(titleText: String, style: UIStyle, sender: UIButton, elements: [String], previousSelectedElements: [Int], delegate: SelectViewControllerDelegate) {
        self.titleText = titleText
        self.style = style
        self.sender = sender
        self.elements = elements
        self.previousSelectedElements = previousSelectedElements
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        selectView = SelectView(frame: self.view.frame, titleText: titleText, style: style, elements: elements, previousSelectedElements: previousSelectedElements)
        self.view = selectView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 뷰가 사라질 때 전체 선택 목록 데이터와 선택한 인덱스 데이터를 넘깁니다.
        delegate?.didSelectViewControllerDismiss(elements: selectView.elements, selectedElements: selectView.selectedElements, sender: sender)
    }
}
