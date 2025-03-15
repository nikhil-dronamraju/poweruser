module DailyTasksHelper
  def humanize_priorities
    priorities = []
    DailyTask.priorities.each do |prio|
      prio_arr = []
      prio_arr << prio[0].humanize
      prio_arr << prio[0]
      priorities << prio_arr
    end

    priorities
  end
end
