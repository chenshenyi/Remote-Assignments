//
//  LoginMode.swift
//  Assignment
//
//  Created by chen shen yi on 2023/9/12.
//

import Foundation

/// 控制 LoginArea 的模式
///
/// 如果是 login 模式，checkLabel 和 checkTextField 都是 disabled
enum LoginMode: String {
  case login = "Log in"
  case signup = "Sign up"
}
