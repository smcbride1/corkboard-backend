class BoardSerializer
    def initialize(board_object)
      @board = board_object
    end
  
    def to_serialized_json
      @board.to_json(
        include: {
          board: {
            except: [:answer, :created_at, :updated_at]
          }
        }
        only: [:text]
      )
    end
  end
  