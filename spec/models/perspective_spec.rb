require 'spec_helper'

describe Perspective do
  describe '#data_points' do
    before do
      a = DataPoint.create!(:recorded_at => 3.days.ago, :family => 'a', :name => 'b', :value_num => 99)
      b = DataPoint.create!(:recorded_at => 0.days.ago, :family => 'a', :name => 'b', :value_num => 33)
      c = DataPoint.create!(:recorded_at => 13.days.ago, :family => 'a', :name => 'c', :value_num => 0)
    end
    it 'should return no data points' do
      perspective = Perspective.create!
      perspective.data_points.should == []
    end
    
    describe 'with #entries' do
      it 'should return all current data points' do
        perspective = Perspective.create!
        perspective.data_points.should == [b,c]
      end
    end
  end

  describe '#grouped_data_points' do
    it 'should return all current data points, grouped' do
      a = DataPoint.create!(:recorded_at => 3.days.ago, :family => 'a', :name => 'b', :value_num => 99)
      b = DataPoint.create!(:recorded_at => 0.days.ago, :family => 'a', :name => 'b', :value_num => 33)
      c = DataPoint.create!(:recorded_at => 13.days.ago, :family => 'a', :name => 'c', :value_num => 0)
      perspective = Perspective.create!
      perspective.grouped_data_points.should == { 'a' => [b,c] }
    end
  end
end
