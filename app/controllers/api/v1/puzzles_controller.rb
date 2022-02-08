class Api::V1::PuzzlesController < ApplicationController
  def index
    render json: PuzzleSerializer.new(Puzzle.where(availability: true))
  end

  def show
    render json: PuzzleSerializer.new(Puzzle.find(params[:id]))
  end

  def create
    render json: PuzzleSerializer.new(Puzzle.create(puzzle_params))
  end

  # def update
  #   puzzle = Puzzle.update(params[:id], availability: false)
  #   render json: PuzzleSerializer.new(puzzle)
  # end

  def destroy
    render json: PuzzleSerializer.new(Puzzle.destroy(params[:id]))
  end

  private

  def puzzle_params
    params.permit(:id, :user_id, :image, :category, :piece_count, :missing_pieces, :availability, :quality, :original_price_point)
  end
end