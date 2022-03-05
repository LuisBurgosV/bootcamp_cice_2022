//
//  CustomAlertManager.swift
//  CiceMusic
//
//  Created by Luis Burgos on 3/3/22.
//

import Foundation

enum DefaultAlertType: Int {
    case none
    case successLogin
    case failureLogin
    case cantSendMail
    case generalConfirmation
}

struct CustomAlertManager {
    var type: DefaultAlertType?
    
    // Success Login
    var successLoginTitle = LocalizedKeys.Login.titleAlertLoginSuccess
    var successLoginMessage = LocalizedKeys.Login.messageAlertLoginSuccess
    
    // Failure Login
    var failureLoginTitle = LocalizedKeys.Login.titleAlertLoginFailure
    var failureLoginMessage = LocalizedKeys.Login.messageAlertLoginFailure
    
    // Success Mail
    var successMailTitle = LocalizedKeys.Mail.titleAlertMailSuccess
    var successMailMessage = LocalizedKeys.Mail.messageAlertMailSuccess
    
    // Failure Mail
    var failureMailTitle = LocalizedKeys.Mail.titleAlertMailFailure
    var failureMailMessage = LocalizedKeys.Mail.messageAlertMailFailure
    
    // Confirmation
    var confirmationTitle = LocalizedKeys.Confirmation.titleAlertConfirmation
    var confirmationMessage = LocalizedKeys.Confirmation.messageAlertConfirmation
    
    // General Title Buttons
    var primaryButton = LocalizedKeys.General.generalAccept
    var secondButton = LocalizedKeys.General.generalCancel
    
    init(type: DefaultAlertType) {
        self.type = type
    }
}
