//
//  UDConfigurationStyle.swift

import Foundation
import AVFoundation
import CoreLocation
import MapKit
import UIKit

var safeAreaInsetsLeftOrRight: CGFloat = 0
var SCREEN_WIDTH: CGFloat {
    get {
        if UIScreen.main.bounds.height > UIScreen.main.bounds.width {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.width - safeAreaInsetsLeftOrRight
        }
    }
}
var SCREEN_HEIGHT: CGFloat {
    get {
        return UIScreen.main.bounds.size.height
    }
}

var MAX_WIDTH_MESSAGE: CGFloat {
    get {
        if UIScreen.main.bounds.height > UIScreen.main.bounds.width {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
}

let RC_TYPE_TEXT = 1
let RC_TYPE_EMOJI = 2
let RC_TYPE_PICTURE = 3
let RC_TYPE_VIDEO = 4
let RC_TYPE_File = 5
let RC_TYPE_Feedback = 6

let RC_STATUS_LOADING = 1
let RC_STATUS_SUCCEED = 2
let RC_STATUS_OPENIMAGE = 3

let RC_AUDIOSTATUS_STOPPED = 1
let RC_AUDIOSTATUS_PLAYING = 2

// MARK: - Configuration desigen
public struct ConfigurationStyle {
    public var navigationBarStyle: NavigationBarStyle
    public var chatStyle: ChatStyle
    public var sectionHeaderStyle: SectionHeaderStyle
    public var bubbleStyle: BubbleStyle
    public var avatarStyle: AvatarStyle
    public var messageStyle: MessageStyle
    public var feedbackMessageStyle: FeedbackMessageStyle
    public var pictureStyle: PictureStyle
    public var videoStyle: VideoStyle
    public var fileStyle: FileStyle
    public var inputViewStyle: InputViewStyle
    public var attachButtonStyle: AttachButtonStyle
    public var sendButtonStyle: SendButtonStyle
    public var messageButtonStyle: MessageButtonStyle
    public var feedbackFormStyle: FeedbackFormStyle
    public var baseStyle: BaseStyle
    public var baseSectionsStyle: BaseSectionsStyle
    public var baseCategoriesStyle: BaseCategoriesStyle
    public var baseArticlesListStyle: BaseArticlesListStyle
    public var baseSearchStyle: BaseSearchStyle
    public var baseArticleStyle: BaseArticleStyle
    
    public init(navigationBarStyle: NavigationBarStyle = NavigationBarStyle(),
                chatStyle: ChatStyle = ChatStyle(),
                sectionHeaderStyle: SectionHeaderStyle = SectionHeaderStyle(),
                bubbleStyle: BubbleStyle = BubbleStyle(),
                avatarStyle: AvatarStyle = AvatarStyle(),
                messageStyle: MessageStyle = MessageStyle(),
                feedbackMessageStyle: FeedbackMessageStyle = FeedbackMessageStyle(),
                pictureStyle: PictureStyle = PictureStyle(),
                videoStyle: VideoStyle = VideoStyle(),
                fileStyle: FileStyle = FileStyle(),
                inputViewStyle: InputViewStyle = InputViewStyle(),
                attachButtonStyle: AttachButtonStyle = AttachButtonStyle(),
                sendButtonStyle: SendButtonStyle = SendButtonStyle(),
                messageButtonStyle: MessageButtonStyle = MessageButtonStyle(),
                feedbackFormStyle: FeedbackFormStyle = FeedbackFormStyle(),
                baseStyle: BaseStyle = BaseStyle(),
                baseSectionsStyle: BaseSectionsStyle = BaseSectionsStyle(),
                baseCategoriesStyle: BaseCategoriesStyle = BaseCategoriesStyle(),
                articlesListStyle: BaseArticlesListStyle = BaseArticlesListStyle(),
                baseSearchStyle: BaseSearchStyle = BaseSearchStyle(),
                baseArticleStyle: BaseArticleStyle = BaseArticleStyle()) {
        self.navigationBarStyle = navigationBarStyle
        self.chatStyle = chatStyle
        self.sectionHeaderStyle = sectionHeaderStyle
        self.bubbleStyle = bubbleStyle
        self.avatarStyle = avatarStyle
        self.messageStyle = messageStyle
        self.feedbackMessageStyle = feedbackMessageStyle
        self.pictureStyle = pictureStyle
        self.videoStyle = videoStyle
        self.fileStyle = fileStyle
        self.inputViewStyle = inputViewStyle
        self.attachButtonStyle = attachButtonStyle
        self.sendButtonStyle = sendButtonStyle
        self.messageButtonStyle = messageButtonStyle
        self.navigationBarStyle = navigationBarStyle
        self.feedbackFormStyle = feedbackFormStyle
        self.baseStyle = baseStyle
        self.baseSectionsStyle = baseSectionsStyle
        self.baseCategoriesStyle = baseCategoriesStyle
        self.baseArticlesListStyle = articlesListStyle
        self.baseSearchStyle = baseSearchStyle
        self.baseArticleStyle = baseArticleStyle
    }
}

// MARK: -  NavigationBar
public struct NavigationBarStyle {
    public var backgroundColor: UIColor
    public var textColor: UIColor
    public var font: UIFont
    public var statusBarStyle: UIStatusBarStyle
    public var backButtonImage: UIImage?
    public var backButtonInFileImage: UIImage?
    public var searchButtonImage: UIImage?
    
    public init(backgroundColor: UIColor? = nil,
                textColor: UIColor? = nil,
                font: UIFont = UIFont.boldSystemFont(ofSize: 20),
                statusBarStyle: UIStatusBarStyle = .default,
                backButtonImage: UIImage? = nil,
                backButtonInFileImage: UIImage? = nil,
                searchButtonImage: UIImage? = nil) {
        self.backgroundColor = backgroundColor != nil ? backgroundColor! : UIColor(hexString: "F7F7F7")
        self.textColor = textColor != nil ? textColor! : UIColor(hexString: "333333")
        self.font = font
        self.statusBarStyle = statusBarStyle
        self.backButtonImage = backButtonImage != nil ? backButtonImage! : UIImage.named("backButton")
        self.backButtonInFileImage = backButtonInFileImage != nil ? backButtonInFileImage! : UIImage.named("backInFileButton")
        self.searchButtonImage = searchButtonImage != nil ? searchButtonImage! : UIImage.named("search")
    }
}
// MARK: -  ChatStyle
public struct ChatStyle {
    public var backgroundColor: UIColor
    
    public init(backgroundColor: UIColor? = nil) {
        self.backgroundColor = backgroundColor != nil ? backgroundColor! : UIColor(hexString: "FFFFFF")
    }
}

// MARK: -  Date messages section
public struct SectionHeaderStyle {
    public var margin: UIEdgeInsets
    public var textColor: UIColor
    public var textHeight: CGFloat
    public var font: UIFont
    public var backViewPadding: UIEdgeInsets
    public var backViewColor: UIColor
    public var backViewCornerRadius: CGFloat
    public var backViewOpacity: CGFloat
    
    public init(margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10),
                textColor: UIColor? = nil,
                textHeight: CGFloat = 16,
                font: UIFont = UIFont.systemFont(ofSize: 13),
                backViewPadding: UIEdgeInsets = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10),
                backViewColor: UIColor = .white,
                backViewCornerRadius: CGFloat = 12,
                backViewOpacity: CGFloat = 0.8) {
        
        self.margin = margin
        self.textColor = textColor == nil ? UIColor(hexString: "454D63") : textColor!
        self.textHeight = textHeight
        self.font = font
        self.backViewPadding = backViewPadding
        self.backViewColor = backViewColor
        self.backViewCornerRadius = backViewCornerRadius
        self.backViewOpacity = backViewOpacity
    }
    
    public var heightHeader: CGFloat {
        return textHeight + backViewPadding.top + backViewPadding.bottom + margin.top + margin.bottom
    }
}
// MARK: -  Bubble
public struct BubbleStyle {
    public var bubbleMarginLeft: CGFloat
    public var bubbleMarginRight: CGFloat
    public var bubbleRadius: CGFloat
    public var bubbleWidthMin: CGFloat
    public var bubbleHeightMin: CGFloat
    public var spacingOneSender: CGFloat
    public var spacingDifferentSender: CGFloat
    public var bubbleColorOutgoing: UIColor
    public var bubbleColorIncoming: UIColor
    
