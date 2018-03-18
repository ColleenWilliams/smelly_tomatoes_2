Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  'SjhDlimJliKhrr6H1FIL6HOep', 'sQVWTl79oexjZhPilxaB8gz93BWaN7HEn0sGDTHfM0pCXsquXK'
  provider :facebook, '333589087149408', '76b16dd51caffafe1f7f19dabf4e70c2'
  provider :github, '3da494f83c8a7cb4f7ff', '89c7909a2e12133403a6a7514b8d25585c250c50'
  provider :google_oauth2, 'spoiledtomatoes-195013', '629734371387'
end
