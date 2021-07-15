//
//  StudentVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 Vishal. All rights reserved.
//

import UIKit

class StudentVC: UIViewController {

    
    let spid = UserDefaults.standard.string(forKey: "spid")
    let name = UserDefaults.standard.string(forKey: "name")
    let clas = UserDefaults.standard.string(forKey: "clas")
    let div = UserDefaults.standard.string(forKey: "div")
    let sem = UserDefaults.standard.string(forKey: "sem")
    let mobileno = UserDefaults.standard.string(forKey: "mobileno")
    private var studArray = [Students]()
 //   private var noticeArray = [Notice]()
    
    
    
    private let welcomelbl:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    private let classLabelName:UILabel = {
        let labl = UILabel()
        labl.text = "Your Class"
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    private let classLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    
    private let divLabelName:UILabel = {
        let labl = UILabel()
        labl.text = "Your Div"
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    private let divLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    private let semLableName:UILabel = {
        let labl = UILabel()
        labl.text = "Your Sem"
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    private let SemLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    private let noticeLabelName:UILabel = {
        let labl = UILabel()
        labl.text = "Notice"
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    
    
    private let noticeLabel:UILabel = {
        let labl = UILabel()
        labl.text = ""
        labl.font = UIFont(name: "", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        labl.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 1)
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    
    private let allNotice:UIButton = {
        let button = UIButton()
        // button.setTitle("logut", for: .normal)
        button.addTarget(self, action: #selector(gotonotice), for: .touchUpInside)
        button.setImage(UIImage(named: "noticeboard"),for: .normal)
        //button.backgroundColor = .gray
        //        button.layer.cornerRadius = 25
        //        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    @objc private func gotonotice(){
        
        let vc = studNoticeVC()

        navigationController?.pushViewController(vc, animated: true)
    }
    
    private let icontext:UILabel = {
        let labl = UILabel()
        labl.text = "Check All Notice"
        labl.font = UIFont(name: "", size: 10.0)
        labl.textAlignment = .center
        labl.textColor = .white
        labl.layer.masksToBounds = true
        labl.layer.cornerRadius = 20
        return labl
    }()
    private let changepwd : UIButton = {
        let con = UIButton()
        
        con.setTitle("Change Password", for: .normal)
        con.addTarget(self, action: #selector(changepassword), for: .touchUpInside)
        // con.backgroundColor = .gray
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        con.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return con
        
        
    } ()
    
    private let logout : UIButton = {
        let con = UIButton()
        
        con.setTitle("Logout", for: .normal)
        con.addTarget(self, action: #selector(gotohome), for: .touchUpInside)
        // con.backgroundColor = .gray
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        
        con.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return con
        
        
    } ()
    
    @objc private func gotohome(){
        
        let vc =  ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func changepassword()
    {
        let cnt = studArray.count
        for i in 0..<cnt
        {
            if (spid == studArray[i].spid!)
            {
                let stud = studArray[i]
                let alert = UIAlertController(title: "Add New Password", message: "Please Change Your Password", preferredStyle: .alert)
                
                alert.addTextField { (tf) in
                    tf.placeholder = "\(self.studArray[i].password!)"
                }
                let action = UIAlertAction(title:"Submit", style: .default) { (_) in
                    guard let pass = alert.textFields?[0].text
                        else{
                            return
                    }
                    
                    CoreDataHandler.shared.updatepwd(stud: stud, password: pass, completion: {
                        [weak self] in
                        print(self!.studArray[i].name!)
                        print(pass)
                        let vc = StudentVC()
                        self?.navigationController?.pushViewController(vc, animated: false)
                    })
                }
                alert.addAction(action)
                
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        studArray = CoreDataHandler.shared.fetch()
      
        
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "6.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        view.addSubview(welcomelbl)
        view.addSubview(classLabelName)
        view.addSubview(classLabel)
        view.addSubview(divLabelName)
        view.addSubview(divLabel)
        view.addSubview(semLableName)
        view.addSubview(SemLabel)
        // view.addSubview(noticeLabel)
        //view.addSubview(noticeLabelName)
        view.addSubview(allNotice)
        view.addSubview(icontext)
        view.addSubview(changepwd)
        view.addSubview(logout)
        print(name!)
        print(div!)
        print(spid!)
        welcomelbl.text = "Welcome :\(name!)"
        classLabel.text = clas
        divLabel.text = div
        SemLabel.text = sem
//        let ntcnt = noticeArray.count
//        for i in 0..<ntcnt
//        {
//            noticeLabel.text = noticeArray[i].notice
//        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        welcomelbl.frame = CGRect(x: 80, y: 130, width: 225, height: 60)
        classLabelName.frame = CGRect(x: 80, y: welcomelbl.bottom + 5, width: 120, height: 40)
        classLabel.frame = CGRect(x: classLabelName.right + 10, y: welcomelbl.bottom + 5, width: 100, height: 40)
        divLabelName.frame = CGRect(x: 80, y: classLabelName.bottom + 5, width: 120, height: 40)
        divLabel.frame = CGRect(x: divLabelName.right + 10, y: classLabelName.bottom + 5, width: 100, height: 40)
        semLableName.frame = CGRect(x: 80, y: divLabelName.bottom + 5, width: 120, height: 40)
        SemLabel.frame = CGRect(x: semLableName.right + 10, y: divLabelName.bottom + 5, width: 100, height: 40)
        // noticeLabelName.frame = CGRect(x: 150, y: semLableName.bottom + 20, width: 90, height: 40)
        //noticeLabel.frame = CGRect(x: 110, y: noticeLabelName.bottom, width: 200, height: 30)
        allNotice.frame = CGRect(x: 150, y: semLableName.bottom + 50, width: 100, height: 100)
        icontext.frame = CGRect(x: 120, y: allNotice.bottom + 2, width: 150, height: 20)
        changepwd.frame = CGRect(x: 100, y: icontext.bottom + 20, width: view.width / 2, height: 50)
        logout.frame = CGRect(x: 150, y: changepwd.bottom + 5, width: 100, height: 30)
    }
    
    
    
    
}
