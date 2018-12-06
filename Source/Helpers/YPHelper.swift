//
//  YPHelper.swift
//  YPImgePicker
//
//  Created by Sacha Durand Saint Omer on 02/11/16.
//  Copyright © 2016 Yummypets. All rights reserved.
//

import Foundation
import UIKit
import Photos

internal func ypLocalized(_ str: String) -> String {
    return NSLocalizedString(str,
                             tableName: nil,
                             bundle: Bundle(for: YPPickerVC.self),
                             value: "",
                             comment: "")
}

internal func imageFromBundle(_ named: String) -> UIImage {
    return UIImage(named: named, in: Bundle(for: YPPickerVC.self), compatibleWith: nil) ?? UIImage()
}

struct YPHelper {
    static func changeBackButtonIcon(_ controller: UIViewController) {
        if YPConfig.icons.shouldChangeDefaultBackButtonIcon {
            let backButtonIcon = YPConfig.icons.backButtonIcon
            controller.navigationController?.navigationBar.backIndicatorImage = backButtonIcon
            controller.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButtonIcon
        }
    }
    
    static func changeBackButtonTitle(_ controller: UIViewController) {
        if YPConfig.icons.hideBackButtonTitle {
            controller.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                          style: .plain,
                                                                          target: nil,
                                                                          action: nil)
        }
    }
    
    static func changeNextButtonIcon(_ controller: UIViewController) {
        if YPConfig.icons.shouldChangeDefaultNextButtonIcon {
            let nextButtonIcon = YPConfig.icons.nextImage
            if controller.navigationItem.rightBarButtonItem?.title == YPConfig.wordings.next {
                let action = controller.navigationItem.rightBarButtonItem?.action
                let target = controller.navigationItem.rightBarButtonItem?.target
                let style = controller.navigationItem.rightBarButtonItem?.style
                controller.navigationItem.rightBarButtonItem = UIBarButtonItem(image: nextButtonIcon,
                                                                               style: style ?? .done,
                                                                               target: target,
                                                                               action: action)
            }
        }
    }
    
    static func changeCancelButtonIcon(_ controller: UIViewController) {
        if YPConfig.icons.shouldChangeDefaultCancelButtonIcon {
            let cancelButtonIcon = YPConfig.icons.cancelImage
            if controller.navigationItem.leftBarButtonItem?.title == YPConfig.wordings.cancel {
                let action = controller.navigationItem.leftBarButtonItem?.action
                let target = controller.navigationItem.leftBarButtonItem?.target
                let style = controller.navigationItem.leftBarButtonItem?.style
                controller.navigationItem.leftBarButtonItem = UIBarButtonItem(image: cancelButtonIcon,
                                                                               style: style ?? .done,
                                                                               target: target,
                                                                               action: action)
            }
        }
    }
    
    static func configureFocusView(_ v: UIView) {
        v.alpha = 0.0
        v.backgroundColor = UIColor.clear
        v.layer.borderColor = UIColor(r: 204, g: 204, b: 204).cgColor
        v.layer.borderWidth = 1.0
        v.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    static func animateFocusView(_ v: UIView) {
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 3.0, options: UIView.AnimationOptions.curveEaseIn,
                       animations: {
                        v.alpha = 1.0
                        v.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion: { _ in
            v.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            v.removeFromSuperview()
        })
    }
    
    static func formattedStrigFrom(_ timeInterval: TimeInterval) -> String {
        let interval = Int(timeInterval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
