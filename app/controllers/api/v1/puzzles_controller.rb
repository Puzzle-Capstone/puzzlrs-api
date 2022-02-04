class Api::V1::PuzzlesController < ApplicationController
  def index
    render json: PuzzleSerializer.new(Puzzle.where(availability: true))
  end

  def show
    render json: PuzzleSerializer.new(Puzzle.find(params[:id]))
  end
end