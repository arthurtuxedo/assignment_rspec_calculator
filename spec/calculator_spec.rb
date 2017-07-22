require_relative '../lib/calculator.rb'

describe Calculator do
  let (:c) {Calculator.new}
  describe 'initialize' do
    it 'should be a Calculator' do
      expect(c).to be_a(Calculator)
    end
  end

  describe 'add' do
    it 'correctly adds positive numbers' do
      expect(c.add(1,2)).to eq(3)
    end
    it 'correctly adds negative numbers' do
      expect(c.add(-1,-2)).to eq(-3)
    end
    it 'correctly adds floats' do
      expect(c.add(1.5,2.5)).to be_within(0.5).of(4.0)
    end
  end

  describe 'subtract' do
    it 'correctly subtracts positive numbers' do
      expect(c.subtract(3,2)).to eq(1)
    end
    it 'correctly subtracts negative numbers' do
      expect(c.subtract(-1,2)).to eq(-3)
    end
    it 'correctly subtracts floats' do
      expect(c.subtract(1.5,2)).to be_within(0.5).of(-0.5)
    end
  end

  describe 'multiply' do
    it 'correctly multiplies positive numbers' do
      expect(c.multiply(3,2)).to eq(6)
    end
    it 'correctly multiplies negative numbers' do
      expect(c.multiply(-1,2)).to eq(-2)
    end
    it 'correctly multiplies floats' do
      expect(c.multiply(1.5,2.5)).to be_within(0.5).of(4)
    end
  end

  describe 'divide' do
    it 'correctly divides positive numbers' do
      expect(c.divide(6,2)).to eq(3)
    end
    it 'correctly divides negative numbers' do
      expect(c.divide(-8,2)).to eq(-4)
    end
    it 'correctly divides floats' do
      expect(c.divide(7.5,2)).to be_within(0.5).of(4)
    end
    it 'raises an error for divide by zero' do
      expect{(c.divide(4,0))}.to raise_error(ArgumentError)
    end
  end

  describe 'pow' do
    it 'correctly powers positive numbers' do
      expect(c.pow(6,2)).to eq(36)
    end
    it 'correctly powers negative numbers' do
      expect(c.pow(-8,2)).to eq(64)
    end
    it 'correctly powers floats' do
      expect(c.pow(2,0.25)).to be_within(0.5).of(1.19)
    end
  end

  describe 'sqrt' do
    it 'correctly squirts positive numbers' do
      expect(c.sqrt(16)).to eq(4)
    end
    it 'correctly squirts floats' do
      expect(c.sqrt(12.5)).to be_within(0.5).of(3.5)
    end
    it 'raises an error for negative numbers' do
      expect{(c.sqrt(-2))}.to raise_error(ArgumentError)
    end
  end

  describe 'memory=' do
    it 'successfully stores and wipes an object in memory' do
      c.memory = 5
      expect(c.memory).to eq(5)
      expect(c.memory).to eq(nil)
    end
  end

  describe 'stringify' do
    let (:stringcalc) {Calculator.new(true)}
    it 'outputs the calculation as a string' do
      expect(stringcalc.add(2,3)).to be_a(String)
    end
  end
end