    public init(bubbleMarginLeft: CGFloat = 15.0,
                bubbleMarginRight: CGFloat = 15.0,
                bubbleRadius: CGFloat = 8,
                bubbleWidthMin: CGFloat = 7.0,
                bubbleHeightMin: CGFloat = 30.0,
                spacingOneSender: CGFloat = 4,
                spacingDifferentSender: CGFloat = 16,
                bubbleColorOutgoing: UIColor? = nil,
                bubbleColorIncoming: UIColor? = nil) {
        self.bubbleMarginLeft = bubbleMarginLeft
        self.bubbleMarginRight = bubbleMarginRight
        self.bubbleRadius = bubbleRadius
        self.bubbleWidthMin = bubbleWidthMin
        self.bubbleHeightMin = bubbleHeightMin
        self.spacingOneSender = spacingOneSender
        self.spacingDifferentSender = spacingDifferentSender
        self.bubbleColorOutgoing = bubbleColorOutgoing != nil ? bubbleColorOutgoing! : UIColor(hexString: "e0ecfc")
        self.bubbleColorIncoming = bubbleColorIncoming != nil ? bubbleColorIncoming! : UIColor(hexString: "F0F0F0")
    }
}
// MARK: -  Avatar
public struct AvatarStyle {
    public var avatarDiameter: CGFloat
    public var margin: UIEdgeInsets
    public var avatarIncomingHidden: Bool
    public var avatarBackColor: UIColor
    public var avatarTextColor: UIColor
    public var avatarFont: UIFont
    
    public init(avatarDiameter: CGFloat = 30.0,
                margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8),
                avatarIncomingHidden: Bool = false,
                avatarBackColor: UIColor? = nil,
                avatarTextColor: UIColor = UIColor.white,
                avatarFont: UIFont = UIFont.systemFont(ofSize: 12)) {
        self.avatarDiameter = avatarDiameter
        self.margin = margin
        self.avatarIncomingHidden = avatarIncomingHidden
        self.avatarBackColor = avatarBackColor == nil ? UIColor(hexString: "d6d6d6ff") : avatarBackColor!
        self.avatarTextColor = avatarTextColor
        self.avatarFont = avatarFont
    }
}
// MARK: -  Text cell
public struct MessageStyle {
    // Text Message
    public var textOutgoingColor: UIColor
    public var textIncomingColor: UIColor
    public var font: UIFont
    public var textMargin: UIEdgeInsets
    // Time Text
    public var timeOutgoingColor: UIColor
    public var timeIncomingColor: UIColor
    public var timeFont: UIFont
    public var timeMargin: UIEdgeInsets
    public var timeOutgoingPictureColor: UIColor
    public var timeIncomingPictureColor: UIColor
    // Time Back View
    public var timeBackViewOutgoingColor: UIColor
    public var timeBackViewIncomingColor: UIColor
    public var timeBackViewOpacity: CGFloat
    public var timeBackViewCornerRadius: CGFloat
    public var timeBackViewPadding: UIEdgeInsets
    // Sender Text
    public var senderTextColor: UIColor
    public var senderTextFont: UIFont
    public var senderTextMarginBottom: CGFloat
    
