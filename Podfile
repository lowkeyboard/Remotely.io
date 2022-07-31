# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

workspace 'remotely'
#core module
def core_pods
  pod 'Alamofire', '~> 5.5'
  pod 'Firebase'
  pod 'FirebaseAuth'
end

target 'Core' do
  project 'Core/Core.project'
  core_pods
end

#app module

def application_pods
  core_pods
end

  # Pods for remotely
target 'remotely' do
  pod 'SnapKit', '~> 5.6.0'
  application_pods
end
