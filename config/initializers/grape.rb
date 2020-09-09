
Grape.configure do |config|
  puts 'init Grape==================================================='
  config.param_builder = Grape::Extensions::Hashie::Mash::ParamBuilder
end
BaseController.configure do |config|
  puts 'init BaseController==================================================='
  puts config['abc'] = '1234'
end
