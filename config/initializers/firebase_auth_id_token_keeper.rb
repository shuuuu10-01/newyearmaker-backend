Firebase::Auth::IDTokenKeeper.configure do |config|
    config.firebase_project_id = ENV.fetch("FIREBASE_PROJECT_ID")
end 
