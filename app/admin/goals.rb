ActiveAdmin.register Goal do
    permit_params :id, :goal_type, :user_id
end
