class ErrorSerializer
  def registration_error(user)
    {
      data:
        {
          id: nil,
          type:"error",
          attributes: {
            error_message: user.errors.full_messages.to_sentence
          }
        }
    }
  end
end
