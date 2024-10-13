module Admin
  class DashboardController < BaseController
    def index
      # binding.pry
      searcher = if current_user.admin?
                   Dashboard::AdminSearcher
                 elsif current_user.moderator?
                   Dashboard::ModeratorSearcher
                 else
                   raise Pundit::NotAuthorizedError
                 end
      @data = searcher.new(current_user).call
    end
  end
end

# semaphore = Mutex.new
#
# [:a, :b, :c].each do |tname|
#   Thread.new(tname) do |t_name|
#     semaphore.synchronize {
#       if t_name == :a
#         byebug
#       end
#     }
#     puts "exit #{t_name}"
#   end
# end