//
//  MyTest.swift
//  MyFramework
//
//  Created by Jian Jian on 2017/5/9.
//  Copyright © 2017年 CJ. All rights reserved.
//

import Foundation
public class CJKit{
    public class var topViewController:UIViewController?{
        get{
            var resultVC = _topViewtroller(vc: UIApplication.shared.keyWindow?.rootViewController)
            while resultVC?.presentedViewController != nil {
                resultVC = _topViewtroller(vc: resultVC?.presentedViewController)
            }
            return resultVC
        }
    }
    private class func _topViewtroller(vc:UIViewController?)->UIViewController?{
        if let _vc = vc as? UINavigationController{
            return self._topViewtroller(vc: _vc.topViewController)
        }
        if let _vc = vc as? UITabBarController{
            return self._topViewtroller(vc:_vc.selectedViewController)
        }
        return vc
    }
}
