require 'spec_helper'

describe GeoDistance::NVector do
  let(:from) do 
    [45, 10].geo_point
  end

  let(:to) do   
    b = [42, 11].geo_point
  end

  describe '#distance' do
    it "should calculate N-vector distance as Float" do
      dist = GeoDistance::NVector.distance(from, to)

      dist.should be_a(Float)

      puts "the distance from #{from} to #{to} is: #{dist.kms_to(:meters)} meters"
      dist.should be_within(20).of 340
    end
  end

  describe '#geo_distance' do
    it "should calculate N-vector distance as GeoDistance" do
      dist = GeoDistance::NVector.geo_distance(from, to)
      dist.should be_a(GeoDistance)

      puts "the distance from #{from} to #{to} is: #{dist.meters} meters"

      dist.kms.should be_within(20).of 340
    end
  end
end
