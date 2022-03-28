# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

install! 'cocoapods',
:deterministic_uuids => false,
:warn_for_multiple_pod_sources => false,
:warn_for_unused_master_specs_repo => false

inhibit_all_warnings!

target 'RIBsTodo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
 
   # Pods for RIBsTodo

  pod 'RIBs', :git => 'https://github.com/uber/RIBs.git', :tag => 'v0.10.0'
  pod 'RxSwift', '~> 5.0'
  pod 'RxCocoa', '~> 5.0'
  pod 'SnapKit'

  target 'RIBsTodoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RIBsTodoUITests' do
    # Pods for testing
  end

end