    public init(textOutgoingColor: UIColor? = nil,
                textIncomingColor: UIColor? = nil,
                font: UIFont = UIFont.systemFont(ofSize: 17),
                textInset: UIEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 7),
                timeOutgoingColor: UIColor? = nil,
                timeIncomingColor: UIColor? = nil,
                timeFont: UIFont = UIFont.systemFont(ofSize: 11),
                timeMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 6),
                timeOutgoingPictureColor: UIColor? = nil,
                timeIncomingPictureColor: UIColor? = nil,
                timeBackViewOutgoingColor: UIColor? = nil,
                timeBackViewIncomingColor: UIColor? = nil,
                timeBackViewOpacity: CGFloat = 0.6,
                timeBackViewCornerRadius: CGFloat = 7,
                timeBackViewPadding: UIEdgeInsets = UIEdgeInsets(top: 1, left: 4, bottom: 0, right: 4),
                senderTextColor: UIColor? = nil,
                senderTextFont: UIFont = UIFont.systemFont(ofSize: 11),
                senderTextMarginBottom: CGFloat = 4) {
        self.textOutgoingColor = textOutgoingColor != nil ? textOutgoingColor! : UIColor(hexString: "333333")
        self.textIncomingColor = textIncomingColor != nil ? textIncomingColor! : UIColor(hexString: "333333")
        self.font = font
        self.textMargin = textInset
        self.timeOutgoingPictureColor = timeOutgoingPictureColor != nil ? timeOutgoingPictureColor! : UIColor(hexString: "FFFFFF")
        self.timeIncomingPictureColor = timeIncomingPictureColor != nil ? timeIncomingPictureColor! : UIColor(hexString: "FFFFFF")
        self.timeOutgoingColor = timeOutgoingColor != nil ? timeOutgoingColor! : UIColor(hexString: "989FB3")
        self.timeIncomingColor = timeIncomingColor != nil ? timeIncomingColor! : UIColor(hexString: "989FB3")
        self.timeFont = timeFont
        self.timeMargin = timeMargin
        self.timeBackViewOutgoingColor = timeBackViewOutgoingColor != nil ? timeBackViewOutgoingColor! : UIColor(hexString: "333333")
        self.timeBackViewIncomingColor = timeBackViewIncomingColor != nil ? timeBackViewIncomingColor! : UIColor(hexString: "333333")
        self.timeBackViewOpacity = timeBackViewOpacity
        self.timeBackViewCornerRadius = timeBackViewCornerRadius
        self.timeBackViewPadding = timeBackViewPadding
        self.senderTextColor = senderTextColor != nil ? senderTextColor! : UIColor(hexString: "989FB3")
        self.senderTextFont = senderTextFont
        self.senderTextMarginBottom = senderTextMarginBottom
    }
}
// MARK: -  Feedback Message cell
public struct FeedbackMessageStyle {
    public var buttonSize: CGSize
    public var buttonsMargin: UIEdgeInsets
    public var likeOnImage: UIImage
    public var likeOffImage: UIImage
    public var dislikeOnImage: UIImage
    public var dislikeOffImage: UIImage
    public var textColor: UIColor
    public var font: UIFont
    public var textMargin: UIEdgeInsets
    public var textFinished: String
    
    public init(buttonSize: CGSize = CGSize(width: 56, height: 56),
                buttonsMargin: UIEdgeInsets = UIEdgeInsets(top: 25, left: 12, bottom: 0, right: 12),
                likeOnImage: UIImage? = nil,
                likeOffImage: UIImage? = nil,
                dislikeOnImage: UIImage? = nil,
                dislikeOffImage: UIImage? = nil,
                textColor: UIColor? = nil,
                font: UIFont = UIFont.systemFont(ofSize: 17),
                textMargin: UIEdgeInsets = UIEdgeInsets(top: 17, left: 28, bottom: 14, right: 28),
                textFinished: String = "Спасибо за вашу оценку") {
        self.buttonSize = buttonSize
        self.buttonsMargin = buttonsMargin
        self.likeOnImage = likeOnImage != nil ? likeOnImage! : UIImage.named("likeOn")
        self.likeOffImage = likeOffImage != nil ? likeOffImage! : UIImage.named("likeOff")
        self.dislikeOnImage = dislikeOnImage != nil ? dislikeOnImage! : UIImage.named("dislikeOn")
        self.dislikeOffImage = dislikeOffImage != nil ? dislikeOffImage! : UIImage.named("dislikeOff")
        self.textColor = textColor != nil ? textColor! : UIColor(hexString: "333333")
        self.font = font
        self.textMargin = textMargin
        self.textFinished = textFinished
    }
}
// MARK: -  Picture cell
public struct PictureStyle {
    public var margin: UIEdgeInsets
    public var imageDefault: UIImage
    public var sizeDefault: CGSize
    
    public init(margin: UIEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2),
                imageDefault: UIImage? = nil,
                sizeDefault: CGSize = CGSize(width: 150, height: 170)) {
        self.margin = margin
        self.imageDefault = imageDefault != nil ? imageDefault! : UIImage.named("pictureDefault")
        self.sizeDefault = sizeDefault
    }
}
// MARK: -  Video cell
public struct VideoStyle {
    public var margin: UIEdgeInsets
    public var imageDefault: UIImage
    public var sizeDefault: CGSize

    public init(margin: UIEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2),
                imageDefault: UIImage? = nil,
                sizeDefault: CGSize = CGSize(width: 150, height: 170)) {
        self.margin = margin
        self.imageDefault = imageDefault != nil ? imageDefault! : UIImage.named("videoDefault")
        self.sizeDefault = sizeDefault
    }
}
// MARK: -  File cell
public struct FileStyle {
    public var iconMargin: UIEdgeInsets
    public var imageIcon: UIImage
    public var iconSize: CGSize
    public var fontName: UIFont
    public var nameMargin: UIEdgeInsets
    public var nameColor: UIColor
    public var fontSize: UIFont
    public var sizeMargin: UIEdgeInsets
    public var sizeColor: UIColor

