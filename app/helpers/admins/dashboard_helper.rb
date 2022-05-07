module Admins::DashboardHelper
  def define_admin(role)
    return if role.nil?

    case role.to_sym
    when :admin
      render partial: "admins/dashboard/admin"
    when :pharmacist
      render partial: "admins/dashboard/pharmacist"
    when :physician
      render partial: "admins/dashboard/physician"
    end
  end
end
