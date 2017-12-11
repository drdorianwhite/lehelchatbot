defmodule Lehelchatbot.Guardian do
    use Guardian, otp_app: :lehelchatbot
  
    def subject_for_token(resource, _claims) do
        if resource do
            {:ok, to_string(resource.id)}
        else
            {:error, :reason_for_error}
        end  
    end

  
    def resource_from_claims(claims) do
        if claims do
            {:ok, Lehelchatbot.Repo.get(Lehelchatbot.User, claims["sub"])}
        else
            {:error, :reason_for_error}
        end
      
    end

end