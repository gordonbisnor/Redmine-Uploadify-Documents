class UploadifyDocumentsController < ApplicationController 
  unloadable 
  before_filter :find_project, :only => [:new]
  
  default_search_scope :documents
  model_object Document
  before_filter :find_model_object, :except => [:new]
  before_filter :find_project_from_association, :except => [:new]
  before_filter :authorize
  
  def new
    @document = @project.documents.build(params[:document])    
    if request.post? and @document.save	
      add_attachments
      flash[:notice] = l(:notice_successful_create)
      redirect_to :controller => "documents", :action => 'index', :project_id => @project
    end
  end

  def edit
    @document= Document.find(params[:id])
    @categories = DocumentCategory.all
    if request.post? and @document.update_attributes(params[:document])
      flash[:notice] = l(:notice_successful_update)
      redirect_to :controller => "documents", :action => 'show', :id => @document
    end
  end

  def add_attachment
    @document = Document.find(params[:id])
    @attachments = add_attachments
    Mailer.deliver_attachments_added(@attachments) if @attachments.present? && Setting.notified_events.include?('document_added')
    redirect_to :controller => "documents", :action => 'show', :id => @document
  end

  private

    def add_attachments
      attachments = []
      params[:attachments].each_pair do |key,value|
        attachment = Attachment.find(value[:id])
        attachment.update_attributes(:container_id => @document.id, :description => value[:description])
        attachments << attachment
      end
      return attachments
    end
    
    def find_project
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end

end
