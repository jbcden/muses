class SessionsController < Devise::SessionsController
  # GET /resource/login
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/login
  def create
    ps = PolymorphicSessions.new(params).info
    session_setup(ps)
    # logger.debug "PS info: #{ps}"
    
    self.resource = warden.authenticate!(@auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(@resource_name, resource)
    if @resource_name == :student
      redirect_to student_path resource
      else
        respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end

  def destroy
    redirect_path = after_sign_out_path_for(@resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(@resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    redirect_to root_url
  end

  private
    def session_setup(ps)
      @auth_options = ps[:auth_options]
      @resource_name = ps[:resource_name]
      warden.config[:default_scope] = ps[:warden]
      params = ps[:paramaters]
    end
end
