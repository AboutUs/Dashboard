class DataPoint < ActiveRecord::Base
  def self.current
    find_by_sql("SELECT d1.*
FROM `data_points` d1,
  (SELECT MAX(recorded_at) AS max_recorded_at, family, name
FROM `data_points` d2
GROUP BY family,`name`) a1
WHERE a1.max_recorded_at = d1.recorded_at AND d1.family = a1.family AND d1.name = a1.name")
  end

  def self.families
    connection.select_all("SELECT DISTINCT(family) FROM data_points").map {|x| x['family'] }
  end

  def self.names
    connection.select_all("SELECT DISTINCT(name) FROM data_points").map {|x| x['name'] }
  end

  def self.from_couch(obj)
    recorded_at = Time.at obj.delete('time_code')
    family      = obj.delete('collection')
    obj.delete('_id')
    obj.delete('_rev')

    name = obj.keys.first

    value_num = obj[name]
    value_str = obj[name]

    if value_num.to_i.to_s == value_num.to_s
      value_num = value_num.to_i
    else
      value_num = nil
    end
    
    new({
          :recorded_at => recorded_at,
          :family => family,
          :name => name,
          :value_num => value_num,
          :value_str => value_str
        })
  end

  def self.save(family, name, value, recorded_at)
    value_num = value
    value_str = value

    if value_num.to_i.to_s == value_num.to_s
      value_num = value_num.to_i
    else
      value_num = nil
    end

    attributes = {
      :family      => family,
      :name        => name,
      :value_num   => value_num,
      :value_str   => value_str,
      :recorded_at => recorded_at
    }
    
    new(attributes).save!
  end


  def value
    value_num || value_str
  end

  HISTORY_ACCURACY = 30         # Maximum number of results returned by #history

  # Sampling of values over the history of this data point. Makes some
  # effort to ensure results are not skewed by over-sampling of a
  # specific period of time.
  def history
    historical = DataPoint.find_all_by_family_and_name(family, name, :order => :recorded_at, :conditions => [ 'value_num IS NOT NULL', 'recorded_at IS NOT NULL' ])
    slice_size = (historical.last.recorded_at.to_i - historical.first.recorded_at.to_i) / HISTORY_ACCURACY
    slices = [historical.first]
    next_time = historical.first.recorded_at.to_i + slice_size
    historical.each do |dp|
      next unless dp.recorded_at.to_i >= next_time
      slices << dp
      next_time += slice_size
    end
    unless slices.include?(historical.last) # Always include last
      slices.pop
      slices << historical.last
    end
    slices.map &:value_num
  end

  def numerical?
    !!value_num
  end
end
