class PhotosController < ApplicationController

	before_action :load_user, only: [:new, :edit, :create, :update, :destroy]

	def load_user
		@user = User.find params[:user_id]
	end

	def authorized_attributes
		params.require(:photo).permit(
			:name,
			:file
		)
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(authorized_attributes)
		@photo.user = @user
		if @photo.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@photo = Photo.includes(:user).find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		if @photo.update_attributes(authorized_attributes)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		Photo.find(params[:id]).destroy

		redirect_to @user
	end
end
