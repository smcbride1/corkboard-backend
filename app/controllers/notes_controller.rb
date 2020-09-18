class NotesController < ApplicationController
    def create
        note = Note.new(note_params)
        if !note.valid?
            render error_message("Unable to create new note: #{note.errors}")
        else
            note.save
            render json: NoteSerializer.new(note).to_serialized_json
        end
    end

    def show
        note = Note.find(params[:id])
        render json: NoteSerializer.new(note).to_serialized_json
    end

    def index
        if params.has_key?(:board_id)
            notes = Note.where(board_id: params[:board_id])
            render json: NoteSerializer.new(notes).to_serialized_json
        else
            render error_message("Specific board must be specified")
        end
    end

    def update
        note = Note.find(params[:id])
        note.update(note_params)
        render json: NoteSerializer.new(note).to_serialized_json
    end

    def destroy
    end

    def note_params
        params.require(:note).permit(:title, :short_content, :long_content, :x_offset, :y_offset, :board_id)
    end
end
