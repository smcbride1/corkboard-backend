class BoardsController < ApplicationController
    def create
        board = Board.new(board_params)
        if !board.valid?
            render error_message("Unable to create new board: #{board.errors}")
        else
            board.save
            render json: BoardSerializer.new(board).to_serialized_json
        end
    end

    def show
        board = Board.find(params[:id])
        render json: BoardSerializer.new(board).to_serialized_json
    end
    
    def index
        if params.has_key?(:user_id)
            boards = Board.where(user_id: params[:user_id])
        else
            render error_message("Specific user must be specified")
        end
    end

    def edit
        board = Board.find(params[:id])
        render json: BoardSerializer.new(board).to_serialized_json
    end

    def destroy
    end

    def board_params
        params.require(:board).permit(:name, :user_id, :board_id)
    end
end