    public init(iconMargin: UIEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 8),
                imageIcon: UIImage? = nil,
                iconSize: CGSize = CGSize(width: 40, height: 40),
                fontName: UIFont = UIFont.systemFont(ofSize: 17),
                nameMargin: UIEdgeInsets = UIEdgeInsets(top: 9, left: 0, bottom: 0, right: 20),
                nameColor: UIColor? = nil,
                fontSize: UIFont = UIFont.systemFont(ofSize: 12),
                sizeMargin: UIEdgeInsets = UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 20),
                sizeColor: UIColor? = nil) {
        self.iconMargin = iconMargin
        self.imageIcon = imageIcon != nil ? imageIcon! : UIImage.named("fileIcon")
        self.iconSize = iconSize
        self.fontName = fontName
        self.nameMargin = nameMargin
        self.nameColor = nameColor != nil ? nameColor! : UIColor(hexString: "333333")
        self.fontSize = fontSize
        self.sizeMargin = sizeMargin
        self.sizeColor = sizeColor != nil ? sizeColor! : UIColor(hexString: "989FB3")
    }
}
// MARK: -  Input View
public struct InputViewStyle {
    public var viewBackColor: UIColor
    public var textBackColor: UIColor
    public var textColor: UIColor
    public var placeholderTextColor: UIColor
    public var font: UIFont
    public var textHeightMin: CGFloat
    public var textHeightMax: CGFloat
    public var textMargin: UIEdgeInsets
    public var inputTextViewBorderWidth: CGFloat
    public var inputTextViewBorderColor: CGColor
    public var inputTextViewRadius: CGFloat
    public var inputTextViewMargin: UIEdgeInsets
    public var heightAssetsCollection: CGFloat
    public var topMarginAssetsCollection: CGFloat
    
    public init(viewBackColor: UIColor? = nil,
                textBackColor: UIColor = UIColor.white,
                textColor: UIColor = UIColor.black,
                placeholderTextColor: UIColor? = nil,
                font: UIFont = UIFont.systemFont(ofSize: 17),
                textHeightMin: CGFloat = 30,
                textHeightMax: CGFloat = 98,
                textMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                inputTextViewBorderWidth: CGFloat = 0,
                inputTextViewBorderColor: CGColor = UIColor.clear.cgColor,
                inputTextViewRadius: CGFloat = 18,
                inputTextViewMargin: UIEdgeInsets = UIEdgeInsets(top: 7, left: 0, bottom: 7, right: 0),
                heightAssetsCollection: CGFloat = 72,
                topMarginAssetsCollection: CGFloat = 15) {
        self.viewBackColor = viewBackColor != nil ? viewBackColor! : UIColor(hexString: "F7F7F7")
        self.textBackColor = textBackColor
        self.textColor = textColor
        self.placeholderTextColor = placeholderTextColor != nil ? placeholderTextColor! : UIColor(hexString: "#BDBDBD")
        self.font = font
        self.textHeightMin = textHeightMin
        self.textHeightMax = textHeightMax
        self.textMargin = textMargin
        self.inputTextViewBorderWidth = inputTextViewBorderWidth
        self.inputTextViewBorderColor = inputTextViewBorderColor
        self.inputTextViewRadius = inputTextViewRadius
        self.inputTextViewMargin = inputTextViewMargin
        self.heightAssetsCollection = heightAssetsCollection
        self.topMarginAssetsCollection = topMarginAssetsCollection
    }
}
// MARK: -  AttachButtonStyle
public struct AttachButtonStyle {
    public var margin: UIEdgeInsets
    public var size: CGSize
    public var image: UIImage
    
    public init(margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 7, right: 12),
                size: CGSize = CGSize(width: 24, height: 24),
                image: UIImage? = nil) {
        self.image = (image != nil) ? image! : UIImage.named("attachButton")
        self.margin = margin
        self.size = size
    }
}

// MARK: -  SendButtonStyle
public struct SendButtonStyle {
    public var margin: UIEdgeInsets
    public var size: CGSize
    public var image: UIImage
    
    public init(margin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 9, bottom: 0, right: 12),
                size: CGSize = CGSize(width: 32, height: 32),
                image: UIImage? = nil) {
        self.image = (image != nil) ? image! : UIImage.named("sendButton")
        self.margin = margin
        self.size = size
    }
}

// MARK: -  Message Button
public struct MessageButtonStyle {
    public var color: UIColor
    public var textColor: UIColor
    public var textFont: UIFont
    public var cornerRadius: CGFloat
    public var margin: UIEdgeInsets
    public var padding: UIEdgeInsets
    
    public init(color: UIColor? = nil,
                textColor: UIColor? = nil,
                textFont: UIFont = UIFont.systemFont(ofSize: 11),
                cornerRadius: CGFloat = 8,
                margin: UIEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 6),
                padding: UIEdgeInsets = UIEdgeInsets(top: 12, left: 9, bottom: 12, right: 9)) {
        self.color = color != nil ? color! : UIColor(hexString: "333333")
        self.textColor = textColor != nil ? textColor! : UIColor(hexString: "FFFFFF")
        self.textFont = textFont
        self.cornerRadius = cornerRadius
        self.margin = margin
        self.padding = padding
    }
}

// MARK: -  FeedbackFormStyle
public struct FeedbackFormStyle {
    public var buttonColor: UIColor
    public var buttonColorDisabled: UIColor
    public var buttonTextColor: UIColor
    public var buttonFont: UIFont
    public var buttonCornerRadius: CGFloat
    public var textColor: UIColor
    public var textFont: UIFont
    public var headerFont: UIFont
    public var headerColor: UIColor
    public var valueFont: UIFont
    public var valueColor: UIColor
    public var lineSeparatorColor: UIColor
    public var lineSeparatorActiveColor: UIColor
    public var errorColor: UIColor
    public var sendedImage: UIImage
    
