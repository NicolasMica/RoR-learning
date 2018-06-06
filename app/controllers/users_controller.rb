class UsersController < ApplicationController

	before_action :load_user, only: [:edit, :update, :destroy]

	def load_user
		@user = User.find params[:id]
	end

	def authorized_attributes
		params.require(:user).permit(
			:firstname,
			:lastname,
			:email,
			:birthdate,
			:phone
		)
	end

	def index
		if params[:order]
			@users = User.order(params[:order]).all
		else
			@users = User.all
		end
	end

	def show
		@user = User.includes(:photos).find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(authorized_attributes)

		if @user.save
			redirect_to :action => 'index'
		else
			render 'new'
		end
	end

	def update
		if @user.update_attributes(authorized_attributes)
			redirect_to :action => 'show'
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy

		redirect_to :action => 'index'
	end
end
