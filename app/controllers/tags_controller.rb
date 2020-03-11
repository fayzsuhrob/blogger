class TagsController < ApplicationController
    def show
        @tag = Tag.find(params[:id])
      end
      def index
        @tags = Tag.all
      end
      def destroy
        @tag = Tag.find(params[:id]).destroy
        redirect_to action: "index"
        flash.notice = "Tag '#{@tag.name}' destroyed!"
      end
end
