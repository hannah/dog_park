require 'spec_helper'

describe DogRegistration do
  context 'validations' do
    let(:dog) { DogRegistration.new }
    it 'requires a first name' do
      expect(dog).to_not be_valid
      expect(dog.errors[:first_name]).to_not be_blank
    end

    it 'requires a last name' do
      expect(dog).to_not be_valid
      expect(dog.errors[:last_name]).to_not be_blank
    end

    it 'requires a valid email' do
      expect(dog).to_not be_valid
      expect(dog.errors[:email]).to_not be_blank

      dog.email = 'not.com'
      expect(dog).to_not be_valid

      dog.email = 'hello@'
      expect(dog).to_not be_valid
    end

    it 'requires a dog name' do
      expect(dog).to_not be_valid
      expect(dog.errors[:dog_name]).to_not be_blank
    end
  end
end
