class Perspective < ActiveRecord::Base

  def data_points
    DataPoint.current
  end

  def grouped_data_points
    data_points.group_by &:family
  end
end
