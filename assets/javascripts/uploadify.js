RedmineUploadifyDocuments = new Object();

RedmineUploadifyDocuments.AddAttachmentFields = function(file, response) {
	var attachment = eval('(' + response + ')');
	var i = new Date();
	var index = i.getTime();
	var id = attachment.id;
	var content_type = attachment.content_type;
	var filename = attachment.filename
	if(content_type.match(/image/g)) {
		var image = "<img src='/attachments/" + id + "/" + filename + "'/>";
	} else {
		image = '';
	}

	jQuery("#added_attachments").append("<div class='added_attachment'><p class='attachment_details'>\
	<strong>Attachment " + id + "</strong><br /> " + filename + "</p>\
	<input type='hidden' name='attachments["+index+"][id]' value='" + id + "'/>\
	<p><label>Description</label>\
	<input type='text' size='60' name='attachments["+index+"][description]'/></p>\
	</div>\
	")
}