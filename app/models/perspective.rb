class Perspective < ActiveRecord::Base
  has_many :memberships
  
  def data_points
    DataPoint.current.select { |data_point| show? data_point }
  end

  def non_featured_data_points
    data_points.reject { |x| feature? x }
  end

  def featured_data_points
    data_points.select { |x| feature? x }
  end

  def grouped_data_points
    non_featured_data_points.group_by &:family
  end

  def show?(data_point)
    !! memberships.find_by_family_and_name(data_point.family, data_point.name)
  end

  def feature?(data_point)
    x = memberships.find_by_family_and_name(data_point.family, data_point.name)
    x && x.featured?
  end
end
