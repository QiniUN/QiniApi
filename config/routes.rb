Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "station/getStation/:idEstacion/:horario" => "station#getStation"

  post "station/postStation" => "station#postStation"

  post "station/postBikes" => "station#postBikes"
end
