//: Playground - noun: a place where people can play

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
import XCPlayground

class ViewController: UIViewController {
    
    let button1 = UIButton()
    let button2 = UIButton()
    let prefectureField = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        self.view.backgroundColor = .whiteColor()
        
        // Button1
        self.button1.frame = .zero
        self.button1.backgroundColor = .redColor()
        self.button1.setTitle("Kanto", forState: .Normal)
        self.button1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.button1)

        // Button2
        self.button2.frame = .zero
        self.button2.backgroundColor = .blueColor()
        self.button2.setTitle("Tohoku", forState: .Normal)
        self.view.addSubview(self.button2)
        
        self.button1.snp_makeConstraints { make in
            make.top.equalTo(self.view).offset(10)
            make.centerX.equalTo(self.view).dividedBy(2)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        self.button2.snp_makeConstraints { make in
            make.top.equalTo(self.view).offset(10)
            make.centerX.equalTo(self.view).multipliedBy(1.5)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        self.prefectureField.frame = .zero
        self.prefectureField.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        self.prefectureField.textAlignment = .Center
        self.prefectureField.font = .systemFontOfSize(CGFloat(25))
        self.view.addSubview(self.prefectureField)
        self.prefectureField.snp_makeConstraints { make in
            make.top.equalTo(self.button1.snp_bottom).offset(50)
            make.centerX.equalTo(self.view)
            make.width.equalTo(300)
            make.bottom.equalTo(self.view).inset(20)
        }
        
        // add tap action
        self.button1.addTarget(self, action: #selector(ViewController.button1Tapped(_:)), forControlEvents: .TouchUpInside)
        self.button2.addTarget(self, action: #selector(ViewController.button2Tapped(_:)), forControlEvents: .TouchUpInside)
    }
    
    func button1Tapped(sender: AnyObject) {
        print("Button1 tapped!!")
        Alamofire.request(.GET, "http://private-f3b7b-playgroundbutton1.apiary-mock.com/prefectures").responseJSON { [weak self] response in
            guard let strongSelf = self else { return }
            switch response.result {
            case .Success(let value):
                var displayString = ""
                let json = JSON(value)
                let prefectures = json["prefectures"].array
                guard let prefs = prefectures else { return }
                for prefecture in prefs {
                    if let prefName = prefecture["name"].string {
                        displayString += "\(prefName)\n"
                    }
                }
                strongSelf.prefectureField.text = displayString
            case .Failure(let error):
                print("error occurred: \(error)")
            }
        }
    }
    
    func button2Tapped(sender: AnyObject) {
        print("Button2 tapped!!")
        Alamofire.request(.GET, "http://private-6ed48-playgroundbutton2.apiary-mock.com/prefectures").responseJSON { [weak self] response in
            guard let strongSelf = self else { return }
            switch response.result {
            case .Success(let value):
                var displayString = ""
                let json = JSON(value)
                let prefectures = json["prefectures"].array
                guard let prefs = prefectures else { return }
                for prefecture in prefs {
                    if let prefName = prefecture["name"].string {
                        displayString += "\(prefName)\n"
                    }
                }
                strongSelf.prefectureField.text = displayString
            case .Failure(let error):
                print("error occurred: \(error)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

XCPlaygroundPage.currentPage.liveView = ViewController()
