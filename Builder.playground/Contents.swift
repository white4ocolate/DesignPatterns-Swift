//MARK: Exmample 1
import UIKit

protocol ThemeProtocol {
    var backgroundColor : UIColor { get }
    var textColor : UIColor { get }
}

class Theme: ThemeProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor
    
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}

protocol ThemeBuilderProtocol {
    func setBackground(color: UIColor)
    
    func setText(color: UIColor)
    
    func createTheme() -> ThemeProtocol?
}

class ThemeBuilder: ThemeBuilderProtocol {
    var backgroundColor: UIColor?
    var textColor: UIColor?
    
    func setBackground(color: UIColor) {
        self.backgroundColor = color
    }
    
    func setText(color: UIColor) {
        self.textColor = color
    }
    
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = self.backgroundColor, let textColor = self.textColor else { return nil}
        return Theme(backgroundColor: backgroundColor, textColor: textColor)
    }
}


var builder = ThemeBuilder()
builder.setBackground(color: .red)
builder.setText(color: .black)

builder.createTheme()
