import ProjectDescription
import ProjectDescriptionHelpers

/// 가장 큰 이유는 프로젝트, framework등에 대한 설정을 템플릿화 해서 빠른 생성을 하기 위함이다.
/// 또 다른 이유로는 .xcodeproj파일을 git에 올리지 않음으로 merge conflict를 방지한다.
/// xcodegen같은 도구도 있지만 .swift파일로 관리하고 싶고, 기능적인 지원도 tuist가 더 많기 때문에 tuist를 선택하게 되었다.

let projectName: String = "RIBsTodo" /// 프로젝트 이름
let organizationName: String = "Allie" /// organization 이름
let bundleName: String = "com.allieProject" /// 번들 앞 prefix

let project = Project.app(name: projectName,
                          platform: .iOS,
                          additionalTargets: [])

//let project = Project(
//    name: projectName,
//    organizationName: organizationName,
//    packages: packages,
////    settings: nil,
//    targets: [target],
//    schemes: schemeList
////    fileHeaderTemplate: nil,
////    additionalFiles: [],
////    resourceSynthesizers: []
//)

