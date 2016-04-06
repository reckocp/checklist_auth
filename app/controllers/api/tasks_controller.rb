class Api::TasksController < ApplicationController
  def index
    render json: Task.all
  end

  def show
    render json: Task.find(params.fetch(:id))
                     .to_json(methods: [:prev, :next],
                              except: :user_id,
                              )
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end
end
