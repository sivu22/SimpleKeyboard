Pod::Spec.new do |s|
  s.name             = 'SimpleKeyboard'
  s.version          = '1.0.2'
  s.summary          = 'Simple Swift solution for not having text input controls covered by the keyboard.'

  s.description      = 
'SimpleKeyboard addresses a very common problem on the iOS platform: when the keyboard is shown, the content under it is not visible anymore. Since there is no simple or out-of-the-box solution for this, SimpleKeyboard attempts to provide exactly that.'
                       

  s.homepage         = 'https://github.com/sivu22/SimpleKeyboard'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cristian Sava' => 'cristianzsava@gmail.com' }
  s.source           = { :git => 'https://github.com/sivu22/SimpleKeyboard.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'SimpleKeyboard/Classes/**/*'
end
