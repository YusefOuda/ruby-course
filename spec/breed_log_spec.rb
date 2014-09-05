require_relative 'spec_helper.rb'

describe PuppyBreeder::Repos::BreedLog do

  before(:all) do
    PuppyBreeder.breed_repo.drop_tables
  end

  describe '#log' do
    it 'returns breed objects' do
      breed = PuppyBreeder::Breed.new("Poodle", 800)
      PuppyBreeder.breed_repo.add_breed(breed)

      result = PuppyBreeder.breed_repo.log.first
      expect(result).to be_an_instance_of(PuppyBreeder::Breed)
    end
  end

  describe '#add_breed' do
    it 'adds a breed and price to the hash' do
      breed = PuppyBreeder::Breed.new("Husky", 500)
      PuppyBreeder.breed_repo.add_breed(breed)

      result = PuppyBreeder.breed_repo.log
      expect(result.size).to eq(2)
      expect(result.last.breed).to eq("Husky")
    end
  end

end