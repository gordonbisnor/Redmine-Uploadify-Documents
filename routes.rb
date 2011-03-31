map.connect '/uploads/create', :controller => 'uploads', :action => 'create'
map.connect '/uploadify_documents/new', :controller => 'uploadify_documents', :action => 'new'
map.connect '/uploadify_documents/add_attachment/:id', :controller => 'uploadify_documents', :action => 'add_attachment'