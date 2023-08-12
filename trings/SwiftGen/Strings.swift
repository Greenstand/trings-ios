// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Alert {
    internal enum Button {
      /// Ok
      internal static let ok = L10n.tr("Localizable", "Alert.Button.Ok", fallback: "Ok")
    }
    internal enum Title {
      /// Localizable.strings
      ///   trings
      /// 
      ///   Created by Alex Cornforth on 20/09/2022.
      internal static let error = L10n.tr("Localizable", "Alert.Title.Error", fallback: "Error")
    }
  }
  internal enum SignIn {
    /// Sign In
    internal static let title = L10n.tr("Localizable", "SignIn.Title", fallback: "Sign In")
    internal enum CreateWalletButton {
      /// Create Wallet
      internal static let title = L10n.tr("Localizable", "SignIn.CreateWalletButton.Title", fallback: "Create Wallet")
    }
    internal enum OrLabel {
      /// or
      internal static let text = L10n.tr("Localizable", "SignIn.OrLabel.Text", fallback: "or")
    }
    internal enum SignInButton {
      /// Sign In
      internal static let title = L10n.tr("Localizable", "SignIn.SignInButton.Title", fallback: "Sign In")
    }
    internal enum TextInput {
      internal enum Password {
        /// Password
        internal static let placeholder = L10n.tr("Localizable", "SignIn.TextInput.Password.Placeholder", fallback: "Password")
      }
      internal enum WalletName {
        /// Wallet Name
        internal static let placeholder = L10n.tr("Localizable", "SignIn.TextInput.WalletName.Placeholder", fallback: "Wallet Name")
      }
    }
  }
  internal enum TreeMap {
    /// Your trees
    internal static let title = L10n.tr("Localizable", "TreeMap.title", fallback: "Your trees")
  }
  internal enum Walkthrough {
    internal enum ContinueButton {
      /// Continue
      internal static let title = L10n.tr("Localizable", "Walkthrough.ContinueButton.Title", fallback: "Continue")
    }
    internal enum InTheCloud {
      /// Greenstand screens each new tree photo, verifies that it represents a living tree and tags it with additional attributes such as species. Each individual tree capture then appears on our
      internal static let info = L10n.tr("Localizable", "Walkthrough.InTheCloud.Info", fallback: "Greenstand screens each new tree photo, verifies that it represents a living tree and tags it with additional attributes such as species. Each individual tree capture then appears on our")
      /// In The Cloud
      internal static let title = L10n.tr("Localizable", "Walkthrough.InTheCloud.Title", fallback: "In The Cloud")
    }
    internal enum InYourWallet {
      /// Tree growers own their environmental impacts, and they have the option to trade or sell their Impact Tokens on an open market platform. Investors and donors can purchase those Tokens directly from tree growers.
      internal static let info = L10n.tr("Localizable", "Walkthrough.InYourWallet.Info", fallback: "Tree growers own their environmental impacts, and they have the option to trade or sell their Impact Tokens on an open market platform. Investors and donors can purchase those Tokens directly from tree growers.")
      /// In Your Wallet
      internal static let title = L10n.tr("Localizable", "Walkthrough.InYourWallet.Title", fallback: "In Your Wallet")
    }
    internal enum OnTheGround {
      /// Using our mobile Treetracker app, growers care for trees and take periodic, geotagged photos of them as they grow. These tree photo captures are uploaded to the Greenstand verification platform.
      internal static let info = L10n.tr("Localizable", "Walkthrough.OnTheGround.Info", fallback: "Using our mobile Treetracker app, growers care for trees and take periodic, geotagged photos of them as they grow. These tree photo captures are uploaded to the Greenstand verification platform.")
      /// On The Ground
      internal static let title = L10n.tr("Localizable", "Walkthrough.OnTheGround.Title", fallback: "On The Ground")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
