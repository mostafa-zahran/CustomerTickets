class AdminsController < ApplicationController
  include UsersStrongParams
  def index
    interactor = GetAdminPage.call(response: @response, page: params[:page], per_page: params[:per_page])
    render json: interactor.response, status: (interactor.success? ? :ok : :unprocessable_entity)
  end

  def show
    interactor = FindAdmin.call(response: @response, user: user_params)
    render json: interactor.response, status: (interactor.success? ? :ok : :not_found)
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