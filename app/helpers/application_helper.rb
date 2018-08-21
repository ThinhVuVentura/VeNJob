module ApplicationHelper
	def check_active_controller(con_name)
		con_name.each do |con|
			if con == controller_name
				return true
			end
		end
		return false
	end

	def check_active_action(act_name)
		act_name.each do |act|
			if act == action_name
				return true
			end
		end
		return false
	end

	def alert_class(key)
    key == 'notice' ? 'success' : 'danger'
  end
end
