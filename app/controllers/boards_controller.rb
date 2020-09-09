class BoardsController < ApplicationController
    def create
        board = Board.new(board_params)
        if !board.valid?
            return json: {
                error: "Creation Failure"
                message: "Unable to create new board: #{board.errors}"
            }
        else
            board.save
            return json: BoardSerializer.new(board).to_serialized_json
        end
    end

    def show
        board = Boards.find(params[:id])
        return json: BoardSerializer.new(board).to_serialized_json
    end

    def edit
        board = Boards.find(params[:id])
        return json: BoardSerializer.new(board).to_serialized_json

    end

    def destroy
    end

    def board_params
        params.require(:board).permit(:name, :wall_id, :user_id)
    end
end
