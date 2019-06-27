# # Sessions controller
# class SessionsController < ApplicationController
#   def new; end

#   def create
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user &&
#        check_user
#     else
#       flash[:danger] = 'This user was not found'
#     end
#   end

#   def destroy
#     log_out if logged_in?
#     redirect_to root_url
#   end

#   private

#   def check_user
#     if user.authenticate(params[:session][:password])
#       if user.activated?
#         user_activated
#       else
#         error_activation
#       end
#     else
#       invalid_email_password
#     end
#   end

#   def invalid_email_password
#     flash.now[:danger] = 'Invalid email/password combination'
#     render 'new'
#   end

#   def user_activated
#     log_in user
#     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
#     redirect_back_or user
#   end

#   def error_activation
#     message  = 'Account not activated. '
#     message += 'Check your email for the activation link.'
#     flash[:warning] = message
#     redirect_to root_url
#   end
# end

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
