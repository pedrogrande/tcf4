class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def destroy
  	@user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end
end