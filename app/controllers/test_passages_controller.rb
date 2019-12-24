class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]
  before_action :authenticate_user!

  ACCESS_TOKEN = '4a0084fe23eedba2a98a73f503e8217ebb2aaaa8'

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, Octokit::Client.new(access_token: ACCESS_TOKEN)).call

    @gist = current_user.gists.create(question: @test_passage.current_question, url: result[:html_url])

    flash_options = if result.present?
      { notice: t('.success') }
    else
      { alert: t('.failure') }
    end

    redirect_to test_passage_path(@test_passage), flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
