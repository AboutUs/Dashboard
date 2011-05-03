class Perspective < ActiveRecord::Base
  has_many :memberships
  
  def data_points
    DataPoint.current.select { |x| memberships.find_by_family_and_name(x.family, x.name) }
  end

  def grouped_data_points
    data_points.group_by &:family
  end
end