    public init(buttonColor: UIColor? = nil,
                buttonColorDisabled: UIColor? = nil,
                buttonTextColor: UIColor? = nil,
                buttonFont: UIFont = UIFont.systemFont(ofSize: 16),
                buttonCornerRadius: CGFloat = 8,
                textColor: UIColor? = nil,
                textFont: UIFont = UIFont.systemFont(ofSize: 16),
                headerFont: UIFont = UIFont.systemFont(ofSize: 15),
                headerColor: UIColor? = nil,
                valueFont: UIFont = UIFont.systemFont(ofSize: 16),
                valueColor: UIColor? = nil,
                lineSeparatorColor: UIColor? = nil,
                lineSeparatorActiveColor: UIColor? = nil,
                errorColor: UIColor? = nil,
                sendedImage: UIImage? = nil) {
        self.buttonColor = buttonColor != nil ? buttonColor! : UIColor(hexString: "333333")
        self.buttonColorDisabled = buttonColorDisabled != nil ? buttonColorDisabled! : UIColor(hexString: "565656")
        self.buttonTextColor = buttonTextColor != nil ? buttonTextColor! : .white
        self.buttonFont = buttonFont
        self.buttonCornerRadius = buttonCornerRadius
        self.textColor = textColor != nil ? textColor! : .black
        self.textFont = textFont
        self.headerFont = headerFont
        self.headerColor = headerColor != nil ? headerColor! : UIColor(hexString: "BDBDBD")
        self.valueFont = valueFont
        self.valueColor = valueColor != nil ? valueColor! : UIColor(hexString: "333333")
        self.lineSeparatorColor = lineSeparatorColor != nil ? lineSeparatorColor! : UIColor(hexString: "E0E0E0")
        self.lineSeparatorActiveColor = lineSeparatorActiveColor != nil ? lineSeparatorActiveColor! : UIColor(hexString: "333333")
        self.errorColor = errorColor != nil ? errorColor! : UIColor(hexString: "EB5757")
        self.sendedImage = (sendedImage != nil) ? sendedImage! : UIImage.named("sended")
    }
}

// MARK: -  Base
public struct BaseStyle {
    public var backColor: UIColor
    public var chatIconImage: UIImage
    public var chatButtonBackColor: UIColor
    public var chatButtonCornerRadius: CGFloat
    public var chatButtonSize: CGSize
    public var chatButtonMargin: UIEdgeInsets
    public var shadowOffset: CGSize
    public var shadowOpacity: Float
    public var shadowRadius: CGFloat
    public var shadowColor: CGColor
    public var searchBarTextBackgroundColor: UIColor
    public var searchBarTextColor: UIColor
    public var searchBarTintColor: UIColor
    public var searchCancelButtonColor: UIColor
    
    public init(backColor: UIColor? = nil,
                chatIconImage: UIImage? = nil,
                chatButtonBackColor: UIColor? = nil,
                chatButtonCornerRadius: CGFloat = 28,
                chatButtonSize: CGSize = CGSize(width: 56, height: 56),
                chatButtonMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 17, right: 12),
                shadowOffset: CGSize = CGSize(width: 0.0, height: 10.0),
                shadowOpacity: Float = 0.2,
                shadowRadius: CGFloat = 15,
                shadowColor: CGColor? = nil,
                searchBarTextBackgroundColor: UIColor = .white,
                searchBarTextColor: UIColor = .black,
                searchBarTintColor: UIColor = .red,
                searchCancelButtonColor: UIColor? = nil) {
        self.backColor = backColor != nil ? backColor! : .white
        self.chatIconImage = (chatIconImage != nil) ? chatIconImage! : UIImage.named("chatIcon")
        self.chatButtonBackColor = chatButtonBackColor != nil ? chatButtonBackColor! : UIColor(hexString: "333333")
        self.chatButtonCornerRadius = chatButtonCornerRadius
        self.chatButtonSize = chatButtonSize
        self.chatButtonMargin = chatButtonMargin
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
        self.shadowColor = shadowColor != nil ? shadowColor! : UIColor(hexString: "000000").cgColor
        self.searchBarTextBackgroundColor = searchBarTextBackgroundColor
        self.searchBarTextColor = searchBarTextColor
        self.searchBarTintColor = searchBarTintColor
        self.searchCancelButtonColor = searchCancelButtonColor != nil ? searchCancelButtonColor! : UIColor(hexString: "EB5757") 
    }
}
// MARK: -  Base Section
public struct BaseSectionsStyle {
    // Cell Style
    public var textFont: UIFont
    public var textColor: UIColor
    public var textMargin: UIEdgeInsets
    public var iconDefaultImage: UIImage
    public var iconFont: UIFont
    public var iconTextColor: UIColor
    public var iconSize: CGSize
    public var iconMargin: UIEdgeInsets
    public var arrowImage: UIImage
    public var arrowSize: CGSize
    public var arrowMargin: UIEdgeInsets
    public var separatorColor: UIColor
    public var separatorLeftMargin: CGFloat
    public var separatorHeight: CGFloat
    
