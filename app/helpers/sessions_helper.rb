module SessionsHelper
    def logged_in?  # 評価を論理値で返すメソッド　=> userがログインしていたら、true!それ以外はfalseを返す。
        !current_user.nil?
    end
end
