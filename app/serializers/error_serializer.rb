class ErrorSerializer
  def registration_error(user)
    {
      data:
        {
          id: nil,
          type:"error",
          error_message: user.errors.full_messages.to_sentence
        }
    }
  end

  def login_error
    {
      data:
        {
          id: nil,
          type:"error",
          error_message: 'Credentials are bad'
        }
    }
  end

  def unauthorized_error
    {
      data:
        {
          id: nil,
          type:"error",
          error_message: 'Credentials are bad'
        }
    }
  end
end
