module NotificationsHelper
    
  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end
    
 def notification_form(notification)
  @comment=nil
  visitor=link_to notification.visitor.name, notification.visitor, style:"font-weight: bold;"
  unless notification.post.nil?
  your_post= image_tag notification.post.picture, class:"notificationform" , style:"font-weight: bold;", remote: true
  else
  end
  case notification.action
    when "follow" then
      "#{visitor}があなたをフォローしました"
    when "like" then
      "#{visitor}があなたの投稿#{your_post}にいいね！しました"
    when "comment" then
      @comment=Comment.find_by(id:notification.comment_id)&.content
      "#{visitor}があなたの投稿#{your_post}にコメントしました"
  end
 end
end
