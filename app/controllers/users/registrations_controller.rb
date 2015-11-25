class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :email, :password, :password_confirmation, :speciality, :biography, :siren, :document_identity, :company_name, :website_url, :sociallink1, :sociallink2, :sociallink3)
  end
end


