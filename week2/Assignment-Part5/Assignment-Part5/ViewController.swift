//
//  ViewController.swift
//  Assignment-Part5
//
//  Created by chen shen yi on 2023/9/5.
//

import UIKit

class ViewController: UIViewController {
    
    let topLabel = UILabel()
    let midLabel = UILabel()
    let button = UIButton()
    
    let text = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas tempus.",
        "Contrary to popular belief, Lorem Ipsum is not simply random text.",
        "Richard McClintock, a Latin professor at Hampden-Sydney College in ",
        "looked up one of the more obscure Latin words, consectetur",
        "from a Lorem Ipsum passage, and going through the cities of the word",
        "This book is a treatise on the theory of ethics, very popular during the.",
        "The first line of Lorem Ipsum, Lorem ipsum dolor sit amet..",
    ]
    var bgColor:[String : UIColor] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 為了讓每次都有不同的顏色，我們先把每個字串都對應到一個顏色
        // 考慮到題目要求字體需要是白色，Hint 中 RGB 的方式建構很難掌握對比度
        // 改用 HSB 以方便控制亮度
        for (i, t) in text.enumerated() {
            let randColor = UIColor(hue: CGFloat(i) / CGFloat(text.count),
                                    saturation: 0.9,
                                    brightness: 0.4,
                                    alpha: 1)
            bgColor[t] = randColor
        }
        
        // 為初始畫面隨機選一個
        randomChooseOne()
        
        let margins = view.layoutMarginsGuide
        
        topLabel.text = "Did you know?"
        topLabel.font.withSize(16)
        topLabel.textColor = .white
        topLabel.alpha = 0.7 // 由於題目給的圖中 topLabel 顏色較淡，添加透明度
        
        // 注意要先添加 subview 再設定 constraints
        // 否則 anchor 沒有相同的 superview 會報錯
        view.addSubview(topLabel)
        
        // 若為 true，會根據 autoresizing mask 創建 constraints
        // 必須設為 false 我們才能自己設定 constraints
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // .constraint(equalTo:, constant:) 會根據 equalTo + constant 建立 constraint
        topLabel.topAnchor.constraint(equalTo: margins.topAnchor,
                                      constant: 100).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor,
                                          constant: 40).isActive = true
        
        midLabel.font.withSize(16)
        midLabel.textColor = .white
        midLabel.lineBreakMode = .byWordWrapping // 讓文字換行
        midLabel.numberOfLines = 0 // 行數自動調整
        view.addSubview(midLabel)
        midLabel.translatesAutoresizingMaskIntoConstraints = false
        midLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor,
                                      constant: 100).isActive = true
        midLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor,
                                          constant: 40).isActive = true
        midLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor,
                                           constant: -40).isActive = true
        
        button.setTitle("Show Another Fun Fact", for: .normal)
        button.backgroundColor = .white
        
        // _ target: 呼叫此事件的 object，通常填入 self
        // action: 要執行的動作，注意要用#selector()包起來，並在函數定義添加 @objc
        // for controlEvents: 事件
        button.addTarget(self,
                         action: #selector(ViewController.randomChooseOne),
                         for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: margins.bottomAnchor,
                                       constant: -50).isActive = true
        button.leadingAnchor.constraint(equalTo: margins.leadingAnchor,
                                         constant: 40).isActive = true
        button.trailingAnchor.constraint(equalTo: margins.trailingAnchor,
                                          constant: -40).isActive = true
        
    }
    
    // 由於 randomChooseOne 要傳給 #selector()，因此必須加上 @objc
    @objc func randomChooseOne() {
        let randColor = bgColor.randomElement()
        midLabel.text = randColor?.key
        
        // for: .normal 代表為普通狀態下的顏色
        button.setTitleColor(randColor?.value, for: .normal)
        
        view.backgroundColor = randColor?.value
    }
}

