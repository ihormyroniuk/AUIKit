//
//  AUIImageViewSetIntrinsicContentSize.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/1/20.
//

import UIKit

open class AUIImageViewSetIntrinsicContentSize: AUIImageView {

    open var setIntrinsicContentSize: CGSize?

    open override var intrinsicContentSize: CGSize {
        if let setIntrinsicContentSize = setIntrinsicContentSize {
            return setIntrinsicContentSize
        }
        return super.intrinsicContentSize
    }

}
