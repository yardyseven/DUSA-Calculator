//
//  FileResource.swift
//  Pods
//
//  Created by Mathijs Kadijk on 06-01-16.
//
//

import Foundation

public protocol FileResourceType {

  /// Bundle this file is in or nil for main bundle
  var bundle: NSBundle? { get }

  /// Name of the file file on disk
  var name: String { get }

  /// Extension of the file on disk
  var pathExtension: String { get }
}

public extension FileResourceType {
  /**
   Returns the full pathname for this resource.

   - returns: The full pathname for this resource or nil if the file could not be located.
   */
  func path() -> String? {
    return bundle?.pathForResource(self)
  }

  /**
   Returns the file URL for this resource.

   - returns: The file URL for this resource or nil if the file could not be located.
   */
  func url() -> NSURL? {
    return bundle?.URLForResource(self)
  }
}

public struct FileResource: FileResourceType {
  /// Bundle this file is in or nil for main bundle
  public let bundle: NSBundle?

  /// Name of the file file on disk
  public let name: String

  /// Extension of the file on disk
  public let pathExtension: String

  public init(bundle: NSBundle?, name: String, pathExtension: String) {
    self.bundle = bundle
    self.name = name
    self.pathExtension = pathExtension
  }
}
