class UsersController < ApplicationController

  def index
    # @users = User.all
    if current_user.role != 'admin'
      redirect_to root_url
    end

    if params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      redirect_to root_url, notice: 'Welcome onboard!'
    else
      render :new
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # respond_to do |format|
      if @user.update(allowed_params)
        # format.html { render :index, notice: 'User was successfully updated.' }
        # format.json { render :index, status: :ok, location: @user }
        redirect_to users_path
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render layout: false}
    end
  end


  private

  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
