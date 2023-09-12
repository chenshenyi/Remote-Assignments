//
//  GrayStackView.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import UIKit

class GrayStackView: UIStackView {
  let textFieldStackView = TextFieldStackView()
  let labelStackView = LabelStackView()

  var mode: LoginMode = .login {
    didSet {
      textFieldStackView.mode = mode
      labelStackView.mode = mode
    }
  }

  convenience init() {
    self.init(frame: .zero)
    addArrangedSubview(labelStackView)
    addArrangedSubview(textFieldStackView)

    axis = .horizontal
    alignment = .fill
    distribution = .fill
    spacing = 8
    backgroundColor = .lightGray
    insetsLayoutMarginsFromSafeArea = false

    textFieldStackView.arrangedSubviews.forEach { subview in
      subview.setContentHuggingPriority(
        labelStackView.contentHuggingPriority(for: .horizontal) - 1,
        for: .horizontal
      )
    }
    labelStackView.arrangedSubviews.forEach { subview in
      subview.setContentCompressionResistancePriority(
        textFieldStackView.contentCompressionResistancePriority(for: .horizontal) + 1,
        for: .horizontal
      )
    }
  }
}
