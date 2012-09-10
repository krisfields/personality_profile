require "open-uri"
require 'addressable/uri'
require 'rest_client'
require 'json'
require 'pry'

class PersonalityProfileClt

	WEBPATH="localhost:3000/"



	def showQuizzes
		path = WEBPATH + "quizzes.json"
  
  		out = JSON.parse(RestClient.get(path))
  	end

  	def showQuiz(quizNumber)
  		path = WEBPATH + "quizzes/" + quizNumber.to_s + ".json"

  		out = JSON.parse(RestClient.get(path))
  	end

	def createQuiz(quizName, quizDescription, approved)
		begin
			path = WEBPATH + "quizzes"
			# query_values = {
			# 	name: quizName,
			# 	description: quizDescription
	  # 		}
	  		#out = JSON.parse(RestClient.post(path, {:params => query_values}))
	  		#out = (RestClient.post(path, {:params => query_values}))
			RestClient.post(path, {:quiz => {:name => quizName, :description => quizDescription, :approved => approved}})
		rescue => e
			puts e
		end
	end

	def updateQuiz(quizNumber, newQuizName, newQuizDescription, approved)
		path = WEBPATH + "quizzes/" + quizNumber.to_s + ".json"
		RestClient.put(path, {:quiz => {:name => newQuizName, :description => newQuizDescription, :approved => approved}})
	end

	def deleteQuiz(quizNumber)
		path = WEBPATH + "quizzes/" + quizNumber.to_s
		RestClient.delete(path)
		puts "DELETED"
	end

	def showQuestion(questionNumber)
		path = WEBPATH + "questions/" + questionNumber.to_s + ".json"
		out = JSON.parse(RestClient.get(path))
	end

	def showQuestionsForQuiz(quizNumber)
		path = WEBPATH + "quizzes/" + quizNumber.to_s + ".json"

  		out = JSON.parse(RestClient.get(path, :params => {:show => true}))
	end

	def createQuestion(text, quiz_id)
		begin
			path = WEBPATH + "questions"
			# query_values = {
			# 	name: quizName
	  # 		}
	  		#out = JSON.parse(RestClient.post(path, {:params => query_values}))
	  		#out = (RestClient.post(path, {:params => query_values}))
			RestClient.post(path, {:question => {:text => text, :quiz_id => quiz_id}})
		rescue => e
			puts e
		end
	end

	def updateQuestion(question_id, text)
		path = WEBPATH + "questions/" + question_id.to_s + ".json"
		RestClient.put(path, {:question => {:text => text}})
	end

	def deleteQuestion(questionNumber)
		path = WEBPATH + "questions/" + questionNumber.to_s
		RestClient.delete(path)
		puts "DELETED"
	end

	def showAnswer(answerNumber)
		path = WEBPATH + "answers/" + answerNumber.to_s + ".json"
		out = JSON.parse(RestClient.get(path))
	end

	def showAnswersForQuestion(questionNumber)
		path = WEBPATH + "questions/" + questionNumber.to_s + ".json"

  		out = JSON.parse(RestClient.get(path, :params => {:show => true}))
	end

	def createAnswer(text, question_id)
		begin
			path = WEBPATH + "answers"
			# query_values = {
			# 	name: questionName
	  # 		}
	  		#out = JSON.parse(RestClient.post(path, {:params => query_values}))
	  		#out = (RestClient.post(path, {:params => query_values}))
			RestClient.post(path, {:answer => {:text => text, :question_id => question_id}})
		rescue => e
			puts e
		end
	end

	def updateAnswer(answer_id, text)
		path = WEBPATH + "answers/" + answer_id.to_s + ".json"
		RestClient.put(path, {:answer => {:text => text}})
	end

	def deleteAnswer(answerNumber)
		path = WEBPATH + "answers/" + answerNumber.to_s
		RestClient.delete(path)
		puts "DELETED"
	end
end

personality_profile = PersonalityProfileClt.new
# puts personality_profile.showQuizzes
# puts personality_profile.createQuiz("New Quiz CLT 2", "This is a new quiz")
# puts personality_profile.deleteQuiz(4)
# puts personality_profile.showQuiz(1)
# puts personality_profile.showQuestion(2)
# puts personality_profile.createQuestion("What would you do if I stomped on your head?", 1)
# puts personality_profile.deleteQuestion(3)

# puts personality_profile.showQuestion(5)
# puts personality_profile.updateQuestion(5, "What about if I just flung poo at you?")
# puts personality_profile.showQuestion(5)

# puts personality_profile.showQuestionsForQuiz(1)
#  puts personality_profile.showQuiz(3)
# puts personality_profile.updateQuiz(3, "awesomeName", "New description", true)
# puts personality_profile.showQuiz(3)

# puts personality_profile.createAnswer("Because I am nutty", 1)
# puts personality_profile.createAnswer("Because I am fun", 1)
# puts personality_profile.createAnswer("Because I am stupid", 1)
# puts personality_profile.showAnswer(2)
puts personality_profile.showAnswersForQuestion(1)
# puts personality_profile.updateAnswer(2, "Because I love you")
# puts personality_profile.deleteAnswer(2)