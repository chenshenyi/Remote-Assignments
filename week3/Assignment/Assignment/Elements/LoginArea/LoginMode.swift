//
//  LoginMode.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import Foundation

/// 控制GrayStackView的模式
///
/// 如果是login模式，checkLabel和checkTextField都是disabled
enum LoginMode: String {
  case login = "Log in"
  case signup = "Sign up"
}
