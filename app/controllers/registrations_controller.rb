class RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_sign_up_path_for(resource)
        current_user.calc_recommended_nutrients_per_day

        new_goal_path
    end

    def after_update_path_for(resource)
        current_user.calc_recommended_nutrients_per_day

        user_path(resource)
    end
end