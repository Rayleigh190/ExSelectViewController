//
//  SelectViewController.swift
//  ExSelectViewController
//
//  Created by 우진 on 1/10/24.
//

import UIKit

class SelectViewController: UIViewController {
    
    var selectView: SelectView!
    var titleText: String = "타이틀"
    var style: UIStyle = .green
    var sender: UIButton?
    var elements: [String] = []
    var previousSelectedElements: [Int] = []
    
    var selectViewControllerDelegate: SelectViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        selectView.elements = elements
        selectView.previousSelectedElements = previousSelectedElements
        selectView.setPreviousSelectedElement()
    }
    
    override func loadView() {
        super.loadView()
        selectView = SelectView(frame: self.view.frame, title: titleText, style: style)
        self.view = selectView
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 뷰가 사라질 때 전체 선택 목록 데이터와 선택한 인덱스 데이터를 넘깁니다.
        selectViewControllerDelegate?.didSelectViewControllerDismiss(elements: selectView.elements, selectedElements: selectView.selectedElements, sender: sender!)
    }

}

