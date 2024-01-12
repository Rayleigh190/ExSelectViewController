//
//  ViewController.swift
//  ExSelectViewController
//
//  Created by 우진 on 1/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    // Data
    var dataList: [String] = ["선택항목 1", "선택항목 2", "선택항목 3", "선택항목 4", "선택항목 5", "선택항목 6", "선택항목 7", "선택항목 8", "선택항목 9", "선택항목 10"]
    var selectedElements: [Int] = []
    
    // UI
    private lazy var basicLabel: UILabel = {
        let label = UILabel()
        label.text = "선택한 항목들"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .baseGreen
        button.setTitle("버튼 1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(greenButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var navyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .BaseNavy
        button.setTitle("버튼 2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(navyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        [greenButton, navyButton].forEach{ stackView.addArrangedSubview($0) }
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubViews()
    }

}

private extension ViewController {
    func setupSubViews() {
        view.addSubview(basicLabel)
        basicLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            basicLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            basicLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            basicLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            basicLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
    }
    
    @objc func greenButtonTapped(sender: UIButton) {
        print("green tapped")
        let vc = SelectViewController()
        vc.selectViewControllerDelegate = self
        vc.titleText = "선택화면 1"
        vc.style = .green
        vc.elements = dataList
        vc.previousSelectedElements = selectedElements
        vc.sender = sender
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 30
            sheet.prefersGrabberVisible = true
       }
       present(vc, animated: true)
    }
    
    @objc func navyButtonTapped(sender: UIButton) {
        print("navy tapped")
        let vc = SelectViewController()
        vc.selectViewControllerDelegate = self
        vc.titleText = "선택화면 2"
        vc.style = .navy
        vc.elements = dataList
        vc.previousSelectedElements = selectedElements
        vc.sender = sender
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 30
            sheet.prefersGrabberVisible = true
       }
       present(vc, animated: true)
        
    }
}

extension ViewController: SelectViewControllerDelegate {
    func didSelectViewControllerDismiss(elements: [String], selectedElements: [Int], sender: UIButton) {
        if selectedElements.count > 0 {
            // 선택한 데이터 index 저장
            self.selectedElements = selectedElements
            // basicLabel에 선택한 데이터 문자열 세팅
            var selectedElementString: String = ""
            for selectedElement in selectedElements {
                print(elements[selectedElement])
                selectedElementString += (elements[selectedElement]+", ")
            }
            selectedElementString = String(selectedElementString.dropLast(2))
            basicLabel.text = selectedElementString
        } else {
            self.selectedElements = []
            basicLabel.text = "선택 안 함"
        }
    }
}
