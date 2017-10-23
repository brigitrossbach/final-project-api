class ApplicationController < ActionController::API
  include NewRelic::Agent::Instrumentation::ControllerInstrumentation

  jwt_secret = '5ElS49SXm9DlqG9K9tfkgu9hO38XskmbKstF3uqt'

  def encode_token(payload)
    token=JWT.encode(payload, '5ElS49SXm9DlqG9K9tfkgu9hO38XskmbKstF3uqt')
  end

  def auth_header
    header = request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token=auth_header
      begin
        JWT.decode(token, '5ElS49SXm9DlqG9K9tfkgu9hO38XskmbKstF3uqt', true, {algorithm: 'HS256'})
      rescue JWT::DecodeError
        [{}]
      end
    else
    end
  end

end
