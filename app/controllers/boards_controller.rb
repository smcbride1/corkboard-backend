class BoardsController < ApplicationController
    def create
        board = Board.new(board_params)
        if !board.valid?
            render error_message("Unable to create new board: #{board.errors}")
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
        params.require(:board).permit(:name, :user_id, :board_id)
    end
end
