module QuestionsHelper
  
def procomplete(question)
  finished = 0.0
  total = 0.0
  question.tasks.each do |task|
    if task.complete
      finished = finished + 1
    end
    total = total + 1
  end
  finished = (finished/total)*500
end

def color(percent)
  if percent <= 150
    "progress-danger progress-striped"
  elsif percent <= 350
    "progress-warning progress-striped"
  elsif percent < 500
    "progress-success progress-striped"
  else 
    "progress-success"
  end
end

end
