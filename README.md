# FXNetworkKit

### CocoaPods

For FXNetworkKit, use the following entry in your Podfile:

```rb
pod 'FXNetworkKit', '~>1.2.9'
```

Then run `pod install`.

In any file you'd like to use FXNetworkKit in, don't forget to
import the framework with `import FXNetworkKit`.


### Carthage

Make the following entry in your Cartfile:

```
github "feixue299/FXNetworkKit" ~>1.2.9
```

Then run `carthage update`.

## Example
```swift
import Moya

public struct MessageModel<Model: Codable>: Codable {
    public let code: Int
    public let message: String
    public let data: Model?
}

extension MessageModel: ContainerProtocol {
    public var model: Model? {
        return data
    }
}

public struct Model: Codable {
}

public class ModelManager: PageApiManager<##Moya.TargetType, MessageModel<[Model]>, Model> {
    ...
    public override func requestData(response: (([Model]) -> Void)?) {
        requestTarget(##Moya.TargetType, modelClosure: ...)
    }
    ...
}

```


