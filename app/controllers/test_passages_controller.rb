class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]
  before_action :authenticate_user!
  before_action :check_timer, only: %i[update]

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
    result = GistQuestionService.new(@test_passage.current_question).call

    @gist = current_user.gists.new(question: @test_passage.current_question, url: result[:html_url])

    if @gist.save && result.present?
      flash[:notice] = t('.success', gist_link: view_context.link_to("Open the link", @gist.url, target: :_blank))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passage_path(@test_passage)
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_timer
    if @test_passage.test.time_limit_exists? && @test_passage.time_is_up?
      redirect_to result_test_passage_path(@test_passage)
    end
  end
end
