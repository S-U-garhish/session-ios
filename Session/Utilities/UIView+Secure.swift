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
    func makeSecure2() {
        //エラーは起こらないが効果もない
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            //field.isUserInteractionEnabled = true//効果なし
            self.addSubview(field)
            //field.translatesAutoresizingMaskIntoConstraints = false
            //field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            //field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
    func makeSecure3() {
        //動作する
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            //field.isUserInteractionEnabled = true//効果なし
            self.addSubview(field)
            //field.translatesAutoresizingMaskIntoConstraints = false
            field.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
    func makeSecure4() {
        //エラーは起きないが動作しない
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            //field.isUserInteractionEnabled = true//効果なし
            self.superview!.addSubview(field)
            field.centerYAnchor.constraint(equalTo: self.superview!.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.superview!.centerXAnchor).isActive = true
            //self.centerConstraint.constant = 0
            //self.layoutIfNeeded()
            self.layer.superlayer?.addSublayer(field.layer)
            field.layer.sublayers?.first?.addSublayer(self.layer)
        }
    }
    func makeSecure5() {
        //エラーは起きないが動作しない
        DispatchQueue.main.async {
            let field = UITextField()
            field.isSecureTextEntry = true
            self.addSubview(field)
            print(self.superview!.superview!);
            print(self.superview!);
            print(self);
            //print(self.layer.superlayer!);
            //print(self.layer);
            //これを入れないとタイトルは見えなくなる。入れると見えるがSSも取れる
            //field.translatesAutoresizingMaskIntoConstraints = false
            field.centerYAnchor.constraint(equalTo: self.superview!.superview!.centerYAnchor).isActive = true
            field.centerXAnchor.constraint(equalTo: self.superview!.superview!.centerXAnchor).isActive = true
            
            //ここを弄れ
            //上だけonにするとタイトルが常時表示されなくなる
            //頭にsuperviewを入れてもいいけどfieldに入れると落ちる
            //下だけonにするとエラーを起こす（cycle）
            self.superview!.layer.superlayer?.addSublayer(field.layer)
            print("Add field layer");
            //field.layer.sublayers?.first?.addSublayer(self.layer)
            print("End Of Making Secure");
        }
    }
}
