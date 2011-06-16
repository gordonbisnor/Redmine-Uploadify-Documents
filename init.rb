# Include hook code here
 
require 'redmine'

config.middleware.insert_before   "ActionController::Session::CookieStore", "FlashSessionCookieMiddleware"

Redmine::Plugin.register :a_redmine_uploadify_documents_plugin do
 name 'Document Uploadify Documents'
 author 'Gordon B. Isnor'
 description 'Uploadify for documents'
 version '0.0.2'
end
