# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_podcast.local_session',
  :secret      => '7209288bbf5d51f0c76721939171cc2f885351b095b67581cc133053b5b0466a8ee26d404e139bbd6553e7041e26d2c89a556b67e34f96cf5157570d12567683'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
