class Api::V1::UsersController < ApplicationController
    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # GET /users/:id
    def show
        @user = User.find(params[:id])
        render json: @user 
    end

    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render error: { error: "Unable to create user." }, status: 400
        end
    end

    # PUT /users/:id
    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: { message: "User successfully updated." }, status: 200
        else
            render error: { error: "Unable to udpate user." }, status: 400
        end
    end

    #DELETE /user/:id
    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json: { message: 'User deleted!' }, status: 200
        else
            render error: { error: 'Unable to delete user.' }, status: 400
        end
    end

    private

    def user_params
        params.require(:username, :email, :password_digest)
    end
end
