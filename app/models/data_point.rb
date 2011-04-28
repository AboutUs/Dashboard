class DataPoint < ActiveRecord::Base
  def self.current
    find_by_sql("SELECT d1.*
FROM `data_points` d1,
  (SELECT MAX(recorded_at) AS max_recorded_at, family, name
FROM `data_points` d2
GROUP BY family,`name`) a1
WHERE a1.max_recorded_at = d1.recorded_at AND d1.family = a1.family AND d1.name = a1.name")
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
end