    public init(textFont: UIFont = UIFont.boldSystemFont(ofSize: 17),
                textColor: UIColor = .black,
                textMargin: UIEdgeInsets = UIEdgeInsets(top: 17, left: 14, bottom: 17, right: 14),
                iconDefaultImage: UIImage? = nil,
                iconFont: UIFont = UIFont.systemFont(ofSize: 22),
                iconTextColor: UIColor? = nil,
                iconSize: CGSize = CGSize(width: 44, height: 44),
                iconMargin: UIEdgeInsets = UIEdgeInsets(top: 6, left: 16, bottom: 0, right: 0),
                arrowImage: UIImage? = nil,
                arrowSize: CGSize = CGSize(width: 24, height: 24),
                arrowMargin: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 20),
                separatorColor: UIColor? = nil,
                separatorLeftMargin: CGFloat = 73,
                separatorHeight: CGFloat = 1) {
        self.textFont = textFont
        self.textColor = textColor
        self.textMargin = textMargin
        self.iconDefaultImage = (iconDefaultImage != nil) ? iconDefaultImage! : UIImage.named("iconBaseSection")
        self.iconFont = iconFont
        self.iconTextColor = iconTextColor != nil ? iconTextColor! : UIColor(hexString: "989FB3")
        self.iconSize = iconSize
        self.iconMargin = iconMargin
        self.arrowImage = (arrowImage != nil) ? arrowImage! : UIImage.named("arrow")
        self.arrowSize = arrowSize
        self.arrowMargin = arrowMargin
        self.separatorColor = separatorColor != nil ? separatorColor! : UIColor(hexString: "D2D7E5")
        self.separatorLeftMargin = separatorLeftMargin
        self.separatorHeight = separatorHeight
    }
}
// MARK: -  Base Categories
public struct BaseCategoriesStyle {
    // Cell Style
    public var textFont: UIFont
    public var textColor: UIColor
    public var textMargin: UIEdgeInsets
    public var countArticlesFont: UIFont
    public var countArticlesColor: UIColor
    public var countArticlesMargin: UIEdgeInsets
    public var descriptionFont: UIFont
    public var descriptionColor: UIColor
    public var descriptionMargin: UIEdgeInsets
    public var arrowImage: UIImage
    public var arrowSize: CGSize
    public var arrowMargin: UIEdgeInsets
    public var separatorColor: UIColor
    public var separatorLeftMargin: CGFloat
    public var separatorHeight: CGFloat
    
    public init(textFont: UIFont = UIFont.systemFont(ofSize: 17),
                textColor: UIColor = .black,
                textMargin: UIEdgeInsets = UIEdgeInsets(top: 17, left: 14, bottom: 6, right: 14),
                countArticlesFont: UIFont = UIFont.systemFont(ofSize: 15),
                countArticlesColor: UIColor? = nil,
                countArticlesMargin: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 8),
                descriptionFont: UIFont = UIFont.systemFont(ofSize: 14),
                descriptionColor: UIColor? = nil,
                descriptionMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 16, right: 20),
                arrowImage: UIImage? = nil,
                arrowSize: CGSize = CGSize(width: 24, height: 24),
                arrowMargin: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 20),
                separatorColor: UIColor? = nil,
                separatorLeftMargin: CGFloat = 16,
                separatorHeight: CGFloat = 1) {
        self.textFont = textFont
        self.textColor = textColor
        self.textMargin = textMargin
        self.countArticlesFont = countArticlesFont
        self.countArticlesColor = countArticlesColor != nil ? countArticlesColor! : UIColor(hexString: "989FB3")
        self.countArticlesMargin = countArticlesMargin
        self.descriptionFont = descriptionFont
        self.descriptionColor = descriptionColor != nil ? descriptionColor! : UIColor(hexString: "989FB3")
        self.descriptionMargin = descriptionMargin
        self.arrowImage = (arrowImage != nil) ? arrowImage! : UIImage.named("arrow")
        self.arrowSize = arrowSize
        self.arrowMargin = arrowMargin
        self.separatorColor = separatorColor != nil ? separatorColor! : UIColor(hexString: "D2D7E5")
        self.separatorLeftMargin = separatorLeftMargin
        self.separatorHeight = separatorHeight
    }
}
// MARK: -  Articles List
public struct BaseArticlesListStyle {
    // Cell Style
    public var textFont: UIFont
    public var textColor: UIColor
    public var textMargin: UIEdgeInsets
    public var separatorColor: UIColor
    public var separatorLeftMargin: CGFloat
    public var separatorHeight: CGFloat

    public init(textFont: UIFont = UIFont.systemFont(ofSize: 17),
                textColor: UIColor = .black,
                textMargin: UIEdgeInsets = UIEdgeInsets(top: 16, left: 14, bottom: 16, right: 14),
                separatorColor: UIColor? = nil,
                separatorLeftMargin: CGFloat = 16,
                separatorHeight: CGFloat = 1) {
        self.textFont = textFont
        self.textColor = textColor
        self.textMargin = textMargin
        self.separatorColor = separatorColor != nil ? separatorColor! : UIColor(hexString: "D2D7E5")
        self.separatorLeftMargin = separatorLeftMargin
        self.separatorHeight = separatorHeight
    }
}
// MARK: -  Base Search
public struct BaseSearchStyle {
    // Cell Style
    public var titleFont: UIFont
    public var titleColor: UIColor
    public var titleMargin: UIEdgeInsets
    public var textFont: UIFont
    public var textColor: UIColor
    public var textMargin: UIEdgeInsets
    public var pathFont: UIFont
    public var pathColor: UIColor
    public var pathMargin: UIEdgeInsets
    public var separatorColor: UIColor
    public var separatorLeftMargin: CGFloat
    public var separatorHeight: CGFloat
    
