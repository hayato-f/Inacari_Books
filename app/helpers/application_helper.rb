module ApplicationHelper
    def cart_counts
        if session[:cart].nil?
            return 0
        else
            session[:cart].length
        end
    end
end
