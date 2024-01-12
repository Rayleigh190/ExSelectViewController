//
//  SelectViewControllerProtocol.swift
//  ExSelectViewController
//
//  Created by 우진 on 1/10/24.
//

import UIKit

protocol SelectViewControllerDelegate {
    // SelectViewControll 화면이 사라질 때 선택한 데이터를 받습니다.
    func didSelectViewControllerDismiss(elements: [String], selectedElements: [Int], sender: UIButton)
}
