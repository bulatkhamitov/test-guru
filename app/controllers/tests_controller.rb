class TestsController < ApplicationController
  before_action :find_test, only: [:show, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: Test.all.inspect
  end

  def show
    # @test = Test.find(params[:test_id])
    render inline: '<%= @test.title %>'
  end

  def new
  end

  def create
    @test = Test.create(test_params)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def rescue_with_test_not_found
    render plain: 'Test not found'
  end
end