    public init(titleFont: UIFont = UIFont.systemFont(ofSize: 17),
                titleColor: UIColor? = nil,
                titleMargin: UIEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 4, right: 20),
                textFont: UIFont = UIFont.systemFont(ofSize: 14),
                textColor: UIColor = .black,
                textMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 6, right: 20),
                pathFont: UIFont = UIFont.systemFont(ofSize: 14),
                pathColor: UIColor? = nil,
                pathMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 12, right: 20),
                separatorColor: UIColor? = nil,
                separatorLeftMargin: CGFloat = 16,
                separatorHeight: CGFloat = 1) {
        self.titleFont = titleFont
        self.titleColor = titleColor != nil ? titleColor! : UIColor(hexString: "333333")
        self.titleMargin = titleMargin
        self.textFont = textFont
        self.textColor = textColor
        self.textMargin = textMargin
        self.pathFont = pathFont
        self.pathColor = pathColor != nil ? pathColor! : UIColor(hexString: "989FB3")
        self.pathMargin = pathMargin
        self.separatorColor = separatorColor != nil ? separatorColor! : UIColor(hexString: "D2D7E5")
        self.separatorLeftMargin = separatorLeftMargin
        self.separatorHeight = separatorHeight
    }
}
// MARK: -  Base Search
public struct BaseArticleStyle {

    public var titleFont: UIFont
    public var titleColor: UIColor
    public var titleMargin: UIEdgeInsets
    
    public var titleBigFont: UIFont
    public var titleBigColor: UIColor
    public var titleBigMargin: UIEdgeInsets
    
    public var closeButtonImage: UIImage
    public var closeButtonSize: CGSize
    public var closeButtonMargin: UIEdgeInsets
    
    public var topSeparatorViewColor: UIColor
    // Review Style
    public var reviewFont: UIFont
    public var reviewColor: UIColor
    public var reviewMargin: UIEdgeInsets
    
    public var reviewYesButtonColor: UIColor
    public var reviewYesButtonCornerRadius: CGFloat
    public var reviewYesFont: UIFont
    public var reviewYesColor: UIColor
    public var reviewYesButtonTextMargin: UIEdgeInsets
    public var reviewYesButtonMargin: UIEdgeInsets
    
    public var reviewNoButtonColor: UIColor
    public var reviewNoButtonCornerRadius: CGFloat
    public var reviewNoFont: UIFont
    public var reviewNoColor: UIColor
    public var reviewNoButtonTextMargin: UIEdgeInsets
    public var reviewNoButtonMargin: UIEdgeInsets
    
    public var reviewSendTextFont: UIFont
    public var reviewSendTextColor: UIColor
    public var reviewSendTextMargin: UIEdgeInsets
    
    public var reviewLineBottomColor: UIColor
    public var reviewLineMarginTop: CGFloat
    public var reviewLineHeight: CGFloat
    
    public var reviewSendButtonColor: UIColor
    public var reviewSendButtonCornerRadius: CGFloat
    public var reviewSendFont: UIFont
    public var reviewSendColor: UIColor
    public var reviewSendButtonTextMargin: UIEdgeInsets
    public var reviewSendButtonMargin: UIEdgeInsets
    // Transitions Style
    public var previousArticleImage: UIImage
    public var previousArticleImageSize: CGSize
    public var previousArticleImageMargin: UIEdgeInsets
    
    public var nextArticleImage: UIImage
    public var nextArticleImageSize: CGSize
    public var nextArticleImageMargin: UIEdgeInsets
    
    public var articlePreviousFont: UIFont
    public var articlePreviousColor: UIColor
    public var articlePreviousMargin: UIEdgeInsets
    
    public var articleNextFont: UIFont
    public var articleNextColor: UIColor
    public var articleNextMargin: UIEdgeInsets
    
    public var separatorViewColor: UIColor
    public var separatorViewMargin: UIEdgeInsets
    public var separatorViewHeight: CGFloat
    
