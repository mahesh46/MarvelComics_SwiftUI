//
//  Utility.swift
//  MarvelComics_SwiftUI
//
//  Created by mahesh lad on 04/06/2023.
//

import Foundation
import CryptoKit

extension String {
    func md5() -> String {
        let digest = Insecure.MD5.hash(data: Data(self.utf8))

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
