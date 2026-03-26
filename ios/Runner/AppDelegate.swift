import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {

  private let fileChannelName = "file_intent_channel"
  private let screenshotChannelName = "screenshot_listener"
  private var initialFilePath: String?
  private var fileChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     guard let controller = window?.rootViewController as? FlutterViewController else {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
    
    fileChannel = FlutterMethodChannel(
      name: fileChannelName, 
      binaryMessenger: controller.binaryMessenger)

    if let url = launchOptions?[.url] as? URL {
        if url.startAccessingSecurityScopedResource() {
            initialFilePath = url.path
            url.stopAccessingSecurityScopedResource()
        } else {
            initialFilePath = url.path
        }
    }

    fileChannel?.setMethodCallHandler { [weak self] call, result in
      guard let self = self else { return }

      if call.method == "getInitialFile" {
          result(self.initialFilePath)
          self.initialFilePath = nil
      } else {
          result(FlutterMethodNotImplemented)
      }
    }

    let screenshotChannel = FlutterMethodChannel(
      name: screenshotChannelName,
      binaryMessenger: controller.binaryMessenger
    )

    screenshotChannel.setMethodCallHandler { call, result in
            switch call.method {
            case "disableScreenshot":
                controller.view.window?.layer.superlayer?.isHidden = true
                result(nil)

            case "enableScreenshot":
                controller.view.window?.layer.superlayer?.isHidden = false
                result(nil)

            default:
                result(FlutterMethodNotImplemented)
            }
        }

    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    // 📂 استقبال ملف أثناء تشغيل التطبيق
    override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {

    guard let controller = window?.rootViewController as? FlutterViewController else {
        return false
    }

    if url.startAccessingSecurityScopedResource() {
        fileChannel?.invokeMethod("onNewFile", arguments: url.path)
        url.stopAccessingSecurityScopedResource()
    }

    return true
}
}
