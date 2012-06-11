jeweler --rspec --create-repo math_calculator
cd math_calculator
cp ../parenthesize/LOG_README.txt .
cp ../parenthesize/LICENSE .
cp ../parenthesize/.rvmrc .
cp ../parenthesize/build_it.sh .
cp ../parenthesize/git_it.sh .
cp ../parenthesize/parenthesize.gemspec math_calculator.gemspec
cp ../parenthesize/README.rdoc .

vi LOG_README.txt build_it.sh git_it.sh *.gemspec *.rdoc
(NOTES:
  vi Gemfile and change rcov to simplecov >= 0.5 OR cp ../parenthesize/Gemfile.sh .
  build_it - change name of gem
  git_it - change name of gem
  LICENSE - no change
  .rvmrc - no change
  vi math_calculator.gemspec and change info
)

git remote add github git@github.com:aksharma/math_calculator.git master
cd ../math_calculator ( to activate .rvmrc )
vi Gemfile to add any additional gems needed
bundle install
edit math_calculator.gemspec

sh build_it
(OR gem build math_calculator.gemspec
gem push math_calculator-0.0.1.gem)
sharma.ruby1git@sh.a3

vi spec/math_calculator_spec.rb
autotest


