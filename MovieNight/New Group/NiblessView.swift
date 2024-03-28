//
//  NiblessView.swift
//  AppUIKit
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import UIKit

open class NiblessView: UIView {

    // MARK: - Methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}
