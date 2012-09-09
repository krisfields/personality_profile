require "open-uri"
require 'addressable/uri'
require 'rest_client'
require 'json'
require 'pry'

class TodoClt

	WEBPATH="localhost:3000/"



	def showPersonalityTests
		path = WEBPATH + "personality_tests.json"
  
  		out = JSON.parse(RestClient.get(path))
  	end

  	def showPersonalityTest(personality_testNumber)
  		path = WEBPATH + "personality_tests/" + personality_testNumber.to_s + ".json"

  		out = JSON.parse(RestClient.get(path))
  	end

	def createPersonalityTest(personality_testName)
		begin
			path = WEBPATH + "personality_tests"
			query_values = {
				name: personality_testName
	  		}
	  		#out = JSON.parse(RestClient.post(path, {:params => query_values}))
	  		#out = (RestClient.post(path, {:params => query_values}))
			RestClient.post(path, {:personality_test => {:name => personality_testName}})
		rescue => e
			puts e
		end
	end

	def updatePersonalityTest(personality_testNumber, newPersonalityTestName)
		path = WEBPATH + "personality_tests/" + personality_testNumber.to_s + ".json"
		RestClient.put(path, {:personality_test => {:name => newPersonalityTestName}})
	end

	def deletePersonalityTest(personality_testNumber)
		path = WEBPATH + "personality_tests/" + personality_testNumber.to_s
		RestClient.delete(path)
		puts "DELETED"
	end

	def showQuestion(questionNumber)
		path = WEBPATH + "questions/" + questionNumber.to_s + ".json"
		out = JSON.parse(RestClient.get(path))
	end

	def showQuestions(personality_testNumber)
		path = WEBPATH + "personality_tests/" + personality_testNumber.to_s + ".json"

  		out = JSON.parse(RestClient.get(path, :params => {:show => true}))
	end

	def createQuestion(content, personality_test_id)
		begin
			path = WEBPATH + "questions"
			# query_values = {
			# 	name: personality_testName
	  # 		}
	  		#out = JSON.parse(RestClient.post(path, {:params => query_values}))
	  		#out = (RestClient.post(path, {:params => query_values}))
			RestClient.post(path, {:question => {:content => content, :personality_test_id => personality_test_id}})
		rescue => e
			puts e
		end
	end

	def updateQuestion(question_id, completed)
		path = WEBPATH + "questions/" + question_id.to_s + ".json"
		RestClient.put(path, {:question => {:completed => completed}})
	end

	def deleteQuestion(questionNumber)
		path = WEBPATH + "questions/" + questionNumber.to_s
		RestClient.delete(path)
		puts "DELETED"
	end

end

todo = TodoClt.new
# puts todo.showPersonalityTests
# puts todo.createPersonalityTest("CltPersonalityTest")
# puts todo.deletePersonalityTest(6)
# puts todo.showPersonalityTest(5)
# puts todo.showQuestion(2)
# puts todo.createQuestion("create deleteQuestion method", 8)
# puts todo.deleteQuestion(3)

# puts todo.showQuestion(5)
# puts todo.updateQuestion(5, true)
# puts todo.showQuestion(5)

puts todo.showPersonalityTest(5)
puts todo.updatePersonalityTest(5, "awesomeName")
puts todo.showPersonalityTest(5)
