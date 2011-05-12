module ApplicationHelper
  def show_data_point_check_box perspective, data_point
    checked = perspective.show? data_point
    check_box_tag 'data_point[memberships][]', [data_point.family, data_point.name].join("|||"), checked, :class => 'show'
  end

  def feature_data_point_check_box perspective, data_point
    checked = perspective.feature? data_point
    check_box_tag 'data_point[features][]', [data_point.family, data_point.name].join("|||"), checked, :class => 'feature'
  end
end
