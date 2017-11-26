//
//  RootViewController.swift
//  Tracekeep
//
//  Created by 卢梦如 on 2017/11/26.
//  Copyright © 2017年 Mengru Lu. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    private var DURATION = 0.15         // 点击UITabbar的动画时间
    
    private var CHARGE_INDEX = 1        // 记账页面的下标
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        
        self.createTabBar()
        self.tabBar.addSubview(self.cusTabbar)
        self.addTabBarButton()
        
        self.selectedIndex = CHARGE_INDEX
    }
    
    
    // MARK: - 创建TabBar
    func createTabBar() {
        
        // 账户
        let accountVC = AccountVC()
        let accountNav = UINavigationController(rootViewController: accountVC)
        
        // 记账
        let chargeVC = ChargeVC()
        let chargeNav = UINavigationController(rootViewController: chargeVC)

        // 我的
        let myVC = MyVC()
        let myNav = UINavigationController(rootViewController: myVC)
        
        self.viewControllers = [accountNav, chargeNav, myNav]
        
    }
    
    // 添加Button
    func addTabBarButton()
    {
        
        // 未选中的图标
        let unSelectImage = ["account_unselect", "charge_unselect", "my_unselect"]
        
        // 选中之后的图标
        let selectImage = ["account_select", "charge_select", "my_select"]
        
        // 3个TabBar的名称
        let tabbarName = [NSLocalizedString("account", comment: "账户"), NSLocalizedString("charge", comment: "记账"), NSLocalizedString("my", comment: "我的")]
        
        let num = self.viewControllers!.count
        for i in 0..<num {
            
            if i == CHARGE_INDEX {
                
                let butImage = UIImage(named: "charge_select")
                let addBut: UIButton = UIButton(type: .custom)
                addBut.frame = CGRect(x: 0, y: 0, width: (butImage?.size.width)!, height: (butImage?.size.height)!)
                addBut.setImage(UIImage(named: unSelectImage[i]), for: .normal)
                addBut.setImage(butImage, for: .selected)
                addBut.center = CGPoint(x: cusTabbar.center.x, y: cusTabbar.center.y - 5)
                addBut.tag = 1000 + i
                addBut.isSelected = true
                addBut.adjustsImageWhenHighlighted = false
                addBut.addTarget(self, action: #selector(chargeButtonClick(but:)), for: .touchUpInside)
                self.cusTabbar.addSubview(addBut)
                
            }else{
                
                let  width = LMR_WIDTH
                let  x = CGFloat(width/CGFloat(num)*CGFloat(i))
                let  y:CGFloat = 0.0
                let  w = width/CGFloat(num)
                let  h = 49.0
                
                let button: LMRTabBarButton = LMRTabBarButton(frame:CGRect(x: x,y: y,width: w,height: CGFloat(h)))
                button.tag = 1000 + i
                button.setTitleColor(UIColor.black, for: .normal)
                button.setTitleColor(UIColor.red, for: .selected)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                button.setImage(UIImage(named: unSelectImage[i]), for: .normal)
                button.setImage(UIImage(named: selectImage[i]), for: .selected)
                button.setTitle(tabbarName[i], for: UIControlState())
                button.addTarget(self, action: #selector(changVC(but:)), for: .touchUpInside)
                self.cusTabbar.addSubview(button)
                
            }
        }
    }
    
    
    //MARK: - 记账按钮点击事件
    @objc func chargeButtonClick(but: UIButton) {
        let index: Int = but.tag - 1000
        self.selectVC(index: index, but: but)
    }
    
    
    //MARK: - 切换ViewController
    @objc func changVC(but: UIButton) {
        
        let index: Int = but.tag - 1000
        self.selectVC(index: index, but: but)
        
    }
    
    
    /**
     * 选中VC
     */
    func selectVC(index: Int, but: UIButton) {
        
        if self.selectedIndex != index {
            
            self.selectedIndex = index
            but.isSelected = true
            
            if index != CHARGE_INDEX {
                
                let animation = CAKeyframeAnimation(keyPath: "transform.scale")
                animation.values = [1, 0.8, 1.0]
                animation.duration = DURATION
                animation.calculationMode = kCAAnimationCubic
                but.imageView?.layer.add(animation, forKey: nil)
                
            }
        }
        
        for item in 0...2 {

            if item != index && item != CHARGE_INDEX{
                
                let button: LMRTabBarButton = cusTabbar.viewWithTag(1000 + item) as! LMRTabBarButton
                button.isSelected = false
                
            }
        }
    }
    
    
    
    //MARK: -懒加载
    lazy var cusTabbar: UIView = {
        
        let view = UIView(frame:CGRect(x: 0, y: 0, width: LMR_WIDTH,height: 49))
        view.backgroundColor = UIColor.white
        return view
        
    }()
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

