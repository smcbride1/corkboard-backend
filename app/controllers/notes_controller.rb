class NotesController < ApplicationController
    def create
        note = Note.new(note_params)
        if !note.valid?
            return json: {
                error: "Creation Failure"
                message: "Unable to create new note: #{note.errors}"
            }
        else
            note.save
            return json: NoteSerializer.new(note).to_serialized_json
        end
    end

    def show
        note = Notes.find(params[:id])
        return json: NoteSerializer.new(note).to_serialized_json
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
