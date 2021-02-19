Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v2' do
      post "cards/create" => "cards#create"

      get "cards/:id/show" => "cards#show"

      get "cards/:id/where" => "cards#where"

      post "cards/:id/update" => "cards#update"
      post "cards/:id/:uid/destroy" => "cards#destroy"

      post "recieve/add" => "recieves#add"
      get "recieve/:id/where" => "recieves#where"

      get "twitter/:source_id/:target_id/friendships" => "twitter_api#follow"
      get "twitter/:source_id/:target_screen_name/check" => "twitter_api#check"

      post "user/set" => "users#set"
      # get "user/index" => "users#index"
    end
  end
end
