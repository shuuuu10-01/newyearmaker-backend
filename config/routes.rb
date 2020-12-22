Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get "cards/index" => "cards#index"
      post "cards/create" => "cards#create"

      get "cards/:id/show" => "cards#show"
      get "cards/:id/edit" => "cards#edit"

      post "cards/:id/update" => "cards#update"
      post "cards/:id/destroy" => "cards#destroy"

      get "twitter/:source_id/:target_id/friendships" => "twitter_api#follow"
      get "twitter/:source_id/:target_screen_name/check" => "twitter_api#check"
    end
  end
end
