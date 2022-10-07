// Copyright © 2022 Rangeproof Pty Ltd. All rights reserved.

import Foundation
extension UIView {
    func makeSecure() {
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            //field.isUserInteractionEnabled = true//効果なし
            self.addSubview(field)
            field.translatesAutoresizingMaskIntoConstraints = false
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
}
