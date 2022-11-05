class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def show
    # @books = Book.find(current_user.id)
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    if @user.nil?
      redirect_to root_path
    end
  end

  def edit
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    if @user.nil?
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "アカウントを削除しました。またのご利用お待ちしております。"
  end

  private
  def user_params
    params.require(:user).permit(:name, :account_name, :email, :tel, :shipping_address, :password, :password_confirmation)
  end

end