    public init(titleFont: UIFont = UIFont.boldSystemFont(ofSize: 17),
                titleColor: UIColor? = nil,
                titleMargin: UIEdgeInsets = UIEdgeInsets(top: 22, left: 55, bottom: 0, right: 8),
                titleBigFont: UIFont = UIFont.boldSystemFont(ofSize: 22),
                titleBigColor: UIColor? = nil,
                titleBigMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 12, right: 16),
                closeButtonImage: UIImage? = nil,
                closeButtonSize: CGSize = CGSize(width: 30, height: 30),
                closeButtonMargin: UIEdgeInsets = UIEdgeInsets(top: 20, left: 8, bottom: 13, right: 16),
                topSeparatorViewColor: UIColor? = nil,
                reviewFont: UIFont = UIFont.boldSystemFont(ofSize: 16),
                reviewColor: UIColor? = nil,
                reviewMargin: UIEdgeInsets = UIEdgeInsets(top: 36, left: 16, bottom: 0, right: 16),
                reviewYesButtonColor: UIColor? = nil,
                reviewYesButtonCornerRadius: CGFloat = 0,
                reviewYesFont: UIFont = UIFont.boldSystemFont(ofSize: 12),
                reviewYesColor: UIColor? = nil,
                reviewYesButtonTextMargin: UIEdgeInsets = UIEdgeInsets(top: 11, left: 22, bottom: 11, right: 22),
                reviewYesButtonMargin: UIEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 26, right: 8),
                reviewNoButtonColor: UIColor? = nil,
                reviewNoButtonCornerRadius: CGFloat = 0,
                reviewNoFont: UIFont = UIFont.boldSystemFont(ofSize: 12),
                reviewNoColor: UIColor? = nil,
                reviewNoButtonTextMargin: UIEdgeInsets = UIEdgeInsets(top: 11, left: 22, bottom: 11, right: 22),
                reviewNoButtonMargin: UIEdgeInsets = UIEdgeInsets(top: 12, left: 8, bottom: 26, right: 8),
                reviewSendTextFont: UIFont = UIFont.systemFont(ofSize: 14),
                reviewSendTextColor: UIColor = .black,
                reviewSendTextMargin: UIEdgeInsets = UIEdgeInsets(top: 23, left: 16, bottom: 56, right: 16),
                reviewLineBottomColor: UIColor? = nil,
                reviewLineMarginTop: CGFloat = 0,
                reviewLineHeight: CGFloat = 2,
                reviewSendButtonColor: UIColor? = nil,
                reviewSendButtonCornerRadius: CGFloat = 0,
                reviewSendFont: UIFont = UIFont.boldSystemFont(ofSize: 12),
                reviewSendColor: UIColor? = nil,
                reviewSendButtonTextMargin: UIEdgeInsets = UIEdgeInsets(top: 11, left: 22, bottom: 11, right: 22),
                reviewSendButtonMargin: UIEdgeInsets = UIEdgeInsets(top: 13, left: 16, bottom: 26, right: 16),
                previousArticleImage: UIImage? = nil,
                previousArticleImageSize: CGSize = CGSize(width: 24, height: 24),
                previousArticleImageMargin: UIEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 9),
                nextArticleImage: UIImage? = nil,
                nextArticleImageSize: CGSize = CGSize(width: 24, height: 24),
                nextArticleImageMargin: UIEdgeInsets = UIEdgeInsets(top: 12, left: 9, bottom: 0, right: 16),
                articlePreviousFont: UIFont = UIFont.systemFont(ofSize: 17),
                articlePreviousColor: UIColor? = nil,
                articlePreviousMargin: UIEdgeInsets = UIEdgeInsets(top: 13, left: 0, bottom: 16, right: 15),
                articleNextFont: UIFont = UIFont.systemFont(ofSize: 17),
                articleNextColor: UIColor? = nil,
                articleNextMargin: UIEdgeInsets = UIEdgeInsets(top: 13, left: 15, bottom: 16, right: 0),
                separatorViewColor: UIColor? = nil,
                separatorViewMargin: UIEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
                separatorViewHeight: CGFloat = 1) {
        self.titleFont = titleFont
        self.titleColor = titleColor != nil ? titleColor! : UIColor(hexString: "333333")
        self.titleMargin = titleMargin
        self.titleBigFont = titleBigFont
        self.titleBigColor = titleBigColor != nil ? titleBigColor! : UIColor(hexString: "333333")
        self.titleBigMargin = titleMargin
        self.closeButtonImage = (closeButtonImage != nil) ? closeButtonImage! : UIImage.named("closeArticle")
        self.closeButtonSize = closeButtonSize
        self.closeButtonMargin = closeButtonMargin
        self.topSeparatorViewColor = topSeparatorViewColor != nil ? topSeparatorViewColor! : UIColor(hexString: "D2D7E5")
        self.reviewFont = reviewFont
        self.reviewColor = reviewColor != nil ? reviewColor! : UIColor(hexString: "333333")
        self.reviewMargin = reviewMargin
        self.reviewYesButtonColor = reviewYesButtonColor != nil ? reviewYesButtonColor! : UIColor(hexString: "e9f8e6")
        self.reviewYesButtonCornerRadius = reviewYesButtonCornerRadius
        self.reviewYesFont = reviewYesFont
        self.reviewYesColor = reviewYesColor != nil ? reviewYesColor! : UIColor(hexString: "26BC00")
        self.reviewYesButtonTextMargin = reviewYesButtonTextMargin
        self.reviewYesButtonMargin = reviewYesButtonMargin
        self.reviewNoButtonColor = reviewNoButtonColor != nil ? reviewNoButtonColor! : UIColor(hexString: "fdeeee")
        self.reviewNoButtonCornerRadius = reviewNoButtonCornerRadius
        self.reviewNoFont = reviewNoFont
        self.reviewNoColor = reviewNoColor != nil ? reviewNoColor! : UIColor(hexString: "EB5757")
        self.reviewNoButtonTextMargin = reviewNoButtonTextMargin
        self.reviewNoButtonMargin = reviewNoButtonMargin
        self.reviewSendTextFont = reviewSendTextFont
        self.reviewSendTextColor = reviewSendTextColor
        self.reviewSendTextMargin = reviewSendTextMargin
        self.reviewLineBottomColor = reviewLineBottomColor != nil ? reviewLineBottomColor! : UIColor(hexString: "26BC00")
        self.reviewLineMarginTop = reviewLineMarginTop
        self.reviewLineHeight = reviewLineHeight
        self.reviewSendButtonColor = reviewSendButtonColor != nil ? reviewSendButtonColor! : UIColor(hexString: "e9f8e6")
        self.reviewSendButtonCornerRadius = reviewSendButtonCornerRadius
        self.reviewSendFont = reviewSendFont
        self.reviewSendColor = reviewSendColor != nil ? reviewSendColor! : UIColor(hexString: "26BC00")
        self.reviewSendButtonTextMargin = reviewSendButtonTextMargin
        self.reviewSendButtonMargin = reviewSendButtonMargin
        self.previousArticleImage = (previousArticleImage != nil) ? previousArticleImage! : UIImage.named("previousArticle")
        self.previousArticleImageSize = previousArticleImageSize
        self.previousArticleImageMargin = previousArticleImageMargin
        self.nextArticleImage = (nextArticleImage != nil) ? nextArticleImage! : UIImage.named("nextArticle")
        self.nextArticleImageSize = nextArticleImageSize
        self.nextArticleImageMargin = nextArticleImageMargin
        self.articlePreviousFont = articlePreviousFont
        self.articlePreviousColor = articlePreviousColor != nil ? articlePreviousColor! : UIColor(hexString: "2F80ED")
        self.articlePreviousMargin = articlePreviousMargin
        self.articleNextFont = articleNextFont
        self.articleNextColor = articleNextColor != nil ? articleNextColor! : UIColor(hexString: "2F80ED")
        self.articleNextMargin = articleNextMargin
        self.separatorViewColor = reviewYesColor != nil ? reviewYesColor! : UIColor(hexString: "D3D8E8")
        self.separatorViewMargin = separatorViewMargin
        self.separatorViewHeight = separatorViewHeight
    }
}
