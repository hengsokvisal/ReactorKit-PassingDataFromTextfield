//
//  ViewController.swift
//  IOS-ReactorKitTest2
//
//  Created by HengVisal on 5/14/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit

import SnapKit

import RxSwift
import RxCocoa
import ReactorKit

class HomepageViewController: UIViewController , StoryboardView {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    //UITextfield
    let nameTextfield : UITextField = UITextField()
    let ageTextfield : UITextField = UITextField()
    
    //UILabel
    let nameLabel : UILabel = UILabel()
    let ageLabel : UILabel = UILabel()
    
    //UIButton
    let getName : UIButton = UIButton()
    let getAge : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createComponent()
        addSupview()
        setupLayout()
        
        self.reactor = HomepageReactor()
        
    }
    
    //ReactorKit Bind - This will call automatically
    func bind(reactor: HomepageReactor) {
        print("BIND IS CALL")
        
        //Action
        getName.rx.tap
            .map{ Reactor.Action.usernameText(self.nameTextfield.text) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        getAge.rx.tap
            .map{ Reactor.Action.ageText(self.ageTextfield.text) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        //State
        reactor.state
            .map{$0.userName}
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        reactor.state
            .map{$0.age}
            .bind(to: ageLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

// MARK: - Create UIComponents
extension HomepageViewController{
    func createComponent() -> Void {
        
        //UITextfield
        nameTextfield.backgroundColor = UIColor.white
        nameTextfield.borderStyle = UITextBorderStyle.roundedRect
        ageTextfield.backgroundColor = UIColor.white
        ageTextfield.borderStyle = UITextBorderStyle.roundedRect
        
        //UIButton
        getName.setTitle("getMyName", for: .normal)
        getName.backgroundColor = UIColor.blue
        getAge.setTitle("getMyAge", for: .normal)
        getAge.backgroundColor = UIColor.blue
        
        //Label
        nameLabel.backgroundColor = .gray
        ageLabel.backgroundColor = .yellow
        
    }
}


// MARK: - Add Supview
extension HomepageViewController{
    func addSupview() -> Void {
        
        //Textfield
        self.view.addSubview(nameTextfield)
        self.view.addSubview(ageTextfield)
        
        //Label
        self.view.addSubview(nameLabel)
        self.view.addSubview(ageLabel)
        
        //Button
        self.view.addSubview(getName)
        self.view.addSubview(getAge)
        
    }
}

// MARK: - Setup UIComponent Layout
extension HomepageViewController{
    func setupLayout() -> Void {
        
        //Textfield
        nameTextfield.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(40)
        }
        ageTextfield.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameTextfield.snp.bottom).offset(20)
        }
        
        //Button
        getName.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(ageTextfield.snp.bottom).offset(20)
        }
        getAge.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(ageTextfield.snp.bottom).offset(20)
        }
        
        //Label
        nameLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(getName.snp.bottom).offset(20)
        }
        ageLabel.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-30)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
    }
}




