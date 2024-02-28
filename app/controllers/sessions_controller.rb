class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_path
    else
      super
    end
  end
end

  