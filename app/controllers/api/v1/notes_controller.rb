class Api::V1::NotesController < ApiController
    before_action :require_login

    # GET /notes Get user note titles: 
    # can I use .find_all here?
    def index
        @notes = Note.where(user_id: params[:user_id])
        render json: @notes
    end

    # GET /notes/:id
    def show
        @note = Note.find(params[:user_id])
        render json: @note
    end

    # POST /notes
    def create
        @note = Note.new(note_params)
        if @note.save
            render json: @note
        else
            render error: {error: "Unable to create note."}, status: 400
        end
    end

    # PUT /notes/:id
    def update
        if @note
            @note.update(note_params)
            render json: { message: "Note successfully updated." }, status: 200
        else
            render error: { error: "Unable to update note." }, status: 400
        end
    end

    # DELETE /notes/:id
    def destroy
        if @note
            @note.destroy
            render json: { message: 'Note successfully deleted.' }, status: 200
        else
            render error: {error: "unable to delete note." }, status: 400
        end
    end

    private

    def note_params
        params.require(:note).permit(:user_id, :body, :title)
    end
end
