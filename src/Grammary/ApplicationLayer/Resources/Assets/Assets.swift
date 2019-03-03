// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
internal typealias AssetType = ImageAsset

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum ActionButtons {
    internal static let correctSymbol = ImageAsset(name: "correctSymbol")
    internal static let delete = ImageAsset(name: "delete")
    internal static let refreshButton = ImageAsset(name: "refreshButton")
    internal static let warningSign = ImageAsset(name: "warningSign")
  }
  internal static let arrowPointingRightInACircle = ImageAsset(name: "arrowPointingRightInACircle")
  internal static let collegeGraduation = ImageAsset(name: "collegeGraduation")
  internal static let correctSymbol1 = ImageAsset(name: "correctSymbol1")
  internal static let group3 = ImageAsset(name: "group3")
  internal static let group4 = ImageAsset(name: "group4")
  internal static let house = ImageAsset(name: "house")
  internal static let laMountain = ImageAsset(name: "laMountain")
  internal static let laMountainDay = ImageAsset(name: "laMountainDay")
  internal static let leftArrow = ImageAsset(name: "leftArrow")
  internal static let moon = ImageAsset(name: "moon")
  internal static let pencilEditButton = ImageAsset(name: "pencilEditButton")
  internal static let rectangle = ImageAsset(name: "rectangle")
  internal static let settingsWorkTool = ImageAsset(name: "settingsWorkTool")
  internal static let sortDown = ImageAsset(name: "sortDown")
  internal static let stars = ImageAsset(name: "stars")
  internal static let sun = ImageAsset(name: "sun")

  // swiftlint:disable trailing_comma
  internal static let allColors: [ColorAsset] = [
  ]
  internal static let allImages: [ImageAsset] = [
    ActionButtons.correctSymbol,
    ActionButtons.delete,
    ActionButtons.refreshButton,
    ActionButtons.warningSign,
    arrowPointingRightInACircle,
    collegeGraduation,
    correctSymbol1,
    group3,
    group4,
    house,
    laMountain,
    laMountainDay,
    leftArrow,
    moon,
    pencilEditButton,
    rectangle,
    settingsWorkTool,
    sortDown,
    stars,
    sun,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  internal static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

internal extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
