import UIKit
import UniformTypeIdentifiers

open class AUIClosuresDocumentPickerViewController: UIDocumentPickerViewController, UIDocumentPickerDelegate {
    
    // MARK: - Initialization
    
    @available(iOS, introduced: 8.0, deprecated: 14.0)
    public override init(documentTypes allowedUTIs: [String], in mode: UIDocumentPickerMode) {
        super.init(documentTypes: allowedUTIs, in: mode)
        delegate = self
    }

    @available(iOS 14.0, *)
    public override init(forOpeningContentTypes contentTypes: [UTType], asCopy: Bool) {
        super.init(forOpeningContentTypes: contentTypes, asCopy: asCopy)
        delegate = self
    }

    @available(iOS 14.0, *)
    public convenience init(forOpeningContentTypes contentTypes: [UTType]) {
        self.init(forOpeningContentTypes: contentTypes, asCopy: false)
        delegate = self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
    }

    @available(iOS, introduced: 8.0, deprecated: 14.0)
    public override init(url: URL, in mode: UIDocumentPickerMode) {
        super.init(url: url, in: mode)
        delegate = self
    }

    @available(iOS, introduced: 11.0, deprecated: 14.0)
    public override init(urls: [URL], in mode: UIDocumentPickerMode) {
        super.init(urls: urls, in: mode)
        delegate = self
    }

    @available(iOS 14.0, *)
    public override init(forExporting urls: [URL], asCopy: Bool) {
        super.init(forExporting: urls, asCopy: asCopy)
        delegate = self
    }

    @available(iOS 14.0, *)
    public convenience init(forExporting urls: [URL]) {
        self.init(forExporting: urls)
        delegate = self
    }
    
    // MARK: - UIDocumentPickerDelegate
    
    private var _didPickDocumentsAtUrls: (([URL]) -> Void)?
    @available(iOS 11.0, *)
    var didPickDocumentsAtUrls: (([URL]) -> Void)? {
        get { _didPickDocumentsAtUrls  }
        set { _didPickDocumentsAtUrls = newValue }
    }
    @available(iOS 11.0, *)
    open func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let didPickDocumentsAtUrls = didPickDocumentsAtUrls else { return }
        didPickDocumentsAtUrls(urls)
    }
        
    private var _didCancel: (() -> Void)?
    @available(iOS 8.0, *)
    var didCancel: (() -> Void)? {
        get { _didCancel  }
        set { _didCancel = newValue }
    }
    @available(iOS 8.0, *)
    open func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        guard let didCancel = didCancel else { return }
        didCancel()
    }
    
    private var _didPickDocumentsAtUrl: ((URL) -> Void)?
    @available(iOS, introduced: 8.0, deprecated: 11.0)
    var didPickDocumentsAtUrl: ((URL) -> Void)? {
        get { _didPickDocumentsAtUrl  }
        set { _didPickDocumentsAtUrl = newValue }
    }
    @available(iOS, introduced: 8.0, deprecated: 11.0)
    open func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        guard let didPickDocumentsAtUrl = didPickDocumentsAtUrl else { return }
        didPickDocumentsAtUrl(url)
    }
    
}
