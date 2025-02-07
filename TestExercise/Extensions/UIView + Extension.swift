//
//  UIView + Extension.swift
//  TestExercise
//
//  Created by Maks on 7.02.25.
//

import UIKit.UIView

extension UIView {

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
