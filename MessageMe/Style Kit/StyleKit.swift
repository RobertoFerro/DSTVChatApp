//
//  StyleKit.swift
//  MessageMe
//
//  Created by Roberto Ferro on 2020/05/10.
//  Copyright © 2020 Roberto Ferro. All rights reserved.
//

import Foundation
import UIKit

class StyleKit {
    
    struct Colours {
        
        static func primaryColour() -> UIColor {
            return "#0F2032".hexToColor()
        }
        
        static func secondaryColour() -> UIColor {
            return "#2e4a6e".hexToColor()
        }
        
        static func titleColor() -> UIColor {
            return "#FFFFFF".hexToColor()
        }
        
        static func tertiaryColor() -> UIColor {
            return "#6665ff".hexToColor()
        }
         
        static func lightGrey() -> UIColor {
            return "#EEEEEE".hexToColor()
        }
        
        static func darkGrey() -> UIColor {
            return "#727272".hexToColor()
        }
        
        static func white() -> UIColor {
            return UIColor.white
        }
        
        static func black() -> UIColor {
            return UIColor.black
        }
        
        static func clear() -> UIColor {
            return UIColor.clear
        }
        
    }

    struct Font {
        
        static func regular(withFontSize size:Size) -> UIFont {
            return UIFont(name: FontType.regular.rawValue, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue, weight: .regular)
        }
        
        static func semiBold(withFontSize size:Size) -> UIFont {
            return UIFont(name: FontType.semiBold.rawValue, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue, weight: .semibold)
        }
        
        static func bold(withFontSize size:Size) -> UIFont {
            return UIFont(name: FontType.bold.rawValue, size: size.rawValue) ?? UIFont.systemFont(ofSize: size.rawValue, weight: .bold)
        }
        
    }
    
    struct Dimensions {
        
        static func backgroundAlphaComponent() -> CGFloat {
            return 0.2
        }
        
        static func cornerRadius() -> CGFloat {
            return 10.0
        }
        
        static func borderWidth() -> CGFloat {
            return 0.0
        }
                
        struct Component {
            
            struct Height {
                
                static func small() -> CGFloat {
                    return ComponentHeight.heightSmall.rawValue
                }
                
                static func normal() -> CGFloat {
                    return ComponentHeight.heightNormal.rawValue
                }
                
                static func semiLarge() -> CGFloat {
                    return ComponentHeight.heightSemiLarge.rawValue
                }
                
                static func large() -> CGFloat {
                    return ComponentHeight.heightLarge.rawValue
                }
                
            }
            
            struct Width {
                
                static func small() -> CGFloat {
                    return UIScreen.main.bounds.width*ComponentWidth.widthSmall.rawValue
                }
                
                static func normal() -> CGFloat {
                    return UIScreen.main.bounds.width*ComponentWidth.widthNormal.rawValue
                }
                
                static func semiLarge() -> CGFloat {
                    return UIScreen.main.bounds.width*ComponentWidth.widthSemiLarge.rawValue
                }
                
                static func large() -> CGFloat {
                    return UIScreen.main.bounds.width*ComponentWidth.widthLarge.rawValue
                }
                
            }
        }
        
    }
    
    struct NavigationBarStyle {
        
        static func apperance() -> UINavigationBarAppearance {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = StyleKit.Colours.primaryColour()
            appearance.titleTextAttributes = [.foregroundColor: StyleKit.Colours.white()]
            appearance.largeTitleTextAttributes = [.foregroundColor: StyleKit.Colours.white()]
            return appearance
        }
    }
    
    
}


private enum ComponentWidth: CGFloat {
    case widthLarge = 1.0
    case widthSemiLarge = 0.8
    case widthNormal = 0.6
    case widthSmall = 0.4
}

private enum ComponentHeight: CGFloat {
    case heightLarge = 50.0
    case heightSemiLarge = 40.0
    case heightNormal = 30.0
    case heightSmall = 20.0
}

private enum FontType: String {
    case regular = "SF-UI-Text-Regular"
    case semiBold = "SF-UI-Text-Semibold"
    case bold = "SF-UI-Text-Bold"
}

enum Size: CGFloat {
    case extra_small = 10.0
    case small = 12.0
    case medium = 14.0
    case large = 16.0
    case extra_large = 30.0
}
