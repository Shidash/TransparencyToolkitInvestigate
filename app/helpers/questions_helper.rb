module QuestionsHelper
  
def progress(question)
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

end
