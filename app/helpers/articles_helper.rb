module ArticlesHelper
  def can_actions?(article)
    article.user == current_user || current_user.admin?
  end
end
