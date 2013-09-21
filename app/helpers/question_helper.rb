module QuestionHelper

  def user_can_answer?(question)
    question_id_array = []
    current_user.answers.each do |ans|
      question_id_array << ans.question_id
    end
    if question_id_array.include?(question.id)
      false
    else
      true
    end
  end

end
