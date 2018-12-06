//
//  YPAlbumPickerViewController.swift
//  whatstick
//
//  Created by Lung on 5/12/2018.
//  Copyright © 2018 Lung. All rights reserved.
//

import UIKit

class YPAlbumPicker: UINavigationController {

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return YPImagePickerConfiguration.shared.preferredStatusBarStyle
    }
}
