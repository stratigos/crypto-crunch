Rails.application.routes.draw do
  post "/publish", action: :publish, controller: :publish
end
