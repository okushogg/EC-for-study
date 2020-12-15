class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
  end

  # セキュリティ関連？
  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseの機能が使われる前に、configure_permitted_parametersが実行

  # 管理者ログイン/ログアウト後のページ遷移
  def after_sign_in_path_for(resource)
    admin_path
  end

  def after_sign_out_path_for(resource)
    admin_path
  end
  # 管理者ログイン/ログアウト後のページ遷移

  protected

  # 管理者
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  # 管理者


end
