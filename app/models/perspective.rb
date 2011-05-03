class Perspective < ActiveRecord::Base
  has_many :memberships
  
  def data_points
    DataPoint.current
  end

  def grouped_data_points
    data_points.group_by &:family
  end
end
