class NoteSerializer
    def initialize(note_object)
      @note = note_object
    end
  
    def to_serialized_json
      @note.to_json()
    end
  end
  