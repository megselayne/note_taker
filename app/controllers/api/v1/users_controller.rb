class Api::V1::UsersController < ApiController
    before_action :require_login, except: [:create]

    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # GET /users/:id
    def show
        @user = User.select("id, username, email").find(params[:id])
        render json: @user 
    end

    # POST /users
    def create
        @user = User.create!(user_params)
        render json: { token: @user.auth_token }
    end

    def profile
        @user = User.find_by!(auth_token: request.headers[:token])
        @user_notes = Note.where(user_id: user.id)
        render json: { 
            user: { username: @user.username, email: @user.email },
            notes: @user_notes,
        }
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
        params.require(:user).permit(:username, :email, :password_digest)
    end
end
