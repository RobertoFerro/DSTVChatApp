//
//  ImageRepository.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/07.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import UIKit
import Foundation

protocol ImageRepository {
    func fetchImage(with url: String, completionHandler: @escaping () -> ()) -> UIImage?
}
