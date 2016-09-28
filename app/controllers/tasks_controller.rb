class TasksController < ApplicationController

  def index
    @tasks = {
      buy_gummy_bears: { name: "buy gummy bears",
        description: "need gummy bears from duane reade for lunch",
        completion_status: "on deck",
        completion_date: nil },
      eat_gummy_bears: { name: "eat gummy bears",
        description: "need to eat the gummy bears at lunch; blocked until gummy bears have been purchased",
        completion_status: "blocked",
        completion_date: nil },
      buy_cheez_its: { name: "buy cheez-its",
        description: "need to buy cheez-its from brightly-lit bodega",
        completion_status: "complete",
        completion_date: "2016-09-26" },
      eat_cheez_its: { name: "eat cheez-its",
        description: "need to eat cheez-its all the time",
        completion_status: "in progress",
        completion_date: nil },
    }
  end #index

  def show
    tasks = {
      buy_gummy_bears: { name: "buy gummy bears",
        description: "need gummy bears from duane reade for lunch",
        completion_status: "on deck",
        completion_date: nil },
      eat_gummy_bears: { name: "eat gummy bears",
        description: "need to eat the gummy bears at lunch; blocked until gummy bears have been purchased",
        completion_status: "blocked",
        completion_date: nil },
      buy_cheez_its: { name: "buy cheez-its",
        description: "need to buy cheez-its from brightly-lit bodega",
        completion_status: "complete",
        completion_date: "2016-09-26" },
      eat_cheez_its: { name: "eat cheez-its",
        description: "need to eat cheez-its all the time",
        completion_status: "in progress",
        completion_date: nil },
    }

    puts "This is the identifier: #{params[:identifier]}"
    # :identifier should be passed in as the name, referring here to the hash
    puts tasks[params[:identifier].to_sym]

    @task = tasks[params[:identifier].to_sym]

  end #show
end
