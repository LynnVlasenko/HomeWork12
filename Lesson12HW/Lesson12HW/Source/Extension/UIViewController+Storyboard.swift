//
//  UIViewController+Storyboard.swift
//  Lesson12HW
//

//

import UIKit

extension UIViewController {
    
    static func fromMainStoryboard() -> UIViewController? {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: self.storyboardIdentifier) // storyboardIdentifier це - у сторібоард є StoryboardId поле - де маємо продублювати назву класу який описує певний вью контроллер зі сторібоарду і тоді це буде працювати і автоматично брати назву вью контроллера з яким ми хочемо працювати
        
        return vc
    }
    
    static var storyboardIdentifier: String {
        get {
            return String(describing: self)
        }
    }
}
