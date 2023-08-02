class ApplicationController < ActionController::Base
  #before_action :basic_auth

  #private

  #def basic_auth
    #authenticate_or_request_with_http_basic do |username, password|
     # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更

    #end
 # end
  
 before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(
     :sign_up, keys: [:nickname, :"birthday(1i)", :"birthday(2i)", :"birthday(3i)", :first_name, :last_name, :first_name_kana, :last_name_kana]
   )
 end

 

end
