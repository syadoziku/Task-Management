class UsersController < ApplicationController
 
  # ユーザー一覧
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def destroy 
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end



# beforeフィルター

# ユーザーを所得
  def set_user
    @user = User.find(params[:id])
  end
  
  # ログイン済みユーザーか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
  
  # 現在ログインしているユーザー確認
  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
  
  def admin_user
      redirect_to root_url unless current_user.admin?
  end
  
end