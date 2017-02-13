class AdminsController < ApplicationController
  include UsersStrongParams
  def index

  end

  def show

  end

  def create
    interactor = CreateAdmin.call(response: @response, admin: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :created : :not_acceptable)
  end

  def update
    interactor = UpdateAdmin.call(response: @response, admin: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :accepted : :not_modified)
  end

  def destroy
    interactor = DestroyAdmin.call(response: @response, admin: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :ok : :no_content)
  end
end