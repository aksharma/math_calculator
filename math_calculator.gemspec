Gem::Specification.new do |s|
  s.name        = 'math_calculator'
  s.date        = '2012-06-09'
  s.version     = '0.0.1'
  s.summary     = "Math calculator using the Ruby Math module"
  s.description = "Math calculator evalutaes expressions containg terms supported bt the Ruby's Math module."
  s.authors     = ["Anil Sharma"]
  s.email       = 'sharma.ruby2gem@sharmail.com'
  s.files       = ["lib/math_calculator.rb", "spec/spec_helper.rb", "spec/math_calculator_spec.rb","README.rdoc","LICENSE"]
  s.homepage    = 'http://rubygems.org/gems/math_calculator'
  s.require_paths = ["lib"]
  s.test_files = ["spec//spec_helper.rb", "spec/math_calculator_spec.rb"]
end
