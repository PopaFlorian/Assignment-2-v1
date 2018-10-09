# account activation controller
class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated?
      if user.authenticated?(:activation, params[:id])
        account_activation
      else
        activation_failed
      end
    else
      flash[:danger] = 'Your account is not activated'
    end
  end

  private

  def account_activation
    user.activate
    user.update_attribute(:activated,    true)
    user.update_attribute(:activated_at, Time.zone.now)
    log_in user
    flash[:success] = 'Account activated!'
    redirect_to user
  end

  def activation_failed
    flash[:danger] = 'Invalid activation link'
    redirect_to root_url
  end
end
