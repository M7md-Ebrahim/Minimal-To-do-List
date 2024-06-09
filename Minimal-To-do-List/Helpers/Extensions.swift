//
//  Extensions.swift
//  Minimal-To-do-List
//
//  Created by M7md  on 27/05/2024.
//

import UIKit
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }
}
extension UILabel {
    func setStrikethroughText(_ text: String, strikethroughColor: UIColor = .gray) {
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: strikethroughColor
        ]
        self.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    func removeStrikethroughText() {
        guard let currentAttributedText = self.attributedText else { return }
        let mutableAttributedText = NSMutableAttributedString(attributedString: currentAttributedText)
        mutableAttributedText.removeAttribute(.strikethroughStyle, range: NSRange(location: 0, length: currentAttributedText.length))
        self.attributedText = mutableAttributedText
    }
}
