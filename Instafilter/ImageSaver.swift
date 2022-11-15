//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Vladimir Vinageras on 02.11.2022.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (()-> Void)?
    var errorHanlder:((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer ){
        if let error = error{
            errorHanlder?(error)
        }else{
            successHandler?()
        }
    }
    
}
