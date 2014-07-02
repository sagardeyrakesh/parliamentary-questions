class TransferredController < ApplicationController
  before_action :authenticate_user!, PQUserFilter

  def new
    @pq = PQ.new
  end

  def create
    @pq = PQ.new(pq_params)
    @pq.transferred = true
    @pq.raising_member_id = '0'
    @pq.question = '<< This question is created as a transferred, the text of the question it should appear once the transfer question is received >>'
    @pq.save

    flash[notice] = 'Transferred PQ was successfully created.'
    redirect_to controller: 'dashboard', action: 'index'
  end

  private

  def pq_params
    params.require(:pq).permit(:uin)
  end


end