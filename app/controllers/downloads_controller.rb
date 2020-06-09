# frozen_string_literal: true

class DownloadsController < ApplicationController
  # GET /posts/new

  def new
    resource = Post.find_by_id(params[:post_id]) || Comment.find_by_id(params[:comment_id])

    if resource
      current_user.increment!(:download_count)
      redirect_to rails_blob_path(resource.file, disposition: 'attachment')
    else
      render nothing: true
    end
  end
end
