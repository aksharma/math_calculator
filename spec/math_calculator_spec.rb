require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Simple calculation" do
  it "should do simple addition" do
    str = "2+4"
    MathCalculator.calculate(str).should == 6
  end
end

describe "Simple calculation with negative numbers" do
  it "should do simple addition of negative numbers" do
    str = "-2+(-4)"
    MathCalculator.calculate(str).should == -6
  end
end

describe "Value of constant PI" do
  it "should evaluate PI" do
    str = 'PI'
    MathCalculator.calculate(str).should == PI
  end
end

describe "Value of constant pi" do
  it "should evaluate pi" do
    str = 'pi'
    MathCalculator.calculate(str).should == PI
  end
end

describe "Value of constant E" do
  it "should evaluate E" do
    str = 'E'
    MathCalculator.calculate(str).should == E
  end
end


describe "Value of a single Math function" do
  it "should evaluate log(2)" do
    str = 'log 2'
    MathCalculator.calculate(str).should == log(2)
  end
end

describe "Tokenize expression" do
  it "should create an array of tokens in expressions" do
    str = 'cos(90)*acos(0.23)*cos(90)'
    MathCalculator.tokenize(str).should == %w[cos ( 90 ) * acos ( 0.23 ) * cos ( 90 )]
  end
end

describe "Tokenize expression" do
  it "should create an array of tokens in expressions" do
    str = '(3*exp(t/2)*cos(3*t-PI/2))'
    MathCalculator.tokenize(str, :t => 2).should == %w[ ( 3 * exp ( t / 2 ) * cos ( 3 * t - PI / 2 ) )]
  end
end

describe "Evaluate expression" do
  it "should evaluate matehematicale expressions" do
    str = '(3*exp(t/2)*cos(3*t-PI/2))'
    MathCalculator.calculate(str, :t => 2).should == -2.2785902140319134
  end
end

describe "Unsafe expression" do
  it "should not be evaluated" do
    str = 'PI*3+xyz'
    MathCalculator.calculate(str).should == nil
  end
end

describe "Unsafe variable" do
  it "should not be evaluated" do
    str = '2+2'
    MathCalculator.calculate(str, :t => 'abc').should == nil
  end
end
