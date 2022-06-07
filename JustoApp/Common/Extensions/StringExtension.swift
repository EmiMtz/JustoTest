//
//  StringExtension.swift
//  JustoApp
//
//  Created by Emi Mtz on 07/06/22.
//

import Foundation
import CommonCrypto
import CryptoKit

extension String {
  func sha256() -> String {
    
    if #available(iOS 13.0, *) {
      let inputData = Data(self.utf8)
      let hashed = SHA256.hash(data: inputData)
      let hashString = hashed.compactMap { String(format: "%02x", $0) }.joined()
      
      return hashString
    } else {
      // Fallback on earlier versions
      if let stringData = self.data(using: String.Encoding.utf8) {
        return hexStringFromData(input: digest(input: stringData as NSData))
      }
      return ""
    }
  }
  
  private func digest(input : NSData) -> NSData {
    let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
    var hash = [UInt8](repeating: 0, count: digestLength)
    CC_SHA256(input.bytes, UInt32(input.length), &hash)
    return NSData(bytes: hash, length: digestLength)
  }
  
  private func hexStringFromData(input: NSData) -> String {
    var bytes = [UInt8](repeating: 0, count: input.length)
    input.getBytes(&bytes, length: input.length)
    
    var hexString = ""
    for byte in bytes {
      hexString += String(format:"%02x", UInt8(byte))
    }
    
    return hexString
  }
  
}
