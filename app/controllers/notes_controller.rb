class NotesController < ApplicationController
    def create
        note = Note.new(note_params)
        if !note.valid?
            render error_message("Unable to create new note: #{note.errors}")
        else
            note.save
            return json: NoteSerializer.new(note).to_serialized_json
        end
    end

    def show
        note = Notes.find(params[:id])
        return json: NoteSerializer.new(note).to_serialized_json
    end

    def index
        if params.has_key?(:board_id)
            notes = Note.where(board_id: params[:board_id])
        else
            render error_message("Specific board must be specified")
        end
    end

    def edit
        note = Notes.find(params[:id])
        return json: NoteSerializer.new(note).to_serialized_json
    end

    def destroy
    end

    def note_params
        params.require(:note).permit(:title, :short_content, :long_content, :user_id)
    end
end
