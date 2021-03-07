# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

def shared_pods
  pod 'RxSwift'
end

target 'GitHub' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GitHub
  shared_pods
  pod 'RxCocoa'
  pod 'R.swift'
  pod 'SwiftLint'
  
  target 'GitHubTests' do
        inherit! :search_paths
        shared_pods
    end

end
