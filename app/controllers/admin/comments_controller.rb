class Admin::CommentsController < Admin::ResourcesController
  cache_sweeper :comment_sweeper
end
