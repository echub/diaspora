module StatusMessagesHelper

  def my_latest_message
    message = StatusMessage.my_newest
    unless message.nil?
      return message.message + " " + time_ago_in_words(message.created_at) + " ago."
    else
      return "No message to display."
    end
  end

  class StatusMessages
    include ROXML
   
   def initialize(messages=[])
     @statusmessages = messages
   end

   xml_accessor :statusmessages, :as => [StatusMessage]
   attr_accessor :statusmessages
  end
end
