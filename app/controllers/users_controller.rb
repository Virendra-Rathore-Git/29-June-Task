  class UsersController < ApplicationController

    def index
    end

    def show
      @user=User.all

      respond_to do |format|
      format.html # index.html.erb
      # format.xml  { render xml: @user }
      format.json { render json: @user }
    end
    
    end

    def show_data
      if params[:status]=="activated"
        @user=User.activated
      else
        @user=User.inactivated
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user
      else
        render  :new
      end
    end

  def log

    @user=User.find_by(email: params[:email], password: params[:password] )


    if @user.nil?

      flash.now[:error] = "Email or Password Not Correct."
      render '/users/index'

    else

      # session[:current_user_id] = @user.id
      # session[:user_name] = @user.name

      cookies[:current_user_id] = @user.id
      cookies[:user_name] = @user.name
      cookies.encrypted[:password]= @user.password

      flash[:notice] = "You have successfully logged In."
      redirect_to '/users_log/login_user'
    end

  end

  def show_log_data
    @user= cookies[:user_name]
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :status,:password)
  end
end
