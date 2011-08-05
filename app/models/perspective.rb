class Perspective < ActiveRecord::Base
  has_many :memberships
  def data_points
    @data_points ||= begin
                       all_points = DataPoint.current.select { |data_point| show? data_point }
                       all_points.each { |data_point| data_point.perspective = self }
                       all_points
                     end
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

  def preload
    sparkline_data
  end

  def self.data_cache
    $perspective_data_cache ||= {}
  end

  def recache_data
    self.class.data_cache[self.id] = sparkline_query_result
  end

  def sparkline_data
    self.class.data_cache[self.id] ||= sparkline_query_result
  end

  def sparkline_query_result
    self.class.connection.select_all <<-EOQUERY
      SELECT dp1.*, bin_query.*, ((dp1.recorded_at - bin_query.min_r) DIV bin_query.range_r) as bin, AVG(dp1.value_num) as avg
      FROM data_points dp1,
          (SELECT ((range_query.max_r - range_query.min_r) DIV #{self.class.data_points_per_graph}) as range_r, range_query.min_r, range_query.family, range_query.name
            FROM (SELECT MIN(dp.recorded_at) as min_r, MAX(dp.recorded_at) as max_r, dp.family, dp.name
                  FROM `data_points` dp
                  WHERE dp.value_num IS NOT NULL
                  GROUP BY dp.family, dp.name) range_query) bin_query
      WHERE dp1.value_num IS NOT NULL
        AND dp1.family = bin_query.family
        AND dp1.name = bin_query.name
      GROUP BY bin, dp1.family, dp1.name
      ORDER BY dp1.recorded_at
    EOQUERY
  end

  def self.data_points_per_graph
    100
  end
end
