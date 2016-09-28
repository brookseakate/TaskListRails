class TasksController < ApplicationController

  def index
    @tasks = {
      buy_gummy_bears: { title: "buy gummy bears",
        description: "need gummy bears from duane reade for lunch",
        completion_status: "on deck",
        completed_at: nil },
      eat_gummy_bears: { title: "eat gummy bears",
        description: "need to eat the gummy bears at lunch; blocked until gummy bears have been purchased",
        completion_status: "blocked",
        completed_at: nil },
      buy_cheez_its: { title: "buy cheez-its",
        description: "need to buy cheez-its from brightly-lit bodega",
        completion_status: "complete",
        completed_at: "2016-09-26" },
      eat_cheez_its: { title: "eat cheez-its",
        description: "need to eat cheez-its all the time",
        completion_status: "in progress",
        completed_at: nil },
    }
  end #index

  def show
    tasks = {
      buy_gummy_bears: { title: "buy gummy bears",
        description: "need gummy bears from duane reade for lunch",
        completion_status: "on deck",
        completed_at: nil },
      eat_gummy_bears: { title: "eat gummy bears",
        description: "need to eat the gummy bears at lunch; blocked until gummy bears have been purchased",
        completion_status: "blocked",
        completed_at: nil },
      buy_cheez_its: { title: "buy cheez-its",
        description: "need to buy cheez-its from brightly-lit bodega",
        completion_status: "complete",
        completed_at: "2016-09-26" },
      eat_cheez_its: { title: "eat cheez-its",
        description: "need to eat cheez-its all the time",
          completion_status: "in progress",
        completed_at: nil },
    }

    puts "This is the identifier: #{params[:identifier]}"
    # :identifier should be passed in as the title, referring here to the hash
    puts tasks[params[:identifier].to_sym]

    @task = tasks[params[:identifier].to_sym]

  end #show
end
